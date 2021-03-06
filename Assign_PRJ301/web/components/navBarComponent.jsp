<%-- 
    Document   : navBarComponent
    Created on : Feb 26, 2022, 4:19:59 PM
    Author     : ADMIN
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<c:if test="${sessionScope.account.getaRole() eq 'ADMIN'}">
    <nav class="navbar navbar-expand-lg navbar-light bg-dark fixed-top" style="padding-top: 14px; padding-bottom: 14px">
    </c:if>
    <c:if test="${sessionScope.account.getaRole() ne 'ADMIN'}">
        <nav class="navbar navbar-expand-lg navbar-light bg-dark fixed-top">
        </c:if>
        <div class="container-fluid px-4 px-lg-5">
            <a href="http://localhost:8080/Assign_PRJ301/home-controller"><img src="https://cdn.nba.com/logos/nba/nba-logoman-75-word_white.svg" style="height: 40px;" alt=""></a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                    data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false"
                    aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4">
                    <li class="nav-item">
                        <a class="nav-link active text-white" aria-current="page" href="http://localhost:8080/Assign_PRJ301/player-controller">NBA Team</a>
                    </li>
                    <li class="nav-item"><a class="nav-link text-white" href="http://localhost:8080/Assign_PRJ301/allstar-controller">NBA All-Star</a></li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle text-white" id="navbarDropdown" href="#" role="button"
                           data-bs-toggle="dropdown" aria-expanded="false">Shop</a>
                        <ul class="dropdown-menu bg-dark" aria-labelledby="navbarDropdown">
                            <li><a class="dropdown-item text-white bg-color-grey-hover" href="http://localhost:8080/Assign_PRJ301/product-controller">All Products</a></li>
                            <li>
                                <hr class="dropdown-divider" style="color: #d8e3e887;" />
                            </li>
                            <c:forEach items="${sessionScope.listCategories}" var="CT">
                                <li><a class="dropdown-item text-white bg-color-grey-hover" href="http://localhost:8080/Assign_PRJ301/filter-category?categoryId=${CT.ctId}">${CT.ctName}</a></li>

                            </c:forEach>
                        </ul>
                    </li>
                </ul>
                <form action="http://localhost:8080/Assign_PRJ301/search-product" class="d-flex mx-auto">
                    <input class="form-control me-2" type="search" placeholder="Search in here" aria-label="Search" name="keyword"/>
                    <button class="btn btn-outline-success" type="submit">
                        Search
                    </button>
                </form>
                <c:if test="${sessionScope.account.getaRole() ne 'ADMIN'}">
                    <form class="d-flex my-2">
                        <a href="http://localhost:8080/Assign_PRJ301/cart-controller" class="btn btn-outline-light btn-cart">
                            <i class="bi-cart-fill me-1"></i>
                            Cart
                            <span id="cart_number" class="badge bg-light text-dark ms-1 rounded-pill">${sessionScope.carts.size()}</span>
                            <table class="text-dark cart-table row pe-3" style="border: 1px solid gray;" id="cart_hover">
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
                                            <td><a href="http://localhost:8080/Assign_PRJ301/cart-controller" class="btn btn-outline-success flex-shrink-0 my-2" 
                                                   style="float: right; border: 1px solid #198754 !important;">Go to Cart</a></td>
                                        </tr>
                                    </c:otherwise>
                                </c:choose>

                            </table>
                        </a>
                    </form>
                </c:if>

                <c:if test="${sessionScope.account.getaRole() eq 'ADMIN'}">
                    <a href="http://localhost:8080/Assign_PRJ301/admin/dashboard"><button class="btn btn-outline-secondary ms-lg-2"><i class="bi bi-speedometer2 me-1"></i>Dashboard</button></a>
                </c:if>

                <c:choose>
                    <c:when test="${sessionScope.account == null}">
                        <a href="http://localhost:8080/Assign_PRJ301/login"><button class="btn btn-outline-primary ms-lg-2">Login</button></a>
                    </c:when>
                    <c:when test="${sessionScope.account != null}">
                        <a class="btn ms-1 pb-1 account-div">
                            <i class="bi bi-person-circle text-white me-2 py-5"></i><span class="text-white">${sessionScope.account.aDisplayName}</span>
                            <table class="text-dark cart-table row account-table" style="border: 1px solid gray;">
                                <tr>
                                    <td class="text-center">${sessionScope.account.getaRole()}</td>
                                </tr>
                                <tr>
                                    <td><a href="http://localhost:8080/Assign_PRJ301/AccountInfor.jsp" 
                                           class="btn btn-outline-secondary ms-lg-2 mt-2" style="padding: 6px 17px 6px 17px !important">Information</a></td>   
                                </tr>
                                <c:if test="${sessionScope.account.getaRole() ne 'ADMIN'}">
                                    <tr>
                                        <td><a href="message" type="buttton" class="btn btn-outline-success ms-lg-2 mt-2"
                                               style="padding: 6px 27px 6px 27px !important">Message</a>
                                    </tr>
                                </c:if>
                                <tr>
                                    <td><a href="http://localhost:8080/Assign_PRJ301/cart-history?accountId=${sessionScope.account.getaId()}" class="btn btn-outline-dark ms-lg-2 mt-2"
                                           style="padding: 6px 34px 6px 34px !important">History</a></td>   
                                </tr>
                                <tr>
                                    <td><a href="http://localhost:8080/Assign_PRJ301/logout" class="btn btn-outline-danger ms-lg-2 mt-2"
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
