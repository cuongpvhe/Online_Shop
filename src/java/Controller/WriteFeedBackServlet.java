/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import dal.FeedBackDAO;
import dal.ProductDAO;
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
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import model.Product;

/**
 *
 * @author win
 */
@MultipartConfig()

public class WriteFeedBackServlet extends HttpServlet {

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
        int pid = Integer.parseInt(request.getParameter("pid"));
        int oid = Integer.parseInt(request.getParameter("oid"));

        ProductDAO dao = new ProductDAO();
        Product p = dao.getProductByID(pid);

        HttpSession session = request.getSession();
        session.getAttribute("account");

        if (session.getAttribute("account") == null) {
            response.sendRedirect("login.jsp");
        } else {
            request.setAttribute("p", p);
            request.setAttribute("oid", oid);
            request.getRequestDispatcher("writefeedback.jsp").forward(request, response);
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

        int pid = Integer.parseInt(request.getParameter("pid"));
        int aid = Integer.parseInt(request.getParameter("aid"));
        int oid = Integer.parseInt(request.getParameter("oid"));

        FeedBackDAO daoFB = new FeedBackDAO();

        // Định dạng ngày thành chuỗi
        Date currentDate = new Date();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        String currentDateTime = sdf.format(currentDate);

        try {

            // Lấy dữ liệu từ form
            String title = request.getParameter("title");
            int star = Integer.parseInt(request.getParameter("rating"));
            String desFeedback = request.getParameter("desFeedback");

//                //uploadImage
//            String realPath = "C://Users//win//Desktop//SWP999//online-shop//web//imgFB";
            ServletContext context = getServletContext();
            // Lấy đường dẫn tương đối đến thư mục "imgFB"
            String imgFBFolderPath = context.getRealPath("/imgFB");

            int feedbackId = daoFB.updateFeedBack(pid, aid, title, star, currentDateTime, desFeedback);

            //uploadMoreImage
            List<Part> fileParts = (List<Part>) request.getParts();

            for (Part part : fileParts) {
                String fileName = getSubmittedFileName(part);
                if (fileName != null && !fileName.isEmpty()) {
                    part.write(imgFBFolderPath + File.separator + fileName);
                    // Sau khi có feedbackId, cập nhật bảng FeedBack_Images với fid là feedbackId và đường dẫn hình ảnh.
                    daoFB.updateImageFeedBack(fileName, feedbackId);
                }
            }

            response.sendRedirect("orderdetails?oid=" + oid);
        } catch (NumberFormatException e) {
//            Su dung session de truyen attribute do sendredirect khong tra ve du lieu
//                request.getSession().setAttribute("error", "Ban can phai dang nhap de thuc hien chuc nang nay.");
            response.sendRedirect(request.getHeader("referer")); // Quay trở lại trang trước đó
            return;

        } catch (IOException e) {
//                int pid = Integer.parseInt(request.getParameter("pid"));
            String title = request.getParameter("title");
            int star = Integer.parseInt(request.getParameter("rating"));
            String desFeedback = request.getParameter("desFeedback");
            daoFB.updateFeedBack(pid, aid, title, star, currentDateTime, desFeedback);
            response.sendRedirect(request.getHeader("Referer"));
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
