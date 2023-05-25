/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package nhannt.tbl_order;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import javax.naming.NamingException;
import nhannt.connection.myConnection;

/**
 *
 * @author Trung Nhan
 */
public class tbl_orderDAO implements Serializable{
    private List<tbl_orderDTO> listOrder;
    public List<tbl_orderDTO> getListOrder() throws SQLException, NamingException{
        return listOrder;
    }
    public void searchDeliOrder(Timestamp fromDate, Timestamp toDate, boolean isDeli) throws SQLException, NamingException{
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try{
            con = myConnection.getConnection();
            if (con != null) {
                String sql = "Select * "
                        + "From tbl_order "
                        + "Where (orderDate between ? and ?) and isDeliver = ?";
                stm = con.prepareStatement(sql);
                stm.setTimestamp(1, fromDate);
                stm.setTimestamp(2, toDate);
                stm.setBoolean(3, isDeli);
                rs = stm.executeQuery();
                while (rs.next()) {      
                    System.out.println("Has Result !!!");
                    String orderID = rs.getString("orderID");
                    Timestamp orderDate = rs.getTimestamp("orderDate");
                    String custID = rs.getString("custID");
                    float total = rs.getFloat("total");
                    boolean isDelivered  = rs.getBoolean("isDeliver");
                    String reason = rs.getString("Reason");
                    tbl_orderDTO dto = new tbl_orderDTO(orderID, orderDate, custID, total, isDelivered, reason);
                    if (this.listOrder == null) {
                        this.listOrder = new ArrayList<>();
                    }
                    this.listOrder.add(dto);
                }
                
            }
        }finally{
            if (rs != null) {
                rs.close();
            }
            
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }
        }
    }
     
}
