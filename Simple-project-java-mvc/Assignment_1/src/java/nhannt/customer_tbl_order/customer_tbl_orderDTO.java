/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package nhannt.customer_tbl_order;

import java.io.Serializable;
import java.sql.Timestamp;

/**
 *
 * @author Trung Nhan
 */
public class customer_tbl_orderDTO implements Serializable{
    private String orderID;
    private Timestamp orderDate;
    private String custName;
    private String phone;
    private String address;

    public customer_tbl_orderDTO() {
    }

    public customer_tbl_orderDTO(String orderID, Timestamp orderDate, String custName, String phone, String address) {
        this.orderID = orderID;
        this.orderDate = orderDate;
        this.custName = custName;
        this.phone = phone;
        this.address = address;
    }

    public String getOrderID() {
        return orderID;
    }

    public void setOrderID(String orderID) {
        this.orderID = orderID;
    }

    public Timestamp getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(Timestamp orderDate) {
        this.orderDate = orderDate;
    }

    public String getCustName() {
        return custName;
    }

    public void setCustName(String custName) {
        this.custName = custName;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }
    
    
}
