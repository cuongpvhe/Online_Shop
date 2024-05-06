/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import dal.SliderDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Slider;

/**
 *
 * @author admin
 */
@WebServlet(name = "ChangeSliderArrangeServlet", urlPatterns = {"/changesliderarrange"})
public class ChangeSliderArrangeServlet extends HttpServlet {

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
        SliderDAO sdao = new SliderDAO();
        try {
            List<Slider> listS = sdao.getSliderByArrangeASC();
            request.setAttribute("listS", listS);
            
            request.getRequestDispatcher("MKT-EditArrangeSlider.jsp").forward(request, response);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ChangeSliderArrangeServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception ex) {
            Logger.getLogger(ChangeSliderArrangeServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
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
        String[] arr = request.getParameterValues("arrange");

        SliderDAO sdao = new SliderDAO();
        try {
            List<Slider> listS = sdao.getSliderByArrangeASC();
            for (int i = 0; i < listS.size(); i++) {
                Slider s = listS.get(i); 
                if(s.getArrange()!=Integer.parseInt(arr[i])){
                      sdao.updateArrange(s.getId(), arr[i]);
                }
            }
            List<Slider> listSUpdate = sdao.getSliderByArrangeASC();
            request.setAttribute("listS", listSUpdate);
            request.setAttribute("msg", "Thay dổi số thứ tự của slider thành công");
            request.getRequestDispatcher("MKT-EditArrangeSlider.jsp").forward(request, response);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ChangeSliderArrangeServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception ex) {
            Logger.getLogger(ChangeSliderArrangeServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
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
