/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author win
 */
public class FeedBackImages {
    private int id;
    private String imgFeedBack;
    private int fid;

    public FeedBackImages() {
    }

    public FeedBackImages(int id, String imgFeedBack, int fid) {
        this.id = id;
        this.imgFeedBack = imgFeedBack;
        this.fid = fid;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getImgFeedBack() {
        return imgFeedBack;
    }

    public void setImgFeedBack(String imgFeedBack) {
        this.imgFeedBack = imgFeedBack;
    }

    public int getFid() {
        return fid;
    }

    public void setFid(int fid) {
        this.fid = fid;
    }
    
    
    
}
