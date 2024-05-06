/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package Controller;

import dal.ProductDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;
import model.Product;

/**
 *
 * @author asus
 */
@WebServlet(name="SortDesc", urlPatterns={"/SortDesc"})
public class SortDesc extends HttpServlet {
   
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
        
        ProductDAO d = new ProductDAO();
//        List<Product> list = d.getAllProductOderByAsc();
        List<Product> list = new ArrayList<>();

        PrintWriter out = response.getWriter();
        
        for (Product o : list) {
        	out.println("  <div class=\"col-lg-4 col-md-6 col-sm-12 pb-1\">\n" +
"                                <div class=\"card product-item border-0 mb-4\">\n" +
"                                    <a href=\"detail?pid="+o.getId()+"\" class=\"btn btn-sm text-dark p-0\">\n" +
"                                        <div class=\"card-header product-img position-relative overflow-hidden bg-transparent border p-0\">\n" +
"                                            <img class=\"img-fluid w-100\" src=\""+o.getImageUrl()+"\" alt=\"\">\n" +
"                                        </div>\n" +
"                                        <div class=\"card-body border-left border-right text-center p-0 pt-4 pb-3\">\n" +
"                                            <h6 class=\"text-truncate mb-3\">"+o.getName()+"</h6>\n" +
"                                            <div class=\"d-flex justify-content-center\">\n" +
"                                                <h6><strong>$"+o.getPrice()+"</strong></h6>\n" +
"                                            </div>\n" +
"                                        </div>\n" +
"                                        <div class=\"card-footer d-flex justify-content-between bg-light border\">\n" +
"\n" +
"                                            <a href=\"\" class=\"btn btn-sm text-dark p-0\"><i class=\"fas fa-shopping-cart text-primary mr-1\"></i>Add To Cart</a>\n" +
"                                        </div>\n" +
"                                </div>\n" +
"                            </div>");
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
