/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dto;

/**
 *
 * @author win
 */
public class UpdateQuantityOrder {
    
    private int ProductID;
    private int quantity;
    private int sizeId;

    public UpdateQuantityOrder() {
    }

    public UpdateQuantityOrder(int ProductID, int quantity, int sizeId) {
        this.ProductID = ProductID;
        this.quantity = quantity;
        this.sizeId = sizeId;
    }

    public int getProductID() {
        return ProductID;
    }

    public void setProductID(int ProductID) {
        this.ProductID = ProductID;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public int getSizeId() {
        return sizeId;
    }

    public void setSizeId(int sizeId) {
        this.sizeId = sizeId;
    }

    
    
    
}
