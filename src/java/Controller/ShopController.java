/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package Controller;

import dal.CategoryDAO;
import dal.ProductDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Category;
import model.Product;
import ultils.support;

/**
 *
 * @author win
 */
public class ShopController extends HttpServlet {
   
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
            //get request param
            String xpage = request.getParameter("page");
            String xnumberPerPage = request.getParameter("numberPerPage");
            
            String[] brand = request.getParameterValues("brand");
            
            String[] sizeC = request.getParameterValues("size");
            
            String search = request.getParameter("search");
            
            String sort = request.getParameter("sort");
            
            String price = request.getParameter("price");
            
            String category = request.getParameter("category");
            
            // get data from database
            ProductDAO dao = new ProductDAO();
            CategoryDAO cdao = new CategoryDAO();
            List<Product> data = dao.getProduct(brand, sizeC, search, sort, price, category);
            
            // pagination
            int size = data.size();
            int page = support.parseInt(xpage, 1);
            int numberPerPage = support.parseInt(xnumberPerPage, 6);
            
            int numberOfPage = ((size % numberPerPage == 0) ? (size / numberPerPage) : (size / numberPerPage + 1));
            int start = (page - 1) * numberPerPage;
            int end = Math.min(page * numberPerPage, size);
            
            List<Product> last = dao.pagination(data, start, end);
            
            // send data to FE
            List<Category> listC = cdao.getAllCategory();
            request.setAttribute("listC", listC);
            request.setAttribute("data", last);
            request.setAttribute("page", page);
            request.setAttribute("numberPerPage", numberPerPage);
            request.setAttribute("numberOfPage", numberOfPage);
            request.setAttribute("size", size);
            request.setAttribute("start", start);
            request.setAttribute("end", end);
            
            request.setAttribute("brand", brand);
            request.setAttribute("sizeCheckbox", sizeC);
            request.setAttribute("search", search);
            request.setAttribute("sort", sort);
            request.setAttribute("price", price);
            
//        try ( PrintWriter out = response.getWriter()) {
//            /* TODO output your page here. You may use following sample code. */
//            out.println("<!DOCTYPE html>");
//            out.println("<html>");
//            out.println("<head>");
//            out.println("<title>Servlet ProductDetails</title>");
//            out.println("</head>");
//            out.println("<body>");
//            out.println("<h1>Servlet ProductDetails at " + page + "</h1>");
//            out.println("</body>");
//            out.println("</html>");
//        }


request.getRequestDispatcher("shop.jsp").forward(request, response);
       
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
