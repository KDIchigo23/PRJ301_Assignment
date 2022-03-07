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
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Account;

public class AccountDAO {

    public Account login(String username, String password) {
        String sql = "select a.aId, a.aUsername, a.aPassword, \n"
                    + "a.aDisplayName, a.isSell, a.isAdmin \n"
                    + "from Account a where a.aUsername = ? \n"
                    + "and a.aPassword = ?";
        try {
            
            //Mở kết nối với sql server
            Connection conn = new DBContext().getConnection();

            //Đưa câu sql vào prepareStatement 
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, username);
            ps.setString(2, password);
            //Thực thi câu lệnh sql sẽ trả về result set
            ResultSet rs = ps.executeQuery();

            //Lặp rs để lấy data
            while (rs.next()) {
                return Account.builder()
                        .aId(rs.getInt(1))
                        .aUsername(rs.getString(2))
                        .aPassword(rs.getString(3))
                        .aDisplayName(rs.getString(4))
                        .isSell(rs.getInt(5))
                        .isAdmin(rs.getInt(6))
                        .build();
            }

        } catch (Exception ex) {
            
        }
        return null;

    }

}
