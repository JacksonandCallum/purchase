package com.example.mapper;

import com.example.entity.InvitationApplication;
import org.apache.ibatis.annotations.*;

import java.util.List;

public interface InvitationApplicationMapper {
    /**
     * 新增
     * @param application
     * @return
     */
    @Insert("INSERT INTO invite_application(applicant_email, apply_reason, status,reviewer_id) " +
            "VALUES(#{applicantEmail}, #{applyReason}, #{status}), #{reviewerId}")
    @Options(useGeneratedKeys = true, keyProperty = "id")
    int insert(InvitationApplication application);

    /**
     * 修改
     * @param application
     * @return
     */
    @Update("UPDATE invite_application SET status=#{status}, invite_code=#{inviteCode}, " +
            "reviewer_id=#{reviewerId}, review_comment=#{reviewComment} WHERE id=#{id}")
    int update(InvitationApplication application);

    /**
     * 根据状态查询申请记录
     * @param status 状态值（PENDING/APPROVED/REJECTED）
     * @return 申请记录列表
     */
    @Select("SELECT * FROM invite_application WHERE status = #{status} ORDER BY created_at DESC")
    List<InvitationApplication> selectByStatus(@Param("status") String status);

    /**
     * 根据id查询
     * @param id
     * @return
     */
    @Select("SELECT * FROM invite_application WHERE id = #{id}")
    InvitationApplication selectById(Integer id);

    /**
     * 删除
     * @param id
     */
    void deleteById(Integer id);

    /**
     * 修改
     * @param invitationApplication
     */
    void updateById(InvitationApplication invitationApplication);

    /**
     * 查询全部
     * @param invitationApplication
     * @return
     */
    List<InvitationApplication> selectAll(InvitationApplication invitationApplication);
}
