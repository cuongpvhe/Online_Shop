/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import dto.ListOrderSales;
import dto.OrderDTO;
import dto.UpdateQuantityOrder;
import dto.orderDetailsDTO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Order;
import model.OrderDetail;
import model.OrderStatus;

/**
 *
 * @author win
 */
public class OrderAccountDAO {

    Connection connection = null;

    public List<OrderDTO> getOrderByAid(int aid, int index) {
        List<OrderDTO> list = new ArrayList<>();
        OrderAccountDAO dao = new OrderAccountDAO();

        String sql = "select o.id, o.AccountID, o.totalMoney, o.Fullname, o.Email, o.PhoneNumber, o.[Address], o.Note, o.CreateDate, o.FinishDate, o.[Status], s.[status] from [Order] o\n"
                + "join OrderStatus s on o.[Status] = s.id\n"
                + "where AccountID = ?\n"
                + "order by AccountID ASC\n"
                + "OFFSET ? ROWS\n"
                + "FETCH FIRST 10 ROW ONLY";
        try {
            connection = new DBContext().getConnection();
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, aid);
            stm.setInt(2, (index - 1) * 10);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                int checkPaymentStatus = dao.checkPaymentStatus(rs.getInt(1));
                // Lấy oid từ rs.getInt(1)
                int oid = rs.getInt(1);
                // Gọi phương thức checkStatusOrderDetail với oid
                int statusOrderDetail = checkStatusOrderDetail(oid);
                list.add(new OrderDTO(rs.getInt(1), rs.getInt(2), rs.getFloat(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7), rs.getString(8), rs.getDate(9), rs.getDate(10), rs.getInt(11), rs.getString(12), statusOrderDetail, checkPaymentStatus));
            }
        } catch (Exception e) {

        }
        return list;
    }

    public OrderDTO getOrderByOid(int oid) {
        OrderAccountDAO dao = new OrderAccountDAO();

        String sql = "select o.id, o.AccountID, o.totalMoney, o.Fullname, o.Email, o.PhoneNumber, o.[Address], o.Note, o.CreateDate, o.FinishDate, o.[Status], s.[status] from [Order] o\n"
                + "join OrderStatus s on o.[Status] = s.id\n"
                + "where o.id = ?\n";
        try {
            connection = new DBContext().getConnection();
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, oid);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                int checkPaymentStatus = dao.checkPaymentStatus(oid);
                return new OrderDTO(rs.getInt(1), rs.getInt(2), rs.getFloat(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7), rs.getString(8), rs.getDate(9), rs.getDate(10), rs.getInt(11), rs.getString(12), rs.getInt(13), checkPaymentStatus);
            }
        } catch (Exception e) {

        }

        return null;
    }

    public int checkPaymentStatus(int oid) {
        try {
            String query = "SELECT count(*)\n"
                    + "FROM OrderDetail\n"
                    + "WHERE OrderID = ?\n"
                    + "GROUP BY OrderID\n"
                    + "HAVING COUNT(*) = SUM(CASE WHEN PaymentStatus = 'Đã thanh toán' THEN 1 ELSE 0 END)";
            connection = new DBContext().getConnection();
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setInt(1, oid);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception e) {
        }
        return 0;
    }

//    public List<orderDetailsDTO> getOrderDetailsByOid(int oid) {
//        List<orderDetailsDTO> list = new ArrayList<>();
//
//        String sql = "select o.id, p.imageUrl, p.[name], o.size, o.quantity, o.totalMoney, o.Payment, o.PaymentStatus, o.[status] from [OrderDetail] o\n"
//                + "join Product p on o.ProductID = p.id\n"
//                + "where OrderID = ?";
//        try {
//            connection = new DBContext().getConnection();
//            PreparedStatement stm = connection.prepareStatement(sql);
//            stm.setInt(1, oid);
//            ResultSet rs = stm.executeQuery();
//            while (rs.next()) {
//
//                
//                list.add(new orderDetailsDTO(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getInt(4), rs.getInt(5), rs.getFloat(6), rs.getString(7), rs.getString(8), rs.getInt(9)));
//            }
//        } catch (Exception e) {
//
//        }
//
//        return list;
//    }
    public List<orderDetailsDTO> getOrderDetailsByOid(int oid) {
        List<orderDetailsDTO> list = new ArrayList<>();
        FeedBackDAO daoFB = new FeedBackDAO();

        String sql = "select o.id, p.imageUrl, p.[name], o.size, o.quantity, o.totalMoney, o.Payment, o.PaymentStatus, o.[status], ord.AccountID, p.id from [OrderDetail] o\n"
                + "join Product p on o.ProductID = p.id\n"
                + "join [Order] ord on ord.id = o.OrderID\n"
                + "where OrderID = ?";
        try {
            connection = new DBContext().getConnection();
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, oid);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                int countFbAid = daoFB.getCountFeedBackByAid(rs.getInt(10), rs.getInt(11));
                list.add(new orderDetailsDTO(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getInt(4), rs.getInt(5), rs.getFloat(6), rs.getString(7), rs.getString(8), rs.getInt(9), countFbAid, rs.getInt(10), rs.getInt(11)));
            }
        } catch (Exception e) {

        }

        return list;
    }

    public List<ListOrderSales> getOrderSaleByManagerID(int aid, int index) {
        List<ListOrderSales> list = new ArrayList<>();
        OrderAccountDAO dao = new OrderAccountDAO();

        String sql = "SELECT p.id, p.[name], p.imageUrl, o.quantity, o.totalMoney, o.UpdateDate,  o.OrderID, s.[status], ord.[Status], o.[Status], o.id, o.Payment, o.PaymentStatus, ord.Fullname, ord.[Address], ord.PhoneNumber, ord.Note, o.size\n"
                + "FROM Product AS p\n"
                + "\n"
                + "INNER JOIN OrderDetail AS o ON p.id = o.ProductID\n"
                + "INNER JOIN [Order] AS ord on ord.id = o.OrderID\n"
                + "INNER JOIN [OrderStatus] AS s on ord.[Status] = s.[id]\n"
                + "\n"
                + "where managerId = ?\n"
                + "ORDER BY o.[Status]\n"
                + "OFFSET ? ROWS\n"
                + "FETCH FIRST 10 ROW ONLY";
        try {
            connection = new DBContext().getConnection();
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, aid);
            stm.setInt(2, (index - 1) * 10);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                int checkStatusOrderSale = dao.checkStatusOrderSale(rs.getInt(7));
                list.add(new ListOrderSales(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getInt(4), rs.getFloat(5), rs.getDate(6), rs.getInt(7), rs.getString(8), rs.getInt(9), rs.getInt(10), rs.getInt(11), rs.getString(12), rs.getString(13), rs.getString(14), rs.getString(15), rs.getString(16), rs.getString(17), rs.getInt(18), checkStatusOrderSale));
            }
        } catch (Exception e) {

        }

        return list;
    }

    public List<Order> getListRefund(int index) {
        List<Order> list = new ArrayList<>();

        String sql = "SELECT DISTINCT o.id,o.AccountID,o.totalMoney,o.Fullname,o.Email,o.PhoneNumber,o.[Address],o.Note,o.CreateDate,o.FinishDate,o.[Status] FROM [Order] as o\n"
                + "                INNER JOIN [OrderDetail] AS ord on o.id = ord.OrderID\n"
                + "                WHERE ord.PaymentStatus = 'Wait refund'\n"
                + "                ORDER BY o.id\n"
                + "                OFFSET ? ROWS\n"
                + "                FETCH NEXT 10 ROWS ONLY;";
        try {
            connection = new DBContext().getConnection();
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, (index - 1) * 10);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                list.add(new Order(rs.getInt(1), rs.getInt(2), rs.getFloat(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7), rs.getString(8), rs.getDate(9), rs.getDate(10), rs.getInt(11)));
            }
        } catch (Exception e) {

        }

        return list;
    }

    public List<OrderDetail> getStatusOrder(int oid) {
        List<OrderDetail> list = new ArrayList<>();

        String sql = "select * from OrderDetail\n"
                + "where OrderID = ?";
        try {
            connection = new DBContext().getConnection();
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, oid);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                list.add(new OrderDetail(rs.getInt(1), rs.getInt(2), rs.getInt(3), rs.getInt(4), rs.getInt(5), rs.getFloat(6), rs.getString(7), rs.getString(8), rs.getInt(9), rs.getDate(10)));
            }
        } catch (Exception e) {

        }

        return list;
    }

    public List<UpdateQuantityOrder> updateQuantity(int oid) {
        List<UpdateQuantityOrder> list = new ArrayList<>();

        String sqlSelect = "SELECT p.id, o.quantity, o.size\n"
                + "FROM Product AS p\n"
                + "INNER JOIN OrderDetail AS o ON p.id = o.ProductID\n"
                + "where o.OrderID = ?";
        String sqlUpdateProductSize = "UPDATE ProductSize SET quantity = quantity + ? WHERE pid = ? AND sizeId = ?";
        String sqlUpdateProduct = "UPDATE Product SET quantitySaled = quantitySaled + ? WHERE id = ?";

        try {
            connection = new DBContext().getConnection();
            PreparedStatement stm = connection.prepareStatement(sqlSelect);
            stm.setInt(1, oid);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                list.add(new UpdateQuantityOrder(rs.getInt(1), rs.getInt(2), rs.getInt(3)));

                // Step 3: Update quantity in ProductSize table
                PreparedStatement updateProductSizeStatement = connection.prepareStatement(sqlUpdateProductSize);
                updateProductSizeStatement.setInt(1, rs.getInt(2));
                updateProductSizeStatement.setInt(2, rs.getInt(1));
                updateProductSizeStatement.setInt(3, rs.getInt(3));
                updateProductSizeStatement.executeUpdate();

                // Update quantity in Product
                PreparedStatement updateStatement = connection.prepareStatement(sqlUpdateProduct);
                updateStatement.setInt(1, rs.getInt(2));
                updateStatement.setInt(2, rs.getInt(1));
                updateStatement.executeUpdate();
            }
        } catch (Exception e) {

        }

        return list;
    }

    public List<OrderStatus> getOrderStatus() {
        List<OrderStatus> list = new ArrayList<>();

        String sql = "select * from OrderStatus";
        try {
            connection = new DBContext().getConnection();
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                list.add(new OrderStatus(rs.getInt(1), rs.getString(2)));
            }
        } catch (Exception e) {

        }

        return list;
    }

    public void updateStatusOrder(int status, int iod, int pid, int quantity, int sizeId, int money, int idOrder, String payment) {
        try {
            String query = "UPDATE [OrderDetail]\n"
                    + "SET [Status] = ?\n"
                    + "WHERE id = ?";
            String queryStatus3 = "UPDATE [OrderDetail]\n"
                    + "SET [Status] = 3\n"
                    + "WHERE OrderID = ?";
            String queryStatus4 = "UPDATE [OrderDetail]\n"
                    + "SET [Status] = 4\n"
                    + "WHERE OrderID = ?";
            String queryDaThanhToan = "UPDATE [OrderDetail]\n"
                    + "SET [PaymentStatus] = 'Đã thanh toán'\n"
                    + "WHERE OrderID = ?";
            String queryRefund = "UPDATE [OrderDetail]\n"
                    + "SET [PaymentStatus] = 'Wait refund'\n"
                    + "WHERE id = ?";
            String queryChuaThanhToan = "UPDATE [OrderDetail]\n"
                    + "SET [PaymentStatus] = 'Cancell'\n"
                    + "WHERE OrderID = ?";
            String sqlUpdateProductSize = "UPDATE ProductSize SET quantity = quantity + ? WHERE pid = ? AND sizeId = ?";
            String sqlDecreProduct = "UPDATE Product SET quantitySaled = quantitySaled - ? WHERE id = ?";
            String sqlDecreTotalOrder = "UPDATE [Order] SET totalMoney = totalMoney - ? WHERE id = ?";
            connection = new DBContext().getConnection();
            if (status != 3 || status != 4) {
                PreparedStatement ps = connection.prepareStatement(query);
                ps.setInt(1, status);
                ps.setInt(2, iod);
                ps.executeUpdate();
            }

            if (status == 3) {
                PreparedStatement psDTT = connection.prepareStatement(queryDaThanhToan);
                psDTT.setInt(1, idOrder);
                psDTT.executeUpdate();
                //Update full status 3
                PreparedStatement psTC = connection.prepareStatement(queryStatus3);
                psTC.setInt(1, idOrder);
                psTC.executeUpdate();
            }

            if (status == 4 && payment.equals("cod")) {
                PreparedStatement psCTT = connection.prepareStatement(queryChuaThanhToan);
                psCTT.setInt(1, idOrder);
                psCTT.executeUpdate();
                //Update quantity in ProductSize table
                PreparedStatement updateProductSizeStatement = connection.prepareStatement(sqlUpdateProductSize);
                updateProductSizeStatement.setInt(1, quantity);
                updateProductSizeStatement.setInt(2, pid);
                updateProductSizeStatement.setInt(3, sizeId);
                updateProductSizeStatement.executeUpdate();
                //Update quantity in Product table
                PreparedStatement updateStatement = connection.prepareStatement(sqlDecreProduct);
                updateStatement.setInt(1, quantity);
                updateStatement.setInt(2, pid);
                updateStatement.executeUpdate();
                //Update PriceTotalOrder
//                PreparedStatement updateTotalOrder = connection.prepareStatement(sqlDecreTotalOrder);
//                updateTotalOrder.setInt(1, money);
//                updateTotalOrder.setInt(2, idOrder);
//                updateTotalOrder.executeUpdate();
                //Update full status4
                PreparedStatement updateStatusCancell = connection.prepareStatement(queryStatus4);
                updateStatusCancell.setInt(1, idOrder);
                updateStatusCancell.executeUpdate();
            }

            if (status == 4 && payment.equals("vnpay")) {
                PreparedStatement psCTT = connection.prepareStatement(queryRefund);
                psCTT.setInt(1, iod);
                psCTT.executeUpdate();
                //Update quantity in ProductSize table
                PreparedStatement updateProductSizeStatement = connection.prepareStatement(sqlUpdateProductSize);
                updateProductSizeStatement.setInt(1, quantity);
                updateProductSizeStatement.setInt(2, pid);
                updateProductSizeStatement.setInt(3, sizeId);
                updateProductSizeStatement.executeUpdate();
                //Update quantity in Product table
                PreparedStatement updateStatement = connection.prepareStatement(sqlDecreProduct);
                updateStatement.setInt(1, quantity);
                updateStatement.setInt(2, pid);
                updateStatement.executeUpdate();
//                //Update PriceTotalOrder
//                PreparedStatement updateTotalOrder = connection.prepareStatement(sqlDecreTotalOrder);
//                updateTotalOrder.setInt(1, money);
//                updateTotalOrder.setInt(2, idOrder);
//                updateTotalOrder.executeUpdate();
            }
        } catch (Exception e) {
        }
    }

    public int checkStatusOrderDetail(int oid) {

        try {

            String query = "select count(*) from OrderDetail\n"
                    + "where OrderID = ? and [status] = 2";
            connection = new DBContext().getConnection();
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setInt(1, oid);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }

        } catch (Exception e) {
        }
        return 0;
    }

    public void cancelOrderStatus(int oid) {
        try {

            String query = "UPDATE [Order]\n"
                    + "SET [status] = 6\n"
                    + "WHERE id = ?\n"
                    + "\n"
                    + "UPDATE [OrderDetail]\n"
                    + "SET [Status] = 4, [PaymentStatus] = 'Cancell'\n"
                    + "WHERE OrderID = ?";
            connection = new DBContext().getConnection();
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setInt(1, oid);
            ps.setInt(2, oid);
            ps.executeUpdate();

        } catch (Exception e) {
        }
    }

    public void cancelOrderStatusVnpay(int oid) {
        try {

            String query = "UPDATE [Order]\n"
                    + "SET [status] = 6\n"
                    + "WHERE id = ?\n"
                    + "\n"
                    + "UPDATE [OrderDetail]\n"
                    + "SET [Status] = 4, [PaymentStatus] = 'Wait refund'\n"
                    + "WHERE OrderID = ?";
            connection = new DBContext().getConnection();
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setInt(1, oid);
            ps.setInt(2, oid);
            ps.executeUpdate();

        } catch (Exception e) {
        }
    }

    public void receivedOrderStatus(int oid) {
        try {

            String query = "UPDATE [Order]\n"
                    + "SET [status] = 5\n"
                    + "WHERE id = ?\n"
                    + "UPDATE [OrderDetail]\n"
                    + "SET [Status] = 3, [PaymentStatus] = ?\n"
                    + "WHERE OrderID = ? AND [Status] <> 4";
            connection = new DBContext().getConnection();
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setInt(1, oid);
            ps.setString(2, "Đã Thanh Toán");
            ps.setInt(3, oid);
            ps.executeUpdate();

        } catch (Exception e) {
        }
    }

    public int getCountListOrder(int aid) {
        try {
            String query = "select count(*) from [Order]\n"
                    + "where AccountID = ?";
            connection = new DBContext().getConnection();
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setInt(1, aid);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                int total = rs.getInt(1);
                int countPage = 0;
                countPage = total / 10;
                if (total % 5 != 0) {
                    countPage++;
                }
                return countPage;
            }

        } catch (Exception e) {
        }
        return 0;
    }

    public int checkStatusOrderSale(int oid) {
        try {
            String query = "SELECT count(*)\n"
                    + "FROM OrderDetail\n"
                    + "WHERE OrderID = ?\n"
                    + "GROUP BY OrderID\n"
                    + "HAVING MIN(Status) = 2 AND MAX(Status) = 2";
            connection = new DBContext().getConnection();
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setInt(1, oid);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                return rs.getInt(1);
            }

        } catch (Exception e) {
        }
        return 0;
    }

    public int getCountOrderSale(int aid) {
        try {
            String query = "SELECT count(*)\n"
                    + "FROM Product AS p\n"
                    + "\n"
                    + "INNER JOIN OrderDetail AS o ON p.id = o.ProductID\n"
                    + "INNER JOIN [Order] AS ord on ord.id = o.OrderID\n"
                    + "INNER JOIN [OrderStatus] AS s on ord.[Status] = s.[id]\n"
                    + "\n"
                    + "where managerId = ?";
            connection = new DBContext().getConnection();
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setInt(1, aid);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                int total = rs.getInt(1);
                int countPage = 0;
                countPage = total / 10;
                if (total % 5 != 0) {
                    countPage++;
                }
                return countPage;
            }

        } catch (Exception e) {
        }
        return 0;
    }

    public int getCountRefund() {
        try {
            String query = "SELECT count(*) FROM OrderDetail\n"
                    + "WHERE PaymentStatus = 'Wait refund'";
            connection = new DBContext().getConnection();
            PreparedStatement ps = connection.prepareStatement(query);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                int total = rs.getInt(1);
                int countPage = 0;
                countPage = total / 10;
                if (total % 5 != 0) {
                    countPage++;
                }
                return countPage;
            }

        } catch (Exception e) {
        }
        return 0;
    }

    public int getTotalOrderSale(int aid) {
        try {
            String query = "SELECT COUNT(DISTINCT o.OrderID)\n"
                    + "FROM Product AS p\n"
                    + "\n"
                    + "\n"
                    + "INNER JOIN OrderDetail AS o ON p.id = o.ProductID\n"
                    + "INNER JOIN [Order] AS ord on ord.id = o.OrderID\n"
                    + "INNER JOIN [OrderStatus] AS s on ord.[Status] = s.[id]\n"
                    + "\n"
                    + "where managerId = ?";
            connection = new DBContext().getConnection();
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setInt(1, aid);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                return rs.getInt(1);

            }

        } catch (Exception e) {
        }
        return 0;
    }

    public int getTotalSoldOrderSale(int aid) {
        try {
            String query = "SELECT sum(o.totalMoney)\n"
                    + "FROM Product AS p\n"
                    + "\n"
                    + "\n"
                    + "INNER JOIN OrderDetail AS o ON p.id = o.ProductID\n"
                    + "INNER JOIN [Order] AS ord on ord.id = o.OrderID\n"
                    + "INNER JOIN [OrderStatus] AS s on ord.[Status] = s.[id]\n"
                    + "\n"
                    + "where managerId = ? and o.[Status] = 3";
            connection = new DBContext().getConnection();
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setInt(1, aid);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                return rs.getInt(1);

            }

        } catch (Exception e) {
        }
        return 0;
    }

    public static void main(String[] args) {
        OrderAccountDAO dao = new OrderAccountDAO();
        System.out.println(dao.getOrderByAid(3, 1));

    }

}
