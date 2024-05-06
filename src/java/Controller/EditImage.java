/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package Controller;

import dal.AdminProductDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import java.util.UUID;
import model.Account;

/**
 *
 * @author MSI GF
 */
@MultipartConfig
@WebServlet(name="EditImage", urlPatterns={"/editImage"})
public class EditImage extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession();
        Account a = (Account) session.getAttribute("account");
//        if(a== null){
//            response.sendRedirect("login");
//            return;
//        }

        String pid_raw = request.getParameter("pid");
        String imageId = request.getParameter("imageId");
        
        Part part = request.getPart("file");
        String realPath = request.getServletContext().getRealPath("/Images/products");
        String fileSubmit = part.getSubmittedFileName();
        String generateFileName = UUID.randomUUID().toString().replace("-", "");
        String filename = generateFileName + "-" + fileSubmit;
        part.write(realPath + "/" + filename);

        AdminProductDAO ad = new AdminProductDAO();
        int pid, id;
        try {
            id = Integer.parseInt(imageId);
            pid = Integer.parseInt(pid_raw);
            
            ad.updateProductImages(id, "Images/products/" + filename, pid);
            request.setAttribute("mess", "Thay đổi ảnh thành công!");
            request.getRequestDispatcher("loadProductImages?id=" +pid).forward(request, response);
        } catch (Exception e) {
        }
    } 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
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
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        processRequest(request, response);
    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
