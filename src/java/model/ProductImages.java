/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author MSI GF
 */
public class ProductImages {

    private int id;
    private String imageUrl;
    private int pid;

    public ProductImages() {
    }

    public ProductImages(int id, String imageUrl, int pid) {
        this.id = id;
        this.imageUrl = imageUrl;
        this.pid = pid;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getImageUrl() {
        return imageUrl;
    }

    public void setImageUrl(String imageUrl) {
        this.imageUrl = imageUrl;
    }

    public int getPid() {
        return pid;
    }

    public void setPid(int pid) {
        this.pid = pid;
    }

    @Override
    public String toString() {
        return "ProductImages{" + "id=" + id + ", imageUrl=" + imageUrl + ", pid=" + pid + '}';
    }
    
    

}
