/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.sql.Date;

/**
 *
 * @author admin
 */
public class Slider {
    private int id;
    private String title;
    private String image;
    private int arrange;
    private int status;
    private int aid; // người tạo slider
    private Date createDate;
    private Date updateDate;
    private String backlink;

    public Slider() {
    }

    public Slider(int id, String title, String image, int arrange, int status, int aid, Date createDate, Date updateDate, String backlink) {
        this.id = id;
        this.title = title;
        this.image = image;
        this.arrange = arrange;
        this.status = status;
        this.aid = aid;
        this.createDate = createDate;
        this.updateDate = updateDate;
        this.backlink = backlink;
    }

    

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public int getArrange() {
        return arrange;
    }

    public void setArrange(int arrange) {
        this.arrange = arrange;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public int getAid() {
        return aid;
    }

    public void setAid(int aid) {
        this.aid = aid;
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

    public String getBacklink() {
        return backlink;
    }

    public void setBacklink(String backlink) {
        this.backlink = backlink;
    }
    
    
}
