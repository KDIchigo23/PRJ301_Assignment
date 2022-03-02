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
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Product;

/**
 *
 * @author ADMIN
 */
public class ProductDAO {

    public List<Product> getAllProducts() {
        List<Product> list = new ArrayList<>();
        try {
            String sql = "select pro.proId, pro.pId, pro.proName, p.pName, \n"
                    + "pro.proDescription, pro.proQuantity, pro.proPrice, \n"
                    + "pro.proImg_url, ct.ctId, ct.ctName\n"
                    + "from Products pro inner join Category ct\n"
                    + "on pro.ctId = ct.ctId\n"
                    + "inner join Players p\n"
                    + "on pro.pId = p.pId";
            Connection conn = new DBContext().getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Product product = new Product(rs.getInt(1), rs.getInt(2), rs.getString(3), rs.getString(4), rs.getString(5),
                        rs.getInt(6), rs.getFloat(7), rs.getString(8), rs.getInt(9), rs.getString(10));
                list.add(product);
            }
        } catch (Exception ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public List<Product> getProductByCategoryId(int categoryId) {
        List<Product> list = new ArrayList<>();
        try {
            String sql = "select pro.proId, pro.pId, pro.proName, p.pName, \n"
                    + "pro.proDescription, pro.proQuantity, pro.proPrice, \n"
                    + "pro.proImg_url, ct.ctId, ct.ctName\n"
                    + "from Products pro inner join Category ct\n"
                    + "on pro.ctId = ct.ctId\n"
                    + "inner join Players p\n"
                    + "on pro.pId = p.pId \n"
                    + "and ct.ctId = ?";
            //Mở kết nối với sql server
            Connection conn = new DBContext().getConnection();

            //Đưa câu sql vào prepareStatement 
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, categoryId);
            //Thực thi câu lệnh sql sẽ trả về result set
            ResultSet rs = ps.executeQuery();

            //Lặp rs để lấy data
            while (rs.next()) {
                Product product = new Product(rs.getInt(1), rs.getInt(2), rs.getString(3), rs.getString(4), rs.getString(5),
                        rs.getInt(6), rs.getFloat(7), rs.getString(8), rs.getInt(9), rs.getString(10));
                list.add(product);
            }

        } catch (Exception ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

//    public List<Product> getProductsByPlayerId() {
//        List<Product> list = new ArrayList<>();
//        try {
//            String sql = "select pro.proId, pro.pId, pro.proName, p.pName, \n"
//                    + "pro.proDescription, pro.proQuantity, pro.proPrice, \n"
//                    + "pro.proImg_url, ct.ctId, ct.ctName\n"
//                    + "from Products pro inner join Category ct\n"
//                    + "on pro.ctId = ct.ctId\n"
//                    + "inner join Players p\n"
//                    + "on pro.pId = p.pId"
//                    + "and pro.ctId = ?";
//            //Mở kết nối với sql server
//            Connection conn = new DBContext().getConnection();
//
//            //Đưa câu sql vào prepareStatement 
//            PreparedStatement ps = conn.prepareStatement(sql);
//            ps.setInt(1, categoryId);
//            //Thực thi câu lệnh sql sẽ trả về result set
//            ResultSet rs = ps.executeQuery();
//
//            //Lặp rs để lấy data
//            while (rs.next()) {
//                Product product = new Product(rs.getInt(1), rs.getInt(2), rs.getString(3), rs.getString(4), rs.getString(5),
//                        rs.getInt(6), rs.getFloat(7), rs.getString(8), rs.getInt(9), rs.getString(10));
//                list.add(product);
//            }
//
//        } catch (Exception ex) {
//            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
//        }
//        return list;
//    }
    public List<Product> getPlayerByCategoryId(int categoryId) {
        List<Product> list = new ArrayList<>();
        try {
            String sql = "select pro.proId, pro.pId, pro.proName, p.pName, \n"
                    + "pro.proDescription, pro.proQuantity, pro.proPrice, \n"
                    + "pro.proImg_url, ct.ctId, ct.ctName\n"
                    + "from Products pro inner join Category ct\n"
                    + "on pro.ctId = ct.ctId\n"
                    + "inner join Players p\n"
                    + "on pro.pId = p.pId \n"
                    + "and ct.ctId = ?";
            //Mở kết nối với sql server
            Connection conn = new DBContext().getConnection();

            //Đưa câu sql vào prepareStatement 
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, categoryId);
            //Thực thi câu lệnh sql sẽ trả về result set
            ResultSet rs = ps.executeQuery();

            //Lặp rs để lấy data
            while (rs.next()) {
                Product product = new Product(rs.getInt(1), rs.getInt(2), rs.getString(3), rs.getString(4), rs.getString(5),
                        rs.getInt(6), rs.getFloat(7), rs.getString(8), rs.getInt(9), rs.getString(10));
                list.add(product);
            }

        } catch (Exception ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }
}
