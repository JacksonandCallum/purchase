package com.example.mapper;

import com.example.entity.InvitationCode;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import java.util.List;

public interface InvitationCodeMapper {
    /**
     * 查询有效邀请码
     * @param inviteCode 邀请码值
     * @return 有效的邀请码实体
     */
    @Select("SELECT * FROM invitation_code " +
            "WHERE code = #{code} " +
            "AND status = 0 " +
            "AND expire_time > NOW() " +
            "AND used_count < use_count")
    InvitationCode selectValidCode(String inviteCode);

    /**
     * 增加已使用次数
     * @param id 邀请码ID
     * @return 更新行数
     */
    @Update("UPDATE invitation_code SET used_count = used_count + 1 WHERE id = #{id}")
    int incrementUsedCount(Long id);


    @Insert("INSERT INTO invitation_code(code, generator, status, expire_time, use_count, bind_email) " +
            "VALUES(#{code}, #{generator}, #{status}, #{expireTime}, #{useCount}, #{bindEmail})")
    int insert(InvitationCode code);

    @Select("SELECT * FROM invitation_code WHERE code = #{code}")
    InvitationCode selectByCode(String code);

    /**
     * 更新邀请码状态
     * @param code 邀请码值
     * @param status 新状态（0-未使用，1-已使用）
     * @return 更新行数
     */
    @Update("UPDATE invitation_code SET status = #{status} WHERE code = #{code}")
    int updateStatus(@Param("code") String code, @Param("status") Integer status);

    /**
     * 删除
     * @param id
     */
    void deleteById(Integer id);

    /**
     * 根据id查询
     * @param id
     * @return
     */
    InvitationCode selectById(Integer id);

    /**
     * 查询全部
     * @param invitationCode
     * @return
     */
    List<InvitationCode> selectAll(InvitationCode invitationCode);
}
