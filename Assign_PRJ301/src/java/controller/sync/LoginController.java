/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.sync;

import dao.AccountDAO;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Account;

/**
 *
 * @author ADMIN
 */
public class LoginController extends HttpServlet {

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
//        processRequest(request, response);
//        Cookie arr[] = request.getCookies();
//        if (arr != null) {
//            for (Cookie cookie : arr) {
//                if (cookie.getName().equals("userC")) {
//                    request.setAttribute("username", cookie.getValue());
//                }
//                if (cookie.getName().equals("passC")) {
//                    request.setAttribute("password", cookie.getValue());
//                }
//            }
//        }
//
//        request.getRequestDispatcher("Login.jsp").forward(request, response);

        Cookie[] cookies = request.getCookies();
        String username = null;
        String password = null;
        for (Cookie cooky : cookies) {
            if (cooky.getName().equals("username")) {
                username = cooky.getValue();
            }
            if (cooky.getName().equals("password")) {
                password = cooky.getValue();
            }
            if (username != null && password != null) {
                break;
            }
        }

        if (username != null && password != null) {
            Account account = new AccountDAO().login(username, password);
            if (account != null) { //cookie hợp lệ
                request.getSession().setAttribute("account", account);
                response.sendRedirect("home-controller");
                return;
            }
        }
        request.getRequestDispatcher("Login.jsp").forward(request, response);
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
        HttpSession session = request.getSession();
//        String username = request.getParameter("username");
//        String password = request.getParameter("password");
//        String remember = request.getParameter("remember");
//
//        Account account = new AccountDAO().login(username, password);
//
//        if (account == null) {
//            request.setAttribute("classAlert", "alert alert-danger");
//            request.setAttribute("strongAlert", "Error");
//            request.setAttribute("alert", "Wrong username or password");
//            request.getRequestDispatcher("Login.jsp").forward(request, response);
//        } else {
//            session.setAttribute("account", account);
//            request.setAttribute("account", account);
//
//            Cookie user = new Cookie("userC", username);
//            Cookie pass = new Cookie("passC", password);
//            user.setMaxAge(30 * 60);
//
//            if (remember != null) {
//                pass.setMaxAge(30 * 60);
//            } else {
//                pass.setMaxAge(0);
//            }
//            response.addCookie(user);
//            response.addCookie(pass);
//
//            response.sendRedirect("home-controller");
//        }
        //Check login
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String remember = request.getParameter("remember");

        // check username, password
        Account account = new AccountDAO().login(username, password);

        if (account != null) { //hợp lệ -> lưu lên session
            //remember
            if (remember != null) {
                Cookie usernameCookie = new Cookie("username", username);
                usernameCookie.setMaxAge(60 * 60 * 24 * 2);
                Cookie passwordCookie = new Cookie("password", password);
                passwordCookie.setMaxAge(60 * 60 * 24 * 2);
                response.addCookie(usernameCookie);
                response.addCookie(passwordCookie);
            }
            request.getSession().setAttribute("account", account);
            response.sendRedirect("home-controller");
            //không remember
        } else {//Không hợp lệ -> trả về lỗi
            request.setAttribute("classAlerts", "alert alert-danger");
            request.setAttribute("strongAlerts", "Error");
            request.setAttribute("alerts", "Wrong username or password");
            request.getRequestDispatcher("Login.jsp").forward(request, response);
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

}
