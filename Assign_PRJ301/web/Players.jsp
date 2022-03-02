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
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <!-- Latest compiled and minified CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">

        <!-- Latest compiled JavaScript -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <link rel="stylesheet" href="css/Home.css">
        <link href="css/styles.css" rel="stylesheet" />
        <title>NBA players</title>
    </head>

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
    </style>

    <header>
        <div class="offcanvas offcanvas-start" id="demo">
            <div class="offcanvas-header">
                <h1 class="offcanvas-title">Team</h1>
                <button type="button" class="btn-close" data-bs-dismiss="offcanvas"></button>
            </div>

            <div class="offcanvas-body">
                <h4 class="text-dark">West</h4>
                <c:forEach begin="0" end="3" items="${listTeams}" var="T">
                    <div class="dropdown dropend team-hover">
                        <a href="filter-team?teamId=${T.tId}" class="text-dark text-decoration-none">${T.tName}</a>    
                    </div>
                </c:forEach>
                <br>
                <h4 class="text-dark">East</h4>               
                <c:forEach begin="4" end="8" items="${listTeams}" var="T">
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
                            <a class="nav-link active text-white" aria-current="page" href="player-controller" data-bs-target="#demo" data-bs-toggle="offcanvas">NBA Team</a>
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
                                <c:forEach items="${listCategories}" var="CT">
                                    <li><a class="dropdown-item text-white bg-color-grey-hover" href="filter-category?categoryId=${CT.ctId}">${CT.ctName}</a></li>
                                    </c:forEach>

                                <!--                        <li><a class="dropdown-item text-white bg-color-grey-hover" href="#!">Sneaker</a></li>-->
                            </ul>
                        </li>
                    </ul>
                    <form class="d-flex mx-auto">
                        <input class="form-control me-2" type="search" placeholder="Search in here" aria-label="Search" />
                        <button class="btn btn-outline-success" type="submit">
                            Search
                        </button>
                    </form>
                    <form class="d-flex my-2">
                        <button class="btn btn-outline-light" type="submit">
                            <i class="bi-cart-fill me-1"></i>
                            Cart
                            <span class="badge bg-light text-dark ms-1 rounded-pill">0</span>
                        </button>
                    </form>
                    <a href="login-controller"><button class="btn btn-outline-primary ms-lg-2">Login</button></a>
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
                        <a href="#" class="btn btn-primary">See Profile</a>
                    </div>
                </div>
            </c:forEach>
        </nav>

        <ul class="pagination justify-content-center">
            <li class="page-item"><a class="page-link" href="javascript:void(0);">Previous</a></li>
            <li class="page-item"><a class="page-link" href="player-controller?page=1">1</a></li>
            <li class="page-item"><a class="page-link" href="player-controller?page=2">2</a></li>
            <li class="page-item"><a class="page-link" href="javascript:void(0);">Next</a></li>
        </ul>
    </body>

    <footer>
        <%@include file="components/footerComponent.jsp" %>
    </footer>

</html>
