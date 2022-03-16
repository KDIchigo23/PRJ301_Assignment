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


    <body>
        <header>
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
                                            <li><button type="button" class="dropdown-item text-white bg-color-grey-hover" onclick="filterCategoryControllerAsync(${CT.ctId})">
                                                    ${CT.ctName}</button></li>

                                        </c:forEach>
                                        <c:if test="${sessionScope.account.getaRole() eq 'ADMIN'}">
                                            <li>
                                                <hr class="dropdown-divider" style="color: #d8e3e887;" />
                                            </li>
                                            <li><a class="dropdown-item text-white bg-color-grey-hover" href="http://localhost:8080/Assign_PRJ301/admin/create-product">Create Product</a></li>
                                            </c:if>
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
        </header>

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

                    <div class="container">
                        <div>
                            <c:forEach items="${sessionScope.listTeams}" var="T">
                                <div class="card">
                                    <div class="card-header">
                                        <button class="btn" style="font-size: 18px" onclick="filterProTeamAsync(${T.tId})">
                                            ${T.tName}
                                        </button> 
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                    </div>
                </div>

                <div class="row col-xl-9 gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-3 justify-content-center" id="list_product">
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
                                <a href="product-detail?productId=${Pro.proId}"><img class="card-img-top" src="${Pro.proImg_url}" alt="..." /></a>
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
                                            <c:when test="${Pro.proPrice > 80}">  
                                                <span class="text-muted text-decoration-line-through">$109.9</span>
                                            </c:when>   
                                        </c:choose>
                                        $${Pro.proPrice}
                                    </div>
                                </div>
                                <!-- Product actions-->
                                <c:if test="${sessionScope.account.getaRole() ne 'ADMIN'}">
                                    <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                        <div class="text-center"><a class="btn btn-outline-dark mt-auto" onclick="addToCartAsync(${Pro.proId})">Add to cart</a>
                                        </div>
                                    </div>
                                </c:if>
                            </div>
                        </div>
                    </c:forEach>

                    <c:choose>
                        <c:when test="${listProducts==null || listProducts.size()==0}">
                            Not founds
                        </c:when>
                        <c:when test="${totalPage < 2}">
                            <nav aria-label="Page navigation example" class="d-flex justify-content-center">
                                <ul class="pagination">
                                    <c:forEach begin="1" end="${totalPage}" var="i">
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
                </div>

            </div>
        </section>

    </body>
    <footer>
        <%@include file="components/footerComponent.jsp" %>
    </footer>
    <script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
    <script>
                                            function addToCartAsync(productId) {
                                                axios.get('add-to-cart-async', {
                                                    params: {
                                                        productId: productId
                                                    }
                                                }).then((response) => {
                                                    //lấy data thanh công
                                                    document.getElementById("cart_number").innerHTML = response.data;
                                                    //Cập nhật view
                                                })
                                                axios.get('cart-hover-async', {
                                                    params: {
                                                        productId: productId
                                                    }
                                                }).then((response) => {
                                                    //lấy data thanh công
                                                    document.getElementById("cart_hover").innerHTML = response.data;
                                                    //Cập nhật view
                                                })
                                            }

                                            function filterCategoryControllerAsync(categoryId) {
                                                axios.get('filter-category-async', {
                                                    params: {
                                                        categoryId: categoryId
                                                    }
                                                }).then((response) => {
                                                    //lấy data thanh công
                                                    document.getElementById("list_product").innerHTML = response.data;

                                                    //Cập nhật view
                                                })
                                            }

                                            function filterProTeamAsync(teamId) {
                                                console.log(teamId);
                                                axios.get('filter-proteam-async', {
                                                    params: {
                                                        teamId: teamId
                                                    }
                                                }).then((response) => {
                                                    //lấy data thanh công
                                                    document.getElementById("list_product").innerHTML = response.data;

                                                    //Cập nhật view
                                                })
                                            }
    </script>

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
</html>
