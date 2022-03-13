<%-- 
    Document   : Cart
    Created on : Mar 3, 2022, 8:59:59 PM
    Author     : ADMIN
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> 
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<fmt:setLocale value="en_US" scope="session"/>
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


    <body style="margin: 80px 10px 0px 10px !important; background-color: lightgoldenrodyellow;">
        <header>
            <%@include file="components/navBarComponent.jsp" %>
        </header>

        <div style="margin-bottom: 80px">
            <div class="container my-3">
                <table class="row" border="1" style="min-width: 60%;">
                    <thead>
                        <tr class="row mx-auto px-1 py-1">
                            <th class="col-1 text-center">#</th>
                            <th class="col-2 text-center">Image</th>
                            <th class="col-2 text-center">Name</th>
                            <th class="col-1 text-center">Price</th>
                            <th class="col-2 text-center">Quantity</th>
                            <th class="col-2 text-center">Total Price</th>
                            <th class="col-2 text-center">Action</th>
                        </tr>
                    </thead>
                </table>
            </div>

            <div class="container" style="min-height: 300px">
                <table class="row table" border="1" style="min-width: 60%; margin: 0px !important">
                    <c:choose>
                        <c:when test="${sessionScope.carts==null||sessionScope.carts.size()==0}">
                            <h1>List Cart is Empty</h1>
                        </c:when>
                        <c:otherwise>
                            <c:forEach items="${carts}" var="C">
                                <form action="update-quantity">
                                    <tbody>
                                        <tr class="row mx-auto px-1 py-1">
                                    <input type="hidden" name="productId" value="${C.value.product.proId}"/>
                                    <td scope="row" class="col-1 text-center">${C.value.product.proId}</td>
                                    <td scope="col" class="col-2 text-center"><img src="${C.value.product.proImg_url}" width="100"/></td>
                                    <td scope="col" class="col-2 text-center">${C.value.product.proName}</td>
                                    <td scope="col" class="col-1 text-center">
                                        <fmt:formatNumber value="${C.value.product.proPrice}" type="currency" /></p>
                                    </td>
                                    <td scope="col" class="col-2 text-center"><input onchange="this.form.submit()" type="number" name="quantity"
                                                                         value="${C.value.quantity}" style="width: 48px"/>
                                    </td>
                                    <td scope="col" class="col-2 text-center"><fmt:formatNumber value="${C.value.product.proPrice*C.value.quantity}" type="currency" /></p></td>
                                    <td scope="col" class="col-2 text-center"><a href="delete-cart?productId=${C.value.product.proId}" 
                                                                     class="btn btn-outline-danger"><i class="bi bi-trash pe-1"></i>Delete</a></td>
                                    </tr>
                                    </tbody>  
                                </form>

                            </c:forEach>
                        </c:otherwise>
                    </c:choose>
                </table>
                <div style="height:50px">
                    <h2 style="float: right; margin-right: 10px; height: 100%; margin-bottom: 0px !important">Total Amount: <fmt:formatNumber value="${totalMoney}" type="currency" /></p></h2>
                    <br/><br/>

                    <!-- The Modal -->
                    <div class="modal fade" id="myModal">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <!-- Modal Header -->
                                <div class="modal-header">
                                    <h4 class="modal-title text-danger">Error</h4>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                                </div>
                                <!-- Modal body -->
                                <div class="modal-body text-danger text-center" style="font-size: 20px">
                                    Don't have any product in cart!!! <br/>
                                    Let choose some product
                                </div>
                                <!-- Modal footer -->
                                <div class="modal-footer">
                                    <a href="product-controller"><button type="button" class="btn btn-success">Go to Shop</button></a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div>
                    <c:choose>
                        <c:when test="${sessionScope.carts==null||sessionScope.carts.size()==0}">
                            <a class="text-decoration-none text-light">
                                <button type="button" class="btn btn-success w-25" data-bs-toggle="modal" style="float: right; margin-right: 10px" data-bs-target="#myModal">
                                    Check out
                                </button>
                            </a>
                        </c:when>
                        <c:otherwise>
                            <form action="checkout-controller" method="POST">
                                <a href="checkout-controller?accountUser=${sessionScope.account.getaUsername()}&accountPass=${sessionScope.account.getaPassword()}" class="text-decoration-none text-light">
                                    <button type="button" class="btn btn-success w-25" data-bs-toggle="modal" style="float: right; margin-right: 10px">
                                        Check out
                                    </button>
                                </a>
                            </form>
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>
        </div>
    </body>
    <footer>
        <%@include file="components/footerComponent.jsp" %>
    </footer>
</html>
