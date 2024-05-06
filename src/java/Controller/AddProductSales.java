/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package Controller;

import dal.AdminProductDAO;
import dal.SalesDAO;
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
@WebServlet(name="AddProductSales", urlPatterns={"/addProductSales"})
public class AddProductSales extends HttpServlet {
   
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
        String name = request.getParameter("name");
        String description = request.getParameter("description");
        String price_raw = request.getParameter("price");
        String cate_raw = request.getParameter("catgoryId");
        String brand_raw = request.getParameter("brandId");
        
        Part part = request.getPart("file");
        String realPath = request.getServletContext().getRealPath("/Images/products");
        String fileSubmit = part.getSubmittedFileName();
        String generateFileName = UUID.randomUUID().toString().replace("-", "");
        String filename = generateFileName + "-" + fileSubmit;
        part.write(realPath + "/" + filename);
        
        int categoryId, brandId;
        double price;
        
        try {
            boolean pn = sd.getProductByName(name);
            price = Double.parseDouble(price_raw);
            categoryId = Integer.parseInt(cate_raw);
            brandId = Integer.parseInt(brand_raw);
            
            String n = name.trim();
            String des = description.trim();
            
            if (n.length() == 0) {
                String error = "Mời nhập lại tên sản phẩm";
                request.setAttribute("error", error);
                request.getRequestDispatcher("loadAddSales").forward(request, response);
            } else if (des.length() > 750) {
                String error = "Description ít hơn 750 ký tự";
                request.setAttribute("error", error);
                request.getRequestDispatcher("loadAddSales").forward(request, response);
            } else if (price_raw.length() ==0) {
                String error = "Hãy nhập giá sản phẩm";
                request.setAttribute("error", error);
                request.getRequestDispatcher("loadAddSales").forward(request, response);
            } else if(pn == true){
                String error = "Sản phẩm đã tồn tại";
                request.setAttribute("error", error);
                request.getRequestDispatcher("loadAddSales").forward(request, response);
            } else {
                sd.addProduct(name, price, description, "Images/products/" + filename, categoryId, brandId, mid, 1);
                request.setAttribute("mess", "Đã thêm mới sản phẩm");
                response.sendRedirect("listProductSales?index=1");
            }
        } catch (Exception e) {
            String error = "Không thể thêm mới sản phẩm";
            request.setAttribute("error", error);
            request.getRequestDispatcher("loadAddSales").forward(request, response);
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
