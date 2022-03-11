/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.playerCRUD;

import dao.PlayerDAO;
import dao.TeamDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Player;

/**
 *
 * @author ADMIN
 */
public class CreatePlayer extends HttpServlet {

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
        String pImg_url = request.getParameter("pImg_url");
        int teamId = Integer.parseInt(request.getParameter("team"));
        String pName = request.getParameter("pName");
        String pHeight = request.getParameter("pHeight");
        String pDob = request.getParameter("pDob");
        String pPosition = request.getParameter("pPosition");
        int pNo = Integer.parseInt(request.getParameter("pNo"));
        String pAchievement = request.getParameter("pAchievement");
        
        Player checkPlayerExist = new PlayerDAO().checkPlayerExist(pName);
        if(checkPlayerExist == null){
            new PlayerDAO().createPlayer(pImg_url, teamId, pName, pHeight, pDob, pPosition, pNo, pAchievement);
        }
        
        response.sendRedirect("player-controller");
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
        request.getRequestDispatcher("CreatePlayer.jsp").forward(request, response);
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
