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
public class OrderDTO {
     private int id;
    private int AccountID;
    private float totalMoney;
    private String fullName;
    private String email;
    private String phoneNumber;
    private String address;
    private String note;
    private Date createDate;
    private Date finishDate;
    private int status;
    private String statusName;
    private int statusOrderDetail;
    private int checkPaymentStatus;

    public OrderDTO() {
    }

    public OrderDTO(int id, int AccountID, float totalMoney, String fullName, String email, String phoneNumber, String address, String note, Date createDate, Date finishDate, int status, String statusName, int statusOrderDetail, int checkPaymentStatus) {
        this.id = id;
        this.AccountID = AccountID;
        this.totalMoney = totalMoney;
        this.fullName = fullName;
        this.email = email;
        this.phoneNumber = phoneNumber;
        this.address = address;
        this.note = note;
        this.createDate = createDate;
        this.finishDate = finishDate;
        this.status = status;
        this.statusName = statusName;
        this.statusOrderDetail = statusOrderDetail;
        this.checkPaymentStatus = checkPaymentStatus;
    }


    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getAccountID() {
        return AccountID;
    }

    public void setAccountID(int AccountID) {
        this.AccountID = AccountID;
    }

    public float getTotalMoney() {
        return totalMoney;
    }

    public void setTotalMoney(float totalMoney) {
        this.totalMoney = totalMoney;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }

    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    public Date getFinishDate() {
        return finishDate;
    }

    public void setFinishDate(Date finishDate) {
        this.finishDate = finishDate;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public String getStatusName() {
        return statusName;
    }

    public void setStatusName(String statusName) {
        this.statusName = statusName;
    }

    public int getStatusOrderDetail() {
        return statusOrderDetail;
    }

    public void setStatusOrderDetail(int statusOrderDetail) {
        this.statusOrderDetail = statusOrderDetail;
    }

    public int getCheckPaymentStatus() {
        return checkPaymentStatus;
    }

    public void setCheckPaymentStatus(int checkPaymentStatus) {
        this.checkPaymentStatus = checkPaymentStatus;
    }

}

