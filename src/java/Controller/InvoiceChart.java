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
import model.Account;

/**
 *
 * @author MSI GF
 */
@WebServlet(name="InvoiceChart", urlPatterns={"/invoiceChart"})
public class InvoiceChart extends HttpServlet {
   
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
        HttpSession session = request.getSession();
        Account a = (Account) session.getAttribute("account");
        if(a== null){
            response.sendRedirect("login");
            return;
        } else if(a != null && a.getRoleId() != 1){
            response.sendRedirect("Alert.jsp");
            
        }
        AdminInvoiceDAO ai = new AdminInvoiceDAO();
        double totalMoneyMonth1 = ai.totalMoneyMonth(1);
        double totalMoneyMonth2 = ai.totalMoneyMonth(2);
        double totalMoneyMonth3 = ai.totalMoneyMonth(3);
        double totalMoneyMonth4 = ai.totalMoneyMonth(4);
        double totalMoneyMonth5 = ai.totalMoneyMonth(5);
        double totalMoneyMonth6 = ai.totalMoneyMonth(6);
        double totalMoneyMonth7 = ai.totalMoneyMonth(7);
        double totalMoneyMonth8 = ai.totalMoneyMonth(8);
        double totalMoneyMonth9 = ai.totalMoneyMonth(9);
        double totalMoneyMonth10 = ai.totalMoneyMonth(10);
        double totalMoneyMonth11 = ai.totalMoneyMonth(11);
        double totalMoneyMonth12 = ai.totalMoneyMonth(12);
        
        request.setAttribute("totalMoneyMonth1", totalMoneyMonth1);
        request.setAttribute("totalMoneyMonth2", totalMoneyMonth2);
        request.setAttribute("totalMoneyMonth3", totalMoneyMonth3);
        request.setAttribute("totalMoneyMonth4", totalMoneyMonth4);
        request.setAttribute("totalMoneyMonth5", totalMoneyMonth5);
        request.setAttribute("totalMoneyMonth6", totalMoneyMonth6);
        request.setAttribute("totalMoneyMonth7", totalMoneyMonth7);
        request.setAttribute("totalMoneyMonth8", totalMoneyMonth8);
        request.setAttribute("totalMoneyMonth9", totalMoneyMonth9);
        request.setAttribute("totalMoneyMonth10", totalMoneyMonth10);
        request.setAttribute("totalMoneyMonth11", totalMoneyMonth11);
        request.setAttribute("totalMoneyMonth12", totalMoneyMonth12);
        
        double totalMoneyYear2023 = ai.totalMoneyYear(2023);
        double totalMoneyYear2022 = ai.totalMoneyYear(2022);
        double totalMoneyYear2021 = ai.totalMoneyYear(2021);
        
        request.setAttribute("totalMoneyYear2023", totalMoneyYear2023);
        request.setAttribute("totalMoneyYear2022", totalMoneyYear2022);
        request.setAttribute("totalMoneyYear2021", totalMoneyYear2021);
        
        request.getRequestDispatcher("invoiceChart.jsp").forward(request, response);
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
