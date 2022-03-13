/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package filter;

import java.io.IOException;
import java.io.PrintStream;
import java.io.PrintWriter;
import java.io.StringWriter;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Account;

/**
 *
 * @author ADMIN
 */
@WebFilter(filterName = "AuthorizationSellerFilter", urlPatterns = {"/seller/*","/CreateProduct.jsp","/UpdateProduct.jsp"})
public class AuthorizationSellerFilter implements Filter {
    
    @Override
    public void doFilter(ServletRequest request, ServletResponse response,
            FilterChain chain)
            throws IOException, ServletException {
        
        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse res = (HttpServletResponse) response;

        HttpSession session = req.getSession();
        //Kiểm tra đăng nhập
        Account account = (Account) session.getAttribute("account");

        if (account != null && account.getaRole().equals(Account.SELLER)) {
            //cho qua
            chain.doFilter(request, response);
            return;
        }
//        req.setAttribute("error", "You are not permission");
        res.sendRedirect("http://localhost:8080/Assign_PRJ301/login");
    }

    /**
     * Destroy method for this filter
     */
    @Override
    public void destroy() {        
    }

    /**
     * Init method for this filter
     * @param filterConfig
     */
    @Override
    public void init(FilterConfig filterConfig) {        

    }
    
}
