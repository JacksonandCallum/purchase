package com.example.entity;

import cn.hutool.core.annotation.Alias;

public class Data_Matching {
    private Integer id;

    @Alias("SKU")
    private String sku;

    // 美国MSKU
    @Alias("美国MSKU")
    private String msku;

    // 美国FNSKU
    @Alias("美国FNSKU")
    private String fnsku;

    // 品名
    @Alias("品名")
    private String productName;

    // 属性
    @Alias("属性")
    private String attribute;

    // 工厂
    @Alias("工厂")
    private String factory;

    // 加装数
    @Alias("装箱数")
    private Integer cartonsNumber;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getSku() {
        return sku;
    }

    public void setSku(String sku) {
        this.sku = sku;
    }

    public String getMsku() {
        return msku;
    }

    public void setMsku(String msku) {
        this.msku = msku;
    }

    public String getFnsku() {
        return fnsku;
    }

    public void setFnsku(String fnsku) {
        this.fnsku = fnsku;
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

    public String getFactory() {
        return factory;
    }

    public void setFactory(String factory) {
        this.factory = factory;
    }

    public Integer getCartonsNumber() {
        return cartonsNumber;
    }

    public void setCartonsNumber(Integer cartonsNumber) {
        this.cartonsNumber = cartonsNumber;
    }
}
