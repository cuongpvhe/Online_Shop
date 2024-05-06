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
import model.Manager;
import model.Product;
import model.ProductImages;
import model.Size;

/**
 *
 * @author MSI GF
 */
public class SalesDAO {
    Connection connection = null;

    public List<ProductImages> getImageProductByPid(int id) {
        List<ProductImages> list = new ArrayList<>();

        try {

            String query = "select ps.id, ps.imagesUrl, ps.pid\n"
                    + "from ProductImages ps, Product p\n"
                    + "where ps.pid = p.id\n"
                    + "and p.id = ?";
            connection = new DBContext().getConnection();

            PreparedStatement ps = connection.prepareStatement(query);
            ps.setInt(1, id);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                ProductImages image = new ProductImages(rs.getInt(1), rs.getString(2), rs.getInt(3));
                list.add(image);
            }

        } catch (Exception e) {
        }
        return list;
    }

    public Brands getBrandByID() {
        try {

            String query = "select * from brands";
            connection = new DBContext().getConnection();

            PreparedStatement ps = connection.prepareStatement(query);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                Brands br = new Brands(rs.getInt(1), rs.getString(2), rs.getDate(3), rs.getDate(4));
                return br;
            }

        } catch (Exception e) {
        }
        return null;
    }

    public Brands getBrandByBrandId(int bid) {
        try {

            String query = "SELECT * FROM Brands where id = ?";
            connection = new DBContext().getConnection();

            PreparedStatement ps = connection.prepareStatement(query);
            ps.setInt(1, bid);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                Brands br = new Brands(rs.getInt(1), rs.getString(2), rs.getDate(3), rs.getDate(4));
                return br;
            }

        } catch (Exception e) {
            System.out.println("");
        }
        return null;
    }

    /**
     *
     * @param pid -> product id want check is exist or not ?
     * @param list -> list data current take
     * @return
     */
    public boolean checkProductExist(int pid, List<Product> list) {
        for (Product item : list) {
            if (pid == item.getId()) {
                return true;
            }
        }
        return false;
    }

    public List<Product> getAllProduct() {
        List<Product> list = new ArrayList<>();
        String query = "select * from product";
        try {
            connection = new DBContext().getConnection();

            PreparedStatement ps = connection.prepareStatement(query);
            ResultSet rs = ps.executeQuery();

//            rs = ps.executeQuery();
            while (rs.next()) {
                int pid = rs.getInt("id");
                List<ProductImages> image = getImageProductByPid(pid);
                Brands br = getBrandByID();
                Category c = getCategoryByID(rs.getInt("categoryid"));
                List<Size> s = getSizeByPid(pid);
                Manager m = getMangerByPid(pid);
                list.add(new Product(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getDouble(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getInt(6),
                        rs.getInt(8),
                        rs.getInt(10),
                        rs.getInt(11),
                        rs.getInt(12),
                        image,
                        rs.getDate(13),
                        rs.getDate(14),
                        rs.getInt(15),
                        br,
                        c,
                        s,
                        m));
            }
        } catch (Exception e) {

        }

        return list;
    }

    public List<Size> getSizeByPid(int pid) {
        List<Size> list = new ArrayList<>();

        try {

            String query = "select * from Size s inner join ProductSize ps\n"
                    + "on s.Id = ps.sizeId\n"
                    + "where ps.pid = ?";
            connection = new DBContext().getConnection();

            PreparedStatement ps = connection.prepareStatement(query);
            ps.setInt(1, pid);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Size s = new Size(rs.getInt("id"), rs.getString("size"), rs.getInt("quantity"));
                list.add(s);
            }

        } catch (Exception e) {

        }
        return list;
    }

    public List<Manager> getManger() {
        List<Manager> list = new ArrayList<>();
        String query = " select distinct p.managerId, a.Fullname\n"
                + "  from Account a, Product p\n"
                + "  where a.Id = p.managerId";

        try {
            connection = new DBContext().getConnection();
            PreparedStatement ps = connection.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Manager(rs.getInt(1), rs.getString(2)));
            }
        } catch (Exception e) {
        }

        return list;
    }

    public Manager getMangerByPid(int id) {
        String query = " select distinct p.managerId, a.Fullname\n"
                + "  from Account a, Product p\n"
                + "  where a.Id = p.managerId"
                + "  and p.id = ?";

        try {
            connection = new DBContext().getConnection();
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return new Manager(rs.getInt(1), rs.getString(2));
            }
        } catch (Exception e) {
        }

        return null;
    }

    public Category getCategoryByID(int cid) {
        try {

            String query = "select * from Categories where cateid = ?";
            connection = new DBContext().getConnection();

            PreparedStatement ps = connection.prepareStatement(query);
            ps.setInt(1, cid);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                Category c = new Category(rs.getInt(1), rs.getString(2), rs.getDate(3), rs.getDate(4));
                return c;
            }

        } catch (Exception e) {
//            System.err.println("ProductDAO -> getCategoryByID:\n" + e);
        }
        return null;
    }

    public List<Category> getCategory() {
        List<Category> list = new ArrayList<>();
        String query = "select * from Categories";
        try {
            connection = new DBContext().getConnection();
            PreparedStatement ps = connection.prepareStatement(query);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Category c = new Category(rs.getInt(1), rs.getString(2), rs.getDate(3), rs.getDate(4));
                list.add(c);
            }

        } catch (Exception e) {
//            System.err.println("ProductDAO -> getCategoryByID:\n" + e);
        }
        return list;
    }

    public List<Brands> getAllBrandses() {
        List<Brands> list = new ArrayList<>();
        String query = "select * from Brands";

        try {
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

    public List<Product> getProducts(String categoryId, String brandId, String managerId, String search, int index) {
        List<Product> list = new ArrayList<>();
        String query = "with x as (select ROW_NUMBER() over (order by id asc) as r, * from Product where 1=1"
                + "and managerId = " +managerId;

        if (categoryId != null && !categoryId.isEmpty()) {
            query += " and categoryid = " + categoryId;
        }

        if (brandId != null && !brandId.isEmpty()) {
            query += " and  brandid = " + brandId;
        }

        if (search != null && !search.isEmpty()) {
            query += " and name like '%" + search + "%'";
        }

        query += ")\n"
                + " select * from x where r between ?*4-3 and ?*4";
        try {
            connection = new DBContext().getConnection();

            PreparedStatement ps = connection.prepareStatement(query);
            ps.setInt(1, index);
            ps.setInt(2, index);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int pid = rs.getInt("id");
                List<ProductImages> image = getImageProductByPid(pid);
                Brands br = getBrandByBrandId(rs.getInt("brandid"));
                Category c = getCategoryByID(rs.getInt("categoryid"));
                List<Size> s = getSizeByPid(pid);
                Manager m = getMangerByPid(pid);
                list.add(new Product(
                        rs.getInt(2),
                        rs.getString(3),
                        rs.getDouble(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getInt(7),
                        rs.getInt(9),
                        rs.getInt(11),
                        rs.getInt(12),
                        rs.getInt(13),
                        image,
                        rs.getDate(14),
                        rs.getDate(15),
                        rs.getInt(16),
                        br,
                        c,
                        s,
                        m));
            }
        } catch (Exception e) {

        }

        return list;
    }

    public int countProducts(String categoryId, String brandId, String managerId, String search) {
        String query = "select count(*) from Product where 1=1"
                + "and managerId = " +managerId;

        if (categoryId != null && !categoryId.isEmpty()) {
            query += " and categoryid = " + categoryId;
        }

        if (brandId != null && !brandId.isEmpty()) {
            query += " and  brandid = " + brandId;
        }

        if (managerId != null && !managerId.isEmpty()) {
            query += " and managerid = " + managerId;
        }

        if (search != null && !search.isEmpty()) {
            query += " and name like '%" + search + "%'";
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
    
    public void addProduct(String name, double price, String description,
            String imageUrl, int category, int brand, int manager, int status) {
        LocalDate curDate = LocalDate.now();
        String date = curDate.toString();
        String query = "INSERT INTO [dbo].[Product]\n"
                + "           ([name]\n"
                + "           ,[price]\n"
                + "           ,[description]\n"
                + "           ,[imageUrl]\n"
                + "           ,[quantitySaled]\n"
                + "           ,[categoryid]\n"
                + "           ,[managerId]\n"
                + "           ,[brandId]\n"
                + "           ,[isSale]\n"
                + "           ,[Gender]\n"
                + "           ,[isAdult]\n"
                + "           ,[CreateDate]\n"
                + "           ,[UpdateDate]\n"
                + "           ,[Status])\n"
                + "     VALUES\n"
                + "           (? , ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

        try {
            connection = new DBContext().getConnection();
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setString(1, name);
            ps.setDouble(2, price);
            ps.setString(3, description);
            ps.setString(4, imageUrl);
            ps.setInt(5, 0);
            ps.setInt(6, category);
            ps.setInt(7, manager);
            ps.setInt(8, brand);
            ps.setInt(9, 0);
            ps.setInt(10, 0);
            ps.setInt(11, 0);
            ps.setString(12, date);
            ps.setString(13, date);
            ps.setInt(14, status);

            ps.executeUpdate();
        } catch (Exception e) {
        }
    }
    
    public boolean getProductByName(String name) {
        String query = "select * from product where name like '%" + name + "%'";

        try {
            connection = new DBContext().getConnection();
            PreparedStatement ps = connection.prepareStatement(query);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                return true;
            }
        } catch (Exception e) {
        }

        return false;
    }

    public void updateProduct(String name, double price, String description,
            String imageUrl, int category, int manager, int status, int id) {
        LocalDate curDate = LocalDate.now();
        String date = curDate.toString();
        String query = "UPDATE [dbo].[Product]\n"
                + "   SET [name] = ?\n"
                + "      ,[price] = ?\n"
                + "      ,[description] = ?\n"
                + "      ,[imageUrl] = ?\n"
                + "      ,[categoryid] = ?\n"
                + "      ,[managerId] = ?\n"
                + "      ,[UpdateDate] = ?\n"
                + "      ,[Status] = ?\n"
                + " WHERE id = ?";

        try {
            connection = new DBContext().getConnection();
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setString(1, name);
            ps.setDouble(2, price);
            ps.setString(3, description);
            ps.setString(4, imageUrl);
            ps.setInt(5, category);
            ps.setInt(6, manager);
            ps.setString(7, date);
            ps.setInt(8, status);
            ps.setInt(9, id);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }
    
    public Product getProductById(int id) {

        String query = "select * from product where id = ?";
        try {
            connection = new DBContext().getConnection();

            PreparedStatement ps = connection.prepareStatement(query);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();

//            rs = ps.executeQuery();
            while (rs.next()) {

                List<ProductImages> image = getImageProductByPid(id);
                Brands br = getBrandByID();
                Category c = getCategoryByID(rs.getInt("categoryid"));
                List<Size> s = getSizeByPid(id);
                Manager m = getMangerByPid(id);
                return new Product(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getDouble(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getInt(6),
                        rs.getInt(8),
                        rs.getInt(10),
                        rs.getInt(11),
                        rs.getInt(12),
                        image,
                        rs.getDate(13),
                        rs.getDate(14),
                        rs.getInt(15),
                        br,
                        c,
                        s,
                        m);
            }
        } catch (Exception e) {

        }

        return null;
    }

    public void updateProductSize(int quantity, int pid, int sizeId) {
        String query = "UPDATE [dbo].[ProductSize]\n"
                + "   set   [quantity] = ?\n"
                + " WHERE pid = ? and sizeId = ?";

        try {
            connection = new DBContext().getConnection();
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setInt(1, quantity);
            ps.setInt(2, pid);
            ps.setInt(3, sizeId);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public void updateProductImages(int id, String imageUrl, int pid) {
        String query = "UPDATE [dbo].[ProductImages]\n"
                + "   SET [imagesUrl] = ?\n"
                + " WHERE id = ? and pid = ?";

        try {
            connection = new DBContext().getConnection();
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setString(1, imageUrl);
            ps.setInt(2, id);
            ps.setInt(3, pid);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public Size checkSize(int pid, int sizeId) {
        String sql = "select * from Size s inner join ProductSize ps\n"
                + "on s.Id = ps.sizeId\n"
                + "where ps.pid = ? and ps.sizeId = ?";

        try {
            connection = new DBContext().getConnection();
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, pid);
            ps.setInt(2, sizeId);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                return new Size(rs.getInt(1), rs.getString(2), rs.getInt(5));

            }
        } catch (Exception e) {
        }

        return null;
    }

    public void addNewSize(int pid, int sizeId, int quantity) {
        String query = "INSERT INTO [dbo].[ProductSize]\n"
                + "           ([pid]\n"
                + "           ,[sizeId]\n"
                + "           ,[quantity])\n"
                + "     VALUES\n"
                + "           (?, ?, ?)";

        try {
            connection = new DBContext().getConnection();
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setInt(1, pid);
            ps.setInt(2, sizeId);
            ps.setInt(3, quantity);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public List<Size> getSize() {
        List<Size> list = new ArrayList<>();
        String query = "select * from Size \n";
        try {
            connection = new DBContext().getConnection();
            PreparedStatement ps = connection.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Size(rs.getInt(1), rs.getString(2), rs.getInt(2)));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public void deleteSizeByPidSizeId(int pid, int sizeId) {
        String query = "DELETE FROM [dbo].[ProductSize]\n"
                + "      WHERE pid = ? and sizeId = ?";

        try {
            connection = new DBContext().getConnection();
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setInt(1, pid);
            ps.setInt(2, sizeId);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public ProductImages getProductImage(int id, int pid) {
        String query = "select * from ProductImages\n"
                + "where id = ? and pid = ?";

        try {
            connection = new DBContext().getConnection();
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setInt(1, id);
            ps.setInt(2, pid);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                return new ProductImages(rs.getInt(1), rs.getString(2), rs.getInt(3));
            }

        } catch (Exception e) {
        }

        return null;
    }

    public void addProductImages(String imageUrl, int pid) {
        String query = "INSERT INTO [dbo].[ProductImages]\n"
                + "           ([imagesUrl]\n"
                + "           ,[pid])\n"
                + "     VALUES\n"
                + "           (?,?)";

        try {
            connection = new DBContext().getConnection();
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setString(1, imageUrl);
            ps.setInt(2, pid);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public void deleteImageByPidSizeId(int pid, int id) {
        String query = "DELETE FROM [dbo].[ProductImages]\n"
                + "      WHERE id = ? and pid =?";

        try {
            connection = new DBContext().getConnection();
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setInt(1, id);
            ps.setInt(2, pid);
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
        SalesDAO dao = new SalesDAO();
        List<Product> list = dao.getProducts("", "", "1", "", 1);
        
        for (Product product : list) {
            System.out.println(product);
        }
    }
}
