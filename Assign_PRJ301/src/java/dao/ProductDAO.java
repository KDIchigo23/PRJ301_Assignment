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

    public List<Product> getAllProduccts() {
        List<Product> list = new ArrayList<>();
        try {
            String sql = "select pro.proId, pro.proName, pro.proDescription, pro.proQuantity, \n"
                    + "pro.proPrice, p.pId, p.pName, pro.proImg_url \n"
                    + "from Products pro inner join Players p\n"
                    + "on pro.pId = p.pId";
            Connection conn = new DBContext().getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Product product = new Product(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getInt(4), rs.getFloat(5), rs.getInt(6), rs.getString(7), rs.getString(8));
                list.add(product);
            }
        } catch (Exception ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

}
