<%-- 
    Document   : Cart
    Created on : Mar 3, 2022, 8:59:59 PM
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


    <body style="margin: 80px 10px 0px 10px !important">
        <header>
            <%@include file="components/navBarComponent.jsp" %>
        </header>

        <div style="margin-bottom: 80px">
            <div class="container my-3">
                <table class="row" border="1" style="min-width: 60%;">
                    <thead>
                        <tr class="row mx-auto px-1 py-1">
                            <th class="col-2 text-center">Image</th>
                            <th class="col-3 text-center">Name</th>
                            <th class="col-2 text-center">Quantity</th>
                            <th class="col-3 text-center">Created Date</th>
                            <th class="col-2 text-center">Total Price</th>
                        </tr>
                    </thead>
                </table>
            </div>

            <div class="container" style="min-height: 300px">
                <table class="row table" border="1" style="min-width: 60%; margin: 0px !important">
                    <c:choose>
                        <c:when test="${listOrders == null || listOrders.size() == 0}">
                            <h1>List Order is Empty</h1>
                        </c:when>
                        <c:otherwise>
                            <c:forEach items="${listOrders}" var="O">
                                <form action="cart-history">
                                    <tbody>
                                        <tr class="row mx-auto px-1 py-1">
                                    <td scope="col" class="col-2 text-center"><img src="${O.odProImg_url}" width="100"/></td>
                                    <td scope="col" class="col-3 text-center">${O.odProName}</td>
                                    <td scope="col" class="col-2 text-center">${O.odQuantity}</td>
                                    <td scope="col" class="col-2 text-center">${O.oCreated_date}</td>
                                    <td scope="col" class="col-3 text-center">$${O.oTotalPrice}</td>
                                    </tr>
                                    </tbody>  
                                </form>

                            </c:forEach>
                        </c:otherwise>
                    </c:choose>
                </table>
            </div>
        </div>
    </body>
    <footer>
        <%@include file="components/footerComponent.jsp" %>
    </footer>
</html>
