/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dto;

import java.sql.Date;

/**
 *
 * @author win
 */
public class ListOrderSales {

    private int id;
    private String name;
    private String imageUrl;
    private int quantity;
    private float totalMoney;
    private Date updateDate;
    private int orderID;
    private String status;
    private int orderStatus;
    private int statusOrderDetail;
    private int idOrderDetail;
    private String payment;
    private String paymentStatus;
    private String fullnameOrder;
    private String addressOrder;
    private String phoneOrder;
    private String notOrder;
    private int size;
    private int checkStatusOrderSale;

    public ListOrderSales() {
    }

    public ListOrderSales(int id, String name, String imageUrl, int quantity, float totalMoney, Date updateDate, int orderID, String status, int orderStatus, int statusOrderDetail, int idOrderDetail, String payment, String paymentStatus, String fullnameOrder, String addressOrder, String phoneOrder, String notOrder, int size, int checkStatusOrderSale) {
        this.id = id;
        this.name = name;
        this.imageUrl = imageUrl;
        this.quantity = quantity;
        this.totalMoney = totalMoney;
        this.updateDate = updateDate;
        this.orderID = orderID;
        this.status = status;
        this.orderStatus = orderStatus;
        this.statusOrderDetail = statusOrderDetail;
        this.idOrderDetail = idOrderDetail;
        this.payment = payment;
        this.paymentStatus = paymentStatus;
        this.fullnameOrder = fullnameOrder;
        this.addressOrder = addressOrder;
        this.phoneOrder = phoneOrder;
        this.notOrder = notOrder;
        this.size = size;
        this.checkStatusOrderSale = checkStatusOrderSale;
    }

    

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getImageUrl() {
        return imageUrl;
    }

    public void setImageUrl(String imageUrl) {
        this.imageUrl = imageUrl;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public float getTotalMoney() {
        return totalMoney;
    }

    public void setTotalMoney(float totalMoney) {
        this.totalMoney = totalMoney;
    }

    public Date getUpdateDate() {
        return updateDate;
    }

    public void setUpdateDate(Date updateDate) {
        this.updateDate = updateDate;
    }

    public int getOrderID() {
        return orderID;
    }

    public void setOrderID(int orderID) {
        this.orderID = orderID;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public int getOrderStatus() {
        return orderStatus;
    }

    public void setOrderStatus(int orderStatus) {
        this.orderStatus = orderStatus;
    }

    public int getStatusOrderDetail() {
        return statusOrderDetail;
    }

    public void setStatusOrderDetail(int statusOrderDetail) {
        this.statusOrderDetail = statusOrderDetail;
    }

    public int getIdOrderDetail() {
        return idOrderDetail;
    }

    public void setIdOrderDetail(int idOrderDetail) {
        this.idOrderDetail = idOrderDetail;
    }

    public String getPayment() {
        return payment;
    }

    public void setPayment(String payment) {
        this.payment = payment;
    }

    public String getPaymentStatus() {
        return paymentStatus;
    }

    public void setPaymentStatus(String paymentStatus) {
        this.paymentStatus = paymentStatus;
    }

    public String getFullnameOrder() {
        return fullnameOrder;
    }

    public void setFullnameOrder(String fullnameOrder) {
        this.fullnameOrder = fullnameOrder;
    }

    public String getAddressOrder() {
        return addressOrder;
    }

    public void setAddressOrder(String addressOrder) {
        this.addressOrder = addressOrder;
    }

    public String getPhoneOrder() {
        return phoneOrder;
    }

    public void setPhoneOrder(String phoneOrder) {
        this.phoneOrder = phoneOrder;
    }

    public String getNotOrder() {
        return notOrder;
    }

    public void setNotOrder(String notOrder) {
        this.notOrder = notOrder;
    }

    public int getSize() {
        return size;
    }

    public void setSize(int size) {
        this.size = size;
    }

    public int getCheckStatusOrderSale() {
        return checkStatusOrderSale;
    }

    public void setCheckStatusOrderSale(int checkStatusOrderSale) {
        this.checkStatusOrderSale = checkStatusOrderSale;
    }

    

   

}
