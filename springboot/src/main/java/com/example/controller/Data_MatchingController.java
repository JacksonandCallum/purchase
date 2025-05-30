package com.example.controller;

import cn.hutool.core.collection.CollectionUtil;
import cn.hutool.core.io.IoUtil;
import cn.hutool.poi.excel.ExcelUtil;
import cn.hutool.poi.excel.ExcelWriter;
import com.example.common.Result;
import com.example.common.enums.ResultCodeEnum;
import com.example.entity.Data_Matching;
import com.example.exception.CustomException;
import com.example.service.Data_MatchingService;
import com.github.pagehelper.PageInfo;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.*;


@RestController
@RequestMapping("/data-match")
public class Data_MatchingController {
    @Resource
    private Data_MatchingService data_matchingService;

    /**
     * 新增
     */
    @PostMapping("/add")
    public Result add(@RequestBody Data_Matching data_matching) {
        data_matchingService.add(data_matching);
        return Result.success();
    }

    /**
     * 删除
     */
    @DeleteMapping("/delete/{id}")
    public Result deleteById(@PathVariable Integer id) {
        data_matchingService.deleteById(id);
        return Result.success();
    }

    /**
     * 批量删除
     */
    @DeleteMapping("/delete/batch")
    public Result deleteBatch(@RequestBody List<Integer> ids) {
        data_matchingService.deleteBatch(ids);
        return Result.success();
    }

    /**
     * 修改
     */
    @PutMapping("/update")
    public Result updateById(@RequestBody Data_Matching data_matching) {
        data_matchingService.updateById(data_matching);
        return Result.success();
    }

    /**
     * 根据ID查询
     */
    @GetMapping("/selectById/{id}")
    public Result selectById(@PathVariable Integer id) {
        Data_Matching data_matching = data_matchingService.selectById(id);
        return Result.success(data_matching);
    }

    /**
     * 查询所有
     */
    @GetMapping("/selectAll")
    public Result selectAll(Data_Matching data_matching ) {
        List<Data_Matching> list = data_matchingService.selectAll(data_matching);
        return Result.success(list);
    }

    /**
     * 分页查询
     */
    @GetMapping("/selectPage")
    public Result selectPage(Data_Matching data_matching,
                             @RequestParam(defaultValue = "1") Integer pageNum,
                             @RequestParam(defaultValue = "10") Integer pageSize) {
        PageInfo<Data_Matching> page = data_matchingService.selectPage(data_matching, pageNum, pageSize);
        return Result.success(page);
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
        List<Data_Matching> all = data_matchingService.findAll();
        if (CollectionUtil.isEmpty(all)) {
            throw new CustomException(ResultCodeEnum.DATA_IS_NULL);
        }

        // 定义一个List和Map<key,value>出来,存储处理之后的数据,用于塞到list里
        List<Map<String, Object>> list = new ArrayList<>(all.size());
        // 遍历每一条数据，然后封装到Map<key,value>,把这个map塞到list里
        for (Data_Matching data_matching : all) {
            Map<String, Object> row = new LinkedHashMap<>();
            row.put("SKU", data_matching.getSku());
            row.put("美国MSKU", data_matching.getMsku());
            row.put("美国FNSKU", data_matching.getFnsku());
            row.put("品名",data_matching.getProductName());
            row.put("属性",data_matching.getAttribute());
            row.put("工厂",data_matching.getFactory());
            row.put("装箱数",data_matching.getCartonsNumber());
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
        List<Data_Matching> infoList = ExcelUtil.getReader(file.getInputStream()).readAll(Data_Matching.class);
        if (CollectionUtil.isEmpty(infoList)) {
            throw new CustomException(ResultCodeEnum.EXCEL_IS_NULL);
        }else {
            for (Data_Matching data_matching : infoList) {
                try {
                    data_matchingService.add(data_matching);
                }catch (Exception e) {
                    e.printStackTrace();
                }
            }
        }
        return Result.success();
    }

    /**
     * 根据SKU匹配数据
     * @param sku
     * @return
     */
    @GetMapping("/selectBySku")
    public Result selectBySku(@RequestParam String sku) {
        Data_Matching data_matching = data_matchingService.selectBySku(sku);
        return Result.success(data_matching);
    }
}
