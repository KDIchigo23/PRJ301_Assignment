/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.dashboard;

import dao.OrderDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Order;

/**
 *
 * @author ADMIN
 */
public class SeeMoreAccount extends HttpServlet {

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
        
        int accountId = Integer.parseInt(request.getParameter("accountId"));
        final int PAGE_SIZE = 6;
        int page = 1;
        String pageStr = request.getParameter("page");
        if (pageStr != null) {
            page = Integer.parseInt(pageStr);
        }

        int totalOrder = new OrderDAO().getTotalOrderByAccountId(accountId);
        int totalPage = totalOrder / PAGE_SIZE;
        if (totalOrder % PAGE_SIZE != 0) {
            totalPage += 1;
        }
        List<Order> listOrdersByAccountId = new OrderDAO().getOrderByAccountIdAndPagging(accountId,page,PAGE_SIZE);
        
        session.setAttribute("listOrdersByAccountId", listOrdersByAccountId);
        request.setAttribute("page", page);
        request.setAttribute("totalPage", totalPage);
        
        request.getRequestDispatcher("../SeeMoreAccount.jsp").forward(request, response);
        
        
//        response.sendRedirect("../see-more");
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
        int accountId = Integer.parseInt(request.getParameter("accountId"));
        final int PAGE_SIZE = 6;
        int page = 1;
        String pageStr = request.getParameter("page");
        if (pageStr != null) {
            page = Integer.parseInt(pageStr);
        }

        int totalOrder = new OrderDAO().getTotalOrderByAccountId(accountId);
        int totalPage = totalOrder / PAGE_SIZE;
        if (totalOrder % PAGE_SIZE != 0) {
            totalPage += 1;
        }
        List<Order> listOrdersByAccountId = new OrderDAO().getOrderByAccountIdAndPagging(accountId,page,PAGE_SIZE);
        
        session.setAttribute("listOrdersByAccountId", listOrdersByAccountId);
        request.setAttribute("page", page);
        request.setAttribute("totalPage", totalPage);
        session.setAttribute("checkAccountId", accountId);
        
        request.getRequestDispatcher("../SeeMoreAccount.jsp").forward(request, response);
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
