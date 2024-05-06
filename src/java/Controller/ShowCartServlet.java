/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import dal.ProductDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import static java.nio.file.Files.size;
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Account;
import model.Cart;
import model.Item;
import model.Product;

/**
 *
 * @author admin
 */
@WebServlet(name = "ShowCartServlet", urlPatterns = {"/show"})
public class ShowCartServlet extends HttpServlet {

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
//        HttpSession session = request.getSession();
//        Account account = (Account) session.getAttribute("account");
//        if (account == null) {
//            response.sendRedirect("login.jsp");
//        } else {
//            ProductDAO pdao = new ProductDAO();
//            List<Product> plist = pdao.getAllProduct();
//            Cookie[] arrCookie = request.getCookies();
//            String txt = "";
//            if (arrCookie != null) {
//                for (Cookie c : arrCookie) {
//                    if (c.getName().equals("cart"+account.getId())) {
//                        txt += c.getValue();
//                    }
//                }
//            }
//
//            if (!txt.isEmpty()) {
//                Cart cart = new Cart(txt, plist);
//                request.setAttribute("cart", cart);
//            }
//            request.getRequestDispatcher("Cart.jsp").forward(request, response);
//        }
//
//    }
        HttpSession session = request.getSession();
        Account account = (Account) session.getAttribute("account");
        String cartName = "guest";
        if (account != null) {
            cartName = "cart" + account.getId();
        }
        Cookie[] arrCookie = request.getCookies();
        String txt = "";
        if (arrCookie != null) {
            for (Cookie c : arrCookie) {
                if (c.getName().equals(cartName)) {
                    txt += c.getValue();
                }
            }
        }
        ProductDAO pdao = new ProductDAO();

        if (!txt.isEmpty()) {
            Cart cart = new Cart(txt);
            List<Item> item = cart.getItems();
            double originTotal = 0;
            for (Item i : item) {
                Product p  = pdao.getProductByID(i.getProduct().getId());
                originTotal += p.getPrice()*i.getQuantity();
            }
            request.setAttribute("originTotal", originTotal);
            request.setAttribute("cart", cart);
        }
        request.getRequestDispatcher("Cart.jsp").forward(request, response);

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
