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
import model.Player;
import model.Product;

/**
 *
 * @author ADMIN
 */
public class PlayerDAO {

    public List<Player> getAllPlayers() {
        List<Player> list = new ArrayList<>();
        try {
            String sql = "select p.pId, p.pName, p.pDob, p.pPosition, p.pNo, \n"
                    + "t.tId, t.tName, p.pAchievement, p.pImg_url \n"
                    + "from Players p inner join Team t on p.tId = t.tId";
            Connection conn = new DBContext().getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
//                Player player = new Player(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4),
//                        rs.getInt(5), rs.getInt(6), rs.getString(7), rs.getString(8), rs.getString(9));
                Player player = Player.builder()
                        .pId(rs.getInt(1))
                        .pName(rs.getString(2))
                        .pDob(rs.getString(3))
                        .pPosition(rs.getString(4))
                        .pNo(rs.getInt(5))
                        .tId(rs.getInt(6))
                        .tName(rs.getString(7))
                        .pAchievement(rs.getString(8))
                        .pImg_url(rs.getString(9))
                        .build();
                list.add(player);
            }
        } catch (Exception ex) {
            Logger.getLogger(PlayerDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public List<Player> getPlayersByTeamId(int teamId) {
        List<Player> list = new ArrayList<>();
        try {
            String sql = "select p.pId, p.pName, p.pDob, p.pPosition, p.pNo, \n"
                    + "t.tId, t.tName, p.pAchievement, p.pImg_url\n"
                    + "from Players p inner join Team t \n"
                    + "on p.tId = t.tId where t.tId = ?";
            //Mở kết nối với sql server
            Connection conn = new DBContext().getConnection();

            //Đưa câu sql vào prepareStatement 
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, teamId);
            //Thực thi câu lệnh sql sẽ trả về result set
            ResultSet rs = ps.executeQuery();

            //Lặp rs để lấy data
            while (rs.next()) {
                Player player = Player.builder()
                        .pId(rs.getInt(1))
                        .pName(rs.getString(2))
                        .pDob(rs.getString(3))
                        .pPosition(rs.getString(4))
                        .pNo(rs.getInt(5))
                        .tId(rs.getInt(6))
                        .tName(rs.getString(7))
                        .pAchievement(rs.getString(8))
                        .pImg_url(rs.getString(9))
                        .build();
                list.add(player);
            }

        } catch (Exception ex) {
            Logger.getLogger(PlayerDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

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
                Product product = Product.builder()
                        .proId(rs.getInt(1))
                        .pId(rs.getInt(2))
                        .proName(rs.getString(3))
                        .pName(rs.getString(4))
                        .proDescription(rs.getString(5))
                        .proQuantity(rs.getInt(6))
                        .proPrice(rs.getInt(7))
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

    public List<Player> getPlayerWithPagging(int page, int PAGE_SIZE) {
        List<Player> list = new ArrayList<>();
        try {
            String sql = "with t as (select ROW_NUMBER() over (order by p.pId asc) as r,\n"
                    + "p.pId, p.pName, p.pDob, p.pPosition, p.pNo, \n"
                    + "t.tId, t.tName, p.pAchievement, p.pImg_url \n"
                    + "from Players p inner join Team t on p.tId = t.tId)\n"
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
                Player player = Player.builder()
                        .pId(rs.getInt(2))
                        .pName(rs.getString(3))
                        .pDob(rs.getString(4))
                        .pPosition(rs.getString(5))
                        .pNo(rs.getInt(6))
                        .tId(rs.getInt(7))
                        .tName(rs.getString(8))
                        .pAchievement(rs.getString(9))
                        .pImg_url(rs.getString(10))
                        .build();
                list.add(player);
            }
        } catch (Exception ex) {
            Logger.getLogger(PlayerDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public List<Player> getPlayerByTeamIdAndPagging(int teamId, int page, int PAGE_SIZE) {
        List<Player> list = new ArrayList<>();
        try {
            String sql = "with s as (select ROW_NUMBER() over (order by p.pId asc) as r,\n"
                    + "p.pId, p.pName, p.pDob, p.pPosition, p.pNo, \n"
                    + "t.tId, t.tName, p.pAchievement, p.pImg_url \n"
                    + "from Players p inner join Team t on p.tId = t.tId and p.tId = ?)\n"
                    + "select * from s where r between ?*?-(?-1) and ?*? ";
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
                Player player = Player.builder()
                        .pId(rs.getInt(2))
                        .pName(rs.getString(3))
                        .pDob(rs.getString(4))
                        .pPosition(rs.getString(5))
                        .pNo(rs.getInt(6))
                        .tId(rs.getInt(7))
                        .tName(rs.getString(8))
                        .pAchievement(rs.getString(9))
                        .pImg_url(rs.getString(10))
                        .build();
                list.add(player);
            }
        } catch (Exception ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public List<Player> getPlayersWithPaggingAndSearch(String keyword, int page, int PAGE_SIZE) {
        List<Player> list = new ArrayList<>();
        try {
            String sql = "with s as (select ROW_NUMBER() over (order by p.pId asc) as r,\n"
                    + "p.pId, p.pName, p.pDob, p.pPosition, p.pNo, \n"
                    + "t.tId, t.tName, p.pAchievement, p.pImg_url \n"
                    + "from Players p inner join Team t on p.tId = t.tId and p.pName like ?)\n"
                    + "select * from s where r between ?*?-(?-1) and ?*?";
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
                Player player = Player.builder()
                        .pId(rs.getInt(2))
                        .pName(rs.getString(3))
                        .pDob(rs.getString(4))
                        .pPosition(rs.getString(5))
                        .pNo(rs.getInt(6))
                        .tId(rs.getInt(7))
                        .tName(rs.getString(8))
                        .pAchievement(rs.getString(9))
                        .pImg_url(rs.getString(10))
                        .build();
                list.add(player);
            }
        } catch (Exception ex) {
            Logger.getLogger(CategoryDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public int getTotalPlayers() {
        try {
            String sql = "select count(pId) from Players";
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

    public int getTotalPlayers(int teamId) {
        try {
            String sql = "select count(p.pId) from Players p where p.tId = ?";
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

    public int getTotalPlayers(String keyword) {
        try {
            String sql = "select count(p.pId) from Players p where p.pName like ?";
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

}
