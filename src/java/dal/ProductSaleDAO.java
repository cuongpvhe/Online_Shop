/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.time.LocalDate;
import java.time.LocalTime;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Brands;
import model.Category;
import model.Manager;
import model.Product;
import model.ProductImages;
import model.ProductSale;
import model.Size;

/**
 *
 * @author admin
 */
public class ProductSaleDAO extends DBContext {

    public List<ProductSale> getProductSale()
            throws SQLException, ClassNotFoundException, Exception {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        ProductDAO pdao = new ProductDAO();
        List<ProductSale> list = new ArrayList<>();
        try {
            con = new DBContext().getConnection();
            if (con != null) {
                String sql = "Select * from [Product_Sale] where [isFlashSale] = 0";
                //3. Create Statement
                stm = con.prepareStatement(sql);
                rs = stm.executeQuery();
                while (rs.next()) {
                    Product p = pdao.getProductByID(rs.getInt(1));
                    list.add(new ProductSale(p,
                            rs.getTimestamp(2),
                            rs.getTimestamp(3),
                            rs.getDouble(4),
                            rs.getDouble(5),
                            rs.getInt(6),
                            rs.getInt(7),
                            rs.getInt(8),
                            rs.getInt(9),
                            rs.getTimestamp(10)));
                }

            }
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return list;
    }

    public List<ProductSale> getProductIsFlashSale(String date, int timeFrame)
            throws SQLException, ClassNotFoundException, Exception {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        ProductDAO pdao = new ProductDAO();
        List<ProductSale> list = new ArrayList<>();
        try {
            con = new DBContext().getConnection();
            if (con != null) {
                String sql = "";
                if (timeFrame == 1) {
                    sql = "SELECT *  FROM Product_Sale\n"
                            + "WHERE isFlashSale = 1 AND timeFrame != 2 AND \n"
                            + "startTime <= '" + date + " 08:00:00' and (endTime  >= '" + date + " 14:00:00' or [endTime] is null)\n";
                }

                if (timeFrame == 2) {
                    sql = "SELECT *  FROM Product_Sale\n"
                            + "WHERE isFlashSale = 1 AND timeFrame != 1 AND \n"
                            + "startTime <= '" + date + " 18:00:00' and (endTime  >= '" + date + " 22:00:00' or [endTime] is null)";
                }

                //3. Create Statement
                stm = con.prepareStatement(sql);
                rs = stm.executeQuery();
                while (rs.next()) {
                    Product p = pdao.getProductByID(rs.getInt(1));
                    list.add(new ProductSale(p,
                            rs.getTimestamp(2),
                            rs.getTimestamp(3),
                            rs.getDouble(4),
                            rs.getDouble(5),
                            rs.getInt(6),
                            rs.getInt(7),
                            rs.getInt(8),
                            rs.getInt(9),
                            rs.getTimestamp(10)));
                }

            }
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return list;
    }

    public ProductSale getProductSaleById(int pid)
            throws SQLException, ClassNotFoundException, Exception {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        ProductDAO pdao = new ProductDAO();
        try {
            con = new DBContext().getConnection();
            if (con != null) {
                String sql = "Select * from [Product_Sale] where [ProductID] = ?";
                //3. Create Statement
                stm = con.prepareStatement(sql);
                stm.setInt(1, pid);
                rs = stm.executeQuery();
                if (rs.next()) {
                    Product p = pdao.getProductByID(rs.getInt(1));
                    return new ProductSale(p,
                            rs.getTimestamp(2),
                            rs.getTimestamp(3),
                            rs.getDouble(4),
                            rs.getDouble(5),
                            rs.getInt(6),
                            rs.getInt(7),
                            rs.getInt(8),
                            rs.getInt(9),
                            rs.getTimestamp(10));
                }

            }
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return null;
    }

    public ProductSale getProductBigSale()
            throws SQLException, ClassNotFoundException, Exception {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        ProductDAO pdao = new ProductDAO();
        try {
            con = new DBContext().getConnection();
            if (con != null) {
                String sql = "SELECT top 1 * FROM [dbo].[Product_Sale] WHERE [endTime] is not null Order by [discount] DESC;";
                //3. Create Statement
                stm = con.prepareStatement(sql);
                rs = stm.executeQuery();
                if (rs.next()) {
                    Product p = pdao.getProductByID(rs.getInt(1));
                    return new ProductSale(p,
                            rs.getTimestamp(2),
                            rs.getTimestamp(3),
                            rs.getDouble(4),
                            rs.getDouble(5),
                            rs.getInt(6),
                            rs.getInt(7),
                            rs.getInt(8),
                            rs.getInt(9),
                            rs.getTimestamp(10));
                }

            }
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return null;
    }

    public List<ProductSale> getPSaleByFilter(String search, String category, String brand, String flsale, String createdate)
            throws SQLException, ClassNotFoundException, Exception {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        ProductDAO pdao = new ProductDAO();
        List<ProductSale> list = new ArrayList<>();
        try {
            con = new DBContext().getConnection();
            if (con != null) {
                String sql = "SELECT PS.ProductID, PS.startTime, PS.endTime, PS.salePrice, PS.discount, PS.isFlashSale, PS.quantity, PS.timeFrame, PS.updateBy,PS.createDate\n"
                        + "FROM [dbo].[Product_Sale] AS PS\n"
                        + "JOIN [dbo].[Product] AS P ON PS.ProductID = P.id and P.Status = 1\n"
                        + "WHERE 1 = 1";
                if (search != null && !search.isEmpty()) {
                    sql += " AND P.name like '%" + search + "%'";
                }
                if (category != null && !category.isEmpty()) {
                    sql += " AND P.categoryid = " + category;
                }
                if (brand != null && !brand.isEmpty()) {
                    sql += " AND P.brandId = " + brand;
                }

                if (flsale != null && !flsale.isEmpty()) {
                    switch (flsale) {
                        case "1":
                            sql += " AND PS.isFlashSale = 0";
                            break;
                        case "2":
                            sql += " AND PS.isFlashSale = 1";
                    }
                }
                if (createdate != null && !createdate.isEmpty()) {
                    switch (createdate) {
                        case "1":
                            sql += " ORDER BY [createDate] ASC";
                            break;
                        case "2":
                            sql += " ORDER BY [createDate] DESC";
                            break;
                    }
                }
                stm = con.prepareStatement(sql);
                rs = stm.executeQuery();
                while (rs.next()) {
                    Product p = pdao.getProductByID(rs.getInt(1));
                    list.add(new ProductSale(p,
                            rs.getTimestamp(2),
                            rs.getTimestamp(3),
                            rs.getDouble(4),
                            rs.getDouble(5),
                            rs.getInt(6),
                            rs.getInt(7),
                            rs.getInt(8),
                            rs.getInt(9),
                            rs.getTimestamp(10)));
                }

            }
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return list;
    }

    public void insertProductSale(int pid, Timestamp startTime, Timestamp endTime, double salePrice, double discount, int isFlashSale, String quantity, String timeFrame, int aid)
            throws SQLException, Exception {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        ProductSaleDAO psdao = new ProductSaleDAO();
        psdao.updateIsSale(pid, 1);
        try {
            con = new DBContext().getConnection();
            if (con != null) {
                String sql = "INSERT INTO [dbo].[Product_Sale]\n"
                        + "           ([ProductID]\n"
                        + "           ,[startTime]\n"
                        + "           ,[salePrice]\n"
                        + "           ,[discount]\n"
                        + "           ,[isFlashSale]\n"
                        + "           ,[updateBy]";
                String value = "VALUES(?,?,?,?,?,?);";
                if ((endTime != null) && isFlashSale == 0) {
                    sql += "           ,[endTime]\n";
                    value = "VALUES(?,?,?,?,?,?,?);";
                } else if ((endTime != null) && isFlashSale == 1) {
                    sql += "           ,[endTime]\n"
                            + "           ,[quantity]\n"
                            + "           ,[timeFrame]";
                    value = "VALUES(?,?,?,?,?,?,?,?,?);";
                } else if ((endTime == null) && isFlashSale == 1) {
                    sql += "           ,[quantity]\n"
                            + "           ,[timeFrame]";
                    value = "VALUES(?,?,?,?,?,?,?,?);";
                }
                System.out.println(sql);
                sql = sql + ")" + value;
                stm = con.prepareStatement(sql);
                stm.setInt(1, pid);
                stm.setTimestamp(2, startTime);
                stm.setDouble(3, salePrice);
                stm.setDouble(4, discount);
                stm.setInt(5, isFlashSale);
                stm.setInt(6, aid);
                if ((endTime != null) && isFlashSale == 0) {
                    stm.setTimestamp(7, endTime);
                } else if ((endTime != null) && isFlashSale == 1) {
                    stm.setTimestamp(7, endTime);
                    stm.setString(8, quantity);
                    stm.setString(9, timeFrame);
                } else if ((endTime == null) && isFlashSale == 1) {
                    stm.setString(7, quantity);
                    stm.setString(8, timeFrame);
                }
                stm.executeUpdate();
            }
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }
        }
    }

    public void updateProductSale(int pid, Timestamp startTime, Timestamp endTime, double salePrice, double discount, int isFlashSale, String quantity, String timeFrame, int aid)
            throws SQLException, Exception {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            con = new DBContext().getConnection();
            if (con != null) {
                String sql = "UPDATE [dbo].[Product_Sale]\n"
                        + "          SET [startTime] = ?\n"
                        + "           ,[salePrice] = ?\n"
                        + "           ,[discount] = ?\n"
                        + "           ,[isFlashSale] = ?\n"
                        + "           ,[updateBy] = ?\n";
                if (endTime != null) {
                    sql += "           ,[endTime] = ?\n";
                }
                if (isFlashSale == 1) {
                    sql += "           ,[quantity] = ?\n"
                            + "           ,[timeFrame] = ?\n";
                }
                if (isFlashSale == 0) {
                    sql += ",[quantity] = Null\n"
                            + "      ,[timeFrame] = Null\n";
                }
                sql += " WHERE [ProductID] = ?;";
                stm = con.prepareStatement(sql);
                stm.setTimestamp(1, startTime);
                stm.setDouble(2, salePrice);
                stm.setDouble(3, discount);
                stm.setInt(4, isFlashSale);
                stm.setInt(5, aid);
                int in = 6;
                if (endTime != null) {
                    stm.setTimestamp(in, endTime);
                    ++in;
                }
                if (isFlashSale == 1) {
                    stm.setString(in, quantity);
                    stm.setString(in + 1, timeFrame);
                    in = in + 2;
                }
                stm.setInt(in, pid);
                stm.executeUpdate();
            }
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }
        }
    }

    public void updateIsSale(int pid, int isSale) throws SQLException, Exception {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        LocalDate curDate = LocalDate.now();
        String date = curDate.toString();
        try {
            con = new DBContext().getConnection();
            if (con != null) {
                String sql = "UPDATE [dbo].[Product]\n"
                        + "   SET [isSale] = ?\n"
                        + "   ,[UpdateDate] = ?\n"
                        + " WHERE id = ?";

                stm = con.prepareStatement(sql);
                stm.setInt(1, isSale);
                stm.setString(2, date);
                stm.setInt(3, pid);
                stm.executeUpdate();
                stm.executeUpdate();
            }
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }
        }

    }

    public List<ProductSale> getProduct(String[] brand, String[] size, String search, String sort, String price, String category)
            throws SQLException, Exception {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        ProductDAO pdao = new ProductDAO();
        List<ProductSale> list = new ArrayList<>();
        try {
            con = new DBContext().getConnection();
            if (con != null) {
                String sql = "SELECT distinct PS.ProductID, PS.startTime, PS.endTime, PS.salePrice, PS.discount, PS.isFlashSale, PS.quantity, PS.timeFrame, PS.updateBy ,PS.createDate\n"
                        + "FROM [dbo].[Product_Sale] AS PS\n"
                        + "JOIN [dbo].[Product] AS P ON PS.ProductID = P.id\n"
                        + "join ProductSize As size on P.id = size.pid\n"
                        + "WHERE PS.isFlashSale = 0 and P.Status = 1\n";
                if (size != null && size.length > 0) {
                    sql += " AND sizeid IN (";
                    for (int i = 0; i < size.length; i++) {
                        if (i == size.length - 1) {
                            sql += size[i] + ")\n";
                        } else {
                            sql += size[i] + ", ";
                        }
                    }
                }

                if (category != null && !category.isEmpty()) {
                    sql += " AND P.categoryid = " + category;
                }

                if (brand != null && brand.length > 0) {
                    sql += " AND P.brandid IN (";
                    for (int i = 0; i < brand.length; i++) {
                        if (i == brand.length - 1) {
                            sql += brand[i] + ")";
                        } else {
                            sql += brand[i] + ", ";
                        }
                    }
                }

                if (search != null && !search.isEmpty()) {
                    sql += " AND P.name like '%" + search + "%' ";
                }

                if (price != null && !price.isEmpty()) {
                    double priceFrom = 0;
                    double priceTo = 0;
                    switch (price) {
                        case "100-150":
                            priceFrom = 1000000;
                            priceTo = 1500000;
                            break;
                        case "150-200":
                            priceFrom = 1500000;
                            priceTo = 2000000;
                            break;
                        case "200-250":
                            priceFrom = 2000000;
                            priceTo = 2500000;
                            break;
                        case "250-300":
                            priceFrom = 2500000;
                            priceTo = 3000000;
                            break;
                        case "300-350":
                            priceFrom = 3000000;
                            priceTo = 3500000;
                            break;
                        case "350-more":
                            priceFrom = 3500000;
                            priceTo = pdao.getLastPrice();
                    }

                    sql += " AND P.price between " + priceFrom + " AND " + priceTo;
                }

                if (sort != null && !sort.isEmpty()) {
                    switch (sort) {
                        case "1":
                            sql += " ORDER BY P.price ASC";
                            break;
                        case "2":
                            sql += " ORDER BY P.price DESC";
                            break;
                        case "3":
                            sql += " ORDER BY P.name ASC";
                            break;
                    }
                }

                stm = con.prepareStatement(sql);
                rs = stm.executeQuery();
                while (rs.next()) {
                    Product p = pdao.getProductByID(rs.getInt(1));
                    list.add(new ProductSale(p,
                            rs.getTimestamp(2),
                            rs.getTimestamp(3),
                            rs.getDouble(4),
                            rs.getDouble(5),
                            rs.getInt(6),
                            rs.getInt(7),
                            rs.getInt(8),
                            rs.getInt(9),
                            rs.getTimestamp(10)));
                }

            }
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return list;
    }

    public List<ProductSale> pagination(List<ProductSale> before, int start, int end) {
        List<ProductSale> after = new ArrayList<>();

        for (int i = start; i < end; i++) {
            after.add(before.get(i));
        }

        return after;
    }

    public void deleteSaleProductById(String id) {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;

        try {
            con = new DBContext().getConnection();
            if (con != null) {
                String sql = "DELETE FROM [dbo].[Product_Sale]\n"
                        + "      WHERE ProductID = ?";

                stm = con.prepareStatement(sql);
                stm.setString(1, id);
                stm.executeUpdate();
            }
        } catch (Exception e) {

        }

    }

    public void deleteSaleProductEndTime() {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;

        try {
            con = new DBContext().getConnection();
            if (con != null) {
                String sql = "EXEC deleteSaleProductTimeout;";

                stm = con.prepareStatement(sql);
                rs = stm.executeQuery();
            }
        } catch (Exception e) {

        }

    }

    public static void main(String[] args) {
        LocalTime now = LocalTime.now();
        System.out.println("Thời gian hiện tại là: " + now);
        LocalDate today = LocalDate.now();
        System.out.println("Ngày hiện tại là: " + today);

    }
}
