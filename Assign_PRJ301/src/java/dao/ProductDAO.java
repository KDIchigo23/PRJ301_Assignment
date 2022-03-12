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
                Product product = Product.builder()
                        .proId(rs.getInt(1))
                        .pId(rs.getInt(2))
                        .proName(rs.getString(3))
                        .pName(rs.getString(4))
                        .proDescription(rs.getString(5))
                        .proQuantity(rs.getInt(6))
                        .proPrice(rs.getFloat(7))
                        .proImg_url(rs.getString(8))
                        .ctId(rs.getInt(9))
                        .ctName(rs.getString(10))
                        .build();
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
                Product product = Product.builder()
                        .proId(rs.getInt(1))
                        .pId(rs.getInt(2))
                        .proName(rs.getString(3))
                        .pName(rs.getString(4))
                        .proDescription(rs.getString(5))
                        .proQuantity(rs.getInt(6))
                        .proPrice(rs.getFloat(7))
                        .proImg_url(rs.getString(8))
                        .ctId(rs.getInt(9))
                        .ctName(rs.getString(10))
                        .build();
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
                Product product = Product.builder()
                        .proId(rs.getInt(1))
                        .pId(rs.getInt(2))
                        .proName(rs.getString(3))
                        .pName(rs.getString(4))
                        .proDescription(rs.getString(5))
                        .proQuantity(rs.getInt(6))
                        .proPrice(rs.getFloat(7))
                        .proImg_url(rs.getString(8))
                        .ctId(rs.getInt(9))
                        .ctName(rs.getString(10))
                        .build();
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
                Product product = Product.builder()
                        .proId(rs.getInt(1))
                        .pId(rs.getInt(2))
                        .proName(rs.getString(3))
                        .pName(rs.getString(4))
                        .proDescription(rs.getString(5))
                        .proQuantity(rs.getInt(6))
                        .proPrice(rs.getFloat(7))
                        .proImg_url(rs.getString(8))
                        .ctId(rs.getInt(9))
                        .ctName(rs.getString(10))
                        .build();
                return product;
            }
        } catch (Exception ex) {
            Logger.getLogger(CategoryDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public List<Product> getPlayerByCategoryId(int categoryId) {
        List<Product> list = new ArrayList<>();
        try {
            String sql = "select p.pId, p.pName from Players p inner join Products pro\n"
                    + "on p.pId = pro.pId and pro.ctId = ? group by p.pId, p.pName";
            //Mở kết nối với sql server
            Connection conn = new DBContext().getConnection();

            //Đưa câu sql vào prepareStatement 
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, categoryId);
            //Thực thi câu lệnh sql sẽ trả về result set
            ResultSet rs = ps.executeQuery();

            //Lặp rs để lấy data
            while (rs.next()) {
                Product product = Product.builder()
                        .pId(rs.getInt(1))
                        .pName(rs.getString(2))
                        .build();
                list.add(product);
            }

        } catch (Exception ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

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
                Product product = Product.builder()
                        .proId(rs.getInt(1))
                        .pId(rs.getInt(2))
                        .proName(rs.getString(3))
                        .pName(rs.getString(4))
                        .proDescription(rs.getString(5))
                        .proQuantity(rs.getInt(6))
                        .proPrice(rs.getFloat(7))
                        .proImg_url(rs.getString(8))
                        .ctId(rs.getInt(9))
                        .ctName(rs.getString(10))
                        .build();
                list.add(product);
            }
        } catch (Exception ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public List<Product> getProductsWithPagging(int page, int PAGE_SIZE) {
        List<Product> list = new ArrayList<>();
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
                Product product = Product.builder()
                        .proId(rs.getInt(2))
                        .pId(rs.getInt(3))
                        .proName(rs.getString(4))
                        .proDescription(rs.getString(5))
                        .proQuantity(rs.getInt(6))
                        .proPrice(rs.getFloat(7))
                        .proImg_url(rs.getString(8))
                        .ctId(rs.getInt(9))
                        .build();
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
                Product product = Product.builder()
                        .proId(rs.getInt(2))
                        .pId(rs.getInt(3))
                        .proName(rs.getString(4))
                        .pName(rs.getString(5))
                        .proDescription(rs.getString(6))
                        .proQuantity(rs.getInt(7))
                        .proPrice(rs.getFloat(8))
                        .proImg_url(rs.getString(9))
                        .ctId(rs.getInt(10))
                        .ctName(rs.getString(11))
                        .build();
                list.add(product);
            }

        } catch (Exception ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public List<Product> getProductByTeamIdAndPagging(int teamId, int page, int PAGE_SIZE) {
        List<Product> list = new ArrayList<>();
        try {
            String sql = "with t as (select ROW_NUMBER() over (order by pro.proId asc) as r,\n"
                    + "pro.proId, pro.pId, pro.proName, p.pName, \n"
                    + "pro.proDescription, pro.proQuantity, pro.proPrice,\n"
                    + "pro.proImg_url, ct.ctId, ct.ctName from Products pro \n"
                    + "inner join Category ct on pro.ctId = ct.ctId \n"
                    + "inner join Players p on pro.pId = p.pId and p.tId = ?)\n"
                    + "select * from t where r between ?*?-(?-1) and ?*? ";
            //Mở kết nối với sql server
            Connection conn = new DBContext().getConnection();

            //Đưa câu sql vào prepareStatement 
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, teamId);
            ps.setInt(2, page);
            ps.setInt(3, PAGE_SIZE);
            ps.setInt(4, PAGE_SIZE);
            ps.setInt(5, page);
            ps.setInt(6, PAGE_SIZE);
            //Thực thi câu lệnh sql sẽ trả về result set
            ResultSet rs = ps.executeQuery();

            //Lặp rs để lấy data
            while (rs.next()) {
                Product product = Product.builder()
                        .proId(rs.getInt(2))
                        .pId(rs.getInt(3))
                        .proName(rs.getString(4))
                        .pName(rs.getString(5))
                        .proDescription(rs.getString(6))
                        .proQuantity(rs.getInt(7))
                        .proPrice(rs.getFloat(8))
                        .proImg_url(rs.getString(9))
                        .ctId(rs.getInt(10))
                        .ctName(rs.getString(11))
                        .build();
                list.add(product);
            }

        } catch (Exception ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public List<Product> getProductsWithPaggingAndSearch(String keyword, int page, int PAGE_SIZE) {
        List<Product> list = new ArrayList<>();
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
                Product product = Product.builder()
                        .proId(rs.getInt(2))
                        .pId(rs.getInt(3))
                        .proName(rs.getString(4))
                        .proDescription(rs.getString(5))
                        .proQuantity(rs.getInt(6))
                        .proPrice(rs.getFloat(7))
                        .proImg_url(rs.getString(8))
                        .ctId(rs.getInt(9))
                        .build();
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

    public int getTotalProductsByCategoryId(int categoryId) {
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

    public int getTotalProductsByTeamId(int teamId) {
        try {
            String sql = "select count(pro.proId) from Products pro \n"
                    + "inner join Players p on p.pId = pro.pId where p.tId = ?";
            Connection conn = new DBContext().getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, teamId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception ex) {
            Logger.getLogger(CategoryDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
    }

    public int getProQuantityByProId(int proId) {
        try {
            String sql = "select proQuantity from Products where proId = ?";
            Connection conn = new DBContext().getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, proId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception ex) {
            Logger.getLogger(CategoryDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
    }

    public void updateQuantityByProId(int updateQuantity, int proId) {
        try {
            String sql = "update Products set proQuantity = ? where proId = ?";
            Connection conn = new DBContext().getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, updateQuantity);
            ps.setInt(2, proId);
            ps.executeUpdate();

        } catch (Exception ex) {
            Logger.getLogger(CategoryDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public Product checkProductExist(String proName) {
        String sql = "select * from Products where proName = ?";
        try {

            //Mở kết nối với sql server
            Connection conn = new DBContext().getConnection();

            //Đưa câu sql vào prepareStatement 
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, proName);
            //Thực thi câu lệnh sql sẽ trả về result set
            ResultSet rs = ps.executeQuery();

            //Lặp rs để lấy data
            while (rs.next()) {
                return Product.builder()
                        .proId(rs.getInt(1))
                        .pId(rs.getInt(2))
                        .proName(rs.getString(3))
                        .proDescription(rs.getString(4))
                        .proQuantity(rs.getInt(5))
                        .proPrice(rs.getFloat(6))
                        .proImg_url(rs.getString(7))
                        .ctId(rs.getInt(8))
                        .build();
            }

        } catch (Exception ex) {
            Logger.getLogger(PlayerDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public void createProduct(String proImg_url, String proName, int teamId, int playerId, String proDescription, int proQuantity, float proPrice, int categoryId) {
        String sql = "INSERT INTO [Assign_PRJ301].[dbo].[Products]\n"
                + "           ([pId]\n"
                + "           ,[proName]\n"
                + "           ,[proDescription]\n"
                + "           ,[proQuantity]\n"
                + "           ,[proPrice]\n"
                + "           ,[proImg_url]\n"
                + "           ,[ctId])\n"
                + "     VALUES\n"
                + "           (?,?,?,?,?,?,?)";
        try {

            //Mở kết nối với sql server
            Connection conn = new DBContext().getConnection();

            //Đưa câu sql vào prepareStatement 
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, playerId);
            ps.setString(2, proName);
            ps.setString(3, proDescription);
            ps.setInt(4, proQuantity);
            ps.setFloat(5, proPrice);
            ps.setString(6, proImg_url);
            ps.setInt(7, categoryId);
            //Thực thi câu lệnh sql sẽ trả về result set
            ps.executeUpdate();

        } catch (Exception ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void deleteProductByProductId(int productId) {
        String sql = "DELETE FROM [Assign_PRJ301].[dbo].[Products]\n"
                + "      WHERE proId = ? ";
        try {

            //Mở kết nối với sql server
            Connection conn = new DBContext().getConnection();

            //Đưa câu sql vào prepareStatement 
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, productId);
            //Thực thi câu lệnh sql sẽ trả về result set
            ps.executeUpdate();

        } catch (Exception ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public int getTeamIdByProductId(int productId) {
        try {
            String sql = "select tId from Products pro\n"
                    + "inner join Players p on p.pId = pro.pId\n"
                    + "where pro.proId = ? ";
            Connection conn = new DBContext().getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, productId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception ex) {
            Logger.getLogger(CategoryDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
    }

    public void updateProduct(int productId, String proImg_url, String proName, int playerId, int proQuantity, float proPrice, int categoryId, String proDescription) {
        String sql = "UPDATE [Assign_PRJ301].[dbo].[Products]\n"
                + "   SET [pId] = ?\n"
                + "      ,[proName] = ?\n"
                + "      ,[proDescription] = ?\n"
                + "      ,[proQuantity] = ?\n"
                + "      ,[proPrice] = ?\n"
                + "      ,[proImg_url] = ?\n"
                + "      ,[ctId] = ?\n"
                + " WHERE proId = ?";
        try {

            //Mở kết nối với sql server
            Connection conn = new DBContext().getConnection();

            //Đưa câu sql vào prepareStatement 
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, playerId);
            ps.setString(2, proName);
            ps.setString(3, proDescription);
            ps.setInt(4, proQuantity);
            ps.setFloat(5, proPrice);
            ps.setString(6, proImg_url);
            ps.setInt(7, categoryId);
            ps.setInt(8, productId);

            //Thực thi câu lệnh sql sẽ trả về result set
            ps.executeUpdate();

        } catch (Exception ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

}
