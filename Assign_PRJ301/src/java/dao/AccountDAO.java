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
        String sql = "select * from Account a "
                + "where a.aUsername = ? and a.aPassword = ?";
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
                        .aAddress(rs.getString(5))
                        .aEmail(rs.getString(6))
                        .aPhone(rs.getString(7))
                        .isSell(rs.getInt(8))
                        .isAdmin(rs.getInt(9))
                        .build();
            }

        } catch (Exception ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public Account checkAccountExist(String username) {
        String sql = "select * from Account where aUsername = ?";
        try {

            //Mở kết nối với sql server
            Connection conn = new DBContext().getConnection();

            //Đưa câu sql vào prepareStatement 
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, username);
            //Thực thi câu lệnh sql sẽ trả về result set
            ResultSet rs = ps.executeQuery();

            //Lặp rs để lấy data
            while (rs.next()) {
                return Account.builder()
                        .aId(rs.getInt(1))
                        .aUsername(rs.getString(2))
                        .aPassword(rs.getString(3))
                        .aDisplayName(rs.getString(4))
                        .aAddress(rs.getString(5))
                        .aEmail(rs.getString(6))
                        .aPhone(rs.getString(7))
                        .isSell(rs.getInt(8))
                        .isAdmin(rs.getInt(9))
                        .build();
            }

        } catch (Exception ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public void signup(String username, String password, String displayname) {
        String sql = "INSERT INTO [Assign_PRJ301].[dbo].[Account]\n"
                + "           ([aUsername]\n"
                + "           ,[aPassword]\n"
                + "           ,[aDisplayName]\n"
                + "           ,[aAddress]\n"
                + "           ,[aEmail]\n"
                + "           ,[aPhone]\n"
                + "           ,[isSell]\n"
                + "           ,[isAdmin])\n"
                + "     VALUES\n"
                + "           (?, ?, ?, '', '', '', 0, 0)";
        try {

            //Mở kết nối với sql server
            Connection conn = new DBContext().getConnection();

            //Đưa câu sql vào prepareStatement 
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, username);
            ps.setString(2, password);
            ps.setString(3, displayname);
            //Thực thi câu lệnh sql sẽ trả về result set
            ps.executeUpdate();
        } catch (Exception ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
