/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.sql.Date;

/**
 *
 * @author MSI GF
 */
public class Brands {
    private int rid;
    private String name;
    private Date createDate;
    private Date updateDate;

    public Brands() {
    }

    public Brands(int rid, String name, Date createDate, Date updateDate) {
        this.rid = rid;
        this.name = name;
        this.createDate = createDate;
        this.updateDate = updateDate;
    }

    public int getRid() {
        return rid;
    }

    public void setRid(int rid) {
        this.rid = rid;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
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

    @Override
    public String toString() {
        return "Brands{" + "rid=" + rid + ", name=" + name + ", createDate=" + createDate + ", updateDate=" + updateDate + '}';
    }
    
    
}
