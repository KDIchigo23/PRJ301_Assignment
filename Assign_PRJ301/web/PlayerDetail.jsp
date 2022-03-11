<%-- 
    Document   : Home
    Created on : Feb 24, 2022, 3:52:48 PM
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
        <link rel="stylesheet" href="css/Home.css">
        <link href="css/styles.css" rel="stylesheet" />
    </head>


    <body style="margin: 66px 10px 0px 10px !important">
        <header>
            <%@include file="components/navBarComponent.jsp" %>
        </header>

        <!-- Product section-->
        <section class="py-3 mb-3">
            <div class="container row px-4 px-lg-5 mt-5 mb-2 mx-auto align-items-center">
                <div class="col-md-6">
                    <c:forEach items="${playerDetail}" var="P">
                        <div class="col">
                            <div class="card h-100">
                                <a><img class="card-img-top mb-5 mb-md-0" src="${P.pImg_url}" alt="..." /></a>
                            </div>
                        </div>
                    </c:forEach>
                </div>
                <div class="col-md-5 py-auto">
                    <c:forEach items="${playerDetail}" var="P">
                        <div class="card-body p-4">
                            <h1 class="display-5 fw-bolder">${P.pName}</h1>
                            <div class="mb-1">
                                <span class="me-1" style="font-size: 24px">Date of birth:</span>
                                <span style="font-size: 28px">
                                    <c:choose>
                                        <c:when test="${P.pDob == null}">
                                            Updating
                                        </c:when>
                                        <c:otherwise>
                                            ${P.pDob}
                                        </c:otherwise>
                                    </c:choose>
                                </span>
                            </div>
                            <div class="mb-1">
                                <span class="me-1" style="font-size: 24px">Team:</span>
                                <span style="font-size: 28px">
                                    <c:choose>
                                        <c:when test="${P.tName == null}">
                                            Updating
                                        </c:when>
                                        <c:otherwise>
                                            ${P.tName}
                                        </c:otherwise>
                                    </c:choose>
                                </span>
                            </div>
                            <div class="mb-1">
                                <span class="me-1" style="font-size: 24px">Position:</span>
                                <span style="font-size: 28px">
                                    <c:choose>
                                        <c:when test="${P.pPosition == null}">
                                            Updating
                                        </c:when>
                                        <c:otherwise>
                                            ${P.pPosition}
                                        </c:otherwise>
                                    </c:choose>
                                </span>
                            </div>
                            <div class="mb-1">
                                <span class="me-1" style="font-size: 24px">Height:</span>
                                <span style="font-size: 28px">
                                    <c:choose>
                                        <c:when test="${P.pHeight == null}">
                                            Updating
                                        </c:when>
                                        <c:otherwise>
                                            ${P.pHeight}
                                        </c:otherwise>
                                    </c:choose>
                                </span>
                            </div>
                            <div class="mb-1">
                                <span class="me-1" style="font-size: 24px">Jersey number:</span>
                                <span style="font-size: 28px">
                                    <c:choose>
                                        <c:when test="${P.pNo == null}">
                                            Updating
                                        </c:when>
                                        <c:otherwise>
                                            ${P.pNo}
                                        </c:otherwise>
                                    </c:choose>
                                </span>
                            </div>
                            <div class="mb-1">
                                <span class="me-1" style="font-size: 24px">Achievement:</span>
                                <span style="font-size: 28px">
                                    <c:choose>
                                        <c:when test="${P.pAchievement == null}">
                                            Updating
                                        </c:when>
                                        <c:otherwise>
                                            ${P.pAchievement}
                                        </c:otherwise>
                                    </c:choose>
                                </span>
                            </div>
                            <div class="mb-1">
                            </div>
                            <c:if test="${sessionScope.account.isSell == 1}">
                                <a href="update-player?playerId=${P.pId}" class="btn btn-outline-success mt-2 me-2" type="button">
                                    <i class="bi bi-arrow-up-circle"></i>
                                    Update Player
                                </a>
                                <a href="delete-player?playerId=${P.pId}" class="btn btn-outline-danger mt-2" type="button">
                                    <i class="bi bi-trash"></i>
                                    Delete Player
                                </a>
                            </c:if>
                        </c:forEach> 

                    </div>
                </div>
            </div>
        </section>
    </body>

    <footer>
        <%@include file="components/footerComponent.jsp" %>
    </footer>

</html>
