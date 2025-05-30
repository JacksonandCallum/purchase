package com.example.service;

import com.example.common.enums.ConstantEnum;
import com.example.entity.Purchase_order;
import com.example.mapper.Purchase_orderMapper;
import com.example.mapper.Warehouse_entryMapper;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.*;
import java.util.stream.Collectors;

@Service
public class Purchase_orderService {
    @Resource
    private Purchase_orderMapper purchase_orderMapper;

    @Resource
    private Warehouse_entryMapper warehouse_entryMapper;

    private static final Logger log = LoggerFactory.getLogger(Purchase_orderService.class);

    /**
     * 新增
     * @param purchase_order
     */
    public void add(Purchase_order purchase_order) {
        // AM计划号：AM单号值 为空时，返回 计划编号值；AM单号值 不为空时，返回 AM单号值
        if(purchase_order.getAmTrackId() == null){
            purchase_order.setAmPlanId(purchase_order.getPlanId());
        }else{
            purchase_order.setAmPlanId(purchase_order.getAmPlanId());
        }

        // 辅助列：最终采购单号 + SKU + 店铺
        // 获取各字段值，并处理可能的空值
        String finalPurchaseOrderId = purchase_order.getPurchaseOrderId() != null ? purchase_order.getPurchaseOrderId() : "";
        String sku = purchase_order.getSku() != null ? purchase_order.getSku() : "";
        String shop = purchase_order.getShop() != null ? purchase_order.getShop() : "";
        purchase_order.setAuxiliaryColumn(finalPurchaseOrderId + sku + shop);
        
        // 采购状态
        switchStatus(purchase_order);

        // 辅助列1：辅助列1 = 采购单号
        purchase_order.setAuxiliaryColumn1(purchase_order.getPurchaseOrderId());

        // 最终采购单号：辅助列1为空时，最终采购单号为采购单号值；辅助列1不为空时，最终采购单号的值等于辅助列1的值
        if (purchase_order.getAuxiliaryColumn1() == null) {
            purchase_order.setFinalPurchaseOrderId(purchase_order.getPurchaseOrderId());
        }else{
            purchase_order.setFinalPurchaseOrderId(purchase_order.getAuxiliaryColumn1());
        }

        // 新到货数量 =SUMIF(入库单!A:A, B3207, 入库单!AE:AE)
        this.calculateSingleNewArrival(purchase_order.getAuxiliaryColumn());

        // 实际总到货量：新到货数量 + 到货量
//        purchase_order.setActualTotalArrivalQuantity(purchase_order.getArrivalQuantity() + purchase_order.getNewArrivalsQuantity());

        purchase_orderMapper.insert(purchase_order);
    }

    /**
     * 全局计算方法（用于批量场景）
     * 计算 “ 新到货量 ”
     */
    @Transactional
    public void calculateNewArrivals(){
        // 获取所有采购单
        List<Purchase_order> purchase_orders = purchase_orderMapper.selectAllPurchaseOrders();

        // 收集有效辅助列
        Set<String> auxColumns = purchase_orders.stream()
                .map(Purchase_order::getAuxiliaryColumn)
                .filter(aux -> aux != null && !aux.trim().isEmpty())
                .collect(Collectors.toSet());

        if(auxColumns.isEmpty()) return;

        // 查询入库总量
        List<Map<String,Object>> sumResults = warehouse_entryMapper.selectSumByAuxiliaryColumns(auxColumns);
        Map<String,Integer> sumMap = sumResults.stream()
                .collect(Collectors.toMap(
                        map -> (String)map.get("auxiliaryColumn"),
                        map -> ((Number) map.get("total")).intValue()
                ));

        // 设置新到货数量
        purchase_orders.forEach(p -> {
            String key = p.getAuxiliaryColumn();
            if (key != null && !key.trim().isEmpty()) {
                p.setNewArrivalsQuantity(sumMap.getOrDefault(key,0));
            }
        });

        // 批量更新
        purchase_orderMapper.batchUpdateNewArrivals(purchase_orders);
    }

    /**
     * 单个计算方法（用于新增/修改场景）
     * @param auxiliaryColumn
     */
    @Transactional
    public void calculateSingleNewArrival(String auxiliaryColumn){
        if (StringUtils.isBlank(auxiliaryColumn)) return;

        // 精准查询单个辅助列的入库总量
        Integer newArrivals = warehouse_entryMapper.sumByAuxiliaryColumn(auxiliaryColumn);

        // 仅更新匹配的采购单
        Integer updated = purchase_orderMapper.updateNewArrivalsByAuxColumn(
                auxiliaryColumn,
                newArrivals != null ? newArrivals : 0
        );
        log.info("更新了 {} 条采购单的新到货数量", updated);
    }

    /**
     * 删除
     * @param id
     */
    public void deleteById(Integer id) {
        purchase_orderMapper.deleteById(id);
    }

    /**
     * 批量删除
     * @param ids
     */
    public void deleteBatch(List<Integer> ids) {
        for (Integer id : ids) {
            this.deleteById(id);
        }
    }

    /**
     * 修改
     * @param purchase_order
     */
    public void updateById(Purchase_order purchase_order) {
        // 采购状态
        switchStatus(purchase_order);

        // 新到货数量
        calculateSingleNewArrival(purchase_order.getAuxiliaryColumn());
        purchase_orderMapper.updateById(purchase_order);
    }

    /**
     * 采购状态
     * bug => 新增时，不提交“采购状态”，该逻辑无法默认提交 “待提交”，导致“采购状态”为空，新增失败
     * @param purchase_order
     */
    private void switchStatus1(Purchase_order purchase_order) {
        switch (purchase_order.getProcurementStatus()) {
            case "已完成":
                purchase_order.setProcurementStatus(ConstantEnum.已完成.name());
                break;
            case "待审批":
                purchase_order.setProcurementStatus(ConstantEnum.待审批.name());
                break;
            case "待到货":
                purchase_order.setProcurementStatus(ConstantEnum.待到货.name());
                break;
            default:
                purchase_order.setProcurementStatus(ConstantEnum.待提交.name());

        }
    }

    /**
     * 采购状态
     * （最佳）
     * 优化switchStatus1方法的缺陷
     * @param purchase_order
     */
    private void switchStatus(Purchase_order purchase_order) {
        // 校验状态是否合法，非法时设为默认值（待提交）
        String status = purchase_order.getProcurementStatus();
        boolean valid = false;
        for (ConstantEnum e : ConstantEnum.values()) {
            if (e.message.equals(status)) {
                valid = true;
                break;
            }
        }
        purchase_order.setProcurementStatus(valid ? status : ConstantEnum.待提交.message);
    }

    /**
     * 根据id查询
     * @param id
     * @return
     */
    public Purchase_order selectById(Integer id) {
        Purchase_order purchase_order = purchase_orderMapper.selectById(id);
        return purchase_order;
    }

    /**
     * 查询全部
     * @param purchase_order
     * @return
     */
    public List<Purchase_order> selectAll(Purchase_order purchase_order) {
        return purchase_orderMapper.selectAll(purchase_order);
    }

    /**
     * 分页查询
     * @param purchase_order
     * @param pageNum
     * @param pageSize
     * @return
     */
    public PageInfo<Purchase_order> selectPage(Purchase_order purchase_order, Integer pageNum, Integer pageSize) {
        PageHelper.startPage(pageNum, pageSize);
        List<Purchase_order> list = purchase_orderMapper.selectAll(purchase_order);
        return PageInfo.of(list);
    }

    public List<Purchase_order> findAll() {
        return purchase_orderMapper.findAll();
    }
}
