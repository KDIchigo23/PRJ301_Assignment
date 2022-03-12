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
            String sql = "select p.pId, p.pName, p.pDob, p.pPosition, pHeight, p.pNo, \n"
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
                        .pHeight(rs.getString(5))
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

    public List<Player> getPlayersByTeamId(int teamId) {
        List<Player> list = new ArrayList<>();
        try {
            String sql = "select p.pId, p.pName, p.pDob, p.pPosition, pHeight, p.pNo, \n"
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
                        .pHeight(rs.getString(5))
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

    public List<Player> getPlayerByPlayerId(int playerId) {
        List<Player> list = new ArrayList<>();
        try {
            String sql = "select p.pId, p.pName, p.pDob, p.pPosition, p.pHeight, p.pNo, \n"
                    + "t.tId, t.tName, p.pAchievement, p.pImg_url\n"
                    + "from Players p inner join Team t \n"
                    + "on p.tId = t.tId where p.pId = ?";
            //Mở kết nối với sql server
            Connection conn = new DBContext().getConnection();

            //Đưa câu sql vào prepareStatement 
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, playerId);
            //Thực thi câu lệnh sql sẽ trả về result set
            ResultSet rs = ps.executeQuery();

            //Lặp rs để lấy data
            while (rs.next()) {
                Player player = Player.builder()
                        .pId(rs.getInt(1))
                        .pName(rs.getString(2))
                        .pDob(rs.getString(3))
                        .pPosition(rs.getString(4))
                        .pHeight(rs.getString(5))
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

    public Player getOnlyPlayerByPlayerId(int playerId) {
        try {
            String sql = "select p.pId, p.pName, p.pDob, p.pPosition, p.pHeight, p.pNo, \n"
                    + "t.tId, t.tName, p.pAchievement, p.pImg_url\n"
                    + "from Players p inner join Team t \n"
                    + "on p.tId = t.tId where p.pId = ?";
            //Mở kết nối với sql server
            Connection conn = new DBContext().getConnection();

            //Đưa câu sql vào prepareStatement 
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, playerId);
            //Thực thi câu lệnh sql sẽ trả về result set
            ResultSet rs = ps.executeQuery();

            //Lặp rs để lấy data
            while (rs.next()) {
                return Player.builder()
                        .pId(rs.getInt(1))
                        .pName(rs.getString(2))
                        .pDob(rs.getString(3))
                        .pPosition(rs.getString(4))
                        .pHeight(rs.getString(5))
                        .pNo(rs.getInt(6))
                        .tId(rs.getInt(7))
                        .tName(rs.getString(8))
                        .pAchievement(rs.getString(9))
                        .pImg_url(rs.getString(10))
                        .build();
            }
        } catch (Exception ex) {
            Logger.getLogger(PlayerDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public List<Player> getPlayerWithPagging(int page, int PAGE_SIZE) {
        List<Player> list = new ArrayList<>();
        try {
            String sql = "with t as (select ROW_NUMBER() over (order by p.pId asc) as r,\n"
                    + "p.pId, p.pName, p.pDob, p.pPosition, pHeight, p.pNo, \n"
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
                        .pHeight(rs.getString(6))
                        .pNo(rs.getInt(7))
                        .tId(rs.getInt(8))
                        .tName(rs.getString(9))
                        .pAchievement(rs.getString(10))
                        .pImg_url(rs.getString(11))
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
                    + "p.pId, p.pName, p.pDob, p.pPosition, pHeight, p.pNo, \n"
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
                        .pHeight(rs.getString(6))
                        .pNo(rs.getInt(7))
                        .tId(rs.getInt(8))
                        .tName(rs.getString(9))
                        .pAchievement(rs.getString(10))
                        .pImg_url(rs.getString(11))
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
                    + "p.pId, p.pName, p.pDob, p.pPosition, p.pHeight,  p.pNo, \n"
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
                        .pHeight(rs.getString(6))
                        .pNo(rs.getInt(7))
                        .tId(rs.getInt(8))
                        .tName(rs.getString(9))
                        .pAchievement(rs.getString(10))
                        .pImg_url(rs.getString(11))
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

    public Player checkPlayerExist(String pName) {
        String sql = "select * from Players where pName = ?";
        try {

            //Mở kết nối với sql server
            Connection conn = new DBContext().getConnection();

            //Đưa câu sql vào prepareStatement 
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, pName);
            //Thực thi câu lệnh sql sẽ trả về result set
            ResultSet rs = ps.executeQuery();

            //Lặp rs để lấy data
            while (rs.next()) {
                return Player.builder()
                        .pId(rs.getInt(1))
                        .pName(rs.getString(2))
                        .pDob(rs.getString(3))
                        .tId(rs.getInt(4))
                        .pPosition(rs.getString(5))
                        .pHeight(rs.getString(6))
                        .pNo(rs.getInt(7))
                        .pAchievement(rs.getString(8))
                        .pImg_url(rs.getString(9))
                        .build();
            }

        } catch (Exception ex) {
            Logger.getLogger(PlayerDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public void createPlayer(String pImg_url, int teamId, String pName, String pHeight, String pDob, String pPosition, int pNo, String pAchievement) {
        String sql = "INSERT INTO [Assign_PRJ301].[dbo].[Players]\n"
                + "           ([pName]\n"
                + "           ,[pDob]\n"
                + "           ,[tId]\n"
                + "           ,[pPosition]\n"
                + "           ,[pHeight]\n"
                + "           ,[pNo]\n"
                + "           ,[pAchievement]\n"
                + "           ,[pImg_url])\n"
                + "     VALUES\n"
                + "           (?,?,?,?,?,?,?,?)";
        try {

            //Mở kết nối với sql server
            Connection conn = new DBContext().getConnection();

            //Đưa câu sql vào prepareStatement 
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, pName);
            ps.setString(2, pDob);
            ps.setInt(3, teamId);
            ps.setString(4, pPosition);
            ps.setString(5, pHeight);
            ps.setInt(6, pNo);
            ps.setString(7, pAchievement);
            ps.setString(8, pImg_url);
            //Thực thi câu lệnh sql sẽ trả về result set
            ps.executeUpdate();

        } catch (Exception ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void deletePlayerByPlayerId(int playerId) {
        String sql = "DELETE FROM [Assign_PRJ301].[dbo].[Players]\n"
                + "      WHERE pId = ? ";
        try {

            //Mở kết nối với sql server
            Connection conn = new DBContext().getConnection();

            //Đưa câu sql vào prepareStatement 
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, playerId);
            //Thực thi câu lệnh sql sẽ trả về result set
            ps.executeUpdate();

        } catch (Exception ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void updatePlayer(int playerId, String pImg_url, int teamId, String pName, String pHeight, String pDob, String pPosition, int pNo, String pAchievement) {
        String sql = "UPDATE [Assign_PRJ301].[dbo].[Players]\n"
                + "   SET [pName] = ?\n"
                + "      ,[pDob] = ?\n"
                + "      ,[tId] = ?\n"
                + "      ,[pPosition] = ?\n"
                + "      ,[pHeight] = ?\n"
                + "      ,[pNo] = ?\n"
                + "      ,[pAchievement] = ?\n"
                + "      ,[pImg_url] = ?\n"
                + " WHERE pId = ?";
        try {

            //Mở kết nối với sql server
            Connection conn = new DBContext().getConnection();

            //Đưa câu sql vào prepareStatement 
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, pName);
            ps.setString(2, pDob);
            ps.setInt(3, teamId);
            ps.setString(4, pPosition);
            ps.setString(5, pHeight);
            ps.setInt(6, pNo);
            ps.setString(7, pAchievement);
            ps.setString(8, pImg_url);
            ps.setInt(9, playerId);
            
            //Thực thi câu lệnh sql sẽ trả về result set
            ps.executeUpdate();

        } catch (Exception ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
   

    public int getTeamIdByPlayerId(int playerId) {
        try {
            String sql = "select p.tId from Players p where p.pId = ?";
            Connection conn = new DBContext().getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, playerId);
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
