/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package Controller;

import com.sun.org.apache.bcel.internal.generic.AALOAD;
import dal.SliderDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Slider;

/**
 *
 * @author admin
 */
@WebServlet(name="SliderServlet", urlPatterns={"/sliderlist"})
public class SliderServlet extends HttpServlet {
   
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
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet SliderServlet</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SliderServlet at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
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
        String id = request.getParameter("id");
        try {
            SliderDAO sdao = new SliderDAO();
            if(id!=null){
                sdao.deleteSlider(Integer.parseInt(id));
                request.setAttribute("msg", "Đã xóa khỏi danh sách");
            }
            List<Slider> slist = sdao.getAllSlider();
            request.setAttribute("listS", slist);
            request.getRequestDispatcher("list-slider.jsp").forward(request, response);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(SliderServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception ex) {
            Logger.getLogger(SliderServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
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
        String search = request.getParameter("search");
        String arrange = request.getParameter("arrange");
        String status = request.getParameter("status");
        
        SliderDAO sdao = new SliderDAO();
        try {
            List<Slider> listS = sdao.getSliderWithFilter(search, arrange, status);
            
            request.setAttribute("search", search);
            request.setAttribute("arrange", arrange);
            request.setAttribute("status", status);
            request.setAttribute("listS", listS);
            request.getRequestDispatcher("list-slider.jsp").forward(request, response);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(SliderServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception ex) {
            Logger.getLogger(SliderServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
        
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
