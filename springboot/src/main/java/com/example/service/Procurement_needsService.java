package com.example.service;

import cn.hutool.core.date.DateUtil;
import com.example.common.enums.ResultCodeEnum;
import com.example.entity.Data_Matching;
import com.example.entity.Procurement_needs;
import com.example.entity.Purchase_order;
import com.example.exception.CustomException;
import com.example.mapper.Data_MatchingMapper;
import com.example.mapper.Procurement_needsMapper;
import com.example.mapper.Purchase_orderMapper;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.*;
import java.util.stream.Collectors;

@Service
public class Procurement_needsService {
    @Resource
    private Procurement_needsMapper procurement_needsMapper;

    @Resource
    private Data_MatchingMapper data_matchingMapper;

    @Resource
    private Purchase_orderMapper purchase_orderMapper;

    /**
     * 新增
     * @param procurementNeeds
     */
    public void add(Procurement_needs procurementNeeds) {
        // 将数据输入日期设为当前时间，yyyy-MM-dd
        String currentDate = DateUtil.today();
        procurementNeeds.setInputDate(currentDate);

        // 计划编号辅助列
        String originalPlanId = procurementNeeds.getPlanId();
        if (StringUtils.isNotBlank(originalPlanId)) {
            // 实现 IFERROR(VLOOKUP(...), Bn) 逻辑
            String auxiliaryId = purchase_orderMapper.selectPlanIdByAmPlanId(originalPlanId);
            procurementNeeds.setPlanAuxiliaryId(auxiliaryId != null ? auxiliaryId : originalPlanId);
        }else{
            procurementNeeds.setPlanAuxiliaryId(null);
        }

        // “ 是否整箱 ” 逻辑
        if((procurementNeeds.getPurchaseVolume()/procurementNeeds.getCartonNumber())==1 || (procurementNeeds.getPurchaseVolume()-procurementNeeds.getCartonNumber())>0){
            procurementNeeds.setHasFull(true);
        }else{
            procurementNeeds.setHasFull(false);
        }

        // 交期答复1

        // 交期答复2

        // 已下单数量

        // 已到货量

        // 待到货量

        // 剩余采购量

        // 完全采购

        // 全部到货

        // 采购备注

        // 交期/生产时长

        // 期望到货时间倒计时


        // 根据SKU查询数据匹配表
//        String sku = procurementNeeds.getSku();
//        if (sku == null || sku.equals("")) {
//            Data_Matching data_matching = data_matchingMapper.selectBySku(sku);
//            if (data_matching != null) {
//                // 填充匹配的字段
//                procurementNeeds.setProductName(data_matching.getProductName());
//                procurementNeeds.setAttribute(data_matching.getAttribute());
//                procurementNeeds.setFactory(data_matching.getFactory());
//                procurementNeeds.setCartonNumber(data_matching.getCartonsNumber());
//            }else {
//                throw new CustomException(ResultCodeEnum.SKU_MATCH_ERROR);
//            }
//        }

        procurement_needsMapper.insert(procurementNeeds);
    }

    /**
     * 计算获取`计划编号辅助列`
     */
    @Transactional
    public void calculatePlanAuxiliaryIds(){
        // 获取所有采购需求
        List<Procurement_needs> procurement_needs = procurement_needsMapper.selectALL();

        // 提取有效planId（采购需求的B列）
        Set<String> planIds = procurement_needs.stream()
                .map(Procurement_needs::getPlanId)
                .filter(planId -> StringUtils.isNotBlank(planId))
                .collect(Collectors.toCollection(LinkedHashSet::new));  // 保持顺序

        if (planIds.isEmpty()) return;;

        // 批量查询优化（一次查询多个）。查询采购单映射关系（AM计划号 -> 计划编号）
        List<Purchase_order> mappings = purchase_orderMapper.selectMappingByAmPlanIds(new ArrayList<>(planIds));

        // 构建映射字典（使用LinkedHashMap保持顺序）
        Map<String,String> amPlanIdToPlanIdMap = mappings.stream()
                .collect(Collectors.toMap(
                        Purchase_order::getAmPlanId,
                        Purchase_order::getPlanId,
                        (exsting,replacement) -> exsting, // 处理重复键
                        LinkedHashMap::new
                ));

        // 设置辅助列值
        procurement_needs.forEach(need -> {
            String originalPlanId = need.getPlanId();
            if (StringUtils.isNotBlank(originalPlanId)) {
                String auxiliaryId = amPlanIdToPlanIdMap.getOrDefault(originalPlanId, originalPlanId);
                need.setPlanAuxiliaryId(auxiliaryId);
            }else{
                need.setPlanAuxiliaryId(null);
            }
        });

        // 批量更新
        procurement_needsMapper.batchUpdatePlanAuxiliary(procurement_needs);
    }

    /**
     * 删除
     * @param id
     */
    public void deleteById(Integer id) {
        procurement_needsMapper.deleteById(id);
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
     * @param procurementNeeds
     */
    public void updateById(Procurement_needs procurementNeeds) {
        // “ 是否整箱 ” 逻辑
        if((procurementNeeds.getPurchaseVolume()/procurementNeeds.getCartonNumber())==1 || (procurementNeeds.getPurchaseVolume()-procurementNeeds.getCartonNumber())>0){
            procurementNeeds.setHasFull(true);
        }else{
            procurementNeeds.setHasFull(false);
        }

        // 计划编号辅助列
        String originalPlanId = procurementNeeds.getPlanId();
        if (StringUtils.isNotBlank(originalPlanId)) {
            // 实现 IFERROR(VLOOKUP(...), Bn) 逻辑
            String auxiliaryId = purchase_orderMapper.selectPlanIdByAmPlanId(originalPlanId);
            procurementNeeds.setPlanAuxiliaryId(auxiliaryId != null ? auxiliaryId : originalPlanId);
        }else{
            procurementNeeds.setPlanAuxiliaryId(null);
        }

        procurement_needsMapper.updateById(procurementNeeds);
    }

    /**
     * 根据id查询
     * @param id
     * @return
     */
    public Procurement_needs selectById(Integer id) {
        Procurement_needs procurement_needs = procurement_needsMapper.selectById(id);
        return procurement_needs;
    }

    /**
     * 查询全部
     * @param procurementNeeds
     * @return
     */
    public List<Procurement_needs> selectAll(Procurement_needs procurementNeeds) {
        return procurement_needsMapper.selectAll(procurementNeeds);
    }

    /**
     * 分页查询
     * @param procurementNeeds
     * @param pageNum
     * @param pageSize
     * @return
     */
    public PageInfo<Procurement_needs> selectPage(Procurement_needs procurementNeeds, Integer pageNum, Integer pageSize) {
        PageHelper.startPage(pageNum, pageSize);
        List<Procurement_needs> list = procurement_needsMapper.selectAll(procurementNeeds);
        return PageInfo.of(list);
    }

    public List<Procurement_needs> findAll() {
        return procurement_needsMapper.findAll();
    }
}
