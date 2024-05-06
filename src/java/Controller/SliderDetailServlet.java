/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import dal.AccountDAO;
import dal.BrandDAO;
import dal.CategoryDAO;
import dal.SliderDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import java.util.List;
import java.util.UUID;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Account;
import model.Brands;
import model.Category;
import model.Slider;

/**
 *
 * @author admin
 */
@MultipartConfig
@WebServlet(name = "SliderDetailServlet", urlPatterns = {"/sliderdetail"})
public class SliderDetailServlet extends HttpServlet {

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
            out.println("<title>Servlet SliderDetailServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SliderDetailServlet at " + request.getContextPath() + "</h1>");
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
        String id = request.getParameter("id");
        try {
            SliderDAO sdao = new SliderDAO();
            AccountDAO adao = new AccountDAO();
            CategoryDAO cdao = new CategoryDAO();
            BrandDAO bdao = new BrandDAO();
            Slider s = sdao.getSliderById(Integer.parseInt(id));
            Account a = adao.getAccount(s.getAid());
            List<Category> listC = cdao.getAllCategory();
            List<Brands> listB = bdao.getAll();
            request.setAttribute("listC", listC);
            request.setAttribute("listB", listB);
            request.setAttribute("acc", a);
            request.setAttribute("slider", s);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(SliderDetailServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception ex) {
            Logger.getLogger(SliderDetailServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
        request.getRequestDispatcher("SliderDetail.jsp").forward(request, response);
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
        HttpSession session = request.getSession();
        Account a = (Account) session.getAttribute("account");
        String title = request.getParameter("title");
        String status = request.getParameter("status");
        String link = request.getParameter("link");
        Part part = request.getPart("slider");
        String id = request.getParameter("id");
        String filename = "";

        if (part!=null) {
            String realPath = request.getServletContext().getRealPath("/Images/Slider");
            String filesubmit = part.getSubmittedFileName();
            String generateFileName = UUID.randomUUID().toString().replace("-", "");
            filename = generateFileName + "-" + filesubmit;
            part.write(realPath + "/" + filename);
            filename = "Images/Slider/" + filename;
        }
        SliderDAO sdao = new SliderDAO();
        try {
            sdao.updateSlider(Integer.parseInt(id), title, filename, Integer.parseInt(status), a.getId(), link);
            request.setAttribute("msg", "Thay đổi thông tin thành công");
            Slider s = sdao.getSliderById(Integer.parseInt(id));
            request.setAttribute("acc", a);
            request.setAttribute("slider", s);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(SliderDetailServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception ex) {
            Logger.getLogger(SliderDetailServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
        request.getRequestDispatcher("SliderDetail.jsp").forward(request, response);
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
