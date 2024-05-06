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
import model.Brands;
import model.Category;

/**
 *
 * @author MSI GF
 */
public class AdminCateAndBrand {

    Connection connection = null;

    public List<Brands> getBrands() {
        List<Brands> list = new ArrayList<>();
        try {

            String query = "select * from brands";
            connection = new DBContext().getConnection();

            PreparedStatement ps = connection.prepareStatement(query);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                list.add(new Brands(rs.getInt(1), rs.getString(2), rs.getDate(3), rs.getDate(4)));

            }

        } catch (Exception e) {
        }
        return list;
    }

    public Brands getBrandByID(int id) {
        try {

            String query = "select * from brands where id = ?";
            connection = new DBContext().getConnection();

            PreparedStatement ps = connection.prepareStatement(query);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                Brands br = new Brands(rs.getInt(1), rs.getString(2), rs.getDate(3), rs.getDate(4));
                return br;
            }

        } catch (Exception e) {
        }
        return null;
    }
    
    public Brands getBrandByName(String name) {
        try {

            String query = "select * from brands where name = ?";
            connection = new DBContext().getConnection();

            PreparedStatement ps = connection.prepareStatement(query);
            ps.setString(1, name);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                Brands br = new Brands(rs.getInt(1), rs.getString(2), rs.getDate(3), rs.getDate(4));
                return br;
            }

        } catch (Exception e) {
        }
        return null;
    }

    public void addNewBrands(String name) {
        LocalDate curDate = LocalDate.now();
        String date = curDate.toString();
        String query = "INSERT INTO [dbo].[Brands]\n"
                + "           ([Name]\n"
                + "           ,[CreateDate]\n"
                + "           ,[UpdateDate])\n"
                + "     VALUES\n"
                + "           (?, ?, ?)";
        try {
            connection = new DBContext().getConnection();
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setString(1, name);
            ps.setString(2, date);
            ps.setString(3, date);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public void updateBrand(int id, String name) {
        LocalDate curDate = LocalDate.now();
        String date = curDate.toString();
        String query = "UPDATE [dbo].[Brands]\n"
                + "   SET [Name] = ?\n"
                + "      ,[UpdateDate] = ?\n"
                + " WHERE id = ?";
        try {
            connection = new DBContext().getConnection();
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setString(1, name);
            ps.setString(2, date);
            ps.setInt(3, id);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public void deleteBrand(int id) {
        String query = "DELETE FROM [dbo].[Brands]\n"
                + "      WHERE id = ?";
        try {
            connection = new DBContext().getConnection();
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setInt(1, id);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public List<Category> getCategory() {
        List<Category> list = new ArrayList<>();
        String query = "SELECT [cateid]\n"
                + "      ,[Name]\n"
                + "      ,[CreateDate]\n"
                + "      ,[UpdateDate]\n"
                + "  FROM [dbo].[Categories]";
        try {
            connection = new DBContext().getConnection();
            PreparedStatement ps = connection.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Category(rs.getInt(1), rs.getString(2), rs.getDate(3), rs.getDate(4)));
            }
        } catch (Exception e) {
        }

        return list;
    }
    
    public Category getCategoryByCateId(int cateId){
        String query = "SELECT [cateid]\n"
                + "      ,[Name]\n"
                + "      ,[CreateDate]\n"
                + "      ,[UpdateDate]\n"
                + "  FROM [dbo].[Categories]"
                + "  WHERE cateid = ?";
        try {
            connection = new DBContext().getConnection();
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setInt(1, cateId);
            ResultSet rs = ps.executeQuery();
            
            if(rs.next()){
                return new Category(rs.getInt(1), rs.getString(2), rs.getDate(3), rs.getDate(4));
            }
        } catch (Exception e) {
        }
        return null;
    }
    
    public Category getCategoryByCateName(String name){
        String query = "SELECT [cateid]\n"
                + "      ,[Name]\n"
                + "      ,[CreateDate]\n"
                + "      ,[UpdateDate]\n"
                + "  FROM [dbo].[Categories]"
                + "  WHERE Name = ?";
        try {
            connection = new DBContext().getConnection();
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setString(1, name);
            ResultSet rs = ps.executeQuery();
            
            if(rs.next()){
                return new Category(rs.getInt(1), rs.getString(2), rs.getDate(3), rs.getDate(4));
            }
        } catch (Exception e) {
        }
        return null;
    }
    
    public void addNewCate(String name){
        LocalDate curDate = LocalDate.now();
        String date = curDate.toString();
        String query = "INSERT INTO [dbo].[Categories]\n" +
"           ([Name]\n" +
"           ,[CreateDate]\n" +
"           ,[UpdateDate])\n" +
"     VALUES\n" +
"           (?, ?, ?)";
        try {
            connection = new DBContext().getConnection();
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setString(1, name);
            ps.setString(2, date);
            ps.setString(3, date);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public void updateCate(String name, int cateid){
        LocalDate curDate = LocalDate.now();
        String date = curDate.toString();
        String query = "UPDATE [dbo].[Categories]\n" +
"   SET [Name] = ?\n" +
"      ,[UpdateDate] = ?\n" +
" WHERE cateid = ?";
        try {
            connection = new DBContext().getConnection();
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setString(1, name);
            ps.setString(2, date);
            ps.setInt(3, cateid);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }
    
    public void deleteCate(int cateid){
        String query = "DELETE FROM [dbo].[Categories]\n" +
"      WHERE cateid = ?";
        try {
            connection = new DBContext().getConnection();
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setInt(1, cateid);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }
    public void deleteProductImages(int id) {
        String query = "DELETE FROM [dbo].[ProductImages]\n"
                + "      WHERE pid =?";

        try {
            connection = new DBContext().getConnection();
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setInt(1, id);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public void deleteProductSize(int id) {
        String query = "DELETE FROM [dbo].[ProductSize]\n"
                + "      WHERE pid = ?";

        try {
            connection = new DBContext().getConnection();
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setInt(1, id);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public void deleteOrderDetail(int id) {
        String query = "DELETE FROM [dbo].[OrderDetail]\n"
                + "      WHERE ProductID = ?";

        try {
            connection = new DBContext().getConnection();
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setInt(1, id);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    //public void deleteProductFeedback
    public void deleteReply(int id) {
        String query = "DELETE FROM [dbo].[Reply]\n"
                + "      WHERE ProductID = ?";

        try {
            connection = new DBContext().getConnection();
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setInt(1, id);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public void deleteFeedback(int id) {
        String query = "DELETE FROM [dbo].[Feedback]\n"
                + "      WHERE ProductID = ?";

        try {
            connection = new DBContext().getConnection();
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setInt(1, id);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public void deleteProductSale(int id) {
        String query = "DELETE FROM [dbo].[Product_Sale]\n"
                + "      WHERE ProductID = ?";

        try {
            connection = new DBContext().getConnection();
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setInt(1, id);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public void deleteProduct(int id) {
        String query = "DELETE FROM [dbo].[Product]\n"
                + "      WHERE id = ?";

        try {
            connection = new DBContext().getConnection();
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setInt(1, id);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public static void main(String[] args) {
        AdminCateAndBrand ad = new AdminCateAndBrand();
        Brands b = ad.getBrandByID(1);
        System.out.println(b);
    }
}
