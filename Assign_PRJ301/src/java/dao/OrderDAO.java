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
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Order;

/**
 *
 * @author ADMIN
 */
public class OrderDAO {

    public int createReturnId(Order order) {
        try {
            String sql = "INSERT INTO [dbo].[Orders]\n"
                    + "           ([aId]\n"
                    + "           ,[oTotalPrice]\n"
                    + "           ,[oNote]\n"
                    + "           ,[sId])\n"
                    + "     VALUES\n"
                    + "           (?,?,?,?)";
            Connection conn = new DBContext().getConnection();
            PreparedStatement ps = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            ps.setInt(1, order.getaId());
            ps.setDouble(2, order.getoTotalPrice());
            ps.setString(3, order.getoNote());
            ps.setInt(4, order.getsId());
            ps.executeUpdate();

            ResultSet rs = ps.getGeneratedKeys();
            if (rs.next()) {
                return rs.getInt(1);
            }

        } catch (Exception ex) {
            Logger.getLogger(ShippingDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
    }

    public List<Order> getOrderByAccountId(int accountId) {
        List<Order> list = new ArrayList<>();
        try {
            String sql = "select od.proImg_url, od.proName, od.odQuantity, o.oCreated_date, o.oTotalPrice \n"
                    + "from Orders o inner join OrderDetail od on o.oId = od.oId \n"
                    + "inner join Account a on a.aId = o.aId where a.aId = ?";
            Connection conn = new DBContext().getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, accountId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Order order = Order.builder()
                        .odProImg_url(rs.getString(1))
                        .odProName(rs.getString(2))
                        .odQuantity(rs.getString(3))
                        .oCreated_date(rs.getString(4))
                        .oTotalPrice(rs.getDouble(5))
                        .build();
                list.add(order);
            }
        } catch (Exception ex) {
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }
}
