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
import model.ProductOnly;

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

    public List<Product> getProductByProductId(int productId) {
        List<Product> list = new ArrayList<>();
        try {
            String sql = "select pro.proId, pro.pId, pro.proName, p.pName, \n"
                    + "pro.proDescription, pro.proQuantity, pro.proPrice, \n"
                    + "pro.proImg_url, ct.ctId, ct.ctName\n"
                    + "from Products pro inner join Category ct\n"
                    + "on pro.ctId = ct.ctId\n"
                    + "inner join Players p\n"
                    + "on pro.pId = p.pId \n"
                    + "and pro.proId = ?";
            //Mở kết nối với sql server
            Connection conn = new DBContext().getConnection();

            //Đưa câu sql vào prepareStatement 
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, productId);
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

    public Product getProductByProId(int productId) {
        try {
            String sql = "select pro.proId, pro.pId, pro.proName, p.pName, pro.proDescription, \n"
                    + "pro.proQuantity, pro.proPrice, pro.proImg_url, ct.ctId, ct.ctName\n"
                    + "from Products pro inner join Category ct on pro.ctId = ct.ctId\n"
                    + "inner join Players p on pro.pId = p.pId where pro.proId = ?";
            Connection conn = new DBContext().getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, productId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Product product = new Product(rs.getInt(1), rs.getInt(2), rs.getString(3), rs.getString(4), rs.getString(5),
                        rs.getInt(6), rs.getFloat(7), rs.getString(8), rs.getInt(9), rs.getString(10));
                return product;
            }
        } catch (Exception ex) {
            Logger.getLogger(CategoryDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

//    public List<Product> getPlayerByCategoryId(int categoryId) {
//        List<Product> list = new ArrayList<>();
//        try {
//            String sql = "select pro.proId, pro.pId, pro.proName, p.pName, \n"
//                    + "pro.proDescription, pro.proQuantity, pro.proPrice, \n"
//                    + "pro.proImg_url, ct.ctId, ct.ctName\n"
//                    + "from Products pro inner join Category ct\n"
//                    + "on pro.ctId = ct.ctId\n"
//                    + "inner join Players p\n"
//                    + "on pro.pId = p.pId \n"
//                    + "and ct.ctId = ?";
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
    public List<Product> search(String keyword) {
        List<Product> list = new ArrayList<>();
        try {
            String sql = "select pro.proId, pro.pId, pro.proName, p.pName, \n"
                    + "pro.proDescription, pro.proQuantity, pro.proPrice, \n"
                    + "pro.proImg_url, ct.ctId, ct.ctName\n"
                    + "from Products pro inner join Category ct\n"
                    + "on pro.ctId = ct.ctId\n"
                    + "inner join Players p\n"
                    + "on pro.pId = p.pId where pro.proName like ?";
            Connection conn = new DBContext().getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, "%" + keyword + "%");
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

    public List<ProductOnly> getProductsWithPagging(int page, int PAGE_SIZE) {
        List<ProductOnly> list = new ArrayList<>();
        try {
            String sql = "with t as (select ROW_NUMBER() over (order by pro.proId asc) as r, * from Products pro)\n"
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
                ProductOnly product = new ProductOnly(rs.getInt(2), rs.getInt(3), rs.getString(4), rs.getString(5), rs.getInt(6), rs.getFloat(7), rs.getString(8), rs.getInt(9));
                list.add(product);
            }
        } catch (Exception ex) {
            Logger.getLogger(CategoryDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public List<Product> getProductByCategoryIdAndPagging(int categoryId, int page, int PAGE_SIZE) {
        List<Product> list = new ArrayList<>();
        try {
            String sql = "with t as (select ROW_NUMBER() over (order by pro.proId asc) as r,\n"
                    + "pro.proId, pro.pId, pro.proName, p.pName, \n"
                    + "pro.proDescription, pro.proQuantity, pro.proPrice,\n"
                    + "pro.proImg_url, ct.ctId, ct.ctName from Products pro \n"
                    + "inner join Category ct on pro.ctId = ct.ctId \n"
                    + "inner join Players p on pro.pId = p.pId and ct.ctId = ?)\n"
                    + "select * from t where r between ?*?-(?-1) and ?*? ";
            //Mở kết nối với sql server
            Connection conn = new DBContext().getConnection();

            //Đưa câu sql vào prepareStatement 
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, categoryId);
            ps.setInt(2, page);
            ps.setInt(3, PAGE_SIZE);
            ps.setInt(4, PAGE_SIZE);
            ps.setInt(5, page);
            ps.setInt(6, PAGE_SIZE);
            //Thực thi câu lệnh sql sẽ trả về result set
            ResultSet rs = ps.executeQuery();

            //Lặp rs để lấy data
            while (rs.next()) {
                Product product = new Product(rs.getInt(2), rs.getInt(3), rs.getString(4), rs.getString(5), rs.getString(6),
                        rs.getInt(7), rs.getFloat(8), rs.getString(9), rs.getInt(10), rs.getString(11));
                list.add(product);
            }

        } catch (Exception ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public List<ProductOnly> getProductsWithPaggingAndSearch(String keyword, int page, int PAGE_SIZE) {
        List<ProductOnly> list = new ArrayList<>();
        try {
            String sql = "with t as (select ROW_NUMBER() over (order by pro.proId asc) as r, "
                    + "* from Products pro where pro.proName like ?) select * from t where r between ?*?-(?-1) and ?*?";
            Connection conn = new DBContext().getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, "%" + keyword + "%");
            ps.setInt(2, page);
            ps.setInt(3, PAGE_SIZE);
            ps.setInt(4, PAGE_SIZE);
            ps.setInt(5, page);
            ps.setInt(6, PAGE_SIZE);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                ProductOnly product = new ProductOnly(rs.getInt(2), rs.getInt(3), rs.getString(4), rs.getString(5), rs.getInt(6), rs.getFloat(7), rs.getString(8), rs.getInt(9));
                list.add(product);
            }
        } catch (Exception ex) {
            Logger.getLogger(CategoryDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public int getTotalProducts() {
        try {
            String sql = "select count(proId) from Products ";
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

    public int getTotalProducts(String keyword) {
        try {
            String sql = "select count(pro.proId) from Products pro where pro.proName like ?";
            Connection conn = new DBContext().getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, "%" + keyword + "%");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception ex) {
            Logger.getLogger(CategoryDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
    }

    public int getTotalProducts(int categoryId) {
        try {
            String sql = "select count(pro.proId) from Products pro where pro.ctId = ?";
            Connection conn = new DBContext().getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, categoryId);
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
