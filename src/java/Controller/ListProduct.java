/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package Controller;

import dal.SalesDAO;
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
@WebServlet(name="ListProduct", urlPatterns={"/listProductSales"})
public class ListProduct extends HttpServlet {
   
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
        SalesDAO sd = new SalesDAO();
        HttpSession session = request.getSession();
        Account a = (Account) session.getAttribute("account");
        if(a== null){
            response.sendRedirect("login");
            return;
        } else if(a != null && a.getRoleId() != 3){
            response.sendRedirect("Alert.jsp");
            
        }
        
         int mid = a.getId();
        String id = request.getParameter("id");
        String categoryId = request.getParameter("categoryId");
        String brandId = request.getParameter("brandId");
        String search = request.getParameter("search");
        String indexString = request.getParameter("index");
        
        try {
            int index = Integer.parseInt(indexString);
            int count = sd.countProducts(categoryId, brandId, String.valueOf(mid), search);
            int pageSize = 4;
            int endPage = count / pageSize;
            if(count % pageSize != 0){
                endPage++;
            }
            
            List<Product> list = sd.getProducts(categoryId, brandId, String.valueOf(mid), search, index);
            List<Category> listC = sd.getCategory();
            List<Brands> listB = sd.getAllBrandses();
            
            request.setAttribute("endPage", endPage);
            request.setAttribute("listP", list);
            request.setAttribute("tag", index);
            request.setAttribute("search", search);
            request.setAttribute("categoryId", categoryId);
            request.setAttribute("brandId", brandId);
            request.setAttribute("brands", listB);
            request.setAttribute("category", listC);
            
            request.getRequestDispatcher("productsSales.jsp").forward(request, response);
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
