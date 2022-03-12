/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.sync;

import dao.ProductDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.LinkedHashMap;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Cart;

/**
 *
 * @author ADMIN
 */
public class UpdateCartQuantityController extends HttpServlet {

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
        int proId = Integer.parseInt(request.getParameter("productId"));
        int quantity = Integer.parseInt(request.getParameter("quantity"));

        HttpSession session = request.getSession();
        Map<Integer, Cart> carts = (Map<Integer, Cart>) session.getAttribute("carts");
        if (carts == null) {
            carts = new LinkedHashMap<>();
        }
        int proQuantity = new ProductDAO().getProQuantityByProId(proId);
        session.setAttribute("chechProQuantity", proQuantity);
        if (quantity <= proQuantity && quantity >= 0) {
            if (carts.containsKey(proId)) {
                carts.get(proId).setQuantity(quantity);
            }
            session.setAttribute("classAlert", "");
            session.setAttribute("strongAlert", "");
            session.setAttribute("alert", "");
        } else {
            if (quantity < 0) {
                session.setAttribute("classAlert", "alert alert-danger");
                session.setAttribute("alert", "Can't reduce quantity");
                session.setAttribute("lessProId", proId);
                session.setAttribute("checkqQuantity", quantity);
            } else {
                session.setAttribute("classAlert", "alert alert-danger");
                session.setAttribute("alert", "Over Quantity in shop");
                session.setAttribute("overProId", proId);
                session.setAttribute("checkQuantity", quantity);
            }

        }

        session.setAttribute("carts", carts);
        response.sendRedirect("cart-controller");
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
