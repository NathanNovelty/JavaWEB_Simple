<%-- 
    Document   : ViewDetail
    Created on : Mar 17, 2018, 2:34:54 PM
    Author     : Trung Nhan
--%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View Detail Page</title>
<!--        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" 
              integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">-->
        <style>
            #welcome{
                font-size: 1.2em;
                font-family: sans-serif;
                color: blue;
                margin-left: 5%;
            }
            h2{
                color: darkblue;
                font-size: 2.5em;
                margin-bottom: 3%;
            }
            #set_label{
                font-size: 1.3em;
                margin-right:2%;
                font-weight: bold;
            }

            span{
                color: deeppink;
                font-size: 1.2em;
                margin-right: 1%;
                
            }
            h4{
                color: darkorange;
            }
            a{
                margin-left: 5%;
            }
        </style>

    </head>
    <body>
        <p id="welcome">
            Welcome, ${sessionScope.CUSTID}
        </p>
        <c:url var="logOut" value="logOut">
            <c:param name="btnAction" value="logOut" />
        </c:url><a href="${logOut}">Log Out</a>
        <div class="container">
            <div class="row">
                <h2>Order Detail</h2>

            </div>
            <c:set var="result" value="${requestScope.LOADCUSTINFO}" />
            <c:forEach var="dto" items="${pageScope.result}">
                <label id="set_label"> OrderID: </label> <span>${dto.orderID}</span>
                <label id="set_label" > Date: </label> <span>${dto.orderDate}</span> 
                <br/>
                <label id="set_label">Customer: </label> <span>${dto.custName}</span> 
                <label id="set_label">Phone: </label>  <span>${dto.phone}</span>
                <br/>
                <label id="set_label">Address: </label><span>${dto.address}</span> 
            </c:forEach>
            <br/>
            <h4>Details:</h4> 
            <c:set var="rs" value="${requestScope.LOADORDERDETAIL}" />
            <table class="table table-hover " border="1">
                <thead class="thead-dark">
                    <tr>
                        <th>No.</th>
                        <th>Product</th>
                        <th>Quantity</th>
                        <th>Price</th>
                        <th>Total</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="child" items="${pageScope.rs}" varStatus="counter">
                        <tr>
                            <th scope="row">${counter.count}</th>
                            <td>${child.productID}</td>
                            <td>${child.quantity}</td>
                            <td>${child.unitPrice}</td>
                            <td>${child.total}</td>
                            
                        </tr>
                    </c:forEach>
                    <c:set var="price" value="${requestScope.TOTALPRICE}" />
                        <tr>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <th scope="row">Total: ${price}</th>
                        </tr>
                </tbody>
            </table>
            



        </div>
    </body>
</html>
