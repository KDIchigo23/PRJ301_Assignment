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
import model.AllStar;

/**
 *
 * @author ADMIN
 */
public class AllStarDAO {

    public List<AllStar> getAllAllStarLebrons() {
        List<AllStar> list = new ArrayList<>();
        try {
            String sql = "select ap.apId, ap.apName, ap.apPTS, ap.apRules, \n"
                    + "p.pPosition, p.pNo, t.tName, ap.apImg_url \n"
                    + "from AllStar_Players_2022 ap inner join Players p\n"
                    + "on ap.pId = p.pId inner join Team t \n"
                    + "on ap.tId = t.tId and ap.apGroup = 'Team Lebron'";
            //Mở kết nối với sql server
            Connection conn = new DBContext().getConnection();

            //Đưa câu sql vào prepareStatement 
            PreparedStatement ps = conn.prepareStatement(sql);

            //Thực thi câu lệnh sql sẽ trả về result set
            ResultSet rs = ps.executeQuery();

            //Lặp rs để lấy data
            while (rs.next()) {
//                AllStar allstar = new AllStar(rs.getInt(1), rs.getString(2), rs.getInt(3), rs.getString(4), rs.getString(5), rs.getInt(6), rs.getString(7), rs.getString(8));
                AllStar allstar = AllStar.builder()
                        .apId(rs.getInt(1))
                        .apName(rs.getString(2))
                        .apPTS(rs.getInt(3))
                        .apRules(rs.getString(4))
                        .pPosition(rs.getString(5))
                        .pNo(rs.getInt(6))
                        .tName(rs.getString(7))
                        .apImg_url(rs.getString(8))
                        .build();
                list.add(allstar);
            }

        } catch (Exception ex) {
            Logger.getLogger(AllStarDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public List<AllStar> getAllAllStarDurants() {
        List<AllStar> list = new ArrayList<>();
        try {
            String sql = "select ap.apId, ap.apName, ap.apPTS, ap.apRules, \n"
                    + "p.pPosition, p.pNo, t.tName, ap.apImg_url \n"
                    + "from AllStar_Players_2022 ap inner join Players p\n"
                    + "on ap.pId = p.pId inner join Team t \n"
                    + "on ap.tId = t.tId and ap.apGroup = 'Team Durant'";
            //Mở kết nối với sql server
            Connection conn = new DBContext().getConnection();

            //Đưa câu sql vào prepareStatement 
            PreparedStatement ps = conn.prepareStatement(sql);

            //Thực thi câu lệnh sql sẽ trả về result set
            ResultSet rs = ps.executeQuery();

            //Lặp rs để lấy data
            while (rs.next()) {
                AllStar allstar = AllStar.builder()
                        .apId(rs.getInt(1))
                        .apName(rs.getString(2))
                        .apPTS(rs.getInt(3))
                        .apRules(rs.getString(4))
                        .pPosition(rs.getString(5))
                        .pNo(rs.getInt(6))
                        .tName(rs.getString(7))
                        .apImg_url(rs.getString(8))
                        .build();
                list.add(allstar);
            }

        } catch (Exception ex) {
            Logger.getLogger(AllStarDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

}
