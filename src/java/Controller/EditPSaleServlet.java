/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package Controller;

import dal.ProductSaleDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Account;
import model.ProductSale;

/**
 *
 * @author admin
 */
@WebServlet(name="EditPSaleServlet", urlPatterns={"/editpsale"})
public class EditPSaleServlet extends HttpServlet {
   
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
        String id = request.getParameter("id");
        ProductSaleDAO psdao = new ProductSaleDAO();
        
        try {
            ProductSale psale = psdao.getProductSaleById(Integer.parseInt(id));
            request.setAttribute("psale", psale);
            request.getRequestDispatcher("MKT-EditPSale.jsp").forward(request, response);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(EditPSaleServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception ex) {
            Logger.getLogger(EditPSaleServlet.class.getName()).log(Level.SEVERE, null, ex);
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
        String pid = request.getParameter("id");
        String salePrice = request.getParameter("salePrice");
        String discount = request.getParameter("discount");
        String start = request.getParameter("starttime");
        String end = request.getParameter("endtime");
        String isflashsale = request.getParameter("isflashsale");
        String timeframe = request.getParameter("timeframe");
        String quantity = request.getParameter("quantity");
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm");
        ProductSaleDAO psdao = new ProductSaleDAO();
        Timestamp endTime = null;
        HttpSession session = request.getSession();
        Account a = (Account) session.getAttribute("account");
        if (!end.isEmpty()) {
            try {
                Date date = format.parse(end);
                endTime = new Timestamp(date.getTime());
            } catch (ParseException ex) {
                Logger.getLogger(MKTAddSaleServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        try {
            Date date = format.parse(start);
            Timestamp startTime = new Timestamp(date.getTime());
            psdao.updateProductSale(Integer.parseInt(pid), startTime, endTime, Double.parseDouble(salePrice), Double.parseDouble(discount),
                    Integer.parseInt(isflashsale), quantity, timeframe, a.getId());
            ProductSale psale = psdao.getProductSaleById(Integer.parseInt(pid));
            request.setAttribute("psale", psale);
            request.setAttribute("msg", "Thay đổi thông tin thành công !!");
        } catch (Exception ex) {
            Logger.getLogger(MKTAddSaleServlet.class.getName()).log(Level.SEVERE, null, ex);
        }

        request.getRequestDispatcher("MKT-EditPSale.jsp").forward(request, response);
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
