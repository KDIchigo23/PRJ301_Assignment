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
                <a href="cart-controller" class="btn btn-outline-light">
                    <i class="bi-cart-fill me-1"></i>
                    Cart
                    <span class="badge bg-light text-dark ms-1 rounded-pill">${sessionScope.carts.size()}</span>
                </a>
            </form>
            <a href="login-controller"><button class="btn btn-outline-primary ms-lg-2">Login</button></a>
        </div>
    </div>
</nav>
