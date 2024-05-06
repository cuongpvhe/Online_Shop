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
import java.io.File;
import java.util.List;
import model.Account;


/**
 *
 * @author MSI GF
 */
@MultipartConfig
@WebServlet(name = "EditProduct", urlPatterns = {"/editProduct"})
public class EditProduct extends HttpServlet {

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
        request.setCharacterEncoding("UTF-8");
        HttpSession session = request.getSession();
        Account a = (Account) session.getAttribute("account");
//        if(a== null){
//            response.sendRedirect("login");
//            return;
//        }

        String id_raw = request.getParameter("id");
        String name = request.getParameter("name");
        String description = request.getParameter("description");
        String price_raw = request.getParameter("price");
        String cate_raw = request.getParameter("catgoryId");
        String brand_raw = request.getParameter("brandId");
        String manager_raw = request.getParameter("managerId");
        String status_raw = request.getParameter("status");
        String filename = "";
        
        Part part = request.getPart("file");
        if(part!=null){
            String realPath = request.getServletContext().getRealPath("/Images/products");
        String fileSubmit = part.getSubmittedFileName();
        String generateFileName = UUID.randomUUID().toString().replace("-", "");
        filename = generateFileName + "-" + fileSubmit;
        part.write(realPath + "/" + filename);
        filename = "Images/products/" + filename;
        }
        
        AdminProductDAO ad = new AdminProductDAO();
        int id, categoryId, brandId, managerId, status;
        double price;

        try {

            id = Integer.parseInt(id_raw);
            price = Double.parseDouble(price_raw);
            categoryId = Integer.parseInt(cate_raw);
            brandId = Integer.parseInt(brand_raw);
            managerId = Integer.parseInt(manager_raw);
            status = Integer.parseInt(status_raw);
            String n = name.trim();
            String des = description.trim();
            if (n.length() == 0) {
                String error = "Mời nhập lại tên sản phẩm";
                request.setAttribute("error", error);
                request.getRequestDispatcher("loadProduct").forward(request, response);
            } else if (des.length() > 750) {
                String error = "Description ít hơn 750 ký tự";
                request.setAttribute("error", error);
                request.getRequestDispatcher("loadProduct").forward(request, response);
            } else if (price_raw.length() == 0) {
                String error = "Hãy nhập giá sản phẩm";
                request.setAttribute("error", error);
                request.getRequestDispatcher("loadProduct").forward(request, response);
            } else {
                ad.updateProduct(name, price, description, filename, categoryId, brandId, managerId,status, id);
                request.setAttribute("mess", "Sản phẩm đã được cập nhật");
                response.sendRedirect("listProduct?index=1");
            }

        } catch (Exception e) {
            String error = "Không thể cập nhật sản phẩm";
            request.setAttribute("error", error);
            request.getRequestDispatcher("loadProduct").forward(request, response);
        }

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
