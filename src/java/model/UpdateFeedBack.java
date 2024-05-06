/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.sql.Date;

/**
 *
 * @author win
 */
public class UpdateFeedBack {
    
    private int pid;
    private int aid;
    private String title;
    private int star;
    private String date;
    private String desFeedback;
    private String image;

    public UpdateFeedBack() {
    }

    public UpdateFeedBack(int pid, int aid, String title, int star, String date, String desFeedback, String image) {
        this.pid = pid;
        this.aid = aid;
        this.title = title;
        this.star = star;
        this.date = date;
        this.desFeedback = desFeedback;
        this.image = image;
    }

    public int getPid() {
        return pid;
    }

    public void setPid(int pid) {
        this.pid = pid;
    }

    public int getAid() {
        return aid;
    }

    public void setAid(int aid) {
        this.aid = aid;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public int getStar() {
        return star;
    }

    public void setStar(int star) {
        this.star = star;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getDesFeedback() {
        return desFeedback;
    }

    public void setDesFeedback(String desFeedback) {
        this.desFeedback = desFeedback;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    
    
    

    
}
