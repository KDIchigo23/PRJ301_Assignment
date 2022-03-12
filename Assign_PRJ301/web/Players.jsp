<%-- 
    Document   : Players
    Created on : Feb 27, 2022, 3:56:58 PM
    Author     : ADMIN
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

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
        <link href="css/styles.css" rel="stylesheet"/>
        <link rel="stylesheet" href="css/Home.css"/>

    </head>

    <header>
        <div class="offcanvas offcanvas-start" id="demo">
            <div class="offcanvas-header">
                <h1 class="offcanvas-title">Team</h1>
                <button type="button" class="btn-close" data-bs-dismiss="offcanvas"></button>           
            </div>

            <div class="offcanvas-body">
                <div class="dropdown dropend team-hover mb-4">
                    <a href="player-controller" class="text-dark text-decoration-none">All Players in NBA</a>    
                </div>
                <div class="dropdown dropend team-hover mb-4">
                    <a href="admin/create-player" class="text-dark text-decoration-none">Create Player</a>    
                </div>

                <h4 class="text-dark">West</h4>
                <c:forEach begin="0" end="3" items="${sessionScope.listTeams}" var="T">
                    <div class="dropdown dropend team-hover">
                        <a href="filter-team?teamId=${T.tId}" class="text-dark text-decoration-none">${T.tName}</a>    
                    </div>
                </c:forEach>
                <br>
                <h4 class="text-dark">East</h4>               
                <c:forEach begin="4" end="8" items="${sessionScope.listTeams}" var="T">
                    <div class="dropdown dropend team-hover">
                        <a href="filter-team?teamId=${T.tId}" class="text-dark text-decoration-none">${T.tName}</a>    
                    </div>
                </c:forEach>
            </div>

        </div>

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
                            <a class="nav-link active text-white" aria-current="page" data-bs-toggle="offcanvas" data-bs-target="#demo" href="player-controller">NBA Team</a>
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
                                    <c:if test="${sessionScope.account.getaRole() == (Account.SELLER)}">
                                    <li>
                                        <hr class="dropdown-divider" style="color: #d8e3e887;" />
                                    </li>
                                    <li><a class="dropdown-item text-white bg-color-grey-hover" href="create-product">Create product</a></li>
                                    </c:if>

                            </ul>
                        </li>
                    </ul>
                    <form action="search-player" class="d-flex mx-auto">
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
                            <table class="text-dark cart-table row pe-2 ps-1" style="border: 1px solid gray; box-shadow:">
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
                                        <tr><td><a href="cart-controller" class="btn btn-outline-success flex-shrink-0 my-2" 
                                                   style="float: right; border: 1px solid #198754 !important;">Go to Cart</a></td></tr>
                                            </c:otherwise>
                                        </c:choose>
                            </table>
                        </a>
                    </form>
                    <c:choose>
                        <c:when test="${sessionScope.account == null}">
                            <a href="Login.jsp"><button class="btn btn-outline-primary ms-lg-2">Login</button></a>
                        </c:when>
                        <c:when test="${sessionScope.account != null}">
                            <a class="btn ms-1 pb-1 account-div">
                                <i class="bi bi-person-circle text-white me-2 py-5"></i><span class="text-white">${sessionScope.account.aDisplayName}</span>
                                <table class="text-dark cart-table row account-table" style="border: 1px solid gray;">
                                    <tr>
                                        <td class="text-center">${sessionScope.account.getaRole()}</td>
                                    </tr>
                                    <tr>
                                        <td><a href="AccountInfor.jsp" 
                                               class="btn btn-outline-secondary ms-lg-2 mt-2" style="padding: 6px 17px 6px 17px !important">Information</a></td>   
                                    </tr>
                                    <tr>
                                        <td><a href="cart-history?accountUser=${sessionScope.account.getaUsername()}&accountPass=${sessionScope.account.getaPassword()}" class="btn btn-outline-dark ms-lg-2 mt-2"
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

    </header>

    <body style="margin: 66px 10px 0px 10px !important; background-color: lightgoldenrodyellow;">
        <nav class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 justify-content-center">
            <c:forEach items="${listPlayers}" var="P">
                <div class="card col mb-5 mx-4 mt-1" style="width:300px">
                    <img class="card-img-top" src="${P.pImg_url}" alt="Card image" style="width:100%">
                    <div class="card-body">
                        <h4 class="card-title">${P.pName}</h4>
                        <span class="card-text" style="font-size: 20px;"><span style="font-weight: bold">Position: </span>${P.pPosition}</span>
                        &nbsp;&nbsp;
                        <span class="card-text" style="font-size: 20px;"><span style="font-weight: bold">No.</span>${P.pNo}</span><br/>
                        <p class="card-text" style="font-size: 20px;"><span style="font-weight: bold">Achievement: </span>${P.pAchievement}</p>
                        <a href="pdetail-controller?playerId=${P.pId}" class="btn btn-primary">See Profile</a>
                    </div>
                </div>
            </c:forEach>
        </nav>

        <c:choose>
            <c:when test="${listPlayers==null || listPlayers.size()==0}">
                Not founds
            </c:when>
            <c:when test="${totalPage < 2}">
                <nav aria-label="Page navigation example" class="d-flex justify-content-center">
                    <ul class="pagination">
                        <c:forEach begin="1" end="${totalPage}" var="i">
                            <li class="page-item ${i == page?"active":""}"><a class="page-link" href="${pagination_url}page=${i}">${i}</a></li>
                            </c:forEach>
                    </ul>
                </nav>
            </c:when>
            <c:when test="${page < 2}">
                <nav aria-label="Page navigation example" class="d-flex justify-content-center">
                    <ul class="pagination">                               
                        <c:forEach begin="1" end="${totalPage}" var="i">
                            <li class="page-item ${i == page?"active":""}"><a class="page-link" href="${pagination_url}page=${i}">${i}</a></li>
                            </c:forEach>
                        <li class="page-item"><a class="page-link" href="${pagination_url}page=${page+1}">Next</a></li>
                    </ul>
                </nav>
            </c:when>
            <c:when test="${page+1 > totalPage}">
                <nav aria-label="Page navigation example" class="d-flex justify-content-center">
                    <ul class="pagination">
                        <li class="page-item"><a class="page-link" href="${pagination_url}page=${page-1}">Previous</a></li>
                            <c:forEach begin="1" end="${totalPage}" var="i">
                            <li class="page-item ${i == page?"active":""}"><a class="page-link" href="${pagination_url}page=${i}">${i}</a></li>
                            </c:forEach>
                    </ul>
                </nav>
            </c:when>
            <c:otherwise>
                <nav aria-label="Page navigation example" class="d-flex justify-content-center">
                    <ul class="pagination">
                        <li class="page-item"><a class="page-link" href="${pagination_url}page=${page-1}">Previous</a></li>
                            <c:forEach begin="1" end="${totalPage}" var="i">
                            <li class="page-item ${i == page?"active":""}"><a class="page-link" href="${pagination_url}page=${i}">${i}</a></li>
                            </c:forEach>
                        <li class="page-item"><a class="page-link" href="${pagination_url}page=${page+1}">Next</a></li>
                    </ul>
                </nav>
            </c:otherwise>
        </c:choose>
    </body>

    <footer>
        <%@include file="components/footerComponent.jsp" %>
    </footer>


    <style>
        .offcanvas-body div{
            width: 100%;
            border-bottom: 1px solid rgba(29, 27, 27, 0.151);
            padding: 5px 0px;
        }

        .offcanvas-body div a{
            width: 100px !important;
            font-size: 20px;
        }

        .team-hover:hover{
            background-color: gray;
        }

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

</html>
