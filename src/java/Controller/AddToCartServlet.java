/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import dal.ProductDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Account;
import model.Cart;
import model.Product;

/**
 *
 * @author admin
 */
@WebServlet(name = "AddToCartServlet", urlPatterns = {"/addtocart"})
public class AddToCartServlet extends HttpServlet {

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
        Account account = (Account) session.getAttribute("account");
        Cookie[] arrCookie = request.getCookies();
        String txt = "";
        String cartName = "guest";
        String cartSize = "cartSize";
        if (account != null) {
            cartName = "cart" + account.getId();
            cartSize = "cartSize" + account.getId();
        }
            
        if (arrCookie != null) {
            for (Cookie c : arrCookie) {
                if (c.getName().equals(cartName)) {
                    txt += c.getValue();
                }
                if (c.getName().equals("cartSize")) {
                    c.setMaxAge(0);
                    response.addCookie(c);
                }
            }
        }
        String id = request.getParameter("id");
        String quantity = request.getParameter("quantity");
        String size = request.getParameter("size");
        String urlredirect = request.getParameter("urlredirect");
        if (txt.isEmpty()) {
            txt += id + "and" + size + "and" + quantity;
        } else {
            txt += "or" + id + "and" + size + "and" + quantity;
        }
        Cookie c = new Cookie(cartName, txt);
        c.setMaxAge(60 * 60 * 24 * 60);
        response.addCookie(c);
        Cart cart = new Cart(txt);
        int number = cart.getItems().size();
        Cookie cartS = new Cookie(cartSize, String.valueOf(number));
        cartS.setMaxAge(60 * 60 * 24 * 60);
        response.addCookie(cartS);
        response.sendRedirect(urlredirect + "&success=true");
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
