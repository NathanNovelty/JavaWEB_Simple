/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package nhannt.customer;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.naming.NamingException;
import nhannt.connection.myConnection;

/**
 *
 * @author Trung Nhan
 */
public class customerDAO implements Serializable{
    public boolean checkLogin(String custID, String password) throws SQLException, NamingException{
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try{
            con = myConnection.getConnection();
            if (con != null) {
                String sql = "Select custID, password From customer Where custID = ? and password =?";
                stm = con.prepareStatement(sql);
                stm.setString(1, custID);
                stm.setString(2, password);
                rs = stm.executeQuery();
                if (rs.next()) {
                    return true;
                }
                
            }
        }finally{
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return false;
    }
    
    public boolean insertNewCus(String custID, String password, String custName, String lastName, 
            String middleName, String address, String phone, int custLevel) throws  SQLException, NamingException{
        Connection con = null;
        PreparedStatement stm = null;
        try{
            con = myConnection.getConnection();
            if (con != null) {
                String sql = "Insert into customer Values (?,?,?,?,?,?,?,?)";
                stm = con.prepareStatement(sql);
                stm.setString(1, custID);
                stm.setString(2, password);
                stm.setString(3, custName);
                stm.setString(4, lastName);
                stm.setString(5, middleName);
                stm.setString(6, address);
                stm.setString(7, phone);
                stm.setInt(8, custLevel);
                int row = stm.executeUpdate();
                if (row > 0 ) {
                    return true;
                }
            }
        }finally{
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }
        }
        
        return false;
        
    }
    
    public boolean checkExistCustID(String custID) throws SQLException, NamingException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try{
            con = myConnection.getConnection();
            if (con != null) {
                String sql = "Select custID from customer Where custID = ?";
                stm = con.prepareStatement(sql);
                stm.setString(1, custID);
                rs = stm.executeQuery();
                if (rs.next()) {
                    return true;
                }
            }
        }finally{
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }
        }
        
        return false;
    }
}
