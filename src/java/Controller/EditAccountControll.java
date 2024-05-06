/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package Controller;

import dal.AdminDAO;
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
@WebServlet(name="EditAccountControll", urlPatterns={"/edit"})
public class EditAccountControll extends HttpServlet {
   
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
        HttpSession session = request.getSession();
         Account a = (Account) session.getAttribute("account");
//        if(a== null){
//            response.sendRedirect("login");
//            return;
//        }
        request.setCharacterEncoding("UTF-8");
        String id_raw = request.getParameter("id");
        String email = request.getParameter("email");
        String fullName = request.getParameter("name");
        String phoneNumber = request.getParameter("phoneNumber");
        String address = request.getParameter("address");
        String status_raw = request.getParameter("status");
        String roleId_raw = request.getParameter("roleId");
        
        AdminDAO ad = new AdminDAO();
        int id, status, roleId;
        try {
            id = Integer.parseInt(id_raw);
            status = Integer.parseInt(status_raw);
            roleId = Integer.parseInt(roleId_raw);
            String fn = fullName.trim();
            if (fn.length() == 0) {
                String error = "Mời nhập lại Full Name";
                request.setAttribute("error", error);
                request.getRequestDispatcher("loadAccount").forward(request, response);
            } else{
            ad.updateAccount(fullName, status, roleId, id);
            request.setAttribute("mess", "Tài khoản được cập nhật!");
            response.sendRedirect("listAccountControll?index=1");
            }
            
        } catch (Exception e) {
            String error = "Không thể cập nhật tài khoản mới";
            request.setAttribute("error", error);
            request.getRequestDispatcher("loadAccount").forward(request, response);
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
