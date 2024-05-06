/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import dal.BrandDAO;
import dal.CategoryDAO;
import dal.ProductSaleDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Brands;
import model.Category;
import model.Product;
import model.ProductSale;

/**
 *
 * @author admin
 */
@WebServlet(name = "MKTSaleListServlet", urlPatterns = {"/mktsalelist"})
public class MKTSaleListServlet extends HttpServlet {

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
        String search = request.getParameter("search");
        String cate = request.getParameter("cate");
        String brand = request.getParameter("brand");
        String isflsale = request.getParameter("isflsale");
        String createdate = request.getParameter("createdate");
        String id = request.getParameter("id");
        CategoryDAO cdao = new CategoryDAO();
        BrandDAO bdao = new BrandDAO();
        List<Category> listC = cdao.getAllCategory();
        List<Brands> listB = bdao.getAll();

        request.setAttribute("listC", listC);
        request.setAttribute("listB", listB);

        request.setAttribute("search", search);
        request.setAttribute("cate", cate);
        request.setAttribute("brand", brand);
        request.setAttribute("isflsale", isflsale);
        request.setAttribute("createdate", createdate);
        ProductSaleDAO psdao = new ProductSaleDAO();
        try {
            if (id != null) {
                psdao.updateIsSale(Integer.parseInt(id), 0);
                psdao.deleteSaleProductById(id);
                request.setAttribute("msg", "Đã xóa khỏi danh sách");
            }
            List<ProductSale> list = psdao.getPSaleByFilter(search, cate, brand, isflsale,createdate);
            request.setAttribute("ListPS", list);
        } catch (Exception ex) {
            Logger.getLogger(MKTSaleListServlet.class.getName()).log(Level.SEVERE, null, ex);
        }

        request.getRequestDispatcher("MKT-PSaleList.jsp").forward(request, response);
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
