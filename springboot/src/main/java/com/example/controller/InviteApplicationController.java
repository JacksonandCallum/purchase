package com.example.controller;

import com.example.common.Result;
import com.example.entity.InvitationApplication;
import com.example.service.InvitationService;
import com.github.pagehelper.PageInfo;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.List;

@RestController
@RequestMapping("/invite-application")
public class InviteApplicationController {
    @Resource
    private InvitationService invitationService;

    /**
     * 新增
     */
    @PostMapping("/add")
    public Result add(@RequestBody InvitationApplication invitationApplication) {
        invitationService.add(invitationApplication);
        return Result.success();
    }

    /**
     * 删除
     */
    @DeleteMapping("/delete/{id}")
    public Result deleteById(@PathVariable Integer id) {
        invitationService.deleteById(id);
        return Result.success();
    }

    /**
     * 批量删除
     */
    @DeleteMapping("/delete/batch")
    public Result deleteBatch(@RequestBody List<Integer> ids) {
        invitationService.deleteBatch(ids);
        return Result.success();
    }

    /**
     * 修改
     */
    @PutMapping("/update")
    public Result updateById(@RequestBody InvitationApplication invitationApplication) {
        invitationService.updateById(invitationApplication);
        return Result.success();
    }

    /**
     * 根据ID查询
     */
    @GetMapping("/selectById/{id}")
    public Result selectById(@PathVariable Integer id) {
        InvitationApplication invitationApplication = invitationService.selectById(id);
        return Result.success(invitationApplication);
    }

    /**
     * 查询所有
     */
    @GetMapping("/selectAll")
    public Result selectAll(InvitationApplication invitationApplication ) {
        List<InvitationApplication> list = invitationService.selectAll(invitationApplication);
        return Result.success(list);
    }

    /**
     * 分页查询
     */
    @GetMapping("/selectPage")
    public Result selectPage(InvitationApplication invitationApplication,
                             @RequestParam(defaultValue = "1") Integer pageNum,
                             @RequestParam(defaultValue = "10") Integer pageSize) {
        PageInfo<InvitationApplication> page = invitationService.selectPage(invitationApplication, pageNum, pageSize);
        return Result.success(page);
    }
}
