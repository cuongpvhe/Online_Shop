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
import model.Size;

/**
 *
 * @author MSI GF
 */
@WebServlet(name="AddSize", urlPatterns={"/addSize"})
public class AddSize extends HttpServlet {
   
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

        String pid_raw = request.getParameter("pid");
        String sizeId_raw = request.getParameter("sizeId");
        String quantity_raw = request.getParameter("quantity");
        
        AdminProductDAO ad = new AdminProductDAO();
        int pid, sizeId, quantity;
        
        try {
            pid = Integer.parseInt(pid_raw);
            sizeId = Integer.parseInt(sizeId_raw);
            
            
            Size cS = ad.checkSize(pid, sizeId);
            
            if(!quantity_raw.matches("[0-9]+")){
                String error = "Quantity chỉ được nhập chữ số";
                request.setAttribute("error", error);
                request.getRequestDispatcher("loadProductSize?id=" +pid).forward(request, response);
            }else if(cS != null){
                String error = "Quantity size đã tồn tại";
                request.setAttribute("error", error);
                request.getRequestDispatcher("loadProductSize?id=" +pid).forward(request, response);
            }else{
                quantity = Integer.parseInt(quantity_raw);
                ad.addNewSize(pid, sizeId, quantity);
                request.setAttribute("mess", "Thêm size thành công!");
                request.getRequestDispatcher("loadProductSize?id=" +pid).forward(request, response);
            }
            
        } catch (Exception e) {
            
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
