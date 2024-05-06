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
import model.Size;

public class SizeDAO  {

    Connection connection = null;

    public List<Size> getAll() {
        List<Size> list = new ArrayList<>();

        try {
            String query = "select * from Size";
            connection = new DBContext().getConnection();

            PreparedStatement ps = connection.prepareStatement(query);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {

                // quantity ở đây bằng 0 vì quantity chỉ số size còn của 1 sản phẩm
                // đây là hàm get all -> không có
                Size s = new Size(rs.getInt(1), rs.getString(2), 0);
                list.add(s);
            }

        } catch (Exception e) {
            System.out.println("SizeDAO -> getSize: \n" + e);
        }

        return list;
    }
}
