/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import dal.FeedBackDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import java.io.File;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.util.Date;
import java.util.List;

/**
 *
 * @author win
 */
@MultipartConfig()

public class FeedBack extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        FeedBackDAO daoFB = new FeedBackDAO();
        int aid = Integer.parseInt(request.getParameter("aid"));
        int pid = Integer.parseInt(request.getParameter("pid"));

        int checkExFb = daoFB.getCountFeedBackByAid(aid, pid);

        if (checkExFb > 1) {
            response.sendRedirect(request.getHeader("Referer"));

        } else {
            Date currentDate = new Date();
            // Định dạng ngày thành chuỗi
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            String currentDateTime = sdf.format(currentDate);

            HttpSession session = request.getSession();
            session.getAttribute("account");

            try {
                // Lấy dữ liệu từ form
//                int pid = Integer.parseInt(request.getParameter("pid"));
                String title = request.getParameter("title");
                int star = Integer.parseInt(request.getParameter("rating"));
                String desFeedback = request.getParameter("desFeedback");
//                //uploadImage
//                Part part = request.getPart("image"); //Lay file upload theo field.
//                
                String realPath = "C://Users//win//Desktop//SWP999//online-shop//web//imgFB";
//update 1 image
//                String filename = Paths.get(part.getSubmittedFileName()).getFileName().toString();
//
//                if (!Files.exists(Paths.get(realPath))) {
//                    Files.createDirectory(Paths.get(realPath));
//                }
//                part.write(realPath + "/" + filename);

                int feedbackId = daoFB.updateFeedBack(pid, aid, title, star, currentDateTime, desFeedback);

                //uploadMoreImage
                List<Part> fileParts = (List<Part>) request.getParts();

                for (Part part : fileParts) {
                    String fileName = getSubmittedFileName(part);
                    if (fileName != null && !fileName.isEmpty()) {
                        part.write(realPath + File.separator + fileName);
                        // Sau khi có feedbackId, cập nhật bảng FeedBack_Images với fid là feedbackId và đường dẫn hình ảnh.
                        daoFB.updateImageFeedBack(fileName, feedbackId);
                    }
                }

//                response.getWriter().println("success");

                response.sendRedirect(request.getHeader("Referer"));
            } catch (NumberFormatException e) {
//            Su dung session de truyen attribute do sendredirect khong tra ve du lieu
//                request.getSession().setAttribute("error", "Ban can phai dang nhap de thuc hien chuc nang nay.");
                response.sendRedirect(request.getHeader("referer")); // Quay trở lại trang trước đó
                return;

            } catch (IOException e) {
//                int pid = Integer.parseInt(request.getParameter("pid"));
                String title = request.getParameter("title");
                int star = Integer.parseInt(request.getParameter("rating"));
                String desFeedback = request.getParameter("desFeedback");
                daoFB.updateFeedBack(pid, aid, title, star, currentDateTime, desFeedback);
                response.sendRedirect(request.getHeader("Referer"));
            }

        }

    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

    private String getSubmittedFileName(Part part) {
        for (String cd : part.getHeader("content-disposition").split(";")) {
            if (cd.trim().startsWith("filename")) {
                String fileName = cd.substring(cd.indexOf('=') + 1).trim().replace("\"", "");
                return fileName;
            }
        }
        return null;
    }
}
