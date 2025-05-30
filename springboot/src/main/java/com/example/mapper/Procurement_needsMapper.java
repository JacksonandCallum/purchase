package com.example.mapper;

import com.example.entity.Procurement_needs;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface Procurement_needsMapper {
    /**
     * 新增
     * @param procurementNeeds
     */
    void insert(Procurement_needs procurementNeeds);

    /**
     * 删除
     * @param id
     */
    void deleteById(Integer id);

    /**
     * 修改
     * @param procurementNeeds
     */
    void updateById(Procurement_needs procurementNeeds);

    /**
     * 根据id查询
     * @param id
     * @return
     */
    Procurement_needs selectById(Integer id);

    /**
     * 查询全部
     * @param procurementNeeds
     * @return
     */
    List<Procurement_needs> selectAll(Procurement_needs procurementNeeds);

    List<Procurement_needs> findAll();

    /**
     * 批量更新辅助列
     * @param procurementNeeds
     */
    void batchUpdatePlanAuxiliary(@Param("list") List<Procurement_needs> procurementNeeds);

    /**
     * 查询所有采购需求
     * @return
     */
    @Select("SELECT id, plan_id AS planId, plan_auxiliary_id AS planAuxiliaryId FROM procurement_needs")
    List<Procurement_needs> selectALL();
}
