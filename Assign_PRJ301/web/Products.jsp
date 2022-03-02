<%-- 
    Document   : Shopping
    Created on : Feb 24, 2022, 3:44:20 PM
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

    <header>
        <%@include file="components/navBarComponent.jsp" %>
    </header>

    <body>
        <div class="bg-dark py-5" style="background-image: url('images/NBA-Shopping.png'); margin: 66px 10px 0px 10px !important; background-size: cover;">
            <div class="container px-4 px-lg-5 my-5">
                <div class="text-center text-white">
                    <h1 class="display-4 fw-bolder">Shopping</h1>
                    <p class="lead fw-normal text-white-50 mb-0">Buying Items of NBA</p>
                </div>
            </div>
        </div>

        <!-- Section-->
        <section class="py-5">
            <div class="container-fluid row px-4 px-lg-5 mt-5">
                <div class="row col-xl-3 mx-4 list-group list-group-flush">
                    <c:forEach items="${listPlayersrByCategoryId}" var="PBCI">
                        <a class="list-group-item" href="filter-player?categoryId=${PBCI.ctId}">${PBCI.pName}</a><br/>
                    </c:forEach>
                </div>
                <div class="row col-xl-9 gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-3 justify-content-center">
                    <c:forEach items="${listProducts}" var="Pro">
                        <div class="col mb-5">
                            <div class="card h-100">
                                <!-- Sale badge-->
                                <c:choose> 
                                    <c:when test="${Pro.proPrice > 160}">  
                                        <div class="badge bg-dark text-white position-absolute px-2 py-1" style="top: 0.5rem; right: 0.5rem; background-color: red !important;">Sale
                                        </div>
                                    </c:when> 
                                    <c:when test="${Pro.proPrice > 140}">  
                                        <div class="badge bg-dark text-white position-absolute px-2 py-1" style="top: 0.5rem; right: 0.5rem; background-color: red !important;">Sale
                                        </div>
                                    </c:when> 
                                    <c:when test="${Pro.proPrice > 80 && Pro.proPrice < 100}">  
                                        <div class="badge bg-dark text-white position-absolute px-2 py-1" style="top: 0.5rem; right: 0.5rem; background-color: red !important;">Sale
                                        </div>
                                    </c:when>  
                                </c:choose> 
                                <img class="card-img-top" src="${Pro.proImg_url}" alt="..." />
                                <!-- Product details-->
                                <div class="card-body p-4">
                                    <div class="text-center">
                                        <!-- Product name-->
                                        <h5 class="fw-bolder">${Pro.proName}</h5>
                                        <!-- Product reviews-->
                                        <div class="d-flex justify-content-center small text-warning mb-2">
                                            <c:choose>  
                                                <c:when test="${Pro.proPrice > 160}">  
                                                    <div class="bi-star-fill"></div>
                                                    <div class="bi-star-fill"></div>
                                                    <div class="bi-star-fill"></div>
                                                    <div class="bi-star-fill"></div>
                                                    <div class="bi-star-fill"></div>
                                                </c:when> 
                                                <c:when test="${Pro.proPrice > 140}">  
                                                    <div class="bi-star-fill"></div>
                                                    <div class="bi-star-fill"></div>
                                                    <div class="bi-star-fill"></div>
                                                    <div class="bi-star-fill"></div>
                                                </c:when>
                                                <c:when test="${Pro.proPrice > 90}">  
                                                    <div class="bi-star-fill"></div>
                                                    <div class="bi-star-fill"></div>
                                                    <div class="bi-star-fill"></div>
                                                    <div class="bi-star-fill"></div>
                                                    <div class="bi-star-fill"></div>
                                                </c:when>  
                                                <c:when test="${Pro.proPrice > 80}">  
                                                    <div class="bi-star-fill"></div>
                                                    <div class="bi-star-fill"></div>
                                                    <div class="bi-star-fill"></div>
                                                    <div class="bi-star-fill"></div>
                                                </c:when>  
                                                <c:otherwise>  
                                                    <div class="bi-star-fill"></div>
                                                    <div class="bi-star-fill"></div>
                                                    <div class="bi-star-fill"></div> 
                                                </c:otherwise>  
                                            </c:choose> 
                                        </div>
                                        <!-- Product price-->
                                        <c:choose>
                                            <c:when test="${Pro.proPrice > 160}">  
                                                <span class="text-muted text-decoration-line-through">$189.9</span>
                                            </c:when> 
                                            <c:when test="${Pro.proPrice > 140}">  
                                                <span class="text-muted text-decoration-line-through">$169.9</span>
                                            </c:when> 
                                            <c:when test="${Pro.proPrice > 100}">  
                                                <span class="text-muted text-decoration-line-through">$149.9</span>
                                            </c:when>  
                                            <c:when test="${Pro.proPrice > 90}">  
                                                <span class="text-muted text-decoration-line-through">$119.9</span>
                                            </c:when>  
                                            <c:when test="${Pro.proPrice > 89.9}">  
                                                <span class="text-muted text-decoration-line-through">$109.9</span>
                                            </c:when>   
                                        </c:choose>
                                        $${Pro.proPrice}
                                    </div>
                                </div>
                                <!-- Product actions-->
                                <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                    <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="#">Add to cart</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </c:forEach>


                </div>
                <ul class="pagination justify-content-center">
                    <li class="page-item"><a class="page-link" href="javascript:void(0);">Previous</a></li>
                    <li class="page-item"><a class="page-link" href="product-controller?page=1">1</a></li>
                    <li class="page-item"><a class="page-link" href="product-controller?page=2">2</a></li>
                    <li class="page-item"><a class="page-link" href="javascript:void(0);">Next</a></li>
                </ul>
            </div>
        </section>

    </body>
    <footer>
        <%@include file="components/footerComponent.jsp" %>
    </footer>

</html>
