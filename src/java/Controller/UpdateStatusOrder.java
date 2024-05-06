/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import dal.OrderAccountDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.text.DecimalFormat;

/**
 *
 * @author win
 */
public class UpdateStatusOrder extends HttpServlet {

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
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet UpdateStatusOrder</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet UpdateStatusOrder at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
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
        
        PrintWriter out = response.getWriter();
        
        int oid = Integer.parseInt(request.getParameter("oid"));
        int idOrder = Integer.parseInt(request.getParameter("idOrder"));
        int pid = Integer.parseInt(request.getParameter("pid"));
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        int sizeId = Integer.parseInt(request.getParameter("sizeId"));
        String moneyNoCommit = request.getParameter("money");
        String payment = request.getParameter("payment");
        
        // Chuyển đổi chuỗi thành số thực
        double doubleNumber = Double.parseDouble(moneyNoCommit);

        // Làm tròn nếu bạn muốn
        long roundedNumber = Math.round(doubleNumber);

        // Chuyển đổi thành số nguyên
        int money = (int) roundedNumber;
        
        
        int selectedOption = Integer.parseInt(request.getParameter("selectedOption"));
        
        
        
        OrderAccountDAO dao = new OrderAccountDAO();
        dao.updateStatusOrder(selectedOption, oid, pid, quantity, sizeId, money, idOrder, payment);
        response.sendRedirect("listordersale");
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

    public static void main(String[] args) {
         // Tạo một đối tượng DecimalFormat
         
      
        
    }
}

