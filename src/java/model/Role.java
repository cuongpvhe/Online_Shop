/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author MSI GF
 */
public class Role {
    private int RoleId;
    private String RoleName;

    public Role() {
    }

    public Role(int RoleId, String RoleName) {
        this.RoleId = RoleId;
        this.RoleName = RoleName;
    }

    public int getRoleId() {
        return RoleId;
    }

    public String getRoleName() {
        return RoleName;
    }

    public void setRoleId(int RoleId) {
        this.RoleId = RoleId;
    }

    public void setRoleName(String RoleName) {
        this.RoleName = RoleName;
    }
    
    
}
