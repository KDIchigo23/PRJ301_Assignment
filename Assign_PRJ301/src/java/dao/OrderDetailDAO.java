/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import context.DBContext;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Account;
import model.Cart;
import model.OrderDetail;

/**
 *
 * @author ADMIN
 */
public class OrderDetailDAO {

    public void saveCart(int orderId, Map<Integer, Cart> carts) {
        try {
            String sql = "INSERT INTO [dbo].[OrderDetail]\n"
                    + "           ([oId]\n"
                    + "           ,[proName]\n"
                    + "           ,[proImg_url]\n"
                    + "           ,[proPrice]\n"
                    + "           ,[odQuantity])\n"
                    + "     VALUES\n"
                    + "           (?,?,?,?,?)";
            Connection conn = new DBContext().getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, orderId);
            for (Map.Entry<Integer, Cart> entry : carts.entrySet()) {
                Integer productId = entry.getKey();
                Cart cart = entry.getValue();
                ps.setString(2, cart.getProduct().getProName());
                ps.setString(3, cart.getProduct().getProImg_url());
                ps.setDouble(4, cart.getProduct().getProPrice());
                ps.setDouble(5, cart.getQuantity());
                ps.executeUpdate();
            }

        } catch (Exception ex) {
            Logger.getLogger(ShippingDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void deleteOrderDetailByOrderId(int returnOrderId) {
        String sql = "DELETE FROM [Assign_PRJ301].[dbo].[OrderDetail]\n"
                + "      WHERE oId = ? ";
        try {

            Connection conn = new DBContext().getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, returnOrderId);
            ps.executeUpdate();

        } catch (Exception ex) {
            Logger.getLogger(CategoryDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public List<OrderDetail> getOrderDetailIdByOrderId(int returnOrderId) {
        List<OrderDetail> list = new ArrayList<>();
        try {
            String sql = "select odId from OrderDetail where oId = ?";
            Connection conn = new DBContext().getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, returnOrderId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                OrderDetail orderDetail = OrderDetail.builder()
                        .odId(rs.getInt(1))
                        .build();
                list.add(orderDetail);
            }

        } catch (Exception ex) {
            Logger.getLogger(CategoryDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public void deleteOrderDetailByOrderDetailId(int returnOrderDetailId) {
        String sql = "DELETE FROM [Assign_PRJ301].[dbo].[OrderDetail]\n"
                + "      WHERE odId = ? ";
        try {

            Connection conn = new DBContext().getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, returnOrderDetailId);
            ps.executeUpdate();

        } catch (Exception ex) {
            Logger.getLogger(CategoryDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

}
