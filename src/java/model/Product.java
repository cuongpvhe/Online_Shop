/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.sql.Date;
import java.util.List;

/**
 *
 * @author asus
 */
public class Product {
    private int id;
    private String name;
    private double price;
    private String description;
    private String imageUrl;
    private int quantity;
    private int managerID;
    private int isSale;
    private int Gender;
    private int isAdult;
    private List<ProductImages> imageses;
    private Date createAt;
    private Date updateAt;
    private int status;
    private Brands brand;
    private Category category;
    private List<Size> size;
    private Manager manager;

    public Product() {
    }

    public Product(int id, String name, double price, String description, String imageUrl, int quantity, int managerID, int isSale, int Gender, int isAdult, List<ProductImages> imageses, Date createAt, Date updateAt, int status, Brands brand, Category category, List<Size> size, Manager manager) {
        this.id = id;
        this.name = name;
        this.price = price;
        this.description = description;
        this.imageUrl = imageUrl;
        this.quantity = quantity;
        this.managerID = managerID;
        this.isSale = isSale;
        this.Gender = Gender;
        this.isAdult = isAdult;
        this.imageses = imageses;
        this.createAt = createAt;
        this.updateAt = updateAt;
        this.status = status;
        this.brand = brand;
        this.category = category;
        this.size = size;
        this.manager = manager;
    }

    public Manager getManager() {
        return manager;
    }

    public void setManager(Manager manager) {
        this.manager = manager;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getImageUrl() {
        return imageUrl;
    }

    public void setImageUrl(String imageUrl) {
        this.imageUrl = imageUrl;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public int getManagerID() {
        return managerID;
    }

    public void setManagerID(int managerID) {
        this.managerID = managerID;
    }

    public int getIsSale() {
        return isSale;
    }

    public void setIsSale(int isSale) {
        this.isSale = isSale;
    }

    public int getGender() {
        return Gender;
    }

    public void setGender(int Gender) {
        this.Gender = Gender;
    }

    public int getIsAdult() {
        return isAdult;
    }

    public void setIsAdult(int isAdult) {
        this.isAdult = isAdult;
    }

    public List<ProductImages> getImageses() {
        return imageses;
    }

    public void setImageses(List<ProductImages> imageses) {
        this.imageses = imageses;
    }

    public Date getCreateAt() {
        return createAt;
    }

    public void setCreateAt(Date createAt) {
        this.createAt = createAt;
    }

    public Date getUpdateAt() {
        return updateAt;
    }

    public void setUpdateAt(Date updateAt) {
        this.updateAt = updateAt;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public Brands getBrand() {
        return brand;
    }

    public void setBrand(Brands brand) {
        this.brand = brand;
    }

    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }

    public List<Size> getSize() {
        return size;
    }

    public void setSize(List<Size> size) {
        this.size = size;
    }

    @Override
    public String toString() {
        return "Product{" + "id=" + id + ", name=" + name + ", price=" + price + ", description=" + description + ", imageUrl=" + imageUrl + ", quantity=" + quantity + ", managerID=" + managerID + ", isSale=" + isSale + ", Gender=" + Gender + ", isAdult=" + isAdult + ", imageses=" + imageses + ", createAt=" + createAt + ", updateAt=" + updateAt + ", status=" + status + ", brand=" + brand + ", category=" + category + ", size=" + size + ", manager=" + manager + '}';
    }
}
