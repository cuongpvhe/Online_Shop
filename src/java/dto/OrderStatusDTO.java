/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dto;

/**
 *
 * @author win
 */
public class OrderStatusDTO {
    private orderDetailsDTO ord;
    private int status;

    public OrderStatusDTO() {
    }

    public OrderStatusDTO(orderDetailsDTO ord, int status) {
        this.ord = ord;
        this.status = status;
    }

    public orderDetailsDTO getOrd() {
        return ord;
    }

    public void setOrd(orderDetailsDTO ord) {
        this.ord = ord;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }
    
    
    
}
