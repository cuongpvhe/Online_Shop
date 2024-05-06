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
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.List;
import model.FeedBack;

/**
 *
 * @author win
 */
@MultipartConfig()
public class EditFeedBack extends HttpServlet {

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
        processRequest(request, response);
        FeedBackDAO dao = new FeedBackDAO();
        int aid = Integer.parseInt(request.getParameter("aidFB"));
        int pid = Integer.parseInt(request.getParameter("pidFB"));
        int fid = Integer.parseInt(request.getParameter("fidFB"));
        
        String title = request.getParameter("title");
        int star = Integer.parseInt(request.getParameter("rating"));
        String desFeedback = request.getParameter("desFeedback");
        //uploadImage
        try {
//            Part part = request.getPart("image");
            String realPath = "C://Users//win//Desktop//SWP999//online-shop//web//imgFB";
            dao.editFeedBack(star, title, desFeedback, aid, pid);
            //uploadMoreImage
            List<Part> fileParts = (List<Part>) request.getParts();
          
            for (Part part : fileParts) {
                String fileName = getSubmittedFileName(part);
                if (fileName != null && !fileName.isEmpty()) {
                    part.write(realPath + File.separator + fileName);
                    // Sau khi có feedbackId, cập nhật bảng FeedBack_Images với fid là feedbackId và đường dẫn hình ảnh.
                    dao.updateImageFeedBack(fileName, fid);
                }
            }
            response.sendRedirect(request.getContextPath() + "/details?pid=" + pid);
        } catch (IOException e) {
            dao.editFeedBack(star, title, desFeedback, aid, pid);
            response.sendRedirect(request.getContextPath() + "/details?pid=" + pid);
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
