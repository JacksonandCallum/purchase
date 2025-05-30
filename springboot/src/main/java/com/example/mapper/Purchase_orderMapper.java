package com.example.mapper;

import com.example.entity.Purchase_order;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.ArrayList;
import java.util.List;

public interface Purchase_orderMapper {
    /**
     * 新增
     * @param purchase_order
     */
    void insert(Purchase_order purchase_order);

    /**
     * 删除
     * @param id
     */
    void deleteById(Integer id);

    /**
     * 修改
     * @param purchase_order
     */
    void updateById(Purchase_order purchase_order);

    /**
     * 根据id查询
     * @param id
     * @return
     */
    Purchase_order selectById(Integer id);

    /**
     * 查询全部
     * @param purchase_order
     * @return
     */
    List<Purchase_order> selectAll(Purchase_order purchase_order);

    List<Purchase_order> findAll();

    /**
     * 获取所有采购单的辅助列和ID
     * @return
     */
    @Select("SELECT id, auxiliary_column AS auxiliaryColumn FROM purchase_order")
    List<Purchase_order> selectAllPurchaseOrders();

    void batchUpdateNewArrivals(List<Purchase_order> purchaseOrders);

    /**
     * 根据辅助列更新新到货数量
     * @param auxiliaryColumn 辅助列值
     * @param quantity 新到货数量
     * @return 更新的记录数
     */
    Integer updateNewArrivalsByAuxColumn(@Param("auxColumn") String auxiliaryColumn, @Param("quantity") int quantity);

    /**
     * 根据AM计划号集合查询映射关系
     * @param amPlanIds
     * @return
     */
    @Select(
            {
                    "<script>",
                    "SELECT am_plan_id AS amPlanId, plan_id AS planId ",
                    "FROM purchase_order ",
                    "WHERE am_plan_id IN ",
                    "<foreach item='item' collection='amPlanIds' open='(' separator=',' close=')'>",
                    "#{item}",
                    "</foreach>",
                    "GROUP BY am_plan_id", // 确保唯一性
                    "</script>"
            }
    )
    List<Purchase_order> selectMappingByAmPlanIds(@Param("amPlanIds") List<String> amPlanIds);

    /**
     * 根据AM计划号（即采购需求的am_plan_id）查询对应的计划编号
     * @param originalPlanId amPlanId 对应采购需求的am_plan_id字段
     * @return 采购单中的plan_id（对应Excel的G列 -> 计划编号）
     */
    @Select(
            "SELECT plan_id AS planId " +
            "FROM purchase_order " +
            "WHERE am_plan_id = #{amPlanId} " +
            "ORDER BY id DESC LIMIT 1"
    ) // 取最新记录
    String selectPlanIdByAmPlanId(@Param("amPlanId") String originalPlanId);
}
