/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import com.google.gson.Gson;
import dal.CategoryDAO;
import dal.FeedBackDAO;
import dal.ProductDAO;
import dal.ProductSaleDAO;
import dto.FeedBackDTO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;
import model.Account;
import model.Brands;
import model.Category;
import model.FeedBack;
import model.FeedBackImages;
import model.Product;
import model.ProductImages;
import model.ProductSale;
import model.ProductSize;

/**
 *
 * @author win
 */
public class ProductDetails extends HttpServlet {

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
        FeedBackDAO daoFB = new FeedBackDAO();
        

        String pid = request.getParameter("pid");
        String sale = request.getParameter("sale");
        ProductDAO dao = new ProductDAO();
        CategoryDAO daoC = new CategoryDAO();
        ProductSaleDAO psdao = new ProductSaleDAO();

        if (sale != null) {
            try {
                ProductSale ps = psdao.getProductSaleById(Integer.parseInt(pid));
                request.setAttribute("type", sale);
                request.setAttribute("detailps", ps);
            } catch (ClassNotFoundException ex) {
            } catch (Exception ex) {
            }
        } else {
            Product p = dao.getProductByID(Integer.parseInt(pid));
            request.setAttribute("details", p);
        }

        if (session.getAttribute("account") != null) {
            try {

                int aid = account.getId();

                int checkAcFb = daoFB.checkAccountFB(aid, Integer.parseInt(pid));
                request.setAttribute("checkFb", checkAcFb);

                int checkcountFb = daoFB.checkcountFB(aid, Integer.parseInt(pid));
                request.setAttribute("checkcountFb", checkcountFb);

                //        PhanTrang
                int numberPage = daoFB.getCountFeedBackPage(Integer.parseInt(pid));
                request.setAttribute("numberPage", numberPage);

                String index = request.getParameter("index");

                if (index == null) {
                    index = "1";
                }

                if (index != null) {
                    int indexPage = Integer.parseInt(index);
                    request.setAttribute("tag", indexPage);

                    List<FeedBackDTO> listfb = daoFB.getPaging(Integer.parseInt(pid), indexPage);

                    request.setAttribute("listP", listfb);
                }

                Brands br = dao.getBrandById(Integer.parseInt(pid));

                List<ProductSize> psize = dao.getListSize(Integer.parseInt(pid));
                List<ProductImages> listImage = dao.getListImageByPid(Integer.parseInt(pid));
                List<FeedBackDTO> listFeedBack = daoFB.getFullFeedBack(Integer.parseInt(pid));

                List<FeedBackDTO> listAll = daoFB.getPaging(Integer.parseInt(pid), Integer.parseInt(index));

                int checkCountFb = daoFB.getCountFeedback(Integer.parseInt(pid));

                Category c = dao.getCategoryByPid(Integer.parseInt(pid));

                List<Product> list = dao.get4ProductNew();
                List<Category> listCategory = daoC.getAllCategory();

                int a = dao.getQuantitySize(3, 3);
                int countFeedBack = daoFB.getCountFeedback(Integer.parseInt(pid));
                request.setAttribute("listCategory", listCategory);
                request.setAttribute("checkCountFb", checkCountFb);
                request.setAttribute("listP", listAll);
                request.setAttribute("listFeedBack", listFeedBack);
                request.setAttribute("countFeedBack", countFeedBack);
                request.setAttribute("listImage", listImage);
                request.setAttribute("brandsProduct", br);
                request.setAttribute("list4new", list);
                request.setAttribute("psize", psize);
                request.setAttribute("category", c);

                request.setAttribute("id", pid);

                List<FeedBackImages> listImageFeedBack = daoFB.getImageFeedback();
                request.setAttribute("listImageFeedBack", listImageFeedBack);

                float rateStarFeedBack = daoFB.rateStarFeedBack(Integer.parseInt(pid));
                request.setAttribute("rateStarFeedBack", rateStarFeedBack);

            } catch (NumberFormatException e) {

            }

        } else {

            //        PhanTrang
            int numberPage = daoFB.getCountFeedBackPage(Integer.parseInt(pid));
            request.setAttribute("numberPage", numberPage);

            String index = request.getParameter("index");

            if (index == null) {
                index = "1";
            }

            if (index != null) {
                int indexPage = Integer.parseInt(index);
                request.setAttribute("tag", indexPage);

                List<FeedBackDTO> listfb = daoFB.getPaging(Integer.parseInt(pid), indexPage);

                request.setAttribute("listP", listfb);
            }
            Product p = dao.getProductByID(Integer.parseInt(pid));
            Brands br = dao.getBrandById(Integer.parseInt(pid));

            List<ProductSize> psize = dao.getListSize(Integer.parseInt(pid));
            List<ProductImages> listImage = dao.getListImageByPid(Integer.parseInt(pid));
            List<FeedBackDTO> listFeedBack = daoFB.getFullFeedBack(Integer.parseInt(pid));

            List<FeedBackDTO> listAll = daoFB.getPaging(Integer.parseInt(pid), Integer.parseInt(index));
            int checkCountFb = daoFB.getCountFeedback(Integer.parseInt(pid));

            Category c = dao.getCategoryByPid(Integer.parseInt(pid));

            List<Product> list = dao.get4ProductNew();
            List<Category> listCategory = daoC.getAllCategory();

            int countFeedBack = daoFB.getCountFeedback(Integer.parseInt(pid));
            request.setAttribute("listCategory", listCategory);
            request.setAttribute("checkCountFb", checkCountFb);
            request.setAttribute("listP", listAll);
            request.setAttribute("listFeedBack", listFeedBack);
            request.setAttribute("countFeedBack", countFeedBack);
            request.setAttribute("listImage", listImage);
            request.setAttribute("brandsProduct", br);
            request.setAttribute("list4new", list);
            request.setAttribute("psize", psize);
            request.setAttribute("category", c);

            request.setAttribute("id", pid);

            List<FeedBackImages> listImageFeedBack = daoFB.getImageFeedback();
            request.setAttribute("listImageFeedBack", listImageFeedBack);

            float rateStarFeedBack = daoFB.rateStarFeedBack(Integer.parseInt(pid));
            request.setAttribute("rateStarFeedBack", rateStarFeedBack);
        }
        request.getRequestDispatcher("Shop-details.jsp").forward(request, response);

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
// Lấy dữ liệu từ cơ sở dữ liệu
        FeedBackDAO daoFB = new FeedBackDAO();

        // Lấy tham số pid và id từ yêu cầu AJAX
        int pid = Integer.parseInt(request.getParameter("pid"));
        int fid = Integer.parseInt(request.getParameter("fid"));

        FeedBack fb = daoFB.getFeedBackByFid(fid);

        // Chuyển dữ liệu thành JSON
        Gson gson = new Gson();
        String jsonData = gson.toJson(fb);

        // Thiết lập kiểu nội dung và viết dữ liệu JSON vào phản hồi
        response.setContentType("application/json");
        PrintWriter out = response.getWriter();
        out.write(jsonData);

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
