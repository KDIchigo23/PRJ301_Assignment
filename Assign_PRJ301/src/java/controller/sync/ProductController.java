/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.sync;

import dao.CategoryDAO;
import dao.ProductDAO;
import dao.TeamDAO;
import java.io.IOException;
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
public class ProductController extends HttpServlet {

    /**
     * PSrocesses requests for both HTTP <code>GET</code> and <code>POST</code>
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
//        int teamId = Integer.getInteger("teamId");
        HttpSession session = request.getSession();
        
        final int PAGE_SIZE = 12;
        int page = 1;
        String pageStr = request.getParameter("page");
        if (pageStr != null) {
            page = Integer.parseInt(pageStr);
        }

        int totalProducts = new ProductDAO().getTotalProducts();
        int totalPage = totalProducts / PAGE_SIZE;
        if (totalProducts % PAGE_SIZE != 0) {
            totalPage += 1;
        }

//        List<Player> listPlayersByTeamId = new PlayerDAO().getPlayersByTeamId(teamId);
        List<Product> listProducts = new ProductDAO().getProductsWithPagging(page, PAGE_SIZE);
        List<Product> listPlayers = new ProductDAO().getAllProducts();
        List<Team> listTeams = new TeamDAO().getAllTeams();
        List<Category> listCategories = new CategoryDAO().getAllCategories();
        

        session.setAttribute("listCategories", listCategories);
        request.setAttribute("listProducts", listProducts);
        request.setAttribute("listPlayers", listPlayers);
        request.setAttribute("page", page);
        request.setAttribute("totalPage", totalPage);
        session.setAttribute("listTeams", listTeams);
        session.setAttribute("urlHistory", "product-controller");
        request.setAttribute("pagination_url", "product-controller?");

        request.getRequestDispatcher("Products.jsp").forward(request, response);
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
