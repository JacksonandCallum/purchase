package com.example.controller;

import cn.hutool.core.collection.CollectionUtil;
import cn.hutool.core.io.IoUtil;
import cn.hutool.poi.excel.ExcelUtil;
import cn.hutool.poi.excel.ExcelWriter;
import com.example.common.Result;
import com.example.common.enums.ResultCodeEnum;
import com.example.entity.Data_Matching;
import com.example.entity.Procurement_needs;
import com.example.exception.CustomException;
import com.example.service.Data_MatchingService;
import com.example.service.Procurement_needsService;
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
@RequestMapping("/procurement-needs")
public class Procurement_needsController {
    @Resource
    private Procurement_needsService procurement_needsService;

    @Resource
    private Data_MatchingService data_matchingService;

    /**
     * 新增
     */
    @PostMapping("/add")
    public Result add(@RequestBody Procurement_needs procurement_needs) {
        procurement_needsService.add(procurement_needs);
        return Result.success();
    }

    /**
     * 删除
     */
    @DeleteMapping("/delete/{id}")
    public Result deleteById(@PathVariable Integer id) {
        procurement_needsService.deleteById(id);
        return Result.success();
    }

    /**
     * 批量删除
     */
    @DeleteMapping("/delete/batch")
    public Result deleteBatch(@RequestBody List<Integer> ids) {
        procurement_needsService.deleteBatch(ids);
        return Result.success();
    }

    /**
     * 修改
     */
    @PutMapping("/update")
    public Result updateById(@RequestBody Procurement_needs procurement_needs) {
        procurement_needsService.updateById(procurement_needs);
        return Result.success();
    }

    /**
     * 根据ID查询
     */
    @GetMapping("/selectById/{id}")
    public Result selectById(@PathVariable Integer id) {
        Procurement_needs procurement_needs = procurement_needsService.selectById(id);
        return Result.success(procurement_needs);
    }

    /**
     * 查询所有
     */
    @GetMapping("/selectAll")
    public Result selectAll(Procurement_needs procurement_needs ) {
        List<Procurement_needs> list = procurement_needsService.selectAll(procurement_needs);
        return Result.success(list);
    }

    /**
     * 分页查询
     */
    @GetMapping("/selectPage")
    public Result selectPage(Procurement_needs procurement_needs,
                             @RequestParam(defaultValue = "1") Integer pageNum,
                             @RequestParam(defaultValue = "10") Integer pageSize) {
        PageInfo<Procurement_needs> page = procurement_needsService.selectPage(procurement_needs, pageNum, pageSize);
        return Result.success(page);
    }

    @GetMapping("findAll")
    public Result findAll() {
        List<Procurement_needs> list = procurement_needsService.findAll();
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
        List<Procurement_needs> all = procurement_needsService.findAll();
        if (CollectionUtil.isEmpty(all)) {
            throw new CustomException(ResultCodeEnum.DATA_IS_NULL);
        }

        // 定义一个List和Map<key,value>出来,存储处理之后的数据,用于塞到list里
        List<Map<String, Object>> list = new ArrayList<>(all.size());
        // 遍历每一条数据，然后封装到Map<key,value>,把这个map塞到list里
        for (Procurement_needs procurement_needs : all) {
            Map<String, Object> row = new LinkedHashMap<>();
            row.put("数据输入日期", procurement_needs.getInputDate());
            row.put("计划编号", procurement_needs.getPlanId());
            row.put("计划编号辅助列", procurement_needs.getPlanAuxiliaryId());
            row.put("SKU",procurement_needs.getSku());
            row.put("品名",procurement_needs.getProductName());
            row.put("颜色及规格",procurement_needs.getAttribute());
            row.put("期望到货时间",procurement_needs.getExpectedArrivalTime());
            row.put("工厂",procurement_needs.getFactory());
            row.put("仓库",procurement_needs.getWarehouse());
            row.put("店铺",procurement_needs.getShop());
            row.put("采购量", procurement_needs.getPurchaseVolume());
            row.put("装箱数", procurement_needs.getCartonNumber());
            row.put("是否整箱", procurement_needs.getHasFull());
            row.put("是否新增",procurement_needs.getHasNew());
            row.put("是否加急",procurement_needs.getHasUrgent());
            row.put("运营备注",procurement_needs.getOperationRemark());
            row.put("交期答复1",procurement_needs.getDeliveryDateResponse());
            row.put("交期答复2（飞书）",procurement_needs.getDeliveryDateResponseFeishu());
            row.put("已下单数量",procurement_needs.getOrderedQuantity());
            row.put("待到货数量",procurement_needs.getPendingArrivalQuantity());
            row.put("已到货量",procurement_needs.getReceivedQuantity());
            row.put("剩余未采购量", procurement_needs.getRemainingUnprocuredQuantity());
            row.put("完全采购", procurement_needs.getHasFullProcurement());
            row.put("全部到货", procurement_needs.getHasAllItemsArrived());
            row.put("采购备注",procurement_needs.getPurchaseNotes());
            row.put("交货/生产时长",procurement_needs.getDeliverOrProductTime());
            row.put("期望到货时间倒计时",procurement_needs.getExpectArrivalTimeCountdown());
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
        List<Procurement_needs> infoList = ExcelUtil.getReader(file.getInputStream()).readAll(Procurement_needs.class);
        if (CollectionUtil.isEmpty(infoList)) {
            throw new CustomException(ResultCodeEnum.EXCEL_IS_NULL);
        }else {
            for (Procurement_needs procurement_needs : infoList) {
                try {
                    procurement_needsService.add(procurement_needs);
                }catch (Exception e) {
                    e.printStackTrace();
                }
            }
        }
        return Result.success();
    }

    /**
     * [ 根据sku自动填充匹配数据 ] 导入
     * @param file
     * @return
     */
    @PostMapping("/import-by-sku")
    public Result importExcelBySku(@RequestParam("file") MultipartFile file) {
        try {
            // 检查文件是否为空
            if (file.isEmpty()) {
                throw new CustomException(ResultCodeEnum.EXCEL_IS_NULL);
            }

            // 读取 Excel 文件中的数据
            List<Procurement_needs> infoList = ExcelUtil.getReader(file.getInputStream()).readAll(Procurement_needs.class);

            // 检查数据是否为空
            if (CollectionUtil.isEmpty(infoList)) {
                throw new CustomException(ResultCodeEnum.EXCEL_IS_NULL);
            }

            // 批量添加数据
            for (Procurement_needs procurement_needs : infoList) {
                try {
                    // 确保 SKU 不为空
                    if (procurement_needs.getSku() == null || procurement_needs.getSku().isEmpty()) {
                        throw new CustomException(ResultCodeEnum.SKU_IS_NULL);
                    }

                    // 根据 SKU 调用匹配接口获取匹配数据
                    Data_Matching matchingData = data_matchingService.selectBySku(procurement_needs.getSku());
                    if (matchingData != null) {
                        // 将匹配数据填充到当前对象中
                        if (matchingData.getProductName() != null) {
                            procurement_needs.setProductName(matchingData.getProductName());
                        }
                        if (matchingData.getAttribute() != null) {
                            procurement_needs.setAttribute(matchingData.getAttribute());
                        }
                        if (matchingData.getFactory() != null) {
                            procurement_needs.setFactory(matchingData.getFactory());
                        }
                        if (matchingData.getCartonsNumber() != null) {
                            procurement_needs.setCartonNumber(matchingData.getCartonsNumber());
                        }
                    }

                    // 添加数据
                    procurement_needsService.add(procurement_needs);
                } catch (Exception e) {
                    // 记录错误日志
                    e.printStackTrace();
                    throw new CustomException(ResultCodeEnum.IMPORT_ERROR);
                }
            }

            return Result.success();
        } catch (IOException e) {
            // 处理文件读取异常
            e.printStackTrace();
            throw new CustomException(ResultCodeEnum.FILE_READ_ERROR);
        }
    }
}
