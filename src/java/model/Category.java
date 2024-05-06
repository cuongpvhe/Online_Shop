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

public class Category {
    private int cid;
    private String name;
    private Date createDate;
    private Date updateDate;

    public Category() {
    }

    public Category(int cid, String name, Date createDate, Date updateDate) {
        this.cid = cid;
        this.name = name;
        this.createDate = createDate;
        this.updateDate = updateDate;
    }

    public int getCid() {
        return cid;
    }

    public void setCid(int cid) {
        this.cid = cid;
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
        return "Category{" + "cid=" + cid + ", name=" + name + ", createDate=" + createDate + ", updateDate=" + updateDate + '}';
    }

    
    
}

