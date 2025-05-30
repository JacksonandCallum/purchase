package com.example.mapper;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.List;
import java.util.Map;
import java.util.Set;

public interface Warehouse_entryMapper {
    /**
     * 根据辅助列集合查询入库总量
     * @param auxColumns
     * @return
     */
    @Select(
            {
                    "<script>",
                    "SELECT auxiliary_column AS auxiliaryColumn, SUM(scheduled_receipt) AS total",
                    "FROM warehouse_entry",
                    "WHERE auxiliary_column IN",
                    "<foreach collection='auxColumns' item='col' open='(' separator=',' close=')'>",
                    "#{col}",
                    "</foreach>",
                    "GROUP BY auxiliary_column",
                    "</script>"
            }
    )
    List<Map<String, Object>> selectSumByAuxiliaryColumns(@Param("auxColumns") Set<String> auxColumns);

    /**
     * `auxColumn`（`auxiliaryColumn`） 绑定 到数据表字段`auxiliary_column`
     * 查询表中有 n 条记录，`scheduled_receipt`分别为 x1 x2 x3，则返回 x1 + x2 + x3
     * 如果没有匹配记录，则返回0
     * @param auxiliaryColumn
     * @return
     */
    @Select("SELECT COALESCE(SUM(scheduled_receipt), 0) FROM warehouse_entry WHERE auxiliary_column = #{auxColumn}")
    Integer sumByAuxiliaryColumn(@Param("auxColumn") String auxiliaryColumn);
}
