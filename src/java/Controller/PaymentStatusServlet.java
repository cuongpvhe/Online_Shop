/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import dal.OrderDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.text.NumberFormat;
import java.util.List;
import java.util.Locale;
import model.Account;
import model.Cart;
import model.EmailHandler;
import model.Item;

/**
 *
 * @author admin
 */
@WebServlet(name = "PaymentStatusServlet", urlPatterns = {"/paymentstatus"})
public class PaymentStatusServlet extends HttpServlet {

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
        String status = request.getParameter("vnp_ResponseCode");
        HttpSession session = request.getSession();
        String refund = (String) session.getAttribute("refund");
        if (refund == null) {

            Account a = (Account) session.getAttribute("account");
            String fullName = (String) session.getAttribute("fullname");
            String address = (String) session.getAttribute("address");
            String phone = (String) session.getAttribute("phone");
            String email = (String) session.getAttribute("email");
            String note = (String) session.getAttribute("note");
            long total = (long) session.getAttribute("amount");
            String cartName = "guest";
            OrderDAO odao = new OrderDAO();
            int oid = 0;
            String cartSize = "cartSize";
            String aid = null;
            if (a != null) {
                aid = String.valueOf(a.getId());
                cartName = "cart" + a.getId();
                cartSize = "cartSize" + a.getId();
            }
            Cookie[] arrCookie = request.getCookies();
            String txt = "";

            if (arrCookie != null) {
                for (Cookie c : arrCookie) {
                    if (c.getName().equals(cartName)) {
                        txt += c.getValue();
                        c.setMaxAge(0);
                        response.addCookie(c);
                    }
                    if (c.getName().equals(cartSize)) {
                        c.setMaxAge(0);
                        response.addCookie(c);
                    }
                }
            }

            if (!status.equals("00") && a == null) {
                Cart cart = new Cart(txt);
                Cookie c = new Cookie(cartName, txt);
                c.setMaxAge(60 * 60 * 24 * 60);
                response.addCookie(c);
                int number = cart.getItems().size();
                Cookie cartS = new Cookie(cartSize, String.valueOf(number));
                cartS.setMaxAge(60 * 60 * 24 * 60);
                response.addCookie(cartS);
            } else if (status.equals("00") && a == null) {
                Cart cart = new Cart(txt);
                odao.insertNewOrder(aid, Double.parseDouble(String.valueOf(total)), fullName, email, phone, address, note, 1);
                oid = odao.getOrderID();

                List<Item> item = cart.getItems();
                for (Item i : item) {
                    odao.insertNewOrderDetail(oid, i.getProduct().getId(), i.getSize(), i.getQuantity(), (double) i.getQuantity() * i.getPrice(), "vnpay", "Đang chờ thanh toán", 0);
                    odao.updateQuantity(i.getProduct().getId(), odao.getSiseIdbySize(i.getSize()), odao.getQuantityOfSize(i.getProduct().getId(), i.getSize()) - i.getQuantity());
                    odao.updateQuantitySaled(i.getProduct().getId(), i.getProduct().getQuantity() + i.getQuantity());
                }
            } else {
                oid = odao.getOrderID();
            }
            if (!txt.equals("")) {
                Cart cart = new Cart(txt);
                NumberFormat formatter = NumberFormat.getCurrencyInstance(new Locale("vi", "VN"));
                List<Item> item = cart.getItems();
                String subject = "FBT Shoe Shop!";
                String content = "<!DOCTYPE html>\n"
                        + "<html>\n"
                        + "<head>\n"
                        + "    <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n"
                        + "    <title>Xác thực đơn hàng</title>\n"
                        + "    <style>\n"
                        + "        .container {\n"
                        + "            margin: 50px 200px;\n"
                        + "            background-color: #F3F3F3;\n"
                        + "            padding: 25px;\n"
                        + "        }\n"
                        + "    </style>\n"
                        + "</head>\n"
                        + "<body style=\" padding: 30px;\">\n"
                        + "    <div>\n"
                        + "        <h2 style=\"font-size: 25px;\">Cảm ơn " + fullName + " đã đặt hàng tại  <a href=\"http://localhost:9999/onlineshop/home\">FBT Shoe Shop</a></h2>\n";
                if (status.equals("00")) {
                    content += "        <p>Đơn hàng của bạn đã được đặt thành công!</p>\n"
                            + "        <p><a href=\"http://localhost:9999/onlineshop/orderdetails?oid=" + oid + "\">Xem đơn của bạn tại Shop</a></p>\n";
                } else {
                    content += "        <h2 style=\"color: red\">Thanh toán thất bại  !!!</h2>\n"
                            + "        <p>Vui lòng thực hiện lại thanh toán . Để đặt hàng thành công</p>\n"
                            + "        <p><a href=\"http://localhost:9999/onlineshop/paymentvnpay\">Thanh toán lại đơn hàng</a></p>\n";
                }

                content += "        <h1 style=\"margin-top: 50px; font-size: 28px\">" + "Chi tiết đơn hàng của bạn." + "</h1>\n"
                        + "<table style=\"width:100%;border-spacing:inherit;border:1px solid #ddd\">\n"
                        + "\n"
                        + "            <tr style=\"background-color:#ce0707;font-weight:bold\">\n"
                        + "                <td style=\"padding:10px;border-right:1px solid #ddd;color:white\">\n"
                        + "                    THÔNG TIN THANH TOÁN\n"
                        + "                </td>\n"
                        + "\n"
                        + "                <td style=\"padding:10px;color:white\">\n"
                        + "                    ĐỊA CHỈ GIAO HÀNG\n"
                        + "                </td>    \n"
                        + "            </tr>\n"
                        + "            <tr style=\"color:#ce0707\">\n"
                        + "                <td style=\"padding:10px;border-right:1px solid #ddd\">\n"
                        + "                    " + fullName + "\n"
                        + "                </td>\n"
                        + "\n"
                        + "                <td style=\"padding:10px\">\n"
                        + "                 " + address + "\n"
                        + "                </td>    \n"
                        + "            </tr>\n"
                        + "            <tr style=\"color:#ce0707\">\n"
                        + "                <td style=\"padding:10px;border-right:1px solid #ddd;\">\n"
                        + "                 " + phone + "\n"
                        + "                </td>\n"
                        + "\n"
                        + "                <td style=\"padding:10px;color:white\">\n"
                        + "\n"
                        + "                </td>    \n"
                        + "            </tr>\n"
                        + "\n"
                        + "        </table>"
                        + "<table style=\"border-collapse:collapse;width:100%;color:#333; margin-top: 50px\" border=\"1\">\n"
                        + "            <tbody>\n"
                        + "            <tr style=\"background-color:#ce0707;font-weight:bold;color:white\">\n"
                        + "                <td style=\"padding:10px;width: 30%;\">\n"
                        + "                    Sản phẩm\n"
                        + "                </td>\n"
                        + "\n"
                        + "                <td style=\"padding:10px;width: 25%;\">\n"
                        + "                    Giá Tiền\n"
                        + "                </td>    \n"
                        + "                <td style=\"padding:10px;width: 20%;\">\n"
                        + "                    Số lượng \n"
                        + "                </td> \n"
                        + "                <td style=\"padding:10px;width: 25%;\">\n"
                        + "                    Thành tiền\n"
                        + "                </td> \n"
                        + "            </tr>";
                for (Item i : item) {
                    content += "<tr style=\"\">\n"
                            + "                <td style=\"padding:4px;\">\n"
                            + i.getProduct().getName() + "\n"
                            + "                </td>\n"
                            + "\n"
                            + "                <td style=\"padding:4px;align-content: center;justify-content: center\">\n"
                            + formatter.format(i.getProduct().getPrice()) + "\n"
                            + "                </td>\n"
                            + "                \n"
                            + "                <td style=\"padding:4px;align-content: center;justify-content: center\">\n"
                            + i.getQuantity() + "\n"
                            + "                </td>\n"
                            + "                \n"
                            + "                <td class=\"price\" style=\"padding:4px;align-content: center;justify-content: center\">\n"
                            + formatter.format(i.getProduct().getPrice() * i.getQuantity()) + "\n"
                            + "                </td>\n"
                            + "            </tr>";

                }

                content += "<tr>\n"
                        + "                <td colspan=\"3\" style=\"padding:4px;text-align:right\"> Tổng thanh toán </td>\n"
                        + "                <td class=\"price\">" + formatter.format(Double.parseDouble(String.valueOf(total))) + "</td>\n"
                        + "            </tr>\n"
                        + "            </tbody>\n"
                        + "\n"
                        + "        </table>"
                        + "        <p>Trân trọng,</p>\n"
                        + "        <h2>FBT Shoes Shop</h2>\n"
                        + "    </div>\n"
                        + "<script>\n"
                        + "// Định dạng giá tiền\n"
                        + "function formatPrice(price) {\n"
                        + "  const formatter = new Intl.NumberFormat('vi-VN', {\n"
                        + "    style: 'currency',\n"
                        + "    currency: 'VND'\n"
                        + "  });\n"
                        + "  return formatter.format(price);\n"
                        + "}\n"
                        + "\n"
                        + "// Lấy tất cả các phần tử có class là 'price'\n"
                        + "const priceElements = document.getElementsByClassName('price');\n"
                        + "\n"
                        + "// Định dạng lại giá tiền cho từng phần tử\n"
                        + "for (let i = 0; i < priceElements.length; i++) {\n"
                        + "  const priceElement = priceElements[i];\n"
                        + "  const price = Number(priceElement.textContent);\n"
                        + "  priceElement.textContent = formatPrice(price);\n"
                        + "}\n"
                        + "</script>"
                        + "</body>\n"
                        + "</html>";
                EmailHandler.sendEMail(email, subject, content);
            }
            if (status.equals("00")) {
                odao.updatePaymentStatus(oid, "Đã thanh toán");
                response.sendRedirect("orderdetails?oid=" + oid);
            } else {
                response.sendRedirect("shop?order=3");
            }
        }else{
             String oid = (String) session.getAttribute("oid");
             OrderDAO odao = new OrderDAO();
             if (status.equals("00")) {
                odao.updatePaymentStatus(Integer.parseInt(oid), "Đã hoàn lại tiền");
                request.setAttribute("mes", "Hoàn tiền thành công");
                request.getRequestDispatcher("refund").forward(request, response);
            } else {
                request.setAttribute("mes", "Hoàn tiền thất bại");
                request.getRequestDispatcher("refund").forward(request, response);
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
