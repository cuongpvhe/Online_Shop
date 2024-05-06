/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import dal.OrderAccountDAO;
import dto.ListOrderSales;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;
import model.Account;
import model.OrderStatus;

/**
 *
 * @author win
 */
public class ManagerOrderSale extends HttpServlet {

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
            OrderAccountDAO dao = new OrderAccountDAO();
            HttpSession session = request.getSession();
            Account account = (Account) session.getAttribute("account");
            request.setAttribute("account", account);

            if (account != null && account.getRoleId() == 3) {
                int aid = account.getId();
                //PhanTrang
                int numberPage = dao.getCountOrderSale(aid);
                request.setAttribute("numberPage", numberPage);

                String index = request.getParameter("index");
                if (index == null) {
                    index = "1";
                }
                if (index != null) {
                    int indexPage = Integer.parseInt(index);
                    request.setAttribute("tag", indexPage);
                    List<ListOrderSales> list = dao.getOrderSaleByManagerID(aid, indexPage);

//                    total number ordersale
                    int totalNumberOrder = dao.getTotalOrderSale(aid);
                    request.setAttribute("totalNumberOrder", totalNumberOrder);

//                    totalsoldordersale
                    int totalSold = dao.getTotalSoldOrderSale(aid);
                    request.setAttribute("totalSold", totalSold);

                    request.setAttribute("listOrderSale", list);
                    request.getRequestDispatcher("ManagerOrder.jsp").forward(request, response);
                }

            } else {
                response.sendRedirect("login");
            }
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
