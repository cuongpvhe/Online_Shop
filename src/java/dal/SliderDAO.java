/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Slider;

/**
 *
 * @author admin
 */
public class SliderDAO extends DBContext {

    public List<Slider> getAllSlider()
            throws SQLException, ClassNotFoundException, Exception {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;

        List<Slider> list = new ArrayList<>();
        try {
            con = new DBContext().getConnection();
            if (con != null) {
                String sql = "Select * from Sliders";
                //3. Create Statement
                stm = con.prepareStatement(sql);
                rs = stm.executeQuery();
                while (rs.next()) {
                    list.add(new Slider(rs.getInt(1),
                            rs.getString(2),
                            rs.getString(3),
                            rs.getInt(4),
                            rs.getInt(5),
                            rs.getInt(6),
                            rs.getDate(7),
                            rs.getDate(8),
                            rs.getString(9)));
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

    public List<Slider> getAllSliderActive()
            throws SQLException, ClassNotFoundException, Exception {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;

        List<Slider> list = new ArrayList<>();
        try {
            con = new DBContext().getConnection();
            if (con != null) {
                String sql = "Select * from Sliders where [status] = 1 ORDER BY [arrange] ASC;";
                //3. Create Statement
                stm = con.prepareStatement(sql);
                rs = stm.executeQuery();
                while (rs.next()) {
                    list.add(new Slider(rs.getInt(1),
                            rs.getString(2),
                            rs.getString(3),
                            rs.getInt(4),
                            rs.getInt(5),
                            rs.getInt(6),
                            rs.getDate(7),
                            rs.getDate(8),
                            rs.getString(9)));
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

    public Slider getSliderFirst()
            throws SQLException, ClassNotFoundException, Exception {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;

        try {
            con = new DBContext().getConnection();
            if (con != null) {
                String sql = "SELECT top 1 * FROM [dbo].[Sliders] where [status] = 1 ORDER BY  [arrange] ASC;";
                //3. Create Statement
                stm = con.prepareStatement(sql);
                rs = stm.executeQuery();
                while (rs.next()) {
                    return new Slider(rs.getInt(1),
                            rs.getString(2),
                            rs.getString(3),
                            rs.getInt(4),
                            rs.getInt(5),
                            rs.getInt(6),
                            rs.getDate(7),
                            rs.getDate(8),
                            rs.getString(9));
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

    public List<Slider> getSliderByArrangeASC()
            throws SQLException, ClassNotFoundException, Exception {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;

        List<Slider> list = new ArrayList<>();
        try {
            con = new DBContext().getConnection();
            if (con != null) {
                String sql = " Select * from Sliders order by arrange asc";
                //3. Create Statement
                stm = con.prepareStatement(sql);
                rs = stm.executeQuery();
                while (rs.next()) {
                    list.add(new Slider(rs.getInt(1),
                            rs.getString(2),
                            rs.getString(3),
                            rs.getInt(4),
                            rs.getInt(5),
                            rs.getInt(6),
                            rs.getDate(7),
                            rs.getDate(8),
                            rs.getString(9)));
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

    public Slider getSliderById(int id)
            throws SQLException, ClassNotFoundException, Exception {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;

        try {
            con = new DBContext().getConnection();
            if (con != null) {
                String sql = "SELECT * FROM [dbo].[Sliders] where [Id] = ?";
                //3. Create Statement
                stm = con.prepareStatement(sql);
                stm.setInt(1, id);
                rs = stm.executeQuery();
                while (rs.next()) {
                    return new Slider(rs.getInt(1),
                            rs.getString(2),
                            rs.getString(3),
                            rs.getInt(4),
                            rs.getInt(5),
                            rs.getInt(6),
                            rs.getDate(7),
                            rs.getDate(8),
                            rs.getString(9));
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

    public List<String> getAllImageSlider()
            throws SQLException, ClassNotFoundException, Exception {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;

        List<String> list = new ArrayList<>();
        try {
            con = new DBContext().getConnection();
            if (con != null) {
                String sql = "select imageUrl from Sliders";
                //3. Create Statement
                stm = con.prepareStatement(sql);
                rs = stm.executeQuery();
                while (rs.next()) {
                    list.add(rs.getString(1));
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

    public List<Slider> getSliderWithFilter(String search, String arrange, String status)
            throws SQLException, ClassNotFoundException, Exception {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;

        List<Slider> list = new ArrayList<>();
        try {
            con = new DBContext().getConnection();
            if (con != null) {
                String sql = "select * from Sliders where 1=1";

                if (search != null && !search.isEmpty()) {
                    sql += " AND [sliderTitle] like '%" + search + "%'";
                }

                if (status != null && !status.isEmpty()) {
                    switch (status) {
                        case "1":
                            sql += " AND [status] = 1";
                            break;
                        case "2":
                            sql += " AND [status] = 0";
                            break;
                    }
                }

                if (arrange != null && !arrange.isEmpty()) {
                    switch (arrange) {
                        case "1":
                            sql += " ORDER BY [arrange] ASC";
                            break;
                        case "2":
                            sql += " ORDER BY [arrange] DESC";
                            break;
                    }
                }
                //3. Create Statement
                stm = con.prepareStatement(sql);
                rs = stm.executeQuery();
                while (rs.next()) {
                    list.add(new Slider(rs.getInt(1),
                            rs.getString(2),
                            rs.getString(3),
                            rs.getInt(4),
                            rs.getInt(5),
                            rs.getInt(6),
                            rs.getDate(7),
                            rs.getDate(8),
                            rs.getString(9)));
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

    public int countSlider()
            throws SQLException, ClassNotFoundException, Exception {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            con = new DBContext().getConnection();
            if (con != null) {
                String sql = "SELECT count(*) FROM [dbo].[Sliders] where [status] = 1";
                //3. Create Statement
                stm = con.prepareStatement(sql);
                rs = stm.executeQuery();
                while (rs.next()) {
                    return rs.getInt(1);
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
        return 0;
    }

    public void updateStatus(int id, int status, int aid)
            throws SQLException, ClassNotFoundException, Exception {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;

        LocalDate curDate = LocalDate.now();
        String date = curDate.toString();
        try {
            con = new DBContext().getConnection();
            if (con != null) {
                String sql = "UPDATE [dbo].[Sliders]\n"
                        + "   SET [Status] = ?\n"
                        + "      ,[updateBy] = ?\n"
                        + "      ,[UpdateDate] = ?\n"
                        + " WHERE [id] = ?;";
                //3. Create Statement
                System.out.println(sql);
                stm = con.prepareStatement(sql);
                stm.setInt(1, status);
                stm.setInt(2, aid);
                stm.setString(3, date);
                stm.setInt(4, id);
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

    public void updateSlider(int id, String title, String image, int status, int aid, String link)
            throws SQLException, ClassNotFoundException, Exception {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;

        LocalDate curDate = LocalDate.now();
        String date = curDate.toString();
        try {
            con = new DBContext().getConnection();
            if (con != null) {
                String sql = "UPDATE [dbo].[Sliders]\n"
                        + "   SET [Status] = ?\n"
                        + "      ,[updateBy] = ?\n"
                        + "      ,[UpdateDate] = ?\n";
                if (title != null && !title.isEmpty()) {
                    sql += "      ,[sliderTitle] = ?\n";
                }
                if (image != null && !image.isEmpty()) {
                    sql += "      ,[imageUrl] = ?\n";
                }
                if (link != null && !link.isEmpty()) {
                    sql += "      ,[backlink] = ?\n";
                }
                sql += " WHERE [id] = ?;";
                System.out.println(sql);
                stm = con.prepareStatement(sql);
                stm.setInt(1, status);
                stm.setInt(2, aid);
                stm.setString(3, date);
                int in = 4;
                if (title != null && !title.isEmpty()) {
                    stm.setString(in, title);
                    ++in;
                }
                if (image != null && !image.isEmpty()) {
                    stm.setString(in, image);
                    ++in;
                }
                if (link != null && !link.isEmpty()) {
                    stm.setString(in, link);
                    ++in;
                }
                stm.setInt(in, id);
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
    public void updateArrange(int id, String arrange)
            throws SQLException, ClassNotFoundException, Exception {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;

        LocalDate curDate = LocalDate.now();
        String date = curDate.toString();
        try {
            con = new DBContext().getConnection();
            if (con != null) {
                String sql = "UPDATE [dbo].[Sliders]\n"
                        + "   SET [arrange] = ?\n"
                        + " WHERE [id] = ?;";
                //3. Create Statement
                System.out.println(sql);
                stm = con.prepareStatement(sql);
                stm.setString(1, arrange);
                stm.setInt(2, id);
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

    public void insertSlider(String title, String image, int status, int aid, String link)
            throws SQLException, ClassNotFoundException, Exception {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;

        LocalDate curDate = LocalDate.now();
        String date = curDate.toString();
        SliderDAO s = new SliderDAO();
        int arrange = s.getLastArrange() + 1;
        try {
            con = new DBContext().getConnection();
            if (con != null) {
                String sql = "INSERT INTO [dbo].[Sliders]\n"
                        + "           ([imageUrl]\n"
                        + "           ,[arrange]\n"
                        + "           ,[Status]\n"
                        + "           ,[updateBy]\n"
                        + "           ,[CreateDate]\n"
                        + "           ,[UpdateDate]\n";
                String value = "VALUES(?,?,?,?,?,?);";
                if ((title != null && !title.isEmpty()) && (link == null && link.isEmpty())) {
                    sql += "           ,[sliderTitle]\n";
                    value = "VALUES(?,?,?,?,?,?,?);";
                } else if ((title == null && title.isEmpty()) && (link != null && !link.isEmpty())) {
                    sql += "           ,[backlink]\n";
                    value = "VALUES(?,?,?,?,?,?,?);";
                } else if ((title != null && !title.isEmpty()) && (link != null && !link.isEmpty())) {
                    sql += "           ,[sliderTitle]\n"
                            + "           ,[backlink]\n";
                    value = "VALUES(?,?,?,?,?,?,?,?);";
                }

                sql = sql + ")" + value;
                stm = con.prepareStatement(sql);
                stm.setString(1, image);
                stm.setInt(2, arrange);
                stm.setInt(3, status);
                stm.setInt(4, aid);
                stm.setString(5, date);
                stm.setString(6, date);
                if ((title != null && !title.isEmpty()) && (link == null && link.isEmpty())) {
                    stm.setString(7, title);
                } else if ((title == null && title.isEmpty()) && (link != null && !link.isEmpty())) {
                    stm.setString(8, link);
                } else if ((title != null && !title.isEmpty()) && (link != null && !link.isEmpty())) {
                    stm.setString(7, title);
                    stm.setString(8, link);
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

    public Slider getSliderByArrange(int arrange)
            throws SQLException, ClassNotFoundException, Exception {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;

        try {
            con = new DBContext().getConnection();
            if (con != null) {
                String sql = "SELECT * FROM [dbo].[Sliders] where [Arrange] = ?";
                //3. Create Statement
                stm = con.prepareStatement(sql);
                stm.setInt(1, arrange);
                rs = stm.executeQuery();
                while (rs.next()) {
                    return new Slider(rs.getInt(1),
                            rs.getString(2),
                            rs.getString(3),
                            rs.getInt(4),
                            rs.getInt(5),
                            rs.getInt(6),
                            rs.getDate(7),
                            rs.getDate(8),
                            rs.getString(9));
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

    public int getLastArrange() throws Exception {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            con = new DBContext().getConnection();
            if (con != null) {
                String sql = "SELECT TOP (1) [arrange]\n"
                        + "FROM [dbo].[Sliders]\n"
                        + "ORDER BY [arrange] DESC";
                //3. Create Statement
                stm = con.prepareStatement(sql);
                rs = stm.executeQuery();
                while (rs.next()) {
                    return rs.getInt(1);
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
        return 0;
    }

    public void deleteSlider(int id) throws Exception {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;

        LocalDate curDate = LocalDate.now();
        String date = curDate.toString();
        try {
            con = new DBContext().getConnection();
            if (con != null) {
                String sql = "DELETE FROM [dbo].[Sliders]\n"
                        + "      WHERE id  = ?";

                stm = con.prepareStatement(sql);
                stm.setInt(1, id);
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

    public static void main(String[] args) {
        try {
            SliderDAO sdao = new SliderDAO();
            Slider s = sdao.getSliderByArrange(3);
            System.out.println(s);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(SliderDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception ex) {
            Logger.getLogger(SliderDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

}
