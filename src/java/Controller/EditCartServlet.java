/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import dal.OrderDAO;
import dal.ProductDAO;
import dal.SizeDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;
import model.Account;
import model.Cart;
import model.Item;
import model.Product;

/**
 *
 * @author admin
 */
@WebServlet(name = "EditCartServlet", urlPatterns = {"/editcart"})
public class EditCartServlet extends HttpServlet {

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
        ProductDAO pdao = new ProductDAO();
        String cartName = "guest";
        String cartSize = "cartSize";
        if (account != null) {
            cartName = "cart" + account.getId();
            cartSize = "cartSize" + account.getId();
        }
        OrderDAO odao = new OrderDAO();
        Cookie[] arrCookie = request.getCookies();
        String txt = "";

        if (arrCookie != null) {
            for (Cookie c : arrCookie) {
                if (c.getName().equals(cartName)) {
                    txt += c.getValue();
                    c.setMaxAge(0);
                    response.addCookie(c);
                }
                if(c.getName().equals(cartSize)){
                    c.setMaxAge(0);
                    response.addCookie(c);
                }
            }
        }

        String num = request.getParameter("num");
        String id = request.getParameter("id");
        String sz = request.getParameter("size");
        if (!txt.equals("")) {

            Cart cart = new Cart(txt);
            int pnum = Integer.parseInt(num);
            int pid = Integer.parseInt(id);
            int size = Integer.parseInt(sz);
            Product p = pdao.getProductByID(pid);
            int maxQuantity = odao.getQuantityOfSize(pid, size);
            if ((pnum == -1 && (cart.getQuantityByID(pid, size) <= 1)) || pnum == 0) {
                cart.removeItem(pid, size);
            } else {
                if (pnum == 1 && cart.getQuantityByID(pid, size) >= maxQuantity) {
                    pnum = 0;
                    request.setAttribute("mes", "Số lượng tối đa là " + maxQuantity);
                }
                Item m = new Item(p, p.getPrice(), size, pnum);
                cart.addItem(m);
            }

            List<Item> items = cart.getItems();
            txt = "";
            if (items.size() > 0) {
                txt = items.get(0).getProduct().getId() + "and" + items.get(0).getSize() + "and" + items.get(0).getQuantity();
                for (int i = 1; i < items.size(); i++) {
                    txt += "or" + items.get(i).getProduct().getId() + "and" + items.get(i).getSize() + "and" + items.get(i).getQuantity();
                }
            }
            Cookie c = new Cookie(cartName, txt);
            c.setMaxAge(60 * 60 * 24 * 7);
            response.addCookie(c);
            request.setAttribute("cart", cart);
            double originTotal = 0;
            for (Item i : items) {
                Product product  = pdao.getProductByID(i.getProduct().getId());
                originTotal += product.getPrice()*i.getQuantity();
            }
            request.setAttribute("originTotal", originTotal);
            int number = cart.getItems().size();
            Cookie cartS = new Cookie(cartSize, String.valueOf(number));
            cartS.setMaxAge(60 * 60 * 24 * 60);
            response.addCookie(cartS);
        } else {
            request.setAttribute("cart", null);
            Cookie cartS = new Cookie(cartSize, "0");
            cartS.setMaxAge(0);
            response.addCookie(cartS);
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
