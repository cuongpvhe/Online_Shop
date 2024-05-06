/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import model.Account;
import model.Brands;
import model.Category;
import model.Product;
import model.ProductImages;
import model.ProductSize;
import model.Size;

/**
 *
 * @author MSI GF
 */
public class AdminDAO extends DBContext {

    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    public List<Account> getAllAccounts() {
        List<Account> list = new ArrayList<>();
        String sql = "select * from Account";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Account(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getInt(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getString(8),
                        rs.getInt(9),
                        rs.getInt(10),
                        rs.getDate(11),
                        rs.getDate(12),
                        rs.getDate(13),
                        rs.getInt(14)));
            }
        } catch (Exception e) {

        }
        return list;
    }

    public void insertAccount(String email, String password, String fullname,
            int gender, String phoneNumber, String address, int roleId) {

        LocalDate curDate = LocalDate.now();
        String date = curDate.toString();

        String sql = "INSERT INTO [dbo].[Account]\n"
                + "           ([Email]\n"
                + "           ,[Password]\n"
                + "           ,[Fullname]\n"
                + "           ,[Gender]\n"
                + "           ,[Phone]\n"
                + "           ,[Address]\n"
                + "           ,[imageAvt]\n"
                + "           ,[LoginWith]\n"
                + "           ,[Status]\n"
                + "           ,[LastDateLogin]\n"
                + "           ,[CreateDate]\n"
                + "           ,[UpdateDate]\n"
                + "           ,[roleid])\n"
                + "     VALUES\n"
                + "           (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(sql);
            ps.setString(1, email);
            ps.setString(2, password);
            ps.setString(3, fullname);
            ps.setInt(4, gender);
            ps.setString(5, phoneNumber);
            ps.setString(6, address);
            ps.setString(7, "");
            ps.setInt(8, 1);
            ps.setInt(9, 1);
            ps.setString(10, date);
            ps.setString(11, date);
            ps.setString(12, date);
            ps.setInt(13, roleId);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public Account getAccountByEmail(String email) {
        String sql = "select * from Account\n"
                + "where Email = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, email);
            rs = ps.executeQuery();

            while (rs.next()) {
                return new Account(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getInt(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getString(8),
                        rs.getInt(9),
                        rs.getInt(10),
                        rs.getDate(11),
                        rs.getDate(12),
                        rs.getDate(13),
                        rs.getInt(14));
            }
        } catch (Exception e) {
        }
        return null;
    }

    public Account getAccountById(int id) {
        String sql = "select * from Account\n"
                + "where Id = ?\n";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setInt(1, id);
            rs = ps.executeQuery();

            while (rs.next()) {
                return new Account(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getInt(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getString(8),
                        rs.getInt(9),
                        rs.getInt(10),
                        rs.getDate(11),
                        rs.getDate(12),
                        rs.getDate(13),
                        rs.getInt(14));
            }
        } catch (Exception e) {
        }
        return null;
    }

    public void updateAccount(String fullname,
            int status, int roleId, int id) {

        LocalDate curDate = LocalDate.now();
        String date = curDate.toString();
        String sql = "UPDATE [dbo].[Account]\n"
                + "   SET [Fullname] = ?\n"
                + "      ,[Status] = ?\n"
                + "      ,[UpdateDate] = ?\n"
                + "      ,[roleid] = ?\n"
                + " WHERE id = ?";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(sql);
            ps.setString(1, fullname);
            ps.setInt(2, status);
            ps.setString(3, date);
            ps.setInt(4, roleId);
            ps.setInt(5, id);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public List<Account> getAllAccountsByRoleId(int roleId) {
        List<Account> list = new ArrayList<>();
        String sql = "select * from Account\n"
                + "where roleid = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setInt(1, roleId);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Account(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getInt(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getString(8),
                        rs.getInt(9),
                        rs.getInt(10),
                        rs.getDate(11),
                        rs.getDate(12),
                        rs.getDate(13),
                        rs.getInt(14)));
            }
        } catch (Exception e) {

        }
        return list;
    }

    public List<Account> getAccounts(String roleId, String search, int index, int size) {
        List<Account> list = new ArrayList<>();
        String sql = "with x as (select ROW_NUMBER() over (order by id asc) as r, * from Account where 1=1";

        if (roleId != null && !roleId.isEmpty()) {
            sql += "and roleId = " + roleId;
        }

        if (search != null && !search.isEmpty()) {
            sql += "and email like '%" + search + "%'";
        }

        sql += ")\n"
                + " select * from x where r between ?*6-5 and ?*6";
        try {

            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setInt(1, index);
            ps.setInt(2, index);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Account(
                        rs.getInt(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getInt(6),
                        rs.getString(7),
                        rs.getString(8),
                        rs.getString(9),
                        rs.getInt(10),
                        rs.getInt(11),
                        rs.getDate(12),
                        rs.getDate(13),
                        rs.getDate(14),
                        rs.getInt(15)));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public int count(String roleId, String search) {
        String sql = "select count(*) from Account where 1=1";

        if (roleId != null && !roleId.isEmpty()) {
            sql += "and roleId = " + roleId;
        }

        if (search != null && !search.isEmpty()) {
            sql += "and email like '%" + search + "%'";
        }

        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception e) {
        }
        return 0;
    }
    

    public static void main(String[] args) {
        AdminDAO dao = new AdminDAO();
        Account a = dao.getAccountByEmail("haitranmaniac@gmail.com");
        
        System.out.println(a);

    }
}
