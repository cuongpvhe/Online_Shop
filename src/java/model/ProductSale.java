/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.sql.Timestamp;

/**
 *
 * @author admin
 */
public class ProductSale {
    private Product product;
    private Timestamp startTime;
    private Timestamp endTime;
    private double salePrice;
    private double discount;
    private int isFlashSale;
    private int quantity;
    private int timeFrame;
    private int updateBy;
    private Timestamp createTime;

    public ProductSale() {
    }

    public ProductSale(Product product, Timestamp startTime, Timestamp endTime, double salePrice, double discount, int isFlashSale, int quantity, int timeFrame, int updateBy, Timestamp createTime) {
        this.product = product;
        this.startTime = startTime;
        this.endTime = endTime;
        this.salePrice = salePrice;
        this.discount = discount;
        this.isFlashSale = isFlashSale;
        this.quantity = quantity;
        this.timeFrame = timeFrame;
        this.updateBy = updateBy;
        this.createTime = createTime;
    }

    

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public Timestamp getStartTime() {
        return startTime;
    }

    public void setStartTime(Timestamp startTime) {
        this.startTime = startTime;
    }

    public Timestamp getEndTime() {
        return endTime;
    }

    public void setEndTime(Timestamp endTime) {
        this.endTime = endTime;
    }

    public double getSalePrice() {
        return salePrice;
    }

    public void setSalePrice(double salePrice) {
        this.salePrice = salePrice;
    }

    public double getDiscount() {
        return discount;
    }

    public void setDiscount(double discount) {
        this.discount = discount;
    }

    public int getIsFlashSale() {
        return isFlashSale;
    }

    public void setIsFlashSale(int isFlashSale) {
        this.isFlashSale = isFlashSale;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public int getTimeFrame() {
        return timeFrame;
    }

    public void setTimeFrame(int timeFrame) {
        this.timeFrame = timeFrame;
    }

    public int getUpdateBy() {
        return updateBy;
    }

    public Timestamp getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Timestamp createTime) {
        this.createTime = createTime;
    }
    

    public void setUpdateBy(int updateBy) {
        this.updateBy = updateBy;
    }

    @Override
    public String toString() {
        return "ProductSale{" + "product=" + product + ", startTime=" + startTime + ", endTime=" + endTime + ", salePrice=" + salePrice + ", discount=" + discount + ", isFlashSale=" + isFlashSale + ", quantity=" + quantity + ", timeFrame=" + timeFrame + ", updateBy=" + updateBy + '}';
    }
    
    
}
