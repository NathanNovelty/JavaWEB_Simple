/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package nhannt.tbl_orderDetail;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.naming.NamingException;
import nhannt.connection.myConnection;

/**
 *
 * @author Trung Nhan
 */
public class tbl_orderDetailDAO implements Serializable {

    private List<tbl_orderDetailDTO> listOrderDetail;

    public List<tbl_orderDetailDTO> getListOrderDetail() throws SQLException, NamingException {
        return listOrderDetail;
    }

    public void loadListOrderDetail(String orderID) throws SQLException, NamingException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            con = myConnection.getConnection();
            if (con != null) {
                String sql = "Select  productID, quantity, unitPrice, total From tbl_orderDetail Where orderID = ?";
                stm = con.prepareStatement(sql);
                stm.setString(1, orderID);
                rs = stm.executeQuery();
                while (rs.next()) {
                    String productID = rs.getString("productID");
                    int quantity = rs.getInt("quantity");
                    float unitPrice = rs.getFloat("unitPrice");
                    float total = rs.getFloat("total");
                    tbl_orderDetailDTO dto = new tbl_orderDetailDTO(productID, quantity, unitPrice, total);
                    if (this.listOrderDetail == null) {
                        this.listOrderDetail = new ArrayList<>();
                    }
                    this.listOrderDetail.add(dto);
                }
            }
        } finally {
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

    public float sumTotalPrice(String orderID) throws SQLException, NamingException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            con = myConnection.getConnection();
            if (con != null) {
                String sql = "Select SUM(Total) AS TOTALPRICE From tbl_orderDetail Where orderID = ?";
                stm = con.prepareStatement(sql);
                stm.setString(1, orderID);
                rs = stm.executeQuery();
                if (rs.next()) {
                    float totalPrice = rs.getFloat("TOTALPRICE");
                    return totalPrice;
                }
            }
        } finally {
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
        return -1;
    }
}
