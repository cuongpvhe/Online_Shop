/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import dal.FeedBackDAO;
import model.FeedBack;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import model.FeedBackImages;

/**
 *
 * @author win
 */
public class loadEditFeedBack extends HttpServlet {

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
        int fid = Integer.parseInt(request.getParameter("fid"));

        FeedBackDAO dao = new FeedBackDAO();

        FeedBack fb = dao.getFeedBackByFid(fid);

        List<FeedBackImages> images = dao.getImageFeedbackByFid(fid);

        // Chuyển dữ liệu thành một đối tượng JSON
        JsonObject jsonData = new JsonObject();
        Gson gson = new Gson();
        jsonData.add("feedback", gson.toJsonTree(fb));
        jsonData.add("images", gson.toJsonTree(images));

        // Gửi JSON về phía máy khách
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(jsonData.toString());
//
//        PrintWriter out = response.getWriter();
//        out.println("<h1>Servlet loadEditFeedBack at " + fid + "</h1>");
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

}
