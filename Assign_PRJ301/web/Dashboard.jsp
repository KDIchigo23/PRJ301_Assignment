<%-- 
    Document   : Dashboard
    Created on : Mar 13, 2022, 12:26:44 PM
    Author     : ADMIN
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> 
<fmt:setLocale value="en_US" scope="session"/>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Dashboard - SB Admin</title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <!-- Bootstrap icons-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
        <link href="/Assign_PRJ301/css/dashboard.css" rel="stylesheet" />
        <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js" crossorigin="anonymous"></script>
        <script src="/Assign_PRJ301/js/scripts.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
    </head>

    <body style="background-color: lightgoldenrodyellow;">
        <header class="sb-nav-fixed">
            <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark py-3">
                <!-- Navbar Brand-->
                <div class="container-fluid px-4 px-lg-5">
                    <a href="http://localhost:8080/Assign_PRJ301/home-controller" class="me-4">
                        <img src="https://cdn.nba.com/logos/nba/nba-logoman-75-word_white.svg" style="height: 40px;" alt=""></a>
                    <!-- Sidebar Toggle-->
                    <button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0" id="sidebarToggle" href="#!"><i class="fas fa-bars"></i></button>
                    <!-- Navbar Search-->
                    <div class="collapse navbar-collapse" id="navbarSupportedContent">
                        <form action="http://localhost:8080/Assign_PRJ301/search-product" class="d-flex mx-auto">
                            <input class="form-control me-2" type="search" placeholder="Search in here" aria-label="Search" name="keyword"/>
                            <button class="btn btn-outline-success" type="submit">
                                Search
                            </button>
                        </form>

                        <c:choose>
                            <c:when test="${sessionScope.account == null}">
                                <a href="http://localhost:8080/Assign_PRJ301/login"><button class="btn btn-outline-primary ms-lg-2">Login</button></a>
                            </c:when>
                            <c:when test="${sessionScope.account != null}">
                                <a class="btn ms-1 pb-1 account-div">
                                    <i class="bi bi-person-circle text-white me-2 py-5"></i><span class="text-white">${sessionScope.account.aDisplayName}</span>
                                    <table class="text-dark bg-light cart-table row account-table" style="border: 1px solid gray">
                                        <tr>
                                            <td class="text-center">${sessionScope.account.getaRole()}</td>
                                        </tr>
                                        <tr>
                                            <td><a href="http://localhost:8080/Assign_PRJ301/AccountInfor.jsp" 
                                                   class="btn btn-outline-secondary ms-lg-2 mt-2" style="padding: 6px 17px 6px 17px !important">Information</a></td>   
                                        </tr>
                                        <tr>
                                            <td><a href="http://localhost:8080/Assign_PRJ301/cart-history?accountUser=${sessionScope.account.getaUsername()}&accountPass=${sessionScope.account.getaPassword()}" class="btn btn-outline-dark ms-lg-2 mt-2"
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
        </header>

        <div id="layoutSidenav">
            <div id="layoutSidenav_nav">
                <nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
                    <div class="sb-sidenav-menu">
                        <div class="nav">
                            <div class="sb-sidenav-menu-heading">Core</div>
                            <a class="nav-link" href="dashboard">
                                <div class="sb-nav-link-icon"><i class="fas fa-tachometer-alt"></i></div>
                                Dashboard
                            </a>
                            <div class="sb-sidenav-menu-heading">Interface</div>
                            <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapseLayouts" aria-expanded="false" aria-controls="collapseLayouts">
                                <div class="sb-nav-link-icon"><i class="fas fa-columns"></i></div>
                                Layouts
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <div class="collapse" id="collapseLayouts" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav">
                                    <a class="nav-link" href="#">Static Navigation</a>
                                    <a class="nav-link" href="#">Light Sidenav</a>
                                </nav>
                            </div>
                            <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapsePages" aria-expanded="false" aria-controls="collapsePages">
                                <div class="sb-nav-link-icon"><i class="fas fa-book-open"></i></div>
                                Pages
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <div class="collapse" id="collapsePages" aria-labelledby="headingTwo" data-bs-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav accordion" id="sidenavAccordionPages">
                                    <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#pagesCollapseAuth" aria-expanded="false" aria-controls="pagesCollapseAuth">
                                        Authentication
                                        <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                                    </a>
                                    <div class="collapse" id="pagesCollapseAuth" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordionPages">
                                        <nav class="sb-sidenav-menu-nested nav">
                                            <a class="nav-link" href="login">Login</a>
                                            <a class="nav-link" href="Sign-up.jsp">Register</a>
                                        </nav>
                                    </div>
                                </nav>
                            </div>
                            <div class="sb-sidenav-menu-heading">Addons</div>
                            <a class="nav-link" href="tables.html">
                                <div class="sb-nav-link-icon"><i class="fas fa-table"></i></div>
                                Tables
                            </a>
                        </div>
                    </div>
                    <div class="sb-sidenav-footer">
                        <div class="small">Made by:</div>
                        KDIchigo
                    </div>
                </nav>
            </div>
            <div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid px-4" style="margin-top: 70px">
                        <h1 class="mt-4">Dashboard</h1>
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item active">Dashboard</li>
                        </ol>
                        <div class="row">

                            <div class="col-xl-3 col-md-6">
                                <div class="card bg-light text-primary mb-4" style="border-left: 0.25rem solid #4e73df !important;">
                                    <div class="d-flex">
                                        <h5 class="card-body" style="padding-bottom: 32px;">Account<br>${sessionScope.totalAccount}</h5>
                                        <div class="col-auto pt-3 pe-4"><i class="bi bi-person-square" style="font-size: 2em"></i></div>
                                    </div>
                                    <div class="card-footer d-flex align-items-center justify-content-between">
                                        <a class="small text-primary stretched-link" href="full-account-infor">View Details</a>
                                        <div class="small text-primary"><i class="fas fa-angle-right"></i></div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xl-3 col-md-6">
                                <div class="card bg-light text-warning mb-4" style="border-left: 0.25rem solid #f6c23e !important;">
                                    <div class="d-flex">
                                        <h5 class="card-body">Earnings (Daily)<br><fmt:formatNumber value="${sessionScope.totalPriceEveryDay}" type="currency" /></p></h5>
                                        <div class="col-auto pt-4 pe-4"><i class="fas fa-calendar fa-2x text-gray-300"></i></div>
                                    </div>

                                    <div class="card-footer d-flex align-items-center justify-content-between">
                                        <a class="small text-warning stretched-link" href="earning-daily">View Details</a>
                                        <div class="small text-warning"><i class="fas fa-angle-right"></i></div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xl-3 col-md-6">
                                <div class="card bg-light text-success mb-4" style="border-left: 0.25rem solid #1cc88a !important;">
                                    <div class="d-flex">
                                        <h5 class="card-body">Earnings (Monthly)<br><fmt:formatNumber value="${sessionScope.totalPriceEveryMonth}" type="currency" /></p></h5>
                                        <div class="col-auto pt-4 pe-4"><i class="bi bi-currency-dollar" style="font-size: 2em"></i></div>
                                    </div>

                                    <div class="card-footer d-flex align-items-center justify-content-between">
                                        <a class="small text-success stretched-link" href="earning-month">View Details</a>
                                        <div class="small text-success"><i class="fas fa-angle-right"></i></div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xl-3 col-md-6">
                                <div class="card bg-light text-info mb-4" style="border-left: 0.25rem solid #36b9cc !important;">
                                    <div class="d-flex">
                                        <h5 class="card-body" style="padding-bottom: 32px;">Message<br>${sessionScope.totalMessage}</h5>
                                        <div class="col-auto pt-4 pe-4"><i class="bi bi-chat-left-text" style="font-size: 2em"></i></div>
                                    </div>

                                    <div class="card-footer d-flex align-items-center justify-content-between">
                                        <a class="small text-info stretched-link" href="#">View Details</a>
                                        <div class="small text-info"><i class="fas fa-angle-right"></i></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        
                        <div class="card mb-4">
                            <div class="card-header">
                                <i class="fas fa-table me-1"></i>
                                Account
                            </div>
                            <div class="card-body">
                                <table id="datatablesSimple">
                                    <thead>
                                        <tr>
                                            <th>#</th>
                                            <th>Position</th>
                                            <th>Office</th>
                                            <th>Age</th>
                                            <th>Start date</th>
                                            <th>Salary</th>
                                        </tr>
                                    </thead>
                                    <tfoot>
                                        <tr>
                                            <th>Name</th>
                                            <th>Position</th>
                                            <th>Office</th>
                                            <th>Age</th>
                                            <th>Start date</th>
                                            <th>Salary</th>
                                        </tr>
                                    </tfoot>

                                </table>
                            </div>
                        </div>
                    </div>
                </main>
            </div>
        </div>
    </body>

    <footer>
        <%@include file="components/footerComponent.jsp" %>
    </footer>

    <style>
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

