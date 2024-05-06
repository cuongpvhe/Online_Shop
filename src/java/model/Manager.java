/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author MSI GF
 */
public class Manager {
    
    private int managerId;
    private String fullName;

    public Manager() {
    }

    public Manager(int managerId, String fullName) {
        this.managerId = managerId;
        this.fullName = fullName;
    }

    public int getManagerId() {
        return managerId;
    }

    public void setManagerId(int managerId) {
        this.managerId = managerId;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    @Override
    public String toString() {
        return "Manager{" + "managerId=" + managerId + ", fullName=" + fullName + '}';
    }
    
    
}

