/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.productCRUD;

import dao.CategoryDAO;
import dao.ProductDAO;
import dao.TeamDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Category;
import model.Product;
import model.Team;

/**
 *
 * @author ADMIN
 */
public class CreateProduct extends HttpServlet {

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

        List<Team> listTeams = new TeamDAO().getAllTeams();
        List<Category> listCategories = new CategoryDAO().getAllCategories();

        session.setAttribute("listTeams", listTeams);
        session.setAttribute("listCategories", listCategories);

        request.getRequestDispatcher("CreateProduct.jsp").forward(request, response);
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
        request.getRequestDispatcher("CreateProduct.jsp").forward(request, response);
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
//        processRequest(request, response);
        String proImg_url = request.getParameter("proImg_url");
        String proName = request.getParameter("proName");
        int teamId = Integer.parseInt(request.getParameter("team"));
        int playerId = Integer.parseInt(request.getParameter("player"));
        String proDescription = request.getParameter("proDescription");
        int proQuantity = Integer.parseInt(request.getParameter("proQuantity"));
        float proPrice = Float.parseFloat(request.getParameter("proPrice"));
        int categoryId = Integer.parseInt(request.getParameter("category"));

        Product checkProductExist = new ProductDAO().checkProductExist(proName);
        if (checkProductExist == null) {
            new ProductDAO().createProduct(proImg_url,proName,teamId,playerId,proDescription,proQuantity,proPrice,categoryId);
        }
        
        response.sendRedirect("product-controller");
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
