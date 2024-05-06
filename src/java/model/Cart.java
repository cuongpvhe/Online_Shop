/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import dal.ProductDAO;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author admin
 */
public class Cart {

    private List<Item> items;
    public Cart() {
        items = new ArrayList<>();
    }

    public Cart(List<Item> items) {
        this.items = items;
    }

    public List<Item> getItems() {
        return items;
    }

    public Item getItembyID(int id , int size) {
        for (Item i : items) {
            if (i.getProduct().getId() == id && i.getSize() == size) {
                return i;
            }
        }
        return null;
    }


  
    public int getQuantityByID(int id , int size) {
        return getItembyID(id , size).getQuantity();
    }
    
    public int getSizeByID(int id, int size){
        return getItembyID(id,size).getSize();
    }

    public void addItem(Item m) {
        if (getItembyID(m.getProduct().getId(), m.getSize()) != null) {
            Item i = getItembyID(m.getProduct().getId(), m.getSize());
            
            i.setQuantity(i.getQuantity() + m.getQuantity());
            i.setSize(m.getSize());
        } else {
            items.add(m);
        }
    }

    public void removeItem(int id , int size) {
        if (getItembyID(id, size) != null) {
            items.remove(getItembyID(id,size));
        }
    }



    public double getTotalMoney() {
        double money = 0;
        for (Item item : items) {
            money += (item.getQuantity() * item.getPrice());
        }
        return money;
    }

    

    public Cart(String txt) {
        ProductDAO pdao = new ProductDAO();
        items = new ArrayList<>();
        if (txt != null || txt.length() != 0) {
            String[] s = txt.split("or");
            for (String str : s) {
                String[] i = str.split("and");
                int id = Integer.parseInt(i[0]);
                int size = Integer.parseInt(i[1]);
                int quantity = Integer.parseInt(i[2]);
                Product p = pdao.getProductByIDToCart(id);
                Item t = new Item(p, p.getPrice(), size, quantity); // Sử dụng giá trị size
                addItem(t);
            }
        }
    }

}
