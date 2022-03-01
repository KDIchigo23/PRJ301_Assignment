<%-- 
    Document   : AllStar-2022.jsp
    Created on : Feb 27, 2022, 1:12:32 PM
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

    <header>
        <%@include file="components/navBarComponent.jsp" %>
    </header>

    <body style="margin: 66px 10px 0px 10px !important; background-color: lightgoldenrodyellow;">
        <div class="mb-4">
            <img style="width: 100%;" src="images/Allstars-2022/NBA75_AllStar_2022.png" alt="">
        </div>

        <!-- Blog preview section-->
        <div class="row">
            <div class="col-6 px-4">
                <div class="card bg-danger text-white mb-4">
                    <div class="card-body text-center">West</div>
                    <div class="card-footer d-flex align-items-center justify-content-between">
                        <a class="small text-white stretched-link mx-auto d-block text-decoration-none" href="#">Team Durant</a>
                        <div class="small text-white"><i class="fas fa-angle-right"></i></div>
                    </div>
                </div>
            </div>
            <div class="col-6 px-4">
                <div class="card bg-primary text-white mb-4">
                    <div class="card-body text-center">East</div>
                    <div class="card-footer d-flex align-items-center justify-content-between">
                        <a class="small text-white stretched-link mx-auto d-block text-decoration-none" href="#">Team LeBron</a>
                        <div class="small text-white"><i class="fas fa-angle-right"></i></div>
                    </div>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col-6 pe-4">
                <img style="width: 100%;" src="images/Allstars-2022/Team_Durant.png" alt="">
            </div>
            <div class="col-6 ps-4">
                <img style="width: 100%;" src="images/Allstars-2022/Team_LeBron.png" alt="">
            </div>
        </div>

        <!-- Testimonial section-->
        <div class="py-4 mt-2" style="background-color: darkgray;">
            <div class="row mx-4 pb-1" style="border-bottom: 1px solid rgba(255, 255, 255, 0.534);">
                <div class="col-xl-3 col-1 col-sm-0">
                    <!-- <img class="float-end"
                        src="https://ssl.gstatic.com/onebox/media/sports/logos/69uqqqdzD7Wv0B2DqFRGUw_96x96.png" alt=""> -->
                </div>
                <div class="col-xl-6 col 10 col-sm-12">
                    <img class="mx-auto d-block" style="width: 100%;"
                         src="images/Allstars-2022/AllStar-2022-Result.png" alt="">
                </div>
                <div class="col-xl-3 col-1 col-sm-0">
                    <!-- <img class="float-start"
                        src="https://ssl.gstatic.com/onebox/media/sports/logos/ctB2xWcl4jPPVxe8_xe8ZA_96x96.png" alt=""> -->
                </div>
            </div>

            <div class="row pt-3">
                <div class="col-xl-6 px-4 py-2">
                    <div class="card">
                        <div class="card-header">
                            <i class="fas fa-chart-bar me-1"></i>
                            <p class="text-center">Team Durant</p> 
                        </div>
                        <div class="card-body">
                            <table class="table table-bordered" style="width: 100%">
                                <thead>
                                    <tr>
                                        <th>Name</th>
                                        <th>PTS</th>
                                        <th>Rules</th>
                                        <th>Position</th>
                                        <th>No</th>
                                        <th>Team</th>
                                        <th>Image</th>
                                    </tr>
                                </thead>
                                <c:forEach items="${listAllStarsDurants}" var="L">
                                    <tbody>
                                        <tr>
                                            <td>${L.apName}</td>
                                            <td>${L.apPTS}</td>
                                            <td>${L.apRules}</td>
                                            <td>${L.pPosition}</td>
                                            <td>${L.pNo}</td>
                                            <td>${L.tName}</td>
                                            <td><img style="width: 86%" src="${L.apImg_url}"></td>
                                        </tr>
                                    </tbody>
                                </c:forEach>
                            </table>
                        </div>
                    </div>
                </div>
                <div class="col-xl-6 px-4 py-2">
                    <div class="card">
                        <div class="card-header">
                            <i class="fas fa-chart-area me-1"></i>
                            <p class="text-center">Team LeBron</p> 
                        </div>
                        <div class="card-body">
                            <table class="table table-bordered" style="width: 100%">
                                <thead>
                                    <tr>
                                        <th>Name</th>
                                        <th>PTS</th>
                                        <th>Rules</th>
                                        <th>Position</th>
                                        <th>No</th>
                                        <th>Team</th>
                                        <th>Image</th>
                                    </tr>
                                </thead>
                                <c:forEach items="${listAllStarsLebrons}" var="L">
                                    <tbody>
                                        <tr>
                                            <td>${L.apName}</td>
                                            <td>${L.apPTS}</td>
                                            <td>${L.apRules}</td>
                                            <td>${L.pPosition}</td>
                                            <td>${L.pNo}</td>
                                            <td>${L.tName}</td>
                                            <td><img style="width: 100%" src="${L.apImg_url}"></td>
                                        </tr>
                                    </tbody>
                                </c:forEach>
                            </table>
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