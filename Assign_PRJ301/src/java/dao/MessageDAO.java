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
import model.Message;

/**
 *
 * @author ADMIN
 */
public class MessageDAO {

    public List<Message> getAllMessageAndPagging(int page, int PAGE_SIZE) {
        List<Message> list = new ArrayList<>();
        try {
            String sql = "with t as (select ROW_NUMBER() over (order by m.mId asc) as r, \n"
                    + "a.aId, a.aDisplayName, m.mMessage, m.mCreated_date \n"
                    + "from Message m inner join Account a on a.aId = m.aId)\n"
                    + "select * from t where r between ?*?-(?-1) and ?*?";
            //Mở kết nối với sql server
            Connection conn = new DBContext().getConnection();

            //Đưa câu sql vào prepareStatement 
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, page);
            ps.setInt(2, PAGE_SIZE);
            ps.setInt(3, PAGE_SIZE);
            ps.setInt(4, page);
            ps.setInt(5, PAGE_SIZE);
            //Thực thi câu lệnh sql sẽ trả về result set
            ResultSet rs = ps.executeQuery();

            //Lặp rs để lấy data
            while (rs.next()) {
                Message message = Message.builder()
                        .aId(rs.getInt(2))
                        .aDisplayName(rs.getString(3))
                        .mMessage(rs.getString(4))
                        .mCreated_date(rs.getString(5))
                        .build();
                list.add(message);
            }

        } catch (Exception ex) {
            Logger.getLogger(MessageDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public void sendMessage(int accountId, String message) {
        try {
            String sql = "INSERT INTO [Assign_PRJ301].[dbo].[Message]\n"
                    + "           ([aId]\n"
                    + "           ,[mMessage])\n"
                    + "     VALUES\n"
                    + "           (?,?)";
            Connection conn = new DBContext().getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, accountId);
            ps.setString(2, message);
            ps.executeUpdate();
            
        } catch (Exception ex) {
            Logger.getLogger(CategoryDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public int getTotalMessage() {
        try {
            String sql = "select count(mMessage) from Message";
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

    
}
