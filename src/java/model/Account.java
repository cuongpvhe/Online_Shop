/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.sql.Date;

/**
 *
 * @author Ruan
 */
public class Account {
    private int id;
    private String email;
    private String password;
    private String fullName;
    private int gender;
    private String phoneNumber;
    private String address;
    private String img;
    private int loginWith;
    private int status;
    private Date lastDateLogin;
    private Date createDate;
    private Date updateDate;
    private int roleId;

    public Account() {
    }

    public Account(int id, String email, String password, String fullName, int gender, String phoneNumber, String address, String img, int loginWith, int status, Date lastDateLogin, Date createDate, Date updateDate, int roleId) {
        this.id = id;
        this.email = email;
        this.password = password;
        this.fullName = fullName;
        this.gender = gender;
        this.phoneNumber = phoneNumber;
        this.address = address;
        this.img = img;
        this.loginWith = loginWith;
        this.status = status;
        this.lastDateLogin = lastDateLogin;
        this.createDate = createDate;
        this.updateDate = updateDate;
        this.roleId = roleId;
    }

    public Account(String email, String password, String fullName, int gender, String phoneNumber, String address) {
        this.email = email;
        this.password = password;
        this.fullName = fullName;
        this.gender = gender;
        this.phoneNumber = phoneNumber;
        this.address = address;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public int getGender() {
        return gender;
    }

    public void setGender(int gender) {
        this.gender = gender;
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

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public int getLoginWith() {
        return loginWith;
    }

    public void setLoginWith(int loginWith) {
        this.loginWith = loginWith;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public Date getLastDateLogin() {
        return lastDateLogin;
    }

    public void setLastDateLogin(Date lastDateLogin) {
        this.lastDateLogin = lastDateLogin;
    }

    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    public Date getUpdateDate() {
        return updateDate;
    }

    public void setUpdateDate(Date updateDate) {
        this.updateDate = updateDate;
    }

    public int getRoleId() {
        return roleId;
    }

    public void setRoleId(int roleId) {
        this.roleId = roleId;
    }

    @Override
    public String toString() {
        return "Account{" + "id=" + id + ", email=" + email + ", password=" + password + ", fullName=" + fullName + ", gender=" + gender + ", phoneNumber=" + phoneNumber + ", address=" + address + ", img=" + img + ", loginWith=" + loginWith + ", status=" + status + ", lastDateLogin=" + lastDateLogin + ", createDate=" + createDate + ", updateDate=" + updateDate + ", roleId=" + roleId + '}';
    }

    
    
    
    

    
    
}

