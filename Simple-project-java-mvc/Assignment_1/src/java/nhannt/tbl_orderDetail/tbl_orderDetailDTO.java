/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package nhannt.tbl_orderDetail;

import java.io.Serializable;

/**
 *
 * @author Trung Nhan
 */
public class tbl_orderDetailDTO implements Serializable{
    private String productID;
    private int quantity;
    private float unitPrice;
    private float total;
    private String orderID;

    public tbl_orderDetailDTO() {
    }

    public tbl_orderDetailDTO(String productID, int quantity, float unitPrice, float total) {
        this.productID = productID;
        this.quantity = quantity;
        this.unitPrice = unitPrice;
        this.total = total;
    }

    public String getProductID() {
        return productID;
    }

    public void setProductID(String productID) {
        this.productID = productID;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public float getUnitPrice() {
        return unitPrice;
    }

    public void setUnitPrice(float unitPrice) {
        this.unitPrice = unitPrice;
    }

    public float getTotal() {
        return total;
    }

    public void setTotal(float total) {
        this.total = total;
    }

    public String getOrderID() {
        return orderID;
    }

    public void setOrderID(String orderID) {
        this.orderID = orderID;
    }
    
}
