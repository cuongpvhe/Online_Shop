/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Category;

/**
 *
 * @author admin
 */
public class CategoryDAO extends DBContext {

    Connection connection = null;

    //lấy tất cả sản phẩm từ bảng category
    public List<Category> getAllCategory() {
        List<Category> list = new ArrayList<>();
        String sql = "select * from Categories";
        try {
            connection = new DBContext().getConnection();
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                list.add(new Category(rs.getInt(1), rs.getString(2), rs.getDate(3), rs.getDate(4)));
            }
        } catch (Exception e) {

        }
        return list;
    }

    public int getCategoryID(int pid) {
        String sql = "select categoryid from Product where id = ?";

        try {
            connection = new DBContext().getConnection();
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, pid);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception ex) {

        }

        return 0;
    }
}
