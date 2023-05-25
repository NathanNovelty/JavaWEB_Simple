<%-- 
    Document   : Search
    Created on : Mar 14, 2018, 10:50:03 PM
    Author     : Trung Nhan
--%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Search Page</title>
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
                margin-right:3%;
            }

            #fromDate{
                color: deeppink;
                font-size: 1.2em;
                margin-right: 3%;
            }
            #toDate{
                color: deeppink;
                font-size: 1.2em;
            }
            #btn_Search{
                margin-top: 2%;
                margin-right: 2%;
            }
            a{
                margin-left: 5%;
            }
        </style>

    </head>
    <body>
        <p id="welcome">Welcome, ${sessionScope.CUSTID}<p>
            <c:url var="logOut" value="logOut">
                <c:param name="btnAction" value="logOut" />
            </c:url><a href="${logOut}">Log Out</a>
        <div class="container">

            <div class="row">
                <h2>Search Order</h2>
            </div>
            <!--Search Zone -->
            <form action="search" method="POST" onsubmit="return validateForm();" name="formAction">
                <div class="form-group">
                    <label id="set_label">From Date</label>
                    <input type="date" name="txtFromDate" value="${param.txtFromDate}" required /> <br/>
                    <label id="set_label">To Date </label>
                    <input type="date" name="txtToDate" value="${param.txtToDate}" required/><br/>
                    <div class="custom-control custom-checkbox">
                        <input type="checkbox" name="chkDelivered" value="chkDelivered" class="form-check-input set_deli" id="defaultCheck1"/>
                        <label class="form-check-label" for="defaultCheck1"> Delivered</label> <br/>
                    </div>
                    <input type="submit" name="btnAction" value="Search" id="btn_Search" class="btn btn-primary"/>

                    <input type="reset" value="Reset" id="btn_Search" class="btn btn-primary"/>
                </div>
            </form>
            <!--End Search Zone-->

            <!--Return Search Result-->
            <c:set var="searchValue" value="${param.txtFromDate}" />
            <c:if test="${not empty searchValue}">
                <c:set var="rs" value="${requestScope.LOADRESULT}" />
                <c:if test="${not empty rs}"> 
                    <h3 class="h3">Order List</h3>
                    <label style="font-weight: bold">From :</label> <span id="fromDate">${param.txtFromDate} </span>
                    <label style="font-weight: bold">To :</label> <span id="toDate">${param.txtToDate}</span><br/>
                    <h4>Result</h4>
                    <table class="table" border="1">
                        <thead class="thead-dark">
                            <tr>
                                <th scope="col">No.</th>
                                <th scope="col">Date</th>
                                <th scope="col">Total</th>
                                <th scope="col"> Customer</th>
                                <th scope="col">Action</th>
                                <th scope="col">Reason</th>
                                <th scope="col"></th>

                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="dto" items="${pageScope.rs}" varStatus="counter">
                                <tr>
                                    <th scope="row">${counter.count}</th>
                                    <td>${dto.datetime}
                                        <input type="hidden" name="orderID" value="${dto.orderID}" />
                                    </td>
                                    <td>${dto.total}</td>
                                    <td>${dto.custID}</td>
                                    <td>
                                        <input type="checkbox" name="chkDeli" value="chkDeli"
                                               <c:if test="${dto.isDeliver}">
                                                   checked="checked"
                                               </c:if> disabled="true"
                                               />
                                    </td>
                                    <td>${dto.reason}</td>
                                    <td>
                                        <c:url var="view" value="viewDetail">
                                            <c:param name="btnAction" value="viewDetail" />
                                            <c:param name="orderID" value="${dto.orderID}" />
                                        </c:url><a href="${view}">View Detail</a>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </c:if>
                <c:if test="${empty rs}">
                    <h3>No Record is Matched</h3>
                </c:if> 
            </c:if> 

        </div>
        <script type="text/javascript">
            function validateForm() {
                var fromDate = document.formAction.txtFromDate;
                var toDate = document.formAction.txtToDate;
                if (toDate.value < fromDate.value) {
                    window.alert("To Date can not less than from date");
                    fromDate.focus();
                    return false;
                }
                return true;
            }
        </script>
    </body>
</html>
