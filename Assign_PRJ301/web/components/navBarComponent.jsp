<%-- 
    Document   : navBarComponent
    Created on : Feb 26, 2022, 4:19:59 PM
    Author     : ADMIN
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<nav class="navbar navbar-expand-lg navbar-light bg-dark fixed-top">
    <div class="container-fluid px-4 px-lg-5">
        <a href="home-controller"><img src="https://cdn.nba.com/logos/nba/nba-logoman-75-word_white.svg" style="height: 40px;" alt=""></a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false"
                aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4">
                <li class="nav-item">
                    <a class="nav-link active text-white" aria-current="page" href="player-controller">NBA Team</a>
                </li>
                <li class="nav-item"><a class="nav-link text-white" href="allstar-controller">NBA All-Star</a></li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle text-white" id="navbarDropdown" href="#" role="button"
                       data-bs-toggle="dropdown" aria-expanded="false">Shop</a>
                    <ul class="dropdown-menu bg-dark" aria-labelledby="navbarDropdown">
                        <li><a class="dropdown-item text-white bg-color-grey-hover" href="product-controller">All Products</a></li>
                        <li>
                            <hr class="dropdown-divider" style="color: #d8e3e887;" />
                        </li>
                        <c:forEach items="${sessionScope.listCategories}" var="CT">
                            <li><a class="dropdown-item text-white bg-color-grey-hover" href="filter-category?categoryId=${CT.ctId}">${CT.ctName}</a></li>
                            </c:forEach>
                            <c:if test="${sessionScope.account.isSell == 1}">
                            <li>
                                <hr class="dropdown-divider" style="color: #d8e3e887;" />
                            </li>
                            <li><a class="dropdown-item text-white bg-color-grey-hover" href="create-product">Create product</a></li>
                            </c:if>
                    </ul>
                </li>
            </ul>
            <form action="search-product" class="d-flex mx-auto">
                <input class="form-control me-2" type="search" placeholder="Search in here" aria-label="Search" name="keyword"/>
                <button class="btn btn-outline-success" type="submit">
                    Search
                </button>
            </form>
            <form class="d-flex my-2">
                <a href="cart-controller" class="btn btn-outline-light btn-cart">
                    <i class="bi-cart-fill me-1"></i>
                    Cart
                    <span class="badge bg-light text-dark ms-1 rounded-pill">${sessionScope.carts.size()}</span>
                    <table class="text-dark cart-table row pe-3" style="border: 1px solid gray;">
                        <c:choose>
                            <c:when test="${carts==null || carts.size()==0}">
                                <tr><td class="not-founds">Not founds</td></tr>
                            </c:when>
                            <c:otherwise>
                                <c:forEach items="${carts}" var="C">
                                    <tr class="row mx-auto px-1 py-1" style="border-bottom: 1px solid rgba(0, 0, 0, 0.1); margin-left: 6px !important">
                                    <input type="hidden" name="productId" value="${C.value.product.proId}"/>
                                    <td scope="col" class="col-3"><img src="${C.value.product.proImg_url}" width="60"/></td>
                                    <td scope="col" class="col-7 my-3">${C.value.product.proName}</td>
                                    <td scope="col" class="col-1 my-3" style="color: red; float: left">$${C.value.product.proPrice}</td>
                                    </tr>
                                </c:forEach>
                                <tr>
                                    <td><a href="cart-controller" class="btn btn-outline-success flex-shrink-0 my-2" 
                                           style="float: right; border: 1px solid #198754 !important;">Go to Cart</a></td>
                                </tr>
                            </c:otherwise>
                        </c:choose>

                    </table>
                </a>
            </form>

            <c:choose>
                <c:when test="${sessionScope.account == null}">
                    <a href="login"><button class="btn btn-outline-primary ms-lg-2">Login</button></a>
                </c:when>
                <c:when test="${sessionScope.account != null}">
                    <a class="btn ms-1 pb-1 account-div">
                        <i class="bi bi-person-circle text-white me-2 account-img py-5"></i><span class="text-white">${sessionScope.account.aDisplayName}</span>
                        <table class="text-dark cart-table row account-table" style="border: 1px solid gray;">
                            <c:if test="${sessionScope.account.isSell == 1 && sessionScope.account.isAdmin == 1}">
                                <tr>
                                    <td class="text-center">Manager Account</td>
                                </tr>
                                <tr>
                                    <td class="text-center">Manager Sell</td>
                                </tr>
                            </c:if>
                            <c:if test="${sessionScope.account.isSell == 1 && sessionScope.account.isAdmin == 0}">
                                <tr>
                                    <td class="text-center">Manager Sell</td>
                                </tr>
                            </c:if>
                            <c:if test="${sessionScope.account.isAdmin == 1 && sessionScope.account.isSell == 0}">
                                <tr>
                                    <td class="text-center">Manager Account</td>
                                </tr>
                            </c:if>
                            <c:if test="${sessionScope.account.isSell == 0 && sessionScope.account.isAdmin == 0}">
                                <tr>
                                    <td class="ext-center" style="width: 100%">Customer</td>
                                </tr>
                            </c:if>
                            <tr>
                                <td><a href="cart-history?accountUser=${sessionScope.account.getaUsername()}" class="btn btn-outline-dark ms-lg-2 mt-2"
                                       style="padding: 6px 34px 6px 34px !important">History</a></td>   
                            </tr>
                            <tr>
                                <td><a href="logout" class="btn btn-outline-danger ms-lg-2 mt-2"
                                       style="padding: 6px 34px 6px 34px !important">Logout</a></td>
                            </tr>
                        </table>
                    </a>
                </c:when>
            </c:choose>
        </div>
    </div>
</nav>

<style>
    .btn-cart{
        position: relative;
    }

    .cart-table{
        display: none;
        position: absolute;
        top: 38px;
        right: 11px;
        width: 300px;
        background-color: white;
        border-radius: 5px;
    }

    .btn-cart:hover .cart-table{
        display: block;
    }

    .not-founds{
        padding: 50px 80px 50px 110px !important;
    }

    .cart-table tr{
        margin-right: 0px !important;
    }

    @media only screen and (max-width: 768px){
        .cart-table{
            left: 11px;
        }
    }

    .account-div{
        position: relative;
    }

    .account-table{
        display: none;
        position: absolute;
        top: 36px;
        right: 0;
        width: 160px;
        border-radius: 5px;
        padding: 10px;
    }

    .account-div:hover .account-table{
        display: block;
    }
</style>
