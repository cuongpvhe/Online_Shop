/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package Controller;

import dal.AdminProductDAO;
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
@WebServlet(name="UpdateSalesSize", urlPatterns={"/updateSalesSize"})
public class UpdateSalesSize extends HttpServlet {
   
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
//        if(a== null){
//            response.sendRedirect("login");
//            return;
//        }

        String pid_raw = request.getParameter("pid");
        String sizeId_raw = request.getParameter("sizeId");
        String quantity_raw = request.getParameter("quantity");

        AdminProductDAO ad = new AdminProductDAO();

        int pid, sizeId, quantity;
        try {
            pid = Integer.parseInt(pid_raw);
            sizeId = Integer.parseInt(sizeId_raw);
            quantity = Integer.parseInt(quantity_raw);
            if (quantity < 0) {
                request.setAttribute("error", "Quantity phải là chữ số tự nhiên lớn hơn 0");
                request.getRequestDispatcher("loadSalesSizeDetail?id=" + pid + "&sizeId=" + sizeId).forward(request, response);
            } else {
                ad.updateProductSize(quantity, pid, sizeId);
                request.setAttribute("mess", "Thay đổi số lượng thành công!");
                request.getRequestDispatcher("loadSalesSize?id=" + pid).forward(request, response);
            }
        } catch (Exception e) {
            pid = Integer.parseInt(pid_raw);
            sizeId = Integer.parseInt(sizeId_raw);
            request.setAttribute("error", "Quantity phải là chữ số và không được để trống");
            request.getRequestDispatcher("loadSalesSizeDetail?id=" + pid + "&sizeId=" + sizeId).forward(request, response);
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
