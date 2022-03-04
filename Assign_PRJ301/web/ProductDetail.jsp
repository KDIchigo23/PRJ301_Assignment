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

    <header>
        <%@include file="components/navBarComponent.jsp" %>
    </header>

    <body style="margin: 66px 10px 0px 10px !important; background-color: lightgoldenrodyellow;">
        <!-- Product section-->
        <section class="py-3">
            <div class="container row px-4 px-lg-5 mt-5 mb-2 mx-auto">
                <div class="col-md-6" style="padding: 0 !important">
                    <c:forEach items="${productDetail}" var="Pd">
                        <div class="col">
                            <div class="card h-100">
                                <!-- Sale badge-->
                                <c:choose> 
                                    <c:when test="${Pd.proPrice > 160}">  
                                        <div class="badge bg-dark text-white position-absolute px-2 py-1" style="top: 0.5rem; right: 0.5rem; background-color: red !important;">Sale
                                        </div>
                                    </c:when> 
                                    <c:when test="${Pd.proPrice > 140}">  
                                        <div class="badge bg-dark text-white position-absolute px-2 py-1" style="top: 0.5rem; right: 0.5rem; background-color: red !important;">Sale
                                        </div>
                                    </c:when> 
                                    <c:when test="${Pd.proPrice > 80 && Pd.proPrice < 100}">  
                                        <div class="badge bg-dark text-white position-absolute px-2 py-1" style="top: 0.5rem; right: 0.5rem; background-color: red !important;">Sale
                                        </div>
                                    </c:when>  
                                </c:choose> 
                                <a><img class="card-img-top" src="${Pd.proImg_url}" alt="..." /></a>
                            </div>
                        </div>
                    </c:forEach>
                </div>
                <div class="col-md-5 py-auto" style="padding: 0 !important">
                    <div class="py-auto" style="margin-top: 30%; margin-bottom: 30%">
                        <c:forEach items="${productDetail}" var="Pd">
                            <!-- Product details-->
                            <div class="card-body p-4">
                                <div>
                                    <!-- Product name-->
                                    <h5 class="fw-bolder" style="font-size: 40px">${Pd.proName}</h5>
                                    <!-- Product reviews-->
                                    <div class="d-flex small text-warning mb-2" style="padding-left: 17%">
                                        <c:choose>  
                                            <c:when test="${Pd.proPrice > 160}">  
                                                <div class="bi-star-fill" style="font-size: 20px"></div>
                                                <div class="bi-star-fill" style="font-size: 20px"></div>
                                                <div class="bi-star-fill" style="font-size: 20px"></div>
                                                <div class="bi-star-fill" style="font-size: 20px"></div>
                                                <div class="bi-star-fill" style="font-size: 20px"></div>
                                            </c:when> 
                                            <c:when test="${Pd.proPrice > 140}">  
                                                <div class="bi-star-fill" style="font-size: 20px"></div>
                                                <div class="bi-star-fill" style="font-size: 20px"></div>
                                                <div class="bi-star-fill" style="font-size: 20px"></div>
                                                <div class="bi-star-fill" style="font-size: 20px"></div>
                                            </c:when>
                                            <c:when test="${Pd.proPrice > 90}">  
                                                <div class="bi-star-fill" style="font-size: 20px"></div>
                                                <div class="bi-star-fill" style="font-size: 20px"></div>
                                                <div class="bi-star-fill" style="font-size: 20px"></div>
                                                <div class="bi-star-fill" style="font-size: 20px"></div>
                                                <div class="bi-star-fill" style="font-size: 20px"></div>
                                            </c:when>  
                                            <c:when test="${Pd.proPrice > 80}">  
                                                <div class="bi-star-fill" style="font-size: 20px"></div>
                                                <div class="bi-star-fill" style="font-size: 20px"></div>
                                                <div class="bi-star-fill" style="font-size: 20px"></div>
                                                <div class="bi-star-fill" style="font-size: 20px"></div>
                                            </c:when>  
                                            <c:otherwise>  
                                                <div class="bi-star-fill" style="font-size: 20px"></div>
                                                <div class="bi-star-fill" style="font-size: 20px"></div>
                                                <div class="bi-star-fill" style="font-size: 20px"></div> 
                                            </c:otherwise>  
                                        </c:choose> 
                                    </div>
                                    <!-- Product price-->
                                    <div style="padding-left: 12%">
                                        <c:choose>
                                            <c:when test="${Pd.proPrice > 160}">  
                                                <span class="text-muted text-decoration-line-through" style="font-size: 24px">$189.9</span>
                                            </c:when> 
                                            <c:when test="${Pd.proPrice > 140}">  
                                                <span class="text-muted text-decoration-line-through" style="font-size: 24px">$169.9</span>
                                            </c:when> 
                                            <c:when test="${Pd.proPrice > 100}">  
                                                <span class="text-muted text-decoration-line-through" style="font-size: 24px">$149.9</span>
                                            </c:when>  
                                            <c:when test="${Pd.proPrice > 90}">  
                                                <span class="text-muted text-decoration-line-through" style="font-size: 24px">$119.9</span>
                                            </c:when>  
                                            <c:when test="${Pd.proPrice > 89.9}">  
                                                <span class="text-muted text-decoration-line-through" style="font-size: 24px">$109.9</span>
                                            </c:when>   
                                        </c:choose>
                                        <span style="font-size: 24px">$${Pd.proPrice}</span>
                                    </div>

                                </div>
                                <p class="lead" style="font-size: 20px">${Pd.proDescription}</p>
                            </div>
                            <!-- Product actions-->
                            <div class="row pt-0 border-top-0 bg-transparent">
                                <div class="col-3" style="padding: 0 !important">
                                    <input class="form-control text-center me-3" id="inputQuantity" type="num" value="${Pd.proQuantity}" style="max-width: 4rem; float: right;  font-size: 20px" />
                                </div>
                                <div class="col-6" style="padding: 0 !important">
                                    <a href="add-to-cart?productId=${Pd.proId}" class="btn btn-outline-dark flex-shrink-0 ms-2" type="button" style="padding: 8px;">
                                        <i class="bi-cart-fill me-1"></i>
                                        Add to Card
                                    </a>
                                    <a class="btn btn-outline-success flex-shrink-0 ms-2" type="button" style="padding: 8px;">
                                        <i class="bi-cart-fill me-1"></i>
                                        Buy now
                                    </a>
                                </div>                   
                            </div>
                        </div>
                    </c:forEach> 
                </div>

            </div>
        </div>
    </section>

    <!-- Related items section-->
    <section class="py-5 bg-light">
        <div class="container px-4 px-lg-5 mt-5">
            <h2 class="fw-bolder mb-4">Related products</h2>
            <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
                <c:forEach begin="1" end="4" items="${listProducts}" var="Pro">
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
                                        <c:when test="${Pro.proPrice > 89.9}">  
                                            <span class="text-muted text-decoration-line-through">$109.9</span>
                                        </c:when>   
                                    </c:choose>
                                    $${Pro.proPrice}
                                </div>
                            </div>
                            <!-- Product actions-->
                            <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="#">Add to cart</a></div>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
    </section>
</body>

<footer>
    <%@include file="components/footerComponent.jsp" %>
</footer>

</html>
