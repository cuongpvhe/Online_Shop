/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import dal.AdminInvoiceDAO;
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
import model.Order;

/**
 *
 * @author MSI GF
 */
@WebServlet(name = "Invoice", urlPatterns = {"/invoice"})
public class Invoice extends HttpServlet {

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
        HttpSession session = request.getSession();
        Account a = (Account) session.getAttribute("account");
        if(a== null){
            response.sendRedirect("login");
            return;
        } else if(a != null && a.getRoleId() != 1){
            response.sendRedirect("Alert.jsp");
            
        }

        AdminInvoiceDAO ad = new AdminInvoiceDAO();

        String cDate1 = request.getParameter("cDate1");
        String cDate2 = request.getParameter("cDate2");
        String search = request.getParameter("search");
        String indexString = request.getParameter("index");

        try {
            int index = Integer.parseInt(indexString);
            int count = ad.countOrder(search, cDate1, cDate2);
            int pageSize = 6;
            int endPage = count / pageSize;
            if (count % pageSize != 0) {
                endPage++;
            }
            
            List<Order> list = ad.getListOrders(search, cDate1, cDate2, index);
            request.setAttribute("endPage", endPage);
            request.setAttribute("tag", index);
            request.setAttribute("listO", list);
            request.setAttribute("search", search);
            request.setAttribute("cDate1", cDate1);
            request.setAttribute("cDate2", cDate2);
            
            request.getRequestDispatcher("invoice.jsp").forward(request, response);
        } catch (Exception e) {
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
