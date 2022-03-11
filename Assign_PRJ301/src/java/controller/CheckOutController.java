/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.AccountDAO;
import dao.CategoryDAO;
import dao.OrderDAO;
import dao.OrderDetailDAO;
import dao.ProductDAO;
import dao.ShippingDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Account;
import model.Cart;
import model.Category;
import model.Order;
import model.Product;
import model.Shipping;

/**
 *
 * @author ADMIN
 */
public class CheckOutController extends HttpServlet {

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
        int proId = Integer.parseInt(request.getParameter("productId"));
        String accountUser = request.getParameter("accountUser");
        String accountPass = request.getParameter("accountPass");
        session.setAttribute("accountUser", accountUser);
        session.setAttribute("accountPass", accountPass);

        Map<Integer, Cart> carts = (Map<Integer, Cart>) session.getAttribute("carts");
        if (carts == null) {
            carts = new LinkedHashMap<>();
        }

        if (carts.containsKey(proId)) {//sản phẩm đã có trên giỏ hàng
            int oldQuantity = carts.get(proId).getQuantity();
            carts.get(proId).setQuantity(oldQuantity + 1);
        } else {//sản phẩm chưa có trên giỏ hàng
            Product product = new ProductDAO().getProductByProId(proId);
            carts.put(proId, Cart.builder().product(product).quantity(1).build());
        }
        //lưu carts lên session
        session.setAttribute("carts", carts);
        
        
        //tinh tong tien
        double totalMoney = 0;
        for (Map.Entry<Integer, Cart> entry : carts.entrySet()) {
            Integer productId = entry.getKey();
            Cart cart = entry.getValue();

            totalMoney += cart.getQuantity() * cart.getProduct().getProPrice();
        }
        List<Category> listCategories = new CategoryDAO().getAllCategories();

        session.setAttribute("listCategories", listCategories);
        request.setAttribute("totalMoney", totalMoney);
        request.setAttribute("carts", carts);

        request.getRequestDispatcher("Checkout.jsp").forward(request, response);
        

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
//        processRequest(request, response);
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        HttpSession session = request.getSession();
        String name = request.getParameter("name");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");
        String note = request.getParameter("note");

//        String accountUser= request.getParameter("accountUser");
        //lưu vào database
        //Lưu Shipping
        Shipping shipping = Shipping.builder()
                .sName(name)
                .sPhone(phone)
                .sAddress(address)
                .build();
        int shippingId = new ShippingDAO().createReturnId(shipping); //trả về id tự tăng của bản ghi vừa lưu vào database
        //Lưu Order

        Map<Integer, Cart> carts = (Map<Integer, Cart>) session.getAttribute("carts");
        if (carts == null) {
            carts = new LinkedHashMap<>();
        }
        
        

        //tinh tong tien
        double totalPrice = 0;
        for (Map.Entry<Integer, Cart> entry : carts.entrySet()) {
            Integer productId = entry.getKey();
            Cart cart = entry.getValue();

            totalPrice += cart.getQuantity() * cart.getProduct().getProPrice();

        }

        Account account = (Account) session.getAttribute("account");
        String accountUser = session.getAttribute("accountUser").toString();
        String accountPass = session.getAttribute("accountPass").toString();
        int accountId = new AccountDAO().getAccountIdByUserAndPass(accountUser, accountPass);
        session.setAttribute("accountId", accountId);

        Order order = Order.builder()
                .aId(account.getaId())
                .oTotalPrice(shippingId)
                .oTotalPrice(totalPrice)
                .oNote(note)
                .sId(shippingId)
                .build();
        int orderId = new OrderDAO().createReturnId(order);
        
        //Thay đổi giá trị quantity
        List<Product> listProducts = new ProductDAO().getAllProducts();
        for (Map.Entry<Integer, Cart> entry : carts.entrySet()) {
            Integer productId = entry.getKey();
            Cart cart = entry.getValue();
            int quantity = cart.getQuantity();
            int proId = cart.getProduct().getProId();
            int proQuantity = new ProductDAO().getProQuantityByProId(proId);
            int updateQuantity = proQuantity - quantity;
            new ProductDAO().updateQuantityByProId(updateQuantity, proId);
        }
        //Lưu OrderDetail

        new OrderDetailDAO().saveCart(orderId, carts);

        session.removeAttribute("carts");
        response.sendRedirect("home-controller");
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
