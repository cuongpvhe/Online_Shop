/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 *
 * @author admin
 */
public class OrderDAO extends DBContext {

    Connection connection = null;
    PreparedStatement stm = null;
    ResultSet rs = null;

    public void insertNewOrder(String aid, double totalMoney, String fullname, String email,
            String phoneNumber, String address, String note, int status) {
        String sql = "INSERT INTO [dbo].[Order]\n"
                + "            ([AccountID]\n"
                + "           ,[totalMoney]\n"
                + "           ,[Fullname]\n"
                + "           ,[Email]\n"
                + "           ,[PhoneNumber]\n"
                + "           ,[Address]\n"
                + "           ,[Note]\n"
                + "           ,[Status])\n"
                + "VALUES (?,?,?,?,?,?,?,?);";
        try {
            connection = new DBContext().getConnection();
            stm = connection.prepareStatement(sql);
            stm.setString(1, aid);
            stm.setDouble(2, totalMoney);
            stm.setString(3, fullname);
            stm.setString(4, email);
            stm.setString(5, phoneNumber);
            stm.setString(6, address);
            stm.setString(7, note);
            stm.setInt(8, status);
            stm.executeUpdate();
        } catch (Exception e) {
        }
    }

    public int getOrderID() {
        String sql = "SELECT top 1 * FROM [dbo].[Order]  ORDER BY  [id] DESC;";
        try {
            connection = new DBContext().getConnection();
            stm = connection.prepareStatement(sql);
            rs = stm.executeQuery();
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception e) {
        }
        return 0;
    }

    public void insertNewOrderDetail(int oid, int pid, int size, int quantity, double totalMoney, String payment, String paymentStatus, int status) {
        String sql = "INSERT INTO [dbo].[OrderDetail]\n"
                + "           ([OrderID]\n"
                + "           ,[ProductID]\n"
                + "           ,[size]\n"
                + "           ,[quantity]\n"
                + "           ,[totalMoney]\n"
                + "           ,[Payment]\n"
                + "           ,[PaymentStatus]\n"
                + "           ,[Status])\n"
                + "     VALUES (?,?,?,?,?,?,?,?)";
        try {
            connection = new DBContext().getConnection();
            stm = connection.prepareStatement(sql);
            stm.setInt(1, oid);
            stm.setInt(2, pid);
            stm.setInt(3, size);
            stm.setInt(4, quantity);
            stm.setDouble(5, totalMoney);
            stm.setString(6, payment);
            stm.setString(7, paymentStatus);
            stm.setInt(8, status);
            stm.executeUpdate();
        } catch (Exception e) {
        }
    }

    public void updatePaymentStatus(int oid, String paymentStatus) {
        String sql = "UPDATE [dbo].[OrderDetail]\n"
                + "   SET [PaymentStatus] = ?\n"
                + " WHERE [OrderID] = ? ;\n";
        try {
            connection = new DBContext().getConnection();
            stm = connection.prepareStatement(sql);
            stm.setString(1, paymentStatus);
            stm.setInt(2, oid);
            stm.executeUpdate();
        } catch (Exception e) {
        }
    }

    public int getQuantityOfSize(int pid, int size) {
        String sql = "select PS.quantity from ProductSize PS\n"
                + "  inner join Size s on PS.sizeId = s.Id\n"
                + "  where PS.pid = ? and s.size = ?";
        try {
            connection = new DBContext().getConnection();
            stm = connection.prepareStatement(sql);
            stm.setInt(1, pid);
            stm.setInt(2, size);
            rs = stm.executeQuery();
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception e) {
        }
        return 0;
    }

    public void updateQuantitySaled(int pid, int quantitySaled) {
        String sql = "UPDATE [dbo].[Product]\n"
                + "   SET [quantitySaled] = ?\n"
                + " WHERE [id] = ?";
        try {
            connection = new DBContext().getConnection();
            stm = connection.prepareStatement(sql);
            stm.setInt(1, quantitySaled);
            stm.setInt(2, pid);
            stm.executeUpdate();
        } catch (Exception e) {
        }
    }

    public void updateQuantity(int pid, int sizeid, int quantity) {
        String sql = "UPDATE [dbo].[ProductSize]\n"
                + "   SET [quantity] = ?\n"
                + " WHERE [pid] = ?  and [sizeId] = ?";
        try {
            connection = new DBContext().getConnection();
            stm = connection.prepareStatement(sql);
            stm.setInt(1, quantity);
            stm.setInt(2, pid);
            stm.setInt(3, sizeid);
            stm.executeUpdate();
        } catch (Exception e) {
        }
    }

    public int getSiseIdbySize(int size) {
        String sql = "SELECT [Id]\n"
                + "  FROM [dbo].[Size]\n"
                + "  where size = ?";
        try {
            connection = new DBContext().getConnection();
            stm = connection.prepareStatement(sql);
            stm.setInt(1, size);
            rs = stm.executeQuery();
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception e) {
        }
        return 0;
    }

}


