package com.example.common.enums;

public enum ConstantEnum {
    // 待审批
    //    Pending_Approval("待审批"),
    待审批("待审批"),
    // 待提交
    //    To_Be_Submitted("待提交"),
    待提交("待提交"),
    // 待到货
    //    Until_The_Goods_Arrive("待到货"),
    待到货("待到货"),
    // 已完成
    //    Completed("已完成"),
    已完成("已完成"),
    ;
    public final String message;

    ConstantEnum(String message) {
        this.message = message;
    }

}
