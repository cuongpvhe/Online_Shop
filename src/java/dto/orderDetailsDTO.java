/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dto;

/**
 *
 * @author win
 */
public class orderDetailsDTO {
    private int id;
    private String image;
    private String nameProduct;
    private int size;
    private int quantity;
    private float totalMoney;
    private String payment;
    private String paymentStatus;
    private int orderDetailStatus;
    private int countFbAid;
    private int aid;
    private int pid;
    

    public orderDetailsDTO() {
    }

    public orderDetailsDTO(int id, String image, String nameProduct, int size, int quantity, float totalMoney, String payment, String paymentStatus, int orderDetailStatus, int countFbAid, int aid, int pid) {
        this.id = id;
        this.image = image;
        this.nameProduct = nameProduct;
        this.size = size;
        this.quantity = quantity;
        this.totalMoney = totalMoney;
        this.payment = payment;
        this.paymentStatus = paymentStatus;
        this.orderDetailStatus = orderDetailStatus;
        this.countFbAid = countFbAid;
        this.aid = aid;
        this.pid = pid;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getNameProduct() {
        return nameProduct;
    }

    public void setNameProduct(String nameProduct) {
        this.nameProduct = nameProduct;
    }

    public int getSize() {
        return size;
    }

    public void setSize(int size) {
        this.size = size;
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

    public int getOrderDetailStatus() {
        return orderDetailStatus;
    }

    public void setOrderDetailStatus(int orderDetailStatus) {
        this.orderDetailStatus = orderDetailStatus;
    }

    public int getCountFbAid() {
        return countFbAid;
    }

    public void setCountFbAid(int countFbAid) {
        this.countFbAid = countFbAid;
    }

    public int getAid() {
        return aid;
    }

    public void setAid(int aid) {
        this.aid = aid;
    }

    public int getPid() {
        return pid;
    }

    public void setPid(int pid) {
        this.pid = pid;
    }

   
    

   
    
    
    
    
    
}

