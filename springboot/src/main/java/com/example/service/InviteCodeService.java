package com.example.service;

import com.example.entity.InvitationCode;
import com.example.mapper.InvitationCodeMapper;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class InviteCodeService {

    @Resource
    private InvitationCodeMapper invitationCodeMapper;

    /**
     * 删除
     * @param id
     */
    public void deleteById(Integer id) {
        invitationCodeMapper.deleteById(id);
    }

    /**
     * 批量删除
     * @param ids
     */
    public void deleteBatch(List<Integer> ids) {
        for (Integer id : ids) {
            invitationCodeMapper.deleteById(id);
        }
    }

    /**
     * 根据id查询
     * @param id
     * @return
     */
    public InvitationCode selectById(Integer id) {
        InvitationCode invitationCode = invitationCodeMapper.selectById(id);
        return invitationCode;
    }

    /**
     * 查询全部
     * @param invitationCode
     * @return
     */
    public List<InvitationCode> selectAll(InvitationCode invitationCode) {
        return invitationCodeMapper.selectAll(invitationCode);
    }

    /**
     * 分页查询
     * @param invitationCode
     * @param pageNum
     * @param pageSize
     * @return
     */
    public PageInfo<InvitationCode> selectPage(InvitationCode invitationCode, Integer pageNum, Integer pageSize) {
        PageHelper.startPage(pageNum, pageSize);
        List<InvitationCode> list = invitationCodeMapper.selectAll(invitationCode);
        return PageInfo.of(list);
    }
}
