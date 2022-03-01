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
                    <div class="dropdown dropend">
                        <a href="filter-team?teamId=${T.tId}" class="text-dark text-decoration-none" >${T.tName}</a>    
                    </div>
                </c:forEach>
                <br>
                <h4 class="text-dark">East</h4>               
                <c:forEach begin="4" end="8" items="${listTeams}" var="T">
                    <div class="dropdown dropend">
                        <a href="filter-team?teamId=${T.tId}" class="text-dark text-decoration-none">${T.tName}</a>    
                    </div>
                </c:forEach>
            </div>

        </div>

        <nav class="navbar navbar-expand-lg navbar-light bg-dark fixed-top">
            <div class="container-fluid px-4 px-lg-5">
                <img src="https://cdn.nba.com/logos/nba/nba-logoman-75-word_white.svg" style="height: 40px;" alt="">
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                        data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false"
                        aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4">
                        <li class="nav-item">
                            <a class="nav-link active text-white" aria-current="page" href="player-controller" data-bs-toggle="offcanvas"
                               data-bs-target="#demo">NBA Team</a>
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
                                <li><a class="dropdown-item text-white bg-color-grey-hover" href="#!">Jersey</a></li>
                                <li><a class="dropdown-item text-white bg-color-grey-hover" href="#!">Shoe</a></li>
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
                    <button class="btn btn-outline-primary ms-lg-2">Login</button>
                </div>
            </div>
        </nav>
    </header>

    <body style="margin: 66px 10px 0px 10px !important; background-color: lightgoldenrodyellow;">
        <nav class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 justify-content-center">
            <c:forEach items="${listPlayers}" var="P">
                <div class="card col mb-5 mx-4" style="width:400px">
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
    </body>

    <footer class="container-fluid text-center text-lg-start border border-secondary mt-2 pt-4 bg-dark">
        <!-- Grid container -->
        <div class="container-fluid p-4">
            <!--Grid row-->
            <div class="row">
                <!--Grid column-->
                <div class="col-lg-3 col-md-6 mb-4 mb-lg-0 ps-5">
                    <h5 class="text-uppercase mb-4 text-white-50">NBA</h5>

                    <ul class="list-unstyled mb-4">
                        <li>
                            <a href="#!" class="text-white text-decoration-none">NBA Pre-season</a>
                        </li>
                        <li>
                            <a href="#!" class="text-white text-decoration-none">NBA All-star Game</a>
                        </li>
                        <li>
                            <a href="#!" class="text-white text-decoration-none">NBA Finals Game</a>
                        </li>
                        <li>
                            <a href="#!" class="text-white text-decoration-none">NBA 75 </a>
                        </li>
                    </ul>
                </div>
                <!--Grid column-->

                <!--Grid column-->
                <div class="col-lg-3 col-md-6 mb-4 mb-lg-0 ps-5">
                    <h5 class="text-uppercase mb-4 text-white-50">Skills</h5>

                    <ul class="list-unstyled">
                        <li>
                            <a href="#!" class="text-white text-decoration-none">Dribbling Skills</a>
                        </li>
                        <li>
                            <a href="#!" class="text-white text-decoration-none">Shooting Skills</a>
                        </li>
                        <li>
                            <a href="#!" class="text-white text-decoration-none">Passing Skills</a>
                        </li>
                        <li>
                            <a href="#!" class="text-white text-decoration-none">Dunking Skills</a>
                        </li>
                    </ul>
                </div>
                <!--Grid column-->

                <!--Grid column-->
                <div class="col-lg-3 col-md-6 mb-4 mb-lg-0 ps-5">
                    <h5 class="text-uppercase mb-4 text-white-50">Shop</h5>

                    <ul class="list-unstyled">
                        <li>
                            <a href="#!" class="text-white text-decoration-none">Jersey</a>
                        </li>
                        <li>
                            <a href="#!" class="text-white text-decoration-none">Ball</a>
                        </li>
                        <li>
                            <a href="#!" class="text-white text-decoration-none">Shoe</a>
                        </li>
                    </ul>
                </div>
                <!--Grid column-->

                <!--Grid column-->
                <div class="col-lg-3 col-md-6 mb-4 mb-lg-0 ps-5">
                    <h5 class="text-uppercase mb-4 text-white-50">Special Skills</h5>

                    <ul class="list-unstyled">
                        <li>
                            <a href="#!" class="text-white text-decoration-none">Shooting 3-point</a>
                        </li>
                        <li>
                            <a href="#!" class="text-white text-decoration-none">Alley-oop Dunk</a>
                        </li>
                        <li>
                            <a href="#!" class="text-white text-decoration-none">Breaking Ankle</a>
                        </li>
                        <li>
                            <a href="#!" class="text-white text-decoration-none">Buzzer-Beater</a>
                        </li>
                    </ul>
                </div>
                <!--Grid column-->

                <!--Grid column-->

            </div>
            <!--Grid row-->
        </div>
        <!-- Grid container -->

        <!-- Copyright -->
        <div class="text-center p-3 border-top border-white">
            <a class="text-white" href="#">Made by KDIchigo</a>
        </div>
    </footer>

</html>
