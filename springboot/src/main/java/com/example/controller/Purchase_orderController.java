package com.example.controller;

import cn.hutool.core.collection.CollectionUtil;
import cn.hutool.core.io.IoUtil;
import cn.hutool.poi.excel.ExcelUtil;
import cn.hutool.poi.excel.ExcelWriter;
import com.example.common.Result;
import com.example.common.enums.ResultCodeEnum;
import com.example.entity.Purchase_order;
import com.example.exception.CustomException;
import com.example.service.Purchase_orderService;
import com.github.pagehelper.PageInfo;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/purchase-order")
public class Purchase_orderController {
    @Resource
    private Purchase_orderService purchase_orderService;

    /**
     * 新增
     */
    @PostMapping("/add")
    public Result add(@RequestBody Purchase_order purchase_order) {
        purchase_orderService.add(purchase_order);
        return Result.success();
    }

    /**
     * 删除
     */
    @DeleteMapping("/delete/{id}")
    public Result deleteById(@PathVariable Integer id) {
        purchase_orderService.deleteById(id);
        return Result.success();
    }

    /**
     * 批量删除
     */
    @DeleteMapping("/delete/batch")
    public Result deleteBatch(@RequestBody List<Integer> ids) {
        purchase_orderService.deleteBatch(ids);
        return Result.success();
    }

    /**
     * 修改
     */
    @PutMapping("/update")
    public Result updateById(@RequestBody Purchase_order purchase_order) {
        purchase_orderService.updateById(purchase_order);
        return Result.success();
    }

    /**
     * 根据ID查询
     */
    @GetMapping("/selectById/{id}")
    public Result selectById(@PathVariable Integer id) {
        Purchase_order purchase_order = purchase_orderService.selectById(id);
        return Result.success(purchase_order);
    }

    /**
     * 查询所有
     */
    @GetMapping("/selectAll")
    public Result selectAll(Purchase_order purchase_order ) {
        List<Purchase_order> list = purchase_orderService.selectAll(purchase_order);
        return Result.success(list);
    }

    /**
     * 分页查询
     */
    @GetMapping("/selectPage")
    public Result selectPage(Purchase_order purchase_order,
                             @RequestParam(defaultValue = "1") Integer pageNum,
                             @RequestParam(defaultValue = "10") Integer pageSize) {
        PageInfo<Purchase_order> page = purchase_orderService.selectPage(purchase_order, pageNum, pageSize);
        return Result.success(page);
    }

    @GetMapping("findAll")
    public Result findAll() {
        List<Purchase_order> list = purchase_orderService.findAll();
        return Result.success(list);
    }

    /**
     * 导出报表
     * @param response
     * @return
     * @throws IOException
     */
    @GetMapping("/export")
    public Result export(HttpServletResponse response) throws IOException {
        // 从数据库中查询所有数据
        List<Purchase_order> all = purchase_orderService.findAll();
        if (CollectionUtil.isEmpty(all)) {
            throw new CustomException(ResultCodeEnum.DATA_IS_NULL);
        }

        // 定义一个List和Map<key,value>出来,存储处理之后的数据,用于塞到list里
        List<Map<String, Object>> list = new ArrayList<>(all.size());
        // 遍历每一条数据，然后封装到Map<key,value>,把这个map塞到list里
        for (Purchase_order purchase_order : all) {
            Map<String, Object> row = new LinkedHashMap<>();
//            row.put("AM计划号", purchase_order.getAmPlanId());
//            row.put("辅助列", purchase_order.getAuxiliaryColumn());
            row.put("采购单号", purchase_order.getPurchaseOrderId());
            row.put("采购状态",purchase_order.getProcurementStatus());
            row.put("采购仓库",purchase_order.getPurchasingWarehouse());
            row.put("产品维度",purchase_order.getProductDimension());
            row.put("计划编号",purchase_order.getPlanId());
            row.put("品名",purchase_order.getProductName());
            row.put("SKU",purchase_order.getSku());
            row.put("店铺",purchase_order.getShop());
            row.put("采购量", purchase_order.getProcurementVolume());
            row.put("AM单号", purchase_order.getAmTrackId());
            row.put("采购仓库（明细）", purchase_order.getProcurementWarehouseDetails());
            row.put("待到货量",purchase_order.getPendingArrivalQuantity());
            row.put("预计到货时间",purchase_order.getExpectedDeliveryTime());
            row.put("到货量",purchase_order.getArrivalQuantity());
//            row.put("辅助列1",purchase_order.getAuxiliaryColumn1());
//            row.put("最终采购单号",purchase_order.getFinalPurchaseOrderId());
//            row.put("新到货数量",purchase_order.getNewArrivalsQuantity());
//            row.put("实际总到货量",purchase_order.getActualTotalArrivalQuantity());
//            row.put("备注",purchase_order.getNotes());
            list.add(row);
        }

        // 创建一个ExcelWriter工具类,把list数据用writer写出来(生成出来)
        ExcelWriter wr = ExcelUtil.getWriter(true);
        wr.write(list,true);

        // 把这个excel下载下来
        response.setContentType("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet;charset=utf-8");
        response.setHeader("Content Disposition", "attachment;filename=type.xlsx");
        ServletOutputStream out = response.getOutputStream();
        wr.flush(out,true);
        wr.close();
        IoUtil.close(System.out);

        return Result.success();
    }

    /**
     * 导入报表
     * @param file
     * @return
     * @throws IOException
     */
    @PostMapping("/import")
    public Result importExcel(MultipartFile file) throws IOException {
        List<Purchase_order> infoList = ExcelUtil.getReader(file.getInputStream()).readAll(Purchase_order.class);
        if (CollectionUtil.isEmpty(infoList)) {
            throw new CustomException(ResultCodeEnum.EXCEL_IS_NULL);
        }else {
            for (Purchase_order purchase_order : infoList) {
                try {
                    purchase_orderService.add(purchase_order);
                }catch (Exception e) {
                    e.printStackTrace();
                }
            }
        }
        return Result.success();
    }
}
