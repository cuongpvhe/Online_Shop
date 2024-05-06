/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import dto.FeedBackDTO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.List;
import model.FeedBack;
import model.FeedBackImages;

/**
 *
 * @author win
 */
public class FeedBackDAO {

    Connection connection = null;

    public List<FeedBack> getFeedBackByPid(int pid) {
        List<FeedBack> list = new ArrayList<>();

        try {

            String query = "SELECT TOP 3 FeedBack.id, FeedBack.pid, FeedBack.aid, FeedBack.title, FeedBack.star, FeedBack.[date], FeedBack.desFeedback, Account.Fullname\n"
                    + "FROM FeedBack LEFT JOIN Account ON FeedBack.aid = Account.id\n"
                    + "Where pid = ?\n"
                    + "Order by id desc";
            connection = new DBContext().getConnection();

            PreparedStatement ps = connection.prepareStatement(query);
            ps.setInt(1, pid);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                list.add(new FeedBack(rs.getInt(1), rs.getInt(2), rs.getInt(3), rs.getString(4), rs.getInt(5), rs.getString(6), rs.getString(7), rs.getString(8)));
            }

        } catch (Exception e) {
        }
        return list;
    }

    public List<FeedBack> getAllFeedBack(int pid) {
        List<FeedBack> list = new ArrayList<>();

        try {

            String query = "select FeedBack.id, FeedBack.pid, FeedBack.aid, FeedBack.title, FeedBack.star, FeedBack.[date], FeedBack.desFeedback, Account.Fullname\n"
                    + "from FeedBack left join account ON FeedBack.aid = Account.id\n"
                    + "where pid = ?";
            connection = new DBContext().getConnection();

            PreparedStatement ps = connection.prepareStatement(query);
            ps.setInt(1, pid);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                list.add(new FeedBack(rs.getInt(1), rs.getInt(2), rs.getInt(3), rs.getString(4), rs.getInt(5), rs.getString(6), rs.getString(7), rs.getString(8)));
            }

        } catch (Exception e) {
        }
        return list;
    }

    public FeedBack getFeedBackByFid(int fid) {
        String query = "select FeedBack.id, FeedBack.pid, FeedBack.aid, FeedBack.title, FeedBack.star, FeedBack.[date], FeedBack.desFeedback, Account.Fullname\n"
                + "from FeedBack left join account ON FeedBack.aid = Account.id\n"
                + "where feedback.id = ?";

        try {
            connection = new DBContext().getConnection();
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setInt(1, fid);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                return new FeedBack(rs.getInt(1), rs.getInt(2), rs.getInt(3), rs.getString(4), rs.getInt(5), rs.getString(6), rs.getString(7), rs.getString(8));
            }
        } catch (Exception e) {
        }
        return null;
    }

    public int updateFeedBack(int pid, int aid, String title, int star, String date, String desFeedback) {
        try {

            String query = "INSERT INTO FeedBack (pid, aid, title, star, [date], desFeedback)\n"
                    + "VALUES (?, ?, ?, ?, ?, ?);";
            connection = new DBContext().getConnection();

            PreparedStatement ps = connection.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);
            ps.setInt(1, pid);
            ps.setInt(2, aid);
            ps.setString(3, title);
            ps.setInt(4, star);
            ps.setString(5, date);
            ps.setString(6, desFeedback);
            ps.executeUpdate();
            ResultSet generatedKeys = ps.getGeneratedKeys();
            int feedbackId = -1;
            if (generatedKeys.next()) {
                feedbackId = generatedKeys.getInt(1);
            }

            return feedbackId;

        } catch (Exception e) {
        }
        return 0;
    }

    public int checkImageFeedBack(int fid) {
        try {

            String query = "select count(*) from FeedBack_Images\n"
                    + "where fid = ?";
            connection = new DBContext().getConnection();

            PreparedStatement ps = connection.prepareStatement(query);
            ps.setInt(1, fid);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                return rs.getInt(1);

            }
        } catch (Exception e) {
        }
        return 0;

    }

    public void updateImageFeedBack(String image, int fid) {

        if (checkImageFeedBack(fid) < 3) {
            try {

                String query = "INSERT INTO FeedBack_Images (imgFeedBack, fid) VALUES (?, ?)";
                connection = new DBContext().getConnection();

                PreparedStatement ps = connection.prepareStatement(query);
                ps.setString(1, image);
                ps.setInt(2, fid);
                ps.executeUpdate();

            } catch (Exception e) {
            }
        } else {
            return;
        }
    }

    public void editFeedBack(int star, String title, String des, int aid, int pid) {
        try {

            String query = "UPDATE FeedBack\n"
                    + "SET star = ?, title = ?, desFeedback = ?\n"
                    + "WHERE aid = ? and pid = ? ";
            connection = new DBContext().getConnection();

            PreparedStatement ps = connection.prepareStatement(query);
            ps.setInt(1, star);
            ps.setString(2, title);
            ps.setString(3, des);
            ps.setInt(4, aid);
            ps.setInt(5, pid);
            ps.executeUpdate();

        } catch (Exception e) {
        }
    }

    public void editFeedBackImage(int star, String title, String des, int aid, int pid) {
        try {

            String query = "UPDATE FeedBack\n"
                    + "SET star = ?, title = ?, desFeedback = ?\n"
                    + "WHERE aid = ? and pid = ? ";
            connection = new DBContext().getConnection();

            PreparedStatement ps = connection.prepareStatement(query);
            ps.setInt(1, star);
            ps.setString(2, title);
            ps.setString(3, des);
            ps.setInt(4, aid);
            ps.setInt(5, pid);
            ps.executeUpdate();

        } catch (Exception e) {
        }
    }

    public void deleteFeedBackByAid(int id) {
        try {
            String query = "delete from FeedBack\n"
                    + "where id = ?";
            connection = new DBContext().getConnection();
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setInt(1, id);
            ps.executeUpdate();

        } catch (Exception e) {
        }
    }

    public void deleteImageFeedBack(int fid) {
        try {
            String query = "update FeedBack\n"
                    + "set [image] = null\n"
                    + "where id = ?";
            connection = new DBContext().getConnection();
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setInt(1, fid);
            ps.executeUpdate();

        } catch (Exception e) {
        }
    }

    public boolean deleteImageFeedBackF(int id) {
        try {
            String query = "DELETE FROM FeedBack_Images \n"
                    + "WHERE id=?";
            connection = new DBContext().getConnection();
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setInt(1, id);
            int rowsDeleted = ps.executeUpdate();
            return rowsDeleted > 0;

        } catch (Exception e) {
        }
        return false;
    }

    public List<FeedBackImages> getNameFeedBack(int fid) {

        List<FeedBackImages> list = new ArrayList<>();

        try {
            String query = "select * from FeedBack_Images\n"
                    + "where fid = ?";
            connection = new DBContext().getConnection();
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setInt(1, fid);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new FeedBackImages(rs.getInt(1), rs.getString(2), rs.getInt(3)));

            }
        } catch (Exception e) {
        }
        return list;
    }

    public int getCountFeedback(int pid) {
        int count = 0;

        try {
            String query = "select count (*)\n"
                    + "from FeedBack\n"
                    + "where pid = ?";
            connection = new DBContext().getConnection();
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setInt(1, pid);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                count = rs.getInt(1);
            }

        } catch (Exception e) {
        }
        return count;
    }

    public int getCountFeedBackPage(int pid) {
        try {
            String query = "select count(*) from FeedBack\n"
                    + "where pid = ?";
            connection = new DBContext().getConnection();
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setInt(1, pid);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                int total = rs.getInt(1);
                int countPage = (int) Math.ceil((double) total / 10); // Sử dụng Math.ceil để làm tròn.
                if (total % 5 != 0) {
                    countPage++;
                }
                return countPage;
            }

        } catch (Exception e) {
        }
        return 0;
    }

    public int getCountFeedBackByAid(int aid, int pid) {
        try {
            String query = "select count(*)\n"
                    + "from FeedBack\n"
                    + "where aid = ? and pid = ?";
            connection = new DBContext().getConnection();
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setInt(1, aid);
            ps.setInt(2, pid);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {

                return rs.getInt(1);
            }

        } catch (Exception e) {
        }
        return 0;
    }

    public int checkAccountFB(int aid, int pid) {
        try {
            String query = "select count(*) from Invoice\n"
                    + "where AccountID = ? and ProductID = ?";
            connection = new DBContext().getConnection();
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setInt(1, aid);
            ps.setInt(2, pid);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {

                return rs.getInt(1);
            }

        } catch (Exception e) {
        }
        return 0;
    }

    public int checkcountFB(int aid, int pid) {
        try {
            String query = "select count(*) from FeedBack\n"
                    + "where aid = ? and pid = ?";
            connection = new DBContext().getConnection();
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setInt(1, aid);
            ps.setInt(2, pid);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {

                return rs.getInt(1);
            }

        } catch (Exception e) {
        }
        return 0;
    }

    public float rateStarFeedBack(int pid) {
        try {
            String query = "SELECT star FROM FeedBack\n"
                    + "where pid=?";
            connection = new DBContext().getConnection();
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setInt(1, pid);
            ResultSet rs = ps.executeQuery();

            float totalRating = 0;
            int feedbackCount = 0;

            while (rs.next()) {

                int rating = rs.getInt("star");
                totalRating += rating;
                feedbackCount++;
            }
            DecimalFormat df = new DecimalFormat("#.#");
            // Tính tổng số sao
            float averageRatingg = (feedbackCount > 0) ? totalRating / feedbackCount : 0;

            //doi3.222 thanh 3.2
            String avertoFloat = df.format(averageRatingg);
            float averageRating = Float.parseFloat(avertoFloat);

            return averageRating;

        } catch (Exception e) {
        }
        return 0;
    }

    public List<FeedBackDTO> getPaging(int pid, int index) {
        List<FeedBackDTO> list = new ArrayList<>();
        try {
            String query = "select f.*, a.Fullname from FeedBack as f\n"
                    + "join Account as a on f.aid = a.Id\n"
                    + "where pid = ?\n"
                    + "order by a.id\n"
                    + "OFFSET ? ROWS\n"
                    + "FETCH FIRST 10 ROW ONLY";
            connection = new DBContext().getConnection();
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setInt(1, pid);
            ps.setInt(2, (index - 1) * 10);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int feedbackId = rs.getInt(1);
                // Truy vấn để lấy tất cả hình ảnh liên quan đến phản hồi hiện tại
                String imageQuery = "select * from FeedBack_Images where fid =" + feedbackId;
                PreparedStatement imgStmt = connection.prepareStatement(imageQuery);
                ResultSet imgResult = imgStmt.executeQuery();
                List<FeedBackImages> imageList = new ArrayList<>();
                while (imgResult.next()) {
                    FeedBackImages fi = new FeedBackImages(imgResult.getInt(1), imgResult.getString(2), imgResult.getInt(3));
                    imageList.add(fi);
                }
                FeedBackDTO s = new FeedBackDTO(rs.getInt(1), rs.getInt(2), rs.getInt(3), rs.getString(4), rs.getInt(5), rs.getString(6), rs.getString(7), rs.getString(8), imageList, feedbackId);
                list.add(s);
            }
        } catch (Exception e) {
        }
        return list;
    }
    
    public List<FeedBackDTO> getFullFeedBack(int pid) {
        List<FeedBackDTO> list = new ArrayList<>();
        try {
            String query = "select top 3 f.*, a.Fullname from FeedBack as f\n"
                    + "join Account as a on f.aid = a.Id\n"
                    + "where pid = ?";
            connection = new DBContext().getConnection();
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setInt(1, pid);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int feedbackId = rs.getInt(1);
                // Truy vấn để lấy tất cả hình ảnh liên quan đến phản hồi hiện tại
                String imageQuery = "select * from FeedBack_Images where fid =" + feedbackId;
                PreparedStatement imgStmt = connection.prepareStatement(imageQuery);
                ResultSet imgResult = imgStmt.executeQuery();
                List<FeedBackImages> imageList = new ArrayList<>();
                while (imgResult.next()) {
                    FeedBackImages fi = new FeedBackImages(imgResult.getInt(1), imgResult.getString(2), imgResult.getInt(3));
                    imageList.add(fi);
                }
                FeedBackDTO s = new FeedBackDTO(rs.getInt(1), rs.getInt(2), rs.getInt(3), rs.getString(4), rs.getInt(5), rs.getString(6), rs.getString(7), rs.getString(8), imageList, feedbackId);
                list.add(s);
            }
        } catch (Exception e) {
        }
        return list;
    }

    public FeedBackDTO getFeedBack(int pid, int aid) {
        try {
            String query = "select f.*, a.Fullname from FeedBack as f\n"
                    + "join Account as a on f.aid = a.Id\n"
                    + "where pid = ? and aid = ?";
            connection = new DBContext().getConnection();
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setInt(1, pid);
            ps.setInt(2, aid);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int feedbackId = rs.getInt(1);
                // Truy vấn để lấy tất cả hình ảnh liên quan đến phản hồi hiện tại
                String imageQuery = "select * from FeedBack_Images where fid =" + feedbackId;
                PreparedStatement imgStmt = connection.prepareStatement(imageQuery);
                ResultSet imgResult = imgStmt.executeQuery();
                List<FeedBackImages> imageList = new ArrayList<>();
                while (imgResult.next()) {
                    FeedBackImages fi = new FeedBackImages(imgResult.getInt(1), imgResult.getString(2), imgResult.getInt(3));
                    imageList.add(fi);
                }
                FeedBackDTO s = new FeedBackDTO(rs.getInt(1), rs.getInt(2), rs.getInt(3), rs.getString(4), rs.getInt(5), rs.getString(6), rs.getString(7), rs.getString(8), imageList, feedbackId);
                return s;
            }
        } catch (Exception e) {
        }
        return null;
    }

    public List<FeedBackImages> getImageFeedback() {
        List<FeedBackImages> list = new ArrayList<>();

        try {

            String query = "select * from FeedBack_Images";
            connection = new DBContext().getConnection();

            PreparedStatement ps = connection.prepareStatement(query);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                list.add(new FeedBackImages(rs.getInt(1), rs.getString(2), rs.getInt(3)));
            }

        } catch (Exception e) {

        }
        return list;
    }

    public List<FeedBackImages> getImageFeedbackByFid(int fid) {
        List<FeedBackImages> list = new ArrayList<>();

        try {

            String query = "select * from FeedBack_Images\n"
                    + "where fid = ?";
            connection = new DBContext().getConnection();

            PreparedStatement ps = connection.prepareStatement(query);
            ps.setInt(1, fid);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                list.add(new FeedBackImages(rs.getInt(1), rs.getString(2), rs.getInt(3)));
            }

        } catch (Exception e) {

        }
        return list;
    }

    public FeedBack getLoadEditFeedBack(int fid) {
        String query = "select * from FeedBack\n"
                + "where id = ?";

        try {
            connection = new DBContext().getConnection();
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setInt(1, fid);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {

                return new FeedBack(rs.getInt(1), rs.getInt(2), rs.getInt(3), rs.getString(4), rs.getInt(5), rs.getString(6), rs.getString(7), rs.getString(8));

            }
        } catch (Exception e) {
        }
        return null;
    }

    public static void main(String[] args) {
        FeedBackDAO dao = new FeedBackDAO();

        System.out.println(dao.getCountFeedBackPage(3));

    }

}
