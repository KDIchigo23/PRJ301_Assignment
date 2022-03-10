<%-- 
    Document   : AccountInfor
    Created on : Mar 9, 2022, 4:29:23 PM
    Author     : ADMIN
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Shop Homepage - Start Bootstrap Template</title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <!-- Bootstrap icons-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme CSS (includes Bootstrap)-->
        <link rel="stylesheet" href="css/Home.css">
        <link href="css/styles.css" rel="stylesheet"/>        
    </head>


    <body style="margin: 100px 10px 0px 10px !important">
        <header>
            <%@include file="components/navBarComponent.jsp" %>
        </header>
    <center>
        <div class="row" style="margin-bottom: 50px">
            <h1>Account Information</h1>
            <div class="col-6 mx-auto mt-2" style="border: 1px solid #ccc; border-radius: 5px; padding: 1rem">
                
                <form action="account-infor" method="POST">
                    <div class="mb-3 row">
                        <label for="username" class="form-label col-2">Username</label>
                        <input type="text" class="col-7" name="user" value="${sessionScope.account.getaUsername()}" readonly>
                        <a href="account-infor?accountUser=${sessionScope.account.getaUsername()}&accountPass=${sessionScope.account.getaPassword()}&accountId=${sessionScope.account.getaId()}&value=user"
                           class="btn btn-outline-success col-2 ms-2" style="padding: 6px 17px 6px 17px !important">Update</a>
                    </div>
                    <div class="mb-3 row">
                        <label for="password" class="form-label col-2">Password</label>
                        <input type="password" class="col-7" name="password" value="${sessionScope.account.getaPassword()}" readonly>
                        <a href="account-infor?accountUser=${sessionScope.account.getaUsername()}&accountPass=${sessionScope.account.getaPassword()}&accountId=${sessionScope.account.getaId()}&value=pass"  
                           class="btn btn-outline-success col-2 ms-2" style="padding: 6px 17px 6px 17px !important">Update</a>
                    </div>
                    <div class="mb-3 row">
                        <label for="phone" class="form-label col-2">Phone</label>
                        <input type="" class="col-7" name="phone">
                        <a href="account-infor?accountUser=${sessionScope.account.getaUsername()}&accountPass=${sessionScope.account.getaPassword()}" 
                           class="btn btn-outline-success col-2 ms-2" style="padding: 6px 17px 6px 17px !important">Update</a>
                    </div>
                    <div class="mb-3 row">
                        <label for="phone" class="form-label col-2">Phone</label>
                        <input type="text" class="col-7" name="phone">
                        <a href="account-infor?accountUser=${sessionScope.account.getaUsername()}&accountPass=${sessionScope.account.getaPassword()}" 
                           class="btn btn-outline-success col-2 ms-2" style="padding: 6px 17px 6px 17px !important">Update</a>
                    </div>
                    <div class="mb-3 row">
                        <label for="phone" class="form-label col-2">Phone</label>
                        <input type="text" class="col-7" name="phone">
                        <a href="account-infor?accountUser=${sessionScope.account.getaUsername()}&accountPass=${sessionScope.account.getaPassword()}" 
                           class="btn btn-outline-success col-2 ms-2" style="padding: 6px 17px 6px 17px !important">Update</a>
                    </div>
                    <div class="mb-3 row">
                        <label for="phone" class="form-label col-2">Phone</label>
                        <input type="text" class="col-7" name="phone">
                        <a href="account-infor?accountUser=${sessionScope.account.getaUsername()}&accountPass=${sessionScope.account.getaPassword()}" 
                           class="btn btn-outline-success col-2 ms-2" style="padding: 6px 17px 6px 17px !important">Update</a>
                    </div>
                </form>
            </div>
        </div>
    </center>
</body>
<footer>
    <%@include file="components/footerComponent.jsp" %>
</footer>
</html>
