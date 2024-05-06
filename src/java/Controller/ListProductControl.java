/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package Controller;

import dal.AdminProductDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;
import model.Account;
import model.Brands;
import model.Category;
import model.Manager;
import model.Product;

/**
 *
 * @author MSI GF
 */
@WebServlet(name="ListProductControl", urlPatterns={"/listProduct"})
public class ListProductControl extends HttpServlet {
   
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
        request.setCharacterEncoding("UTF-8");

        HttpSession session = request.getSession();
        Account a = (Account) session.getAttribute("account");
//        if(a== null){
//            response.sendRedirect("login");
//            return;
//        }

        AdminProductDAO ad = new AdminProductDAO();
        
        String id = request.getParameter("id");
        String categoryId = request.getParameter("categoryId");
        String brandId = request.getParameter("brandId");
        String managerId =request.getParameter("managerId");
        String search = request.getParameter("search");
        String indexString = request.getParameter("index");
        try {
            int index = Integer.parseInt(indexString);
            int count = ad.countProducts(categoryId, brandId, managerId, search);
            int pageSize = 4;
            int endPage = count / pageSize;
            if(count % pageSize != 0){
                endPage++;
            }
            
            List<Product> list = ad.getProducts(categoryId, brandId, managerId, search, index);
            List<Manager> listM = ad.getManger();
            List<Category> listC = ad.getCategory();
            List<Brands> listB = ad.getAllBrandses();
           
            request.setAttribute("endPage", endPage);
            request.setAttribute("listP", list);
            request.setAttribute("search", search);
            request.setAttribute("categoryId", categoryId);
            request.setAttribute("brandId", brandId);
            request.setAttribute("managerId", managerId);
            request.setAttribute("brands", listB);
            request.setAttribute("category", listC);
            request.setAttribute("manager", listM);
            
            
            request.getRequestDispatcher("products.jsp").forward(request, response);
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
