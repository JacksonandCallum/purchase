package com.example.entity;

public class Warehouse_entry {
    private Integer id;

    // 辅助列
    private String auxiliaryColumn;

    // PP计划
    private String ppPlan;

    // AM计划
    private String amPlan;

    // PO辅助列1
    private String poAuxiliaryColumn1;

    // PO辅助列2
    private String poAuxiliaryColumn2;

    // 入库单号
    private String warehouseId;

    // 入库仓库
    private String storageWarehouse;

    // 入库类型
    private String storageType;

    // 单据状态
    private String documentStatus;

    // 单据备注
    private String documentRemarks;

    // 产品标签
    private String productLabel;

    // SKU
    private String sku;

    // 品名
    private String productName;

    // 店铺
    private String shop;

    // 入库量
    private Integer scheduledReceipt;

    // 良品量
    private Integer goodQualityQuantity;

    // 产品备注
    private String productRemarks;

    // 北美到货量
    private Integer northAmericanArrivals;

    // 欧洲到货量
    private Integer europeArrivals;

    // 公司仓到货量
    private Integer companyWarehouseArrivals;

    // 通北美（报）
    private String northAmericaNews;

    // 通欧（报）
    private String europeNews;

    // 通（公司仓）
    private String companyWarehouseNews;

    // 合作账号
    private String cooperativeAccount;

    // Lilybeam北美
    private String lilybeamNorthAmerica;

    // Lilybeam欧洲
    private String lilybeamEurope;

    // Lilybeam公司仓
    private String lilybeamCompanyWarehouse;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getAuxiliaryColumn() {
        return auxiliaryColumn;
    }

    public void setAuxiliaryColumn(String auxiliaryColumn) {
        this.auxiliaryColumn = auxiliaryColumn;
    }

    public String getPpPlan() {
        return ppPlan;
    }

    public void setPpPlan(String ppPlan) {
        this.ppPlan = ppPlan;
    }

    public String getAmPlan() {
        return amPlan;
    }

    public void setAmPlan(String amPlan) {
        this.amPlan = amPlan;
    }

    public String getPoAuxiliaryColumn1() {
        return poAuxiliaryColumn1;
    }

    public void setPoAuxiliaryColumn1(String poAuxiliaryColumn1) {
        this.poAuxiliaryColumn1 = poAuxiliaryColumn1;
    }

    public String getPoAuxiliaryColumn2() {
        return poAuxiliaryColumn2;
    }

    public void setPoAuxiliaryColumn2(String poAuxiliaryColumn2) {
        this.poAuxiliaryColumn2 = poAuxiliaryColumn2;
    }

    public String getWarehouseId() {
        return warehouseId;
    }

    public void setWarehouseId(String warehouseId) {
        this.warehouseId = warehouseId;
    }

    public String getStorageWarehouse() {
        return storageWarehouse;
    }

    public void setStorageWarehouse(String storageWarehouse) {
        this.storageWarehouse = storageWarehouse;
    }

    public String getStorageType() {
        return storageType;
    }

    public void setStorageType(String storageType) {
        this.storageType = storageType;
    }

    public String getDocumentStatus() {
        return documentStatus;
    }

    public void setDocumentStatus(String documentStatus) {
        this.documentStatus = documentStatus;
    }

    public String getDocumentRemarks() {
        return documentRemarks;
    }

    public void setDocumentRemarks(String documentRemarks) {
        this.documentRemarks = documentRemarks;
    }

    public String getProductLabel() {
        return productLabel;
    }

    public void setProductLabel(String productLabel) {
        this.productLabel = productLabel;
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

    public String getShop() {
        return shop;
    }

    public void setShop(String shop) {
        this.shop = shop;
    }

    public Integer getScheduledReceipt() {
        return scheduledReceipt;
    }

    public void setScheduledReceipt(Integer scheduledReceipt) {
        this.scheduledReceipt = scheduledReceipt;
    }

    public Integer getGoodQualityQuantity() {
        return goodQualityQuantity;
    }

    public void setGoodQualityQuantity(Integer goodQualityQuantity) {
        this.goodQualityQuantity = goodQualityQuantity;
    }

    public String getProductRemarks() {
        return productRemarks;
    }

    public void setProductRemarks(String productRemarks) {
        this.productRemarks = productRemarks;
    }

    public Integer getNorthAmericanArrivals() {
        return northAmericanArrivals;
    }

    public void setNorthAmericanArrivals(Integer northAmericanArrivals) {
        this.northAmericanArrivals = northAmericanArrivals;
    }

    public Integer getEuropeArrivals() {
        return europeArrivals;
    }

    public void setEuropeArrivals(Integer europeArrivals) {
        this.europeArrivals = europeArrivals;
    }

    public Integer getCompanyWarehouseArrivals() {
        return companyWarehouseArrivals;
    }

    public void setCompanyWarehouseArrivals(Integer companyWarehouseArrivals) {
        this.companyWarehouseArrivals = companyWarehouseArrivals;
    }

    public String getNorthAmericaNews() {
        return northAmericaNews;
    }

    public void setNorthAmericaNews(String northAmericaNews) {
        this.northAmericaNews = northAmericaNews;
    }

    public String getEuropeNews() {
        return europeNews;
    }

    public void setEuropeNews(String europeNews) {
        this.europeNews = europeNews;
    }

    public String getCompanyWarehouseNews() {
        return companyWarehouseNews;
    }

    public void setCompanyWarehouseNews(String companyWarehouseNews) {
        this.companyWarehouseNews = companyWarehouseNews;
    }

    public String getCooperativeAccount() {
        return cooperativeAccount;
    }

    public void setCooperativeAccount(String cooperativeAccount) {
        this.cooperativeAccount = cooperativeAccount;
    }

    public String getLilybeamNorthAmerica() {
        return lilybeamNorthAmerica;
    }

    public void setLilybeamNorthAmerica(String lilybeamNorthAmerica) {
        this.lilybeamNorthAmerica = lilybeamNorthAmerica;
    }

    public String getLilybeamEurope() {
        return lilybeamEurope;
    }

    public void setLilybeamEurope(String lilybeamEurope) {
        this.lilybeamEurope = lilybeamEurope;
    }

    public String getLilybeamCompanyWarehouse() {
        return lilybeamCompanyWarehouse;
    }

    public void setLilybeamCompanyWarehouse(String lilybeamCompanyWarehouse) {
        this.lilybeamCompanyWarehouse = lilybeamCompanyWarehouse;
    }
}
