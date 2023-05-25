/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package nhannt.customer_tbl_order;

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
public class customer_tbl_orderDAO implements Serializable{
    private List<customer_tbl_orderDTO> listCustInfo;
    public List<customer_tbl_orderDTO> getListCustInfo() throws SQLException, NamingException{
        return listCustInfo;
    }
    public void loadCustInfo(String orderID) throws SQLException, NamingException{
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try{
            con = myConnection.getConnection();
            if (con != null) {
                String sql = "Select o.orderID, o.orderDate, c.custName, c.phone, c.address "
                        + "From customer c, tbl_order o "
                        + "Where c.custID = o.custID and o.orderID = ?";
                stm = con.prepareStatement(sql);
                stm.setString(1, orderID);
                rs = stm.executeQuery();
                while (rs.next()) {                    
                    String orderId  = rs.getString("orderID");
                    Timestamp orderDate = rs.getTimestamp("orderDate");
                    String custName = rs.getString("custName");
                    String phone = rs.getString("phone");
                    String address = rs.getString("address");
                    customer_tbl_orderDTO dto = new customer_tbl_orderDTO(orderId, orderDate, custName, phone, address);
                    if (this.listCustInfo == null) {
                        this.listCustInfo = new ArrayList<>();
                    }
                    this.listCustInfo.add(dto);
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
