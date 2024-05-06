/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import dal.FeedBackDAO;
import dal.ProductDAO;
import dto.FeedBackDTO;
import jakarta.servlet.ServletContext;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import java.io.File;
import java.util.List;
import model.Account;
import model.FeedBackImages;
import model.Product;

/**
 *
 * @author win
 */
@MultipartConfig()
public class EditFeedBackServlet extends HttpServlet {

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
            out.println("<title>Servlet EditFeedBackServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet EditFeedBackServlet at " + request.getContextPath() + "</h1>");
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

        HttpSession session = request.getSession();
        Account account = (Account) session.getAttribute("account");

        if (account != null) {

            ProductDAO daoP = new ProductDAO();
            FeedBackDAO fb = new FeedBackDAO();

            int pid = Integer.parseInt(request.getParameter("pid"));
            int aid = Integer.parseInt(request.getParameter("aid"));
            int oid = Integer.parseInt(request.getParameter("oid"));
            int fid = Integer.parseInt(request.getParameter("fid"));

            Product p = daoP.getProductByID(pid);
            FeedBackDTO listFb = fb.getFeedBack(pid, aid);

            request.setAttribute("p", p);
            request.setAttribute("listFb", listFb);
            request.setAttribute("aid", aid);
            request.setAttribute("pid", pid);
            request.setAttribute("oid", oid);
            request.setAttribute("fid", fid);
            request.setAttribute("lengthImage", fb.checkImageFeedBack(fid));

            request.getRequestDispatcher("editfeedback.jsp").forward(request, response);
        } else {
            response.sendRedirect("login");
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

        PrintWriter out = response.getWriter();

        FeedBackDAO daoFb = new FeedBackDAO();
        int pid = Integer.parseInt(request.getParameter("pid"));
        int aid = Integer.parseInt(request.getParameter("aid"));
        int oid = Integer.parseInt(request.getParameter("oid"));
        int star = Integer.parseInt(request.getParameter("rating"));
        int fid = Integer.parseInt(request.getParameter("fid"));
        String title = request.getParameter("title");
        String des = request.getParameter("des");
        try {
//            String realPath = "C://Users//win//Desktop//SWP999//online-shop//web//imgFB";
            ServletContext context = getServletContext();
            // Lấy đường dẫn tương đối đến thư mục "imgFB"
            String imgFBFolderPath = context.getRealPath("/imgFB");
            daoFb.editFeedBack(star, title, des, aid, pid);
            //uploadMoreImage
            List<Part> fileParts = (List<Part>) request.getParts();
            for (Part part : fileParts) {
                String fileName = getSubmittedFileName(part);
                if (fileName != null && !fileName.isEmpty()) {
                    part.write(imgFBFolderPath + File.separator + fileName);
                    // Sau khi có feedbackId, cập nhật bảng FeedBack_Images với fid là feedbackId và đường dẫn hình ảnh.
                    daoFb.updateImageFeedBack(fileName, fid);
                }
            }
            response.sendRedirect("viewfeedback?aid=" + aid + "&pid=" + pid + "&oid=" + oid);

        } catch (Exception e) {
            daoFb.editFeedBack(star, title, des, aid, pid);
            response.sendRedirect("viewfeedback?aid=" + aid + "&pid=" + pid + "&oid=" + oid);
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

    private String getSubmittedFileName(Part part) {
        for (String cd : part.getHeader("content-disposition").split(";")) {
            if (cd.trim().startsWith("filename")) {
                String fileName = cd.substring(cd.indexOf('=') + 1).trim().replace("\"", "");
                return fileName;
            }
        }
        return null;
    }

}
