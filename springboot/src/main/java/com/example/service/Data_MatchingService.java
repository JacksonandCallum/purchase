package com.example.service;

import com.example.entity.Data_Matching;
import com.example.mapper.Data_MatchingMapper;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class Data_MatchingService {
    @Resource
    private Data_MatchingMapper data_MatchingMapper;

    /**
     * 新增
     * @param data_matching
     */
    public void add(Data_Matching data_matching) {
        data_MatchingMapper.insert(data_matching);
    }

    /**
     * 删除
     * @param id
     */
    public void deleteById(Integer id) {
        data_MatchingMapper.deleteById(id);
    }

    /**
     * 批量删除
     * @param ids
     */
    public void deleteBatch(List<Integer> ids) {
        for (Integer id : ids) {
            data_MatchingMapper.deleteById(id);
        }
    }

    /**
     * 修改
     * @param data_matching
     */
    public void updateById(Data_Matching data_matching) {
        data_MatchingMapper.updateById(data_matching);
    }

    /**
     * 根据id查询
     * @param id
     * @return
     */
    public Data_Matching selectById(Integer id) {
        Data_Matching data_matching = data_MatchingMapper.selectById(id);
        return data_matching;
    }

    /**
     * 查询全部
     * @param data_matching
     * @return
     */
    public List<Data_Matching> selectAll(Data_Matching data_matching) {
        return data_MatchingMapper.selectAll(data_matching);
    }

    /**
     * 分页查询
     * @param data_matching
     * @param pageNum
     * @param pageSize
     * @return
     */
    public PageInfo<Data_Matching> selectPage(Data_Matching data_matching, Integer pageNum, Integer pageSize) {
        PageHelper.startPage(pageNum, pageSize);
        List<Data_Matching> list = data_MatchingMapper.selectAll(data_matching);
        return PageInfo.of(list);
    }

    public List<Data_Matching> findAll() {
        return data_MatchingMapper.findAll();
    }

    /**
     * 根据SKU匹配数据
     * @param sku
     * @return
     */
    public Data_Matching selectBySku(String sku) {
        return data_MatchingMapper.selectBySku(sku);
    }
}
