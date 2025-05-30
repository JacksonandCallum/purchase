package com.example.entity;

import cn.hutool.core.annotation.Alias;

public class Purchase_order {
    private Integer id;
    // AM计划号
    @Alias("AM计划号")
    private String AmPlanId;
    // 辅助列
    @Alias("辅助列")
    private String AuxiliaryColumn;
    // 采购单号
    @Alias("采购单号")
    private String PurchaseOrderId;
    // 采购状态
    @Alias("采购状态")
    private String ProcurementStatus;
    // 采购仓库
    @Alias("采购仓库")
    private String PurchasingWarehouse;
    // 产品维度
    @Alias("产品维度")
    private String ProductDimension;
    // 计划编号
    @Alias("计划编号")
    private String PlanId;
    // 品名
    @Alias("品名")
    private String ProductName;
    // SKU
    @Alias("SKU")
    private String sku;
    // 店铺
    @Alias("店铺")
    private String shop;
    // 采购量
    @Alias("采购量")
    private Integer ProcurementVolume;
    // AM单号
    @Alias("AM单号")
    private String AmTrackId;
    // 采购仓库（明细）
    @Alias("采购仓库（明细）")
    private String ProcurementWarehouseDetails;
    // 待到货量
    @Alias("待到货量")
    private Integer PendingArrivalQuantity;
    // 预计到货时间
    @Alias("预计到货时间")
    private String ExpectedDeliveryTime;
    // 到货量
    @Alias("到货量")
    private Integer ArrivalQuantity;
    // 辅助列
    @Alias("辅助列1")
    private String AuxiliaryColumn1;
    // 最终采购单号
    @Alias("最终采购单号")
    private String FinalPurchaseOrderId;
    // 新到货数量
    @Alias("新到货数量")
    private Integer NewArrivalsQuantity;
    // 实际总到货量
    @Alias("实际总到货量")
    private Integer ActualTotalArrivalQuantity;
    // 备注
    @Alias("备注")
    private String notes;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getAmPlanId() {
        return AmPlanId;
    }

    public void setAmPlanId(String amPlanId) {
        AmPlanId = amPlanId;
    }

    public String getAuxiliaryColumn() {
        return AuxiliaryColumn;
    }

    public void setAuxiliaryColumn(String auxiliaryColumn) {
        AuxiliaryColumn = auxiliaryColumn;
    }

    public String getPurchaseOrderId() {
        return PurchaseOrderId;
    }

    public void setPurchaseOrderId(String purchaseOrderId) {
        PurchaseOrderId = purchaseOrderId;
    }

    public String getProcurementStatus() {
        return ProcurementStatus;
    }

    public void setProcurementStatus(String procurementStatus) {
        ProcurementStatus = procurementStatus;
    }

    public String getPurchasingWarehouse() {
        return PurchasingWarehouse;
    }

    public void setPurchasingWarehouse(String purchasingWarehouse) {
        PurchasingWarehouse = purchasingWarehouse;
    }

    public String getProductDimension() {
        return ProductDimension;
    }

    public void setProductDimension(String productDimension) {
        ProductDimension = productDimension;
    }

    public String getPlanId() {
        return PlanId;
    }

    public void setPlanId(String planId) {
        PlanId = planId;
    }

    public String getProductName() {
        return ProductName;
    }

    public void setProductName(String productName) {
        ProductName = productName;
    }

    public String getSku() {
        return sku;
    }

    public void setSku(String sku) {
        this.sku = sku;
    }

    public String getShop() {
        return shop;
    }

    public void setShop(String shop) {
        this.shop = shop;
    }

    public Integer getProcurementVolume() {
        return ProcurementVolume;
    }

    public void setProcurementVolume(Integer procurementVolume) {
        ProcurementVolume = procurementVolume;
    }

    public String getAmTrackId() {
        return AmTrackId;
    }

    public void setAmTrackId(String amTrackId) {
        AmTrackId = amTrackId;
    }

    public String getProcurementWarehouseDetails() {
        return ProcurementWarehouseDetails;
    }

    public void setProcurementWarehouseDetails(String procurementWarehouseDetails) {
        ProcurementWarehouseDetails = procurementWarehouseDetails;
    }

    public Integer getPendingArrivalQuantity() {
        return PendingArrivalQuantity;
    }

    public void setPendingArrivalQuantity(Integer pendingArrivalQuantity) {
        PendingArrivalQuantity = pendingArrivalQuantity;
    }

    public String getExpectedDeliveryTime() {
        return ExpectedDeliveryTime;
    }

    public void setExpectedDeliveryTime(String expectedDeliveryTime) {
        ExpectedDeliveryTime = expectedDeliveryTime;
    }

    public Integer getArrivalQuantity() {
        return ArrivalQuantity;
    }

    public void setArrivalQuantity(Integer arrivalQuantity) {
        ArrivalQuantity = arrivalQuantity;
    }

    public String getAuxiliaryColumn1() {
        return AuxiliaryColumn1;
    }

    public void setAuxiliaryColumn1(String auxiliaryColumn1) {
        AuxiliaryColumn1 = auxiliaryColumn1;
    }

    public String getFinalPurchaseOrderId() {
        return FinalPurchaseOrderId;
    }

    public void setFinalPurchaseOrderId(String finalPurchaseOrderId) {
        FinalPurchaseOrderId = finalPurchaseOrderId;
    }

    public Integer getNewArrivalsQuantity() {
        return NewArrivalsQuantity;
    }

    public void setNewArrivalsQuantity(Integer newArrivalsQuantity) {
        NewArrivalsQuantity = newArrivalsQuantity;
    }

    public Integer getActualTotalArrivalQuantity() {
        return ActualTotalArrivalQuantity;
    }

    public void setActualTotalArrivalQuantity(Integer actualTotalArrivalQuantity) {
        ActualTotalArrivalQuantity = actualTotalArrivalQuantity;
    }

    public String getNotes() {
        return notes;
    }

    public void setNotes(String notes) {
        this.notes = notes;
    }
}
