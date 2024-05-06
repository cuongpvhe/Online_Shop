/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import model.Brands;
import model.Category;
import model.Manager;
import model.Product;
import model.ProductImages;
import model.ProductSize;
import model.Size;

public class ProductDAO {

    Connection connection = null;

    public List<ProductImages> getImageProductByPid(int id) {
        List<ProductImages> list = new ArrayList<>();

        try {

            String query = "select * from ProductImages where id = ?";
            connection = new DBContext().getConnection();

            PreparedStatement ps = connection.prepareStatement(query);
            ps.setInt(1, id);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
//                Thaydoivitricotimage
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

    public List<Product> getProduct(String[] brand, String[] size, String search, String sort, String price, String category) {
        List<Product> list = new ArrayList<>();
        String query = "select * from Product where isSale = 0 and Status = 1";

        try {
            connection = new DBContext().getConnection();

            if (size != null && size.length > 0) {
                String subQuery = "select * from product p inner join ProductSize ps on p.id = ps.pid WHERE 1=1 ";
                subQuery += " AND sizeid IN (";
                for (int i = 0; i < size.length; i++) {
                    if (i == size.length - 1) {
                        subQuery += size[i] + ")";
                    } else {
                        subQuery += size[i] + ", ";
                    }
                }
                query = subQuery;
            }

            if (category != null && !category.isEmpty()) {
                query += " AND categoryid = " + category;
            }

            if (brand != null && brand.length > 0) {
                query += " AND brandid IN (";
                for (int i = 0; i < brand.length; i++) {
                    if (i == brand.length - 1) {
                        query += brand[i] + ")";
                    } else {
                        query += brand[i] + ", ";
                    }
                }
            }

            if (search != null && !search.isEmpty()) {
                query += " AND name like '%" + search + "%'";
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
                        priceTo = getLastPrice();
                }

                query += " AND price between " + priceFrom + " AND " + priceTo;
            }

            if (sort != null && !sort.isEmpty()) {
                switch (sort) {
                    case "1":
                        query += " ORDER BY price ASC";
                        break;
                    case "2":
                        query += " ORDER BY price DESC";
                        break;
                    case "3":
                        query += " ORDER BY name ASC";
                        break;
                }
            }

            System.out.println("SQL Query: " + query);

            PreparedStatement ps = connection.prepareStatement(query);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                int pid = rs.getInt("id");

                if (!checkProductExist(pid, list)) {
                    List<ProductImages> image = getImageProductByPid(pid);
                    Brands br = getBrandByBrandId(rs.getInt("brandid"));
                    Category c = getCategoryByID(rs.getInt("categoryid"));

                    List<Size> s = getSizeByPid(pid);
                    Manager m = getMangerByPid(pid);
                    Product p = new Product(
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
                    list.add(p);
                }
            }

        } catch (Exception e) {
            System.err.println("ProductDAO -> getProduct:\n" + e);
        }

        return list;
    }

    public List<Product> getProductFilterByMKT(String search, String category, String brand, String status) {
        List<Product> list = new ArrayList<>();
        String query = "select * from Product where isSale = 0 and Status = 1";

        try {
            connection = new DBContext().getConnection();

            if (search != null && !search.isEmpty()) {
                query += " AND name like '%" + search + "%'";
            }
            if (category != null && !category.isEmpty()) {
                query += " AND categoryid = " + category;
            }
            if (brand != null && !brand.isEmpty()) {
                query += " AND brandId = " + brand;
            }

//            if (status != null && !status.isEmpty()) {
//                switch (status) {
//                    case "1":
//                        query += " AND [status] = 1";
//                        break;
//                    case "2":
//                        query += " AND [status] = 0";
//                }
//            }
            PreparedStatement ps = connection.prepareStatement(query);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                int pid = rs.getInt("id");

                if (!checkProductExist(pid, list)) {
                    List<ProductImages> image = getImageProductByPid(pid);
                    Brands br = getBrandByBrandId(rs.getInt("brandid"));
                    Category c = getCategoryByID(rs.getInt("categoryid"));

                    List<Size> s = getSizeByPid(pid);
                    Manager m = getMangerByPid(pid);
                    Product p = new Product(
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
                    list.add(p);
                }
            }

        } catch (Exception e) {
            System.err.println("ProductDAO -> getProduct:\n" + e);
        }

        return list;
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

    public List<Product> pagination(List<Product> before, int start, int end) {
        List<Product> after = new ArrayList<>();

        for (int i = start; i < end; i++) {
            after.add(before.get(i));
        }

        return after;
    }

    public double getLastPrice() {
        try {

            String query = "select MAX(price) from product";
            connection = new DBContext().getConnection();

            PreparedStatement ps = connection.prepareStatement(query);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                return rs.getDouble(1);
            }

        } catch (Exception e) {
//            System.err.println("ProductDAO -> getCategoryByID:\n" + e);
        }
        return 0;
    }

    public Product getProductByID(int id) {
        try {
            String query = "select * from Product where id = ?";
            connection = new DBContext().getConnection();

            PreparedStatement ps = connection.prepareStatement(query);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {

                int pid = rs.getInt("id");
                List<ProductImages> image = getImageProductByPid(pid);
                Brands br = getBrandByID();
                Category c = getCategoryByID(rs.getInt("categoryid"));
                Manager m = getMangerByPid(pid);
                List<Size> s = getSizeByPid(pid);

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

//                return new Product(rs.getInt(1), rs.getString(2), rs.getDouble(3), rs.getString(4), rs.getString(5), rs.getInt(6), rs.getInt(7), rs.getInt(8), rs.getDate(9), rs.getDate(10), rs.getBoolean(11));
            }
        } catch (Exception e) {
        }
        return null;
    }

    public Product getProductByIDToCart(int id) {
        try {
            String query = "  SELECT \n"
                    + "    P.id, P.name,\n"
                    + "    CASE \n"
                    + "        WHEN P.isSale = 1 AND PS.isFlashSale = 0 AND( (GETDATE() BETWEEN PS.startTime AND PS.endTime) Or (GETDATE() >= PS.startTime AND PS.endTime is null) ) THEN PS.salePrice\n"
                    + "        WHEN P.isSale = 1 AND PS.isFlashSale = 1 AND (\n"
                    + "            (CAST(GETDATE() AS TIME) BETWEEN '08:00:00' AND '14:00:00') AND  timeFrame != 2\n"
                    + "        ) AND( (GETDATE() BETWEEN PS.startTime AND PS.endTime) Or (GETDATE() >= PS.startTime AND PS.endTime is null) ) THEN PS.salePrice\n"
                    + "		WHEN P.isSale = 1 AND PS.isFlashSale = 1 AND (\n"
                    + "            (CAST(GETDATE() AS TIME) BETWEEN '18:00:00' AND '22:00:00' AND timeFrame != 1)\n"
                    + "        ) AND( (GETDATE() BETWEEN PS.startTime AND PS.endTime) Or (GETDATE() >= PS.startTime AND PS.endTime is null) ) THEN PS.salePrice\n"
                    + "        ELSE P.price\n"
                    + "    END as price,\n"
                    + "    P.description, P.imageUrl, P.quantitySaled, P.categoryid, P.managerId,\n"
                    + "    P.brandId, P.isSale, P.Gender, P.isAdult, P.CreateDate, P.UpdateDate, P.[Status]\n"
                    + "FROM \n"
                    + "    dbo.Product AS P\n"
                    + "LEFT JOIN dbo.Product_Sale AS PS ON P.id = PS.ProductID\n"
                    + "WHERE P.id = ?;";
            connection = new DBContext().getConnection();

            PreparedStatement ps = connection.prepareStatement(query);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {

                int pid = rs.getInt("id");
                List<ProductImages> image = getImageProductByPid(pid);
                Brands br = getBrandByID();
                Category c = getCategoryByID(rs.getInt("categoryid"));
                Manager m = getMangerByPid(pid);
                List<Size> s = getSizeByPid(pid);

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

//                return new Product(rs.getInt(1), rs.getString(2), rs.getDouble(3), rs.getString(4), rs.getString(5), rs.getInt(6), rs.getInt(7), rs.getInt(8), rs.getDate(9), rs.getDate(10), rs.getBoolean(11));
            }
        } catch (Exception e) {
        }
        return null;
    }

    public List<Product> get4ProductNew() {
        List<Product> list = new ArrayList<>();

        try {
            String query = "SELECT TOP 4 * FROM Product order by id desc;";
            connection = new DBContext().getConnection();

            PreparedStatement ps = connection.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
//                list.add(new Product(rs.getInt(1), rs.getString(2), rs.getDouble(3), rs.getString(4), rs.getString(5), rs.getInt(6), rs.getInt(7), rs.getInt(8), rs.getDate(9), rs.getDate(10), rs.getBoolean(11)));
                int pid = rs.getInt(1);
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

    public List<ProductSize> getListSize(int pid) {
        List<ProductSize> list = new ArrayList<>();
        String query = "SELECT Size.Id, Size.size, ProductSize.quantity\n"
                + "FROM (Product INNER JOIN ProductSize ON Product.id = ProductSize.pid)\n"
                + "INNER JOIN Size ON ProductSize.sizeId = Size.Id\n"
                + "Where Product.id = ? AND ProductSize.quantity > 0";

        try {
            connection = new DBContext().getConnection();
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setInt(1, pid);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new ProductSize(rs.getInt(1), rs.getInt(2), rs.getInt(3)));
            }
        } catch (Exception e) {

        }

        return list;
    }

    public Category getCategoryByPid(int pid) {
        try {
            String query = "SELECT Product.id, Categories.Name, Product.CreateDate, Product.UpdateDate\n"
                    + "FROM Product LEFT JOIN Categories ON Product.categoryid = Categories.cateid\n"
                    + "Where Product.id = ?";
            connection = new DBContext().getConnection();
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setInt(1, pid);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return new Category(rs.getInt(1), rs.getString(2), rs.getDate(3), rs.getDate(4));
            }
        } catch (Exception e) {
        }
        return null;
    }

    public int getQuantitySize(int pid, int sizeId) {
        try {

            String query = "select quantity from ProductSize\n"
                    + "where pid = ? and sizeId = ?";
            connection = new DBContext().getConnection();

            PreparedStatement ps = connection.prepareStatement(query);
            ps.setInt(1, pid);
            ps.setInt(2, sizeId);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                return rs.getInt(1);
            }

        } catch (Exception e) {
        }
        return 0;
    }

    public int getQuantityProduct(int pid) {
        try {

            String query = "select quantitySaled from Product\n"
                    + "where id = ?";
            connection = new DBContext().getConnection();

            PreparedStatement ps = connection.prepareStatement(query);
            ps.setInt(1, pid);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                return rs.getInt(1);
            }

        } catch (Exception e) {
        }
        return 0;
    }

    public List<ProductImages> getListImageByPid(int pid) {
        List<ProductImages> list = new ArrayList<>();
        String query = "select * from ProductImages\n"
                + "where pid = ?";

        try {
            connection = new DBContext().getConnection();
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setInt(1, pid);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new ProductImages(rs.getInt(1), rs.getString(2), rs.getInt(3)));
            }
        } catch (Exception e) {

        }

        return list;
    }

    public Brands getBrandById(int pid) {
        try {
            String query = "select Brands.id, Brands.[Name], Brands.CreateDate, Brands.UpdateDate from Brands\n"
                    + "RIGHT JOIN Product ON Brands.id = Product.brandId\n"
                    + "Where Product.id = ?";
            connection = new DBContext().getConnection();
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setInt(1, pid);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return new Brands(rs.getInt(1), rs.getString(2), rs.getDate(3), rs.getDate(4));
            }
        } catch (Exception e) {
        }
        return null;
    }

    public static void main(String[] args) {

        ProductDAO dao = new ProductDAO();

        Product a = dao.getProductByID(7);

    }
}
