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

        <%@include file="components/navBarComponent.jsp" %>
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

    <footer>
        <%@include file="components/footerComponent.jsp" %>
    </footer>

</html>
