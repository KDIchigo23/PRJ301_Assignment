/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.CategoryDAO;
import dao.PlayerDAO;
import dao.ProductDAO;
import dao.TeamDAO;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Category;
import model.Player;
import model.Team;

/**
 *
 * @author ADMIN
 */
public class SearchPlayerController extends HttpServlet {

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
        String keyword = request.getParameter("keyword");
        final int PAGE_SIZE = 12;
        int page = 1;
        String pageStr = request.getParameter("page");
        if (pageStr != null) {
            page = Integer.parseInt(pageStr);
        }

        int totalPlayers = new PlayerDAO().getTotalPlayers(keyword);
        int totalPage = totalPlayers / PAGE_SIZE;
        if (totalPlayers % PAGE_SIZE != 0) {
            totalPage += 1;
        }

        List<Player> listPlayers = new PlayerDAO().getPlayersWithPaggingAndSearch(keyword, page, PAGE_SIZE);
        List<Team> listTeams = new TeamDAO().getAllTeams();
        List<Category> listCategories = new CategoryDAO().getAllCategories();

        request.setAttribute("listTeams", listTeams);
        request.setAttribute("listPlayers", listPlayers);
        request.setAttribute("listCategories", listCategories);
        request.setAttribute("page", page);
        request.setAttribute("totalPage", totalPage);
        request.setAttribute("pagination_url", "search-player?keyword=" + keyword + "&");
        request.setAttribute("team_url", "search-player?keyword=" + keyword + "&");

        request.getRequestDispatcher("Players.jsp").forward(request, response);
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
