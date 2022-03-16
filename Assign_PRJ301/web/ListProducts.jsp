<%-- 
    Document   : ListProducts
    Created on : Mar 16, 2022, 12:19:55 AM
    Author     : ADMIN
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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

