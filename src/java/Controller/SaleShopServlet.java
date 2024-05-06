/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import dal.CategoryDAO;
import dal.ProductDAO;
import dal.ProductSaleDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.time.LocalDate;
import java.time.LocalTime;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Category;
import model.Product;
import model.ProductSale;
import ultils.support;

/**
 *
 * @author admin
 */
@WebServlet(name = "SaleShopServlet", urlPatterns = {"/saleshop"})
public class SaleShopServlet extends HttpServlet {

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
        ProductSaleDAO psdao = new ProductSaleDAO();
        CategoryDAO cdao = new CategoryDAO();
        List<ProductSale> data;
        LocalTime now = LocalTime.now();
        LocalDate today = LocalDate.now();
        String date = today.toString();
        LocalDate tomorrow = LocalDate.now().plusDays(1);
        LocalTime timeFrame1 = LocalTime.of(14, 00);
        LocalTime timeFrame2 = LocalTime.of(22, 00);
        psdao.deleteSaleProductEndTime();
        try {
            data = psdao.getProduct(brand, sizeC, search, sort, price, category);
            int size = data.size();
            int page = support.parseInt(xpage, 1);
            int numberPerPage = support.parseInt(xnumberPerPage, 6);

            int numberOfPage = ((size % numberPerPage == 0) ? (size / numberPerPage) : (size / numberPerPage + 1));
            int start = (page - 1) * numberPerPage;
            int end = Math.min(page * numberPerPage, size);

            List<ProductSale> last = psdao.pagination(data, start, end);
            List<Category> listC = cdao.getAllCategory();
            List<ProductSale> fllist = new ArrayList<>();
            if (now.isBefore(timeFrame1)) {
                fllist = psdao.getProductIsFlashSale(date, 1);
            }
            if (now.isBefore(timeFrame2) && now.isAfter(timeFrame1)) {
                fllist = psdao.getProductIsFlashSale(date, 2);
            }
            if (now.isAfter(timeFrame2)) {
                date = tomorrow.toString();
                fllist = psdao.getProductIsFlashSale(date, 1);
            }
            request.setAttribute("flsale", fllist);
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
            request.getRequestDispatcher("saleProductShop.jsp").forward(request, response);
        } catch (Exception ex) {
            Logger.getLogger(SaleShopServlet.class.getName()).log(Level.SEVERE, null, ex);
        }

        // pagination
        // send data to FE
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
