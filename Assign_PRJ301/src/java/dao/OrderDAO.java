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

    public List<Order> getOrderByAccountIdAndPagging(int accountId,int page, int PAGE_SIZE) {
        List<Order> list = new ArrayList<>();
        try {
            String sql = "with t as (select ROW_NUMBER() over (order by o.oId asc) as r, \n"
                    + "od.proImg_url, od.proName, od.odQuantity, o.oCreated_date, o.oTotalPrice \n"
                    + "from Orders o inner join OrderDetail od on o.oId = od.oId \n"
                    + "inner join Account a on a.aId = o.aId where a.aId = ? )\n"
                    + "select * from t where r between ?*?-(?-1) and ?*?";
            Connection conn = new DBContext().getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, accountId);
            ps.setInt(2, page);
            ps.setInt(3, PAGE_SIZE);
            ps.setInt(4, PAGE_SIZE);
            ps.setInt(5, page);
            ps.setInt(6, PAGE_SIZE);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Order order = Order.builder()
                        .odProImg_url(rs.getString(2))
                        .odProName(rs.getString(3))
                        .odQuantity(rs.getString(4))
                        .oCreated_date(rs.getString(5))
                        .oTotalPrice(rs.getDouble(6))
                        .build();
                list.add(order);
            }
        } catch (Exception ex) {
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public double getTotalPriceEveryDay() {
        try {
            String sql = "select SUM(oTotalPrice) from Orders where Day(oCreated_date) = Day(getDate())";
            Connection conn = new DBContext().getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return rs.getDouble(1);
            }
        } catch (Exception ex) {
            Logger.getLogger(CategoryDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
    }

    public List<Order> getListOrdersDailyAndPagging(int page, int PAGE_SIZE) {
        List<Order> list = new ArrayList<>();
        try {
            String sql = "with t as (select ROW_NUMBER() over (order by a.aId asc) as r, \n"
                    + "a.aId, a.aDisplayName, od.proImg_url, od.proName, od.odQuantity, \n"
                    + "o.oCreated_date, o.oTotalPrice from Orders o \n"
                    + "inner join OrderDetail od on o.oId = od.oId\n"
                    + "inner join Account a on a.aId = o.aId\n"
                    + "where Day(oCreated_date) = Day(getDate()))\n"
                    + "select * from t where r between ?*?-(?-1) and ?*?";
            Connection conn = new DBContext().getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, page);
            ps.setInt(2, PAGE_SIZE);
            ps.setInt(3, PAGE_SIZE);
            ps.setInt(4, page);
            ps.setInt(5, PAGE_SIZE);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Order order = Order.builder()
                        .aId(rs.getInt(2))
                        .aDisplayName(rs.getString(3))
                        .odProImg_url(rs.getString(4))
                        .odProName(rs.getString(5))
                        .odQuantity(rs.getString(6))
                        .oCreated_date(rs.getString(7))
                        .oTotalPrice(rs.getDouble(8))
                        .build();
                list.add(order);
            }
        } catch (Exception ex) {
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public int getTotalOrderDaily() {
        try {
            String sql = "select count(o.oId) from Orders o \n"
                    + "inner join OrderDetail od on o.oId = od.oId\n"
                    + "where Day(oCreated_date) = Day(getDate())";
            Connection conn = new DBContext().getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception ex) {
            Logger.getLogger(CategoryDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
    }

    public double getTotalPriceEveryMonth() {
        try {
            String sql = "select SUM(oTotalPrice) from Orders where Month(oCreated_date) = Month(getDate())";
            Connection conn = new DBContext().getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return rs.getDouble(1);
            }
        } catch (Exception ex) {
            Logger.getLogger(CategoryDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
    }

    public List<Order> getListOrdersMonthAndPagging(int page, int PAGE_SIZE) {
        List<Order> list = new ArrayList<>();
        try {
            String sql = "with t as (select ROW_NUMBER() over (order by a.aId asc) as r, \n"
                    + "a.aId, a.aDisplayName, od.proImg_url, od.proName, od.odQuantity, \n"
                    + "o.oCreated_date, o.oTotalPrice from Orders o \n"
                    + "inner join OrderDetail od on o.oId = od.oId\n"
                    + "inner join Account a on a.aId = o.aId\n"
                    + "where Month(oCreated_date) = Month(getDate()))\n"
                    + "select * from t where r between ?*?-(?-1) and ?*?";
            Connection conn = new DBContext().getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, page);
            ps.setInt(2, PAGE_SIZE);
            ps.setInt(3, PAGE_SIZE);
            ps.setInt(4, page);
            ps.setInt(5, PAGE_SIZE);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Order order = Order.builder()
                        .aId(rs.getInt(2))
                        .aDisplayName(rs.getString(3))
                        .odProImg_url(rs.getString(4))
                        .odProName(rs.getString(5))
                        .odQuantity(rs.getString(6))
                        .oCreated_date(rs.getString(7))
                        .oTotalPrice(rs.getDouble(8))
                        .build();
                list.add(order);
            }
        } catch (Exception ex) {
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public int getTotalOrderMonth() {
        try {
            String sql = "select count(o.oId) from Orders o \n"
                    + "inner join OrderDetail od on o.oId = od.oId\n"
                    + "where Month(oCreated_date) = Month(getDate())";
            Connection conn = new DBContext().getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception ex) {
            Logger.getLogger(CategoryDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
    }

    public void deleteOrderByOrderId(int returnOrderId) {
        String sql = "DELETE FROM [Assign_PRJ301].[dbo].[Orders]\n"
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

    public List<Order> getListOrderByAccountId(int accountId) {
        List<Order> list = new ArrayList<>();
        try {
            String sql = "select * from Orders where aId = ?";
            Connection conn = new DBContext().getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, accountId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Order order = Order.builder()
                        .oId(rs.getInt(1))
                        .aId(rs.getInt(2))
                        .oTotalPrice(rs.getDouble(3))
                        .oNote(rs.getString(4))
                        .oCreated_date(rs.getString(5))
                        .sId(rs.getInt(6))
                        .build();
                list.add(order);
            }

        } catch (Exception ex) {
            Logger.getLogger(CategoryDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public int getIntOrderIdByAccountId(int accountId) {
        try {
            String sql = "select oId from Orders where aId = ?";
            Connection conn = new DBContext().getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, accountId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }

        } catch (Exception ex) {
            Logger.getLogger(CategoryDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
    }

    public List<Order> getShippingIdByAccountId(int accountId) {
        List<Order> list = new ArrayList<>();
        try {
            String sql = "select sId from Orders where aId = ?";
            Connection conn = new DBContext().getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, accountId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Order order = Order.builder()
                        .sId(rs.getInt(1))
                        .build();
                list.add(order);
            }

        } catch (Exception ex) {
            Logger.getLogger(CategoryDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public int getIntShippingIdByAccountId(int accountId) {
        try {
            String sql = "select sId from Orders where aId = ? ";
            Connection conn = new DBContext().getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, accountId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }

        } catch (Exception ex) {
            Logger.getLogger(CategoryDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
    }

    public int getTotalOrderByAccountId(int accountId) {
        try {
            String sql = "select count(o.oId) from Orders o \n"
                    + "where o.aId = ? ";
            Connection conn = new DBContext().getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, accountId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception ex) {
            Logger.getLogger(CategoryDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
    }

}
