/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author admin
 */
public class Item {

    private Product product;
    private double price;
    private int size;
    private int quantity;

    public Item() {
    }

    public Item(Product product, double price, int size, int quantity) {
        this.product = product;
        this.price = price;
        this.size = size;
        this.quantity = quantity;
    }
public Item(Product product, double price, int quantity) {
        this.product = product;
        this.price = price;
        this.quantity = quantity;
    }
    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public int getSize() {
        return size;
    }

    public void setSize(int size) {
        this.size = size;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

}
