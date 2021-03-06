/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.dashboard;

import dao.AccountDAO;
import dao.OrderDAO;
import dao.OrderDetailDAO;
import dao.ShippingDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Order;
import model.OrderDetail;
import model.Shipping;

/**
 *
 * @author ADMIN
 */
public class DeleteAccount extends HttpServlet {

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
        try (PrintWriter out = response.getWriter()) {
            HttpSession session = request.getSession();

            int accountId = Integer.parseInt(request.getParameter("accountId"));
            new AccountDAO().deleteAccountByAccountId(accountId);
//            List<Order> ShippingId = new OrderDAO().getShippingIdByAccountId(accountId);
//            if (ShippingId != null) {
//                int returnShippingId = 0;
//                for (Order order : ShippingId) {
//                    returnShippingId = order.getsId();
//                    new ShippingDAO().deleteShippingByShippingId(returnShippingId);
//                }
//
//            }

//            List<Order> OrderId = new OrderDAO().getOrderIdByAccountId(accountId);
//            if (OrderId != null) {
//                int returnOrderId = 0;
//                for (Order order : OrderId) {
//                    returnOrderId = order.getoId();
//                    new OrderDAO().deleteOrderByOrderId(returnOrderId);
//
//                    List<OrderDetail> OrderDetailId = new OrderDetailDAO().getOrderDetailIdByOrderId(returnOrderId);
//                    if (OrderDetailId != null) {
//                        int returnOrderDetailId = 0;
//                        for (OrderDetail orderDetail : OrderDetailId) {
//                            returnOrderDetailId = orderDetail.getOdId();
//                            new OrderDetailDAO().deleteOrderDetailByOrderId(returnOrderDetailId);
//                        }
//                    }
//
//                }
//
//            }
            response.sendRedirect("http://localhost:8080/Assign_PRJ301/admin/full-account-infor");
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
