/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import dal.ProductDAO;
import dal.ProductSaleDAO;
import dal.SliderDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.Timestamp;
import java.time.LocalDate;
import java.time.LocalTime;
import java.time.Period;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Product;
import model.ProductSale;
import model.Slider;

/**
 *
 * @author admin
 */
@WebServlet(name = "HomeServlet", urlPatterns = {"/home"})
public class HomeServlet extends HttpServlet {

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
        LocalTime now = LocalTime.now();
        LocalDate today = LocalDate.now();
        String date = today.toString();
        LocalDate tomorrow = LocalDate.now().plusDays(1);
        LocalTime timeFrame1 = LocalTime.of(14, 00);
        LocalTime timeFrame2 = LocalTime.of(22, 00);
        
        
        try {
            SliderDAO sdao = new SliderDAO();
            ProductSaleDAO psdao = new ProductSaleDAO();
            ProductDAO pdao = new ProductDAO();
            List<Slider> slist = sdao.getAllSliderActive();
            List<ProductSale> pslist = psdao.getProductSale();
            Slider slider = sdao.getSliderFirst();
            psdao.deleteSaleProductEndTime();
            int numofslider = sdao.countSlider();
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
            List<Product> newP = pdao.get4ProductNew();
            ProductSale bigS = psdao.getProductBigSale();
            Timestamp end = bigS.getEndTime();
            LocalDate endDate = end.toLocalDateTime().toLocalDate();
            Period period = Period.between(today, endDate);
            int remainingDays = period.getDays();
            request.setAttribute("remain", remainingDays);
            request.setAttribute("bigS", bigS);
            request.setAttribute("newP", newP);
            request.setAttribute("flsale", fllist);
            request.setAttribute("sale", pslist);
            request.setAttribute("listS", slist);
            request.setAttribute("firstS", slider);
            request.setAttribute("numofS", numofslider);
            request.getRequestDispatcher("home.jsp").forward(request, response);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(SliderServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception ex) {
            Logger.getLogger(SliderServlet.class.getName()).log(Level.SEVERE, null, ex);
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
