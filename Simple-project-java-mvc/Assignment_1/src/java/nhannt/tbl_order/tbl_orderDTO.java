/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package nhannt.tbl_order;

import java.io.Serializable;
import java.sql.Timestamp;

/**
 *
 * @author Trung Nhan
 */
public class tbl_orderDTO implements Serializable{
    private String orderID;
    private Timestamp datetime;
    private String custID;
    private float total;
    private boolean isDeliver;
    private String reason;

    public tbl_orderDTO() {
    }

    public tbl_orderDTO(String orderID, Timestamp datetime, String custID, float total, boolean isDeliver, String reason) {
        this.orderID = orderID;
        this.datetime = datetime;
        this.custID = custID;
        this.total = total;
        this.isDeliver = isDeliver;
        this.reason = reason;
    }

    public String getOrderID() {
        return orderID;
    }

    public void setOrderID(String orderID) {
        this.orderID = orderID;
    }

    public Timestamp getDatetime() {
        return datetime;
    }

    public void setDatetime(Timestamp datetime) {
        this.datetime = datetime;
    }

    public String getCustID() {
        return custID;
    }

    public void setCustID(String custID) {
        this.custID = custID;
    }

    public float getTotal() {
        return total;
    }

    public void setTotal(float total) {
        this.total = total;
    }

    public boolean isIsDeliver() {
        return isDeliver;
    }

    public void setIsDeliver(boolean isDeliver) {
        this.isDeliver = isDeliver;
    }

    public String getReason() {
        return reason;
    }

    public void setReason(String reason) {
        this.reason = reason;
    }
    
}
