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
public class FeedBack {

    private int id;
    private int pid;
    private int aid;
    private String title;
    private int star;
    private String date;
    private String desFeedback;
    private String fullnameFeedback;

    public FeedBack() {
    }

    public FeedBack(int id, int pid, int aid, String title, int star, String date, String desFeedback, String fullnameFeedback) {
        this.id = id;
        this.pid = pid;
        this.aid = aid;
        this.title = title;
        this.star = star;
        this.date = date;
        this.desFeedback = desFeedback;
        this.fullnameFeedback = fullnameFeedback;
    }

   
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
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

  
    public String getFullnameFeedback() {
        return fullnameFeedback;
    }

    public void setFullnameFeedback(String fullnameFeedback) {
        this.fullnameFeedback = fullnameFeedback;
    }


    @Override
    public String toString() {
        return "FeedBack{" + "id=" + id + ", pid=" + pid + ", aid=" + aid + ", title=" + title + ", star=" + star + ", date=" + date + ", desFeedback=" + desFeedback + ", fullnameFeedback=" + fullnameFeedback + '}';
    }
    

    

}


