package com.example.controller;

import com.example.common.Result;
import com.example.entity.InvitationCode;
import com.example.service.InviteCodeService;
import com.github.pagehelper.PageInfo;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.List;

@RestController
@RequestMapping("/invite-code")
public class InviteCodeController {

    @Resource
    private InviteCodeService inviteCodeService;


    /**
     * 删除
     */
    @DeleteMapping("/delete/{id}")
    public Result deleteById(@PathVariable Integer id) {
        inviteCodeService.deleteById(id);
        return Result.success();
    }

    /**
     * 批量删除
     */
    @DeleteMapping("/delete/batch")
    public Result deleteBatch(@RequestBody List<Integer> ids) {
        inviteCodeService.deleteBatch(ids);
        return Result.success();
    }

    /**
     * 根据ID查询
     */
    @GetMapping("/selectById/{id}")
    public Result selectById(@PathVariable Integer id) {
        InvitationCode invitationCode = inviteCodeService.selectById(id);
        return Result.success(invitationCode);
    }

    /**
     * 查询所有
     */
    @GetMapping("/selectAll")
    public Result selectAll(InvitationCode invitationCode ) {
        List<InvitationCode> list = inviteCodeService.selectAll(invitationCode);
        return Result.success(list);
    }

    /**
     * 分页查询
     */
    @GetMapping("/selectPage")
    public Result selectPage(InvitationCode invitationCode,
                             @RequestParam(defaultValue = "1") Integer pageNum,
                             @RequestParam(defaultValue = "10") Integer pageSize) {
        PageInfo<InvitationCode> page = inviteCodeService.selectPage(invitationCode, pageNum, pageSize);
        return Result.success(page);
    }
}
