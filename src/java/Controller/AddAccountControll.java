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
import util.encodePassword;

/**
 *
 * @author MSI GF
 */
@WebServlet(name = "AddAccountControll", urlPatterns = {"/addAccountControll"})
public class AddAccountControll extends HttpServlet {

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
        request.setCharacterEncoding("UTF-8");

        HttpSession session = request.getSession();
        Account a = (Account) session.getAttribute("account");
        if(a== null){
            response.sendRedirect("login");
            return;
        } else if(a != null && a.getRoleId() != 1){
            response.sendRedirect("Alert.jsp");
            
        }

        String email = request.getParameter("email");
        String fullname = request.getParameter("name");
        String password = request.getParameter("password");
        String gender_raw = request.getParameter("gender");
        String phoneNumber = request.getParameter("phoneNumber");
        String address = request.getParameter("address");
        String roleId_raw = request.getParameter("roleId");

        AdminDAO ad = new AdminDAO();
        int gender, roleId;

        try {
            Account ab = ad.getAccountByEmail(email);
            gender = Integer.parseInt(gender_raw);
            roleId = Integer.parseInt(roleId_raw);
            String fn = fullname.trim();
            
            //Check Validate
            if (fn.length() == 0) {
                String error = "Mời nhập lại Full Name";
                request.setAttribute("error", error);
                request.getRequestDispatcher("add-account.jsp").forward(request, response);
            } else if (!email.matches("[a-zA-Z0-9._-]+[@]([a-z]+[.]){1,}[a-z]+")) {
                String error = "Mời nhập lại Email";
                request.setAttribute("error", error);
                request.getRequestDispatcher("add-account.jsp").forward(request, response);
            } else if(password.length() <6){
                String error = "Mời nhập lại Password";
                request.setAttribute("error", error);
                request.getRequestDispatcher("add-account.jsp").forward(request, response);
            } else if(!phoneNumber.matches("[0-9]+") || !phoneNumber.matches("[0-9]{10}")){
                String error = "Mời nhập lại Phone Number";
                request.setAttribute("error", error);
                request.getRequestDispatcher("add-account.jsp").forward(request, response);
            }
            //check xem account da ton tai chua
            else if (ab != null) { //neu da ton tai
                String error = "email này đã được dùng";
                request.setAttribute("error", error);
                request.getRequestDispatcher("add-account.jsp").forward(request, response);
                
            } else { //neu chua co email nay
                String pass = encodePassword.getMd5(password);
                ad.insertAccount(email, pass, fullname, gender, phoneNumber, address, roleId);
                request.setAttribute("mess", "Tài khoản mới đã được tạo!");
                response.sendRedirect("listAccountControll?index=1");
            }
        } catch (Exception e) {
            String error = "Không thể tạo dài khoản mới";
            request.setAttribute("error", error);
            request.getRequestDispatcher("add-account.jsp").forward(request, response);
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
