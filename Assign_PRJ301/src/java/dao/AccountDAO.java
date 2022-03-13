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
import model.Account;

public class AccountDAO {

    public List<Account> getAllAccounts() {
        List<Account> list = new ArrayList<>();
        try {
            String sql = "select * from Account where aRole = 'USER' and isDeleted <> 1";
            //Mở kết nối với sql server
            Connection conn = new DBContext().getConnection();

            //Đưa câu sql vào prepareStatement 
            PreparedStatement ps = conn.prepareStatement(sql);

            //Thực thi câu lệnh sql sẽ trả về result set
            ResultSet rs = ps.executeQuery();

            //Lặp rs để lấy data
            while (rs.next()) {
                Account account = Account.builder()
                        .aId(rs.getInt(1))
                        .aUsername(rs.getString(2))
                        .aPassword(rs.getString(3))
                        .aDisplayName(rs.getString(4))
                        .aAddress(rs.getString(5))
                        .aEmail(rs.getString(6))
                        .aPhone(rs.getString(7))
                        .aRole(rs.getString(8))
                        .build();
                list.add(account);
            }

        } catch (Exception ex) {
            Logger.getLogger(AllStarDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public Account login(String username, String password) {
        String sql = "select * from Account a where a.aUsername = ? "
                + "and a.aPassword = ? and isDeleted <> 1 ";
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
                        .aRole(rs.getString(8))
                        .build();
            }

        } catch (Exception ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public Account checkAccountExist(String username) {
        String sql = "select * from Account where aUsername = ? and isDeleted <> 1 ";
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
                        .aId(rs.getInt(1))
                        .aUsername(rs.getString(2))
                        .aPassword(rs.getString(3))
                        .aDisplayName(rs.getString(4))
                        .aAddress(rs.getString(5))
                        .aEmail(rs.getString(6))
                        .aPhone(rs.getString(7))
                        .aRole(rs.getString(8))
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
                + "           ,[aRole])\n"
                + "     VALUES\n"
                + "           ( ? , ? , ? ,'','','','USER')";
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

    public int getAccountIdByUserAndPass(String accountUser, String accountPass) {
        try {
            String sql = "select aId from Account where aUsername = ? and aPassword = ?  and isDeleted <> 1 ";
            Connection conn = new DBContext().getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, accountUser);
            ps.setString(2, accountPass);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception ex) {
            Logger.getLogger(CategoryDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
    }

    public String updateUser(String name, int accountId) {
        String sql = "UPDATE [Assign_PRJ301].[dbo].[Account]\n"
                + "   SET [aUsername] = ?\n"
                + " WHERE aId = ?";
        try {

            //Mở kết nối với sql server
            Connection conn = new DBContext().getConnection();

            //Đưa câu sql vào prepareStatement 
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, name);
            ps.setInt(2, accountId);
            //Thực thi câu lệnh sql sẽ trả về result set
            ps.executeUpdate();

        } catch (Exception ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public void updateUser(int accountId, String username) {
        String sql = "UPDATE [Assign_PRJ301].[dbo].[Account]\n"
                + "   SET [aUsername] = ? \n"
                + " WHERE aId = ? ";
        try {

            //Mở kết nối với sql server
            Connection conn = new DBContext().getConnection();

            //Đưa câu sql vào prepareStatement 
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, username);
            ps.setInt(2, accountId);
            //Thực thi câu lệnh sql sẽ trả về result set
            ps.executeUpdate();

        } catch (Exception ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void updateAccount(int accountId, String password, String displayname, String address, String email, String phone) {
        String sql = "UPDATE [Assign_PRJ301].[dbo].[Account]\n"
                + "   SET [aPassword] = ?\n"
                + "      ,[aDisplayName] = ?\n"
                + "      ,[aAddress] = ?\n"
                + "      ,[aEmail] = ?\n"
                + "      ,[aPhone] = ?\n"
                + " WHERE aId = ?";
        try {

            //Mở kết nối với sql server
            Connection conn = new DBContext().getConnection();

            //Đưa câu sql vào prepareStatement 
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, password);
            ps.setString(2, displayname);
            ps.setString(3, address);
            ps.setString(4, email);
            ps.setString(5, phone);
            ps.setInt(6, accountId);
            //Thực thi câu lệnh sql sẽ trả về result set
            ps.executeUpdate();

        } catch (Exception ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public int getTotalAccount() {
        try {
            String sql = "select count(aId) from Account where aRole = 'USER' and isDeleted <> 1 ";
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

    public void deleteAccountByAccountId(int accountId) {
        String sql = "UPDATE [Assign_PRJ301].[dbo].[Account]\n"
                + "   SET [isDeleted] = 1 \n"
                + " WHERE aId = ?";
        try {

            Connection conn = new DBContext().getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, accountId);
            ps.executeUpdate();

        } catch (Exception ex) {
            Logger.getLogger(CategoryDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

}
