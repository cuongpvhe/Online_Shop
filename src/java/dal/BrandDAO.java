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

public class BrandDAO {

    protected Connection connection;

    public List<Brands> getAll() {
        
        List<Brands> list = new ArrayList<>();
        try {

            String query = "SELECT * FROM Brands";
            connection = new DBContext().getConnection();

            PreparedStatement ps = connection.prepareStatement(query);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Brands br = new Brands(rs.getInt(1), rs.getString(2), rs.getDate(3), rs.getDate(4));
               list.add(br);
            }

        } catch (Exception e) {
            System.out.println("");
        }
        return list;
    }

}
