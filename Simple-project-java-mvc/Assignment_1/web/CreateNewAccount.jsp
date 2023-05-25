<%-- 
    Document   : CreateNewAccount
    Created on : Mar 15, 2018, 5:36:17 PM
    Author     : Trung Nhan
--%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Create Account Page</title>
<!--        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" 
              integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">-->
        <style>

            .center-frame{
                width: 100%;
                height: 100vh;
                position: relative;
                /*background-color: yellow;*/
            }
            .center-child-frame{
                /*                background-color: burlywood;*/
                width: 65%;
                top: 50%;
                left: 50%;
                transform: translate(-50%, -50%);
                position: absolute;
            }
            .text-align-center{
                text-align: center;
            }
            .set-form{
                width: 45%;
                margin: auto;
                /*overflow-y: scroll;*/
                height: 100%;
            }
            .set-inside-form{
                margin: auto;
                width: 90%;
                height: 80%;
            }
            .set_btn{
                margin-top: 5%;
                width: 100%;
            }
            .set_btn input {
                margin-left: 20%;
                display: inline;
            }
            p{
                width: 100%;
                font-size: 1.5em;
            }
        </style>
    </head>
    <body>
        <div class="img-bg">
            <div class="container center-frame">
                <div class="row center-child-frame">
                    <div class="col-sm-12 text-align-center">
                        <h3 class="text-primary">Create New Account </h3>
                    </div>


                    <c:set var="error" value="${requestScope.ERRORPRIMARYKEY}" />
                    <div class="form-group">
                        <form action="createAccount" method="POST" onsubmit="return validateForm();" name="formAction">
                            <div class="set-form">
                                <div class="form-row set-inside-form">
                                    <label class="text-secondary">Customer ID</label>
                                    <input type="text" class="form-control " name="insertCustID" value="${param.insertCustID}" required maxlength="10" /> <br/>
                                    <c:if test="${error}">
                                        <p style="color: red">
                                            This Name Has Been Existed
                                        </p>
                                    </c:if>
                                    <label class="text-secondary">Password</label>
                                    <input type="password" class="form-control form-control-sm" name="insertPassword" value="" required maxlength="30"/> <br/>
                                    <label class="text-secondary">Confirm Password </label>
                                    <input type="password" class="form-control form-control-sm" name="confirmPassword" value="" required maxlength="30"/><br/>
                                    <label class="text-secondary">Customer Name </label>
                                    <input type="text" class="form-control form-control-sm" name="insertCustName" value="${param.insertCustName}" required maxlength="15"/><br/>
                                    <label class="text-secondary">Last Name </label>
                                    <input type="text" class="form-control form-control-sm" name="insertLastName" value="${param.insertLastName}" required maxlength="15"/> <br/>
                                    <label class="text-secondary">Middle Name </label>
                                    <input type="text" class="form-control form-control-sm" name="insertMiddleName" value="${param.insertMiddleName}" required maxlength="15"/><br/>
                                    <label class="text-secondary">Address</label>
                                    <input type="text" class="form-control form-control-sm" name="insertAddress" value="${param.insertAddress}" required maxlength="250"/> <br/>
                                    <label class="text-secondary">Phone </label>
                                    <input type="tel" class="form-control form-control-sm" name="insertPhone" value="${param.insertPhone}" min="0" step="1"  maxlength="11" required/><br/>
                                    <div class="set_btn">
                                        <input type="submit" class="btn btn-primary" name="btnAction" value="Insert" />
                                        <input type="reset" class="btn btn-warning" value="Reset" />
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <script type="text/javascript">
            function validateForm() {
                var password = document.formAction.insertPassword;
                var confirm = document.formAction.confirmPassword;
                if (password.value != confirm.value) {
                    window.alert("Confirm Password must be the same with Password");
                    password.focus();
                    return false;
                }
                return true;


            }

        </script>                           
    </body>
</html>
