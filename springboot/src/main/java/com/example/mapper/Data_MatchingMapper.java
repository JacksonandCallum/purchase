package com.example.mapper;

import com.example.entity.Data_Matching;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface Data_MatchingMapper {
    /**
     * 新增
     * @param data_matching
     */
    void insert(Data_Matching data_matching);

    /**
     * 删除
     * @param id
     */
    void deleteById(Integer id);

    /**
     * 修改
     * @param data_matching
     */
    void updateById(Data_Matching data_matching);

    /**
     * 根据id查询
     * @param id
     * @return
     */
    Data_Matching selectById(Integer id);

    /**
     * 查询全部
     * @param data_matching
     * @return
     */
    List<Data_Matching> selectAll(Data_Matching data_matching);

    List<Data_Matching> findAll();

    /**
     * 根据SKU匹配数据
     * @param sku
     * @return
     */
    Data_Matching selectBySku(@Param("sku") String sku);
}
