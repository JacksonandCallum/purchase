package com.example.entity;

import cn.hutool.core.annotation.Alias;

public class Procurement_needs {
    private Integer id;

    // 数据输入日期
    @Alias("数据输入日期")
    private String inputDate;

    // 计划编号
    @Alias("计划编号")
    private String planId;

    // 计划编号辅助列
    @Alias("计划编号辅助列")
    private String planAuxiliaryId;

    @Alias("SKU")
    private String sku;

    // 品名
    @Alias("品名")
    private String productName;

    // 颜色及规格
    @Alias("颜色及规格")
    private String attribute;

    // 期望到货时间
    @Alias("期望到货时间")
    private String expectedArrivalTime;

    // 工厂
    @Alias("工厂")
    private String factory;

    // 仓库
    @Alias("仓库")
    private String warehouse;

    // 店铺
    @Alias("店铺")
    private String shop;

    // 采购量
    @Alias("采购量")
    private Integer purchaseVolume;

    // 装箱数
    @Alias("装箱数")
    private Integer cartonNumber;

    // 是否整箱
    @Alias("是否整箱")
    private Boolean hasFull;

    // 是否新增
    @Alias("是否新增")
    private Boolean hasNew;

    // 是否加急
    @Alias("是否加急")
    private Boolean hasUrgent;

    // 运营备注
    @Alias("运营备注")
    private String operationRemark;

    // 交期答复1
    @Alias("交期答复1")
    private String deliveryDateResponse;

    // 交期答复2（飞书）
    @Alias("交期答复2（飞书）")
    private String deliveryDateResponseFeishu;

    // 已下单数量
    @Alias("已下单数量")
    private Integer orderedQuantity;

    // 待到货数量
    @Alias("待到货数量")
    private Integer pendingArrivalQuantity;;

    // 已到货量
    @Alias("已到货量")
    private Integer receivedQuantity;

    // 剩余未采购量
    @Alias("剩余未采购量")
    private Integer remainingUnprocuredQuantity;

    // 是否完全采购
    @Alias("完全采购")
    private Boolean hasFullProcurement;

    // 是否全部到货
    @Alias("全部到货")
    private Boolean hasAllItemsArrived;

    // 采购备注
    @Alias("采购备注")
    private String purchaseNotes;

    // 交货/生产时长
    @Alias("交货/生产时长")
    private Integer deliverOrProductTime;

    // 期望到货时间倒计时
    @Alias("期望到货时间倒计时")
    private Integer expectArrivalTimeCountdown;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getInputDate() {
        return inputDate;
    }

    public void setInputDate(String inputDate) {
        this.inputDate = inputDate;
    }

    public String getPlanId() {
        return planId;
    }

    public void setPlanId(String planId) {
        this.planId = planId;
    }

    public String getPlanAuxiliaryId() {
        return planAuxiliaryId;
    }

    public void setPlanAuxiliaryId(String planAuxiliaryId) {
        this.planAuxiliaryId = planAuxiliaryId;
    }

    public String getSku() {
        return sku;
    }

    public void setSku(String sku) {
        this.sku = sku;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public String getAttribute() {
        return attribute;
    }

    public void setAttribute(String attribute) {
        this.attribute = attribute;
    }

    public String getExpectedArrivalTime() {
        return expectedArrivalTime;
    }

    public void setExpectedArrivalTime(String expectedArrivalTime) {
        this.expectedArrivalTime = expectedArrivalTime;
    }

    public String getFactory() {
        return factory;
    }

    public void setFactory(String factory) {
        this.factory = factory;
    }

    public String getWarehouse() {
        return warehouse;
    }

    public void setWarehouse(String warehouse) {
        this.warehouse = warehouse;
    }

    public String getShop() {
        return shop;
    }

    public void setShop(String shop) {
        this.shop = shop;
    }

    public Integer getPurchaseVolume() {
        return purchaseVolume;
    }

    public void setPurchaseVolume(Integer purchaseVolume) {
        this.purchaseVolume = purchaseVolume;
    }

    public Integer getCartonNumber() {
        return cartonNumber;
    }

    public void setCartonNumber(Integer cartonNumber) {
        this.cartonNumber = cartonNumber;
    }

    public Boolean getHasFull() {
        return hasFull;
    }

    public void setHasFull(Boolean hasFull) {
        this.hasFull = hasFull;
    }

    public Boolean getHasNew() {
        return hasNew;
    }

    public void setHasNew(Boolean hasNew) {
        this.hasNew = hasNew;
    }

    public Boolean getHasUrgent() {
        return hasUrgent;
    }

    public void setHasUrgent(Boolean hasUrgent) {
        this.hasUrgent = hasUrgent;
    }

    public String getOperationRemark() {
        return operationRemark;
    }

    public void setOperationRemark(String operationRemark) {
        this.operationRemark = operationRemark;
    }

    public String getDeliveryDateResponse() {
        return deliveryDateResponse;
    }

    public void setDeliveryDateResponse(String deliveryDateResponse) {
        this.deliveryDateResponse = deliveryDateResponse;
    }

    public String getDeliveryDateResponseFeishu() {
        return deliveryDateResponseFeishu;
    }

    public void setDeliveryDateResponseFeishu(String deliveryDateResponseFeishu) {
        this.deliveryDateResponseFeishu = deliveryDateResponseFeishu;
    }

    public Integer getOrderedQuantity() {
        return orderedQuantity;
    }

    public void setOrderedQuantity(Integer orderedQuantity) {
        this.orderedQuantity = orderedQuantity;
    }

    public Integer getPendingArrivalQuantity() {
        return pendingArrivalQuantity;
    }

    public void setPendingArrivalQuantity(Integer pendingArrivalQuantity) {
        this.pendingArrivalQuantity = pendingArrivalQuantity;
    }

    public Integer getReceivedQuantity() {
        return receivedQuantity;
    }

    public void setReceivedQuantity(Integer receivedQuantity) {
        this.receivedQuantity = receivedQuantity;
    }

    public Integer getRemainingUnprocuredQuantity() {
        return remainingUnprocuredQuantity;
    }

    public void setRemainingUnprocuredQuantity(Integer remainingUnprocuredQuantity) {
        this.remainingUnprocuredQuantity = remainingUnprocuredQuantity;
    }

    public Boolean getHasFullProcurement() {
        return hasFullProcurement;
    }

    public void setHasFullProcurement(Boolean hasFullProcurement) {
        this.hasFullProcurement = hasFullProcurement;
    }

    public Boolean getHasAllItemsArrived() {
        return hasAllItemsArrived;
    }

    public void setHasAllItemsArrived(Boolean hasAllItemsArrived) {
        this.hasAllItemsArrived = hasAllItemsArrived;
    }

    public String getPurchaseNotes() {
        return purchaseNotes;
    }

    public void setPurchaseNotes(String purchaseNotes) {
        this.purchaseNotes = purchaseNotes;
    }

    public Integer getDeliverOrProductTime() {
        return deliverOrProductTime;
    }

    public void setDeliverOrProductTime(Integer deliverOrProductTime) {
        this.deliverOrProductTime = deliverOrProductTime;
    }

    public Integer getExpectArrivalTimeCountdown() {
        return expectArrivalTimeCountdown;
    }

    public void setExpectArrivalTimeCountdown(Integer expectArrivalTimeCountdown) {
        this.expectArrivalTimeCountdown = expectArrivalTimeCountdown;
    }
}
