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
import model.Team;

/**
 *
 * @author ADMIN
 */
public class TeamDAO {

    public List<Team> getAllTeams() {
        List<Team> list = new ArrayList<>();
        try {
            String sql = "select * from Team";
            Connection conn = new DBContext().getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Team team = Team.builder()
                        .tId(rs.getInt(1))
                        .tName(rs.getString(2))
                        .gId(rs.getInt(3))
                        .build();
                list.add(team);
            }
        } catch (Exception ex) {
            Logger.getLogger(TeamDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

}
