<%-- 
    Document   : Cart
    Created on : Mar 3, 2022, 8:59:59 PM
    Author     : ADMIN
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> 
<fmt:setLocale value="en_US" scope="session"/>
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


    <body style="margin: 80px 10px 0px 10px !important;">
        <header>
            <%@include file="components/navBarComponent.jsp" %>
        </header>

        <div class="container my-3">
            <table class="row" border="1" style="min-width: 60%;">
                <thead>
                    <tr class="row mx-auto px-1 py-1">
                        <th class="col-1">#</th>
                        <th class="col-2">Image</th>
                        <th class="col-4">Name</th>
                        <th class="col-2">Price</th>
                        <th class="col-1">Quantity</th>
                        <th class="col-2">Total Price</th>
                    </tr>
                </thead>
            </table>
        </div>

        <div class="container" style="min-height: 300px;">
            <div style="margin-bottom: 80px">
                <table class="row table " border="1" style="min-width: 60%; margin: 0px 0px 10px 0px !important">
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
                                    <td scope="row" class="col-1">${C.value.product.proId}</td>
                                    <td scope="col" class="col-2"><img src="${C.value.product.proImg_url}" width="140"/></td>
                                    <td scope="col" class="col-4">${C.value.product.proName}</td>
                                    <td scope="col" class="col-2">$${C.value.product.proPrice}</td>
                                    <td scope="col" class="col-1"><input type="number" name="quantity" value="${C.value.quantity}" style="width: 34px" readonly/></td>
                                    <td scope="col" class="col-2">$${C.value.product.proPrice*C.value.quantity}</td>
                                    </tr>
                                    </tbody>  
                                </form>

                            </c:forEach>
                        </c:otherwise>
                    </c:choose>
                </table>

                <div class="row d-flex" style="margin: 0px !important">
                    <div class="col-md-6" style="border: 1px solid #ccc; border-radius: 5px; padding: 1rem">
                        <h3>Information of customer</h3>
                        <form action="checkout-controller" method="POST">
                            <div class="mb-3">
                                <label for="name" class="form-label">Name</label>
                                <input type="text" class="form-control" id="name" name="name" value="${sessionScope.account.getaDisplayName()}" aria-describedby="emailHelp">
                            </div>
                            <div class="mb-3">
                                <label for="phone" class="form-label">Phone</label>
                                <input type="text" class="form-control" id="phone" name="phone" value="${sessionScope.account.getaPhone()}" aria-describedby="emailHelp">
                            </div>
                            <div class="mb-3">
                                <label for="address" class="form-label">Address</label>
                                <input type="text" class="form-control" id="address" name="address" value="${sessionScope.account.getaAddress()}" aria-describedby="emailHelp">
                            </div>
                            <div class="mb-3">
                                <label for="note" class="form-label">Note</label>
                                <textarea class="form-control" id="note" name="note" rows="3"></textarea>
                            </div>
                            <button type="submit" class="btn btn-success w-100">Buy now</button>
                        </form>
                    </div>
                    <div class="col-md-6 ps-2" style="padding-right: 0px !important">
                        <div>
                            <form style="border: 1px solid #ccc; border-radius: 5px; padding: 1rem">
                                <div class="mb-3" style="border-bottom: 1px solid gainsboro">
                                    <span>Total Product: </span>
                                    <h2 style="float: right; margin-right: 10px"><fmt:formatNumber value="${totalMoney}" type="currency" /></p></h2><br/><br/>
                                </div>
                                <div class="mb-3" style="border-bottom: 1px solid gainsboro">
                                    <span>Shipping: </span>
                                    <h2 style="float: right; margin-right: 10px">$10.0</h2><br/><br/>
                                </div>
                                <div class="mb-3">
                                    <span>Total Amount: </span>
                                    <h2 style="float: right; margin-right: 10px"><fmt:formatNumber value="${totalMoney+10.0}" type="currency" /></p></h2><br/><br/>
                                </div>

                            </form>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
<footer>
    <%@include file="components/footerComponent.jsp" %>
</footer>
</html>
