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

/**
 *
 * @author ADMIN
 */
public class PlayerDAO {

    public List<Player> getAllPlayers() {
        List<Player> list = new ArrayList<>();
        try {
            String sql = "select p.pId, p.pName, p.pDob, p.pPosition, \n"
                    + "p.pNo, t.tId, t.tName, p.pAchievement, p.pImg_url \n"
                    + "from Players p inner join Team t\n"
                    + "on p.tId = t.tId";
            Connection conn = new DBContext().getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Player player = new Player(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getInt(5), rs.getInt(6), rs.getString(7), rs.getString(8), rs.getString(9));
                list.add(player);
            }
        } catch (Exception ex) {
            Logger.getLogger(PlayerDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public List<Player> getPlayerByTeamId(int teamId) {
        List<Player> list = new ArrayList<>();
        try {
            String sql = "select p.pId, p.pName, p.pDob, p.pPosition, \n"
                    + "p.pNo, t.tId, t.tName, p.pAchievement, p.pImg_url \n"
                    + "from Players p inner join Team t\n"
                    + "on p.tId = t.tId and t.tId = ?";
            //Mở kết nối với sql server
            Connection conn = new DBContext().getConnection();

            //Đưa câu sql vào prepareStatement 
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, teamId);
            //Thực thi câu lệnh sql sẽ trả về result set
            ResultSet rs = ps.executeQuery();

            //Lặp rs để lấy data
            while (rs.next()) {
                Player player = new Player(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getInt(5), rs.getInt(6), rs.getString(7), rs.getString(8), rs.getString(9));
                list.add(player);
            }

        } catch (Exception ex) {
            Logger.getLogger(PlayerDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

}
