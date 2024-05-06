/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import model.Order;

/**
 *
 * @author MSI GF
 */
public class AdminInvoiceDAO {

    Connection connection = null;

    public List<Order> getListOrders(String search, String cDate1, String cDate2, int index) {
        List<Order> list = new ArrayList<>();
        String query = "with x as (select ROW_NUMBER() over (order by id asc) as r, * from [Order] where 1=1\n"
                + "and Status = 5 \n";

        if (search != null && !search.isEmpty()) {
            query += " and email like '%" + search + "%'";
        }

        if (cDate1 != null && cDate2 != null && !cDate1.isEmpty() && !cDate2.isEmpty()) {
            query += " and CreateDate between '" + cDate1 + "' and '" + cDate2 + "'";
        }
        query += ")\n"
                + " select * from x where r between ?*6-5 and ?*6";
        try {
            connection = new DBContext().getConnection();

            PreparedStatement ps = connection.prepareStatement(query);
            ps.setInt(1, index);
            ps.setInt(2, index);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                list.add(new Order(rs.getInt(2),
                        rs.getInt(3),
                        rs.getFloat(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getString(8),
                        rs.getString(9),
                        rs.getDate(10),
                        rs.getDate(11),
                        rs.getInt(12)));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public int countOrder(String search, String cDate1, String cDate2) {
        String query = "select count(*) from [Order] where 1=1\n"
                + "and Status = 5 \n";

        if (search != null && !search.isEmpty()) {
            query += " and email like '%" + search + "%'";
        }

        if (cDate1 != null && cDate2 != null && !cDate1.isEmpty() && !cDate2.isEmpty()) {
            query += " and CreateDate between '" + cDate1 + "' and '" + cDate2 + "'";
        }

        try {
            connection = new DBContext().getConnection();

            PreparedStatement ps = connection.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception e) {
        }
        return 0;
    }

    public int countOrderChart(int status, String date1, String date2) {
        String query = "select count(*) from [Order]\n"
                + "where Status = ?\n";

        if (date1 != null && date2 != null && !date1.isEmpty() && !date2.isEmpty()) {
            query += "and CreateDate between '" + date1 + "' and '" + date2 + "'";
        }

        try {
            connection = new DBContext().getConnection();
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setInt(1, status);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception e) {
        }
        return 0;
    }

    public double totalMoneyMonth(int month) {
        String query = "select sum(totalMoney) from [Order]\n"
                + "where Status = 1\n"
                + "and MONTH(CreateDate) = ? \n"
                + "group by MONTH(CreateDate)";
        try {
            connection = new DBContext().getConnection();
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setInt(1, month);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return rs.getDouble(1);
            }
        } catch (Exception e) {
        }
        return 0;
    }
    
    public double totalMoneyYear(int year) {
        String query = "select sum(totalMoney) from [Order]\n"
                + "where Status = 1\n"
                + "and Year(CreateDate) = ? \n"
                + "group by Year(CreateDate)";
        try {
            connection = new DBContext().getConnection();
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setInt(1, year);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return rs.getDouble(1);
            }
        } catch (Exception e) {
        }
        return 0;
    }
    
    

    public static void main(String[] args) {
        AdminInvoiceDAO dao = new AdminInvoiceDAO();
        List<Order> list = dao.getListOrders("", "2023-10-30", "2023-10-30", 1);

        for (Order o : list) {
            System.out.println(o);
        }
    }
}
