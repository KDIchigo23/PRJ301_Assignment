<%-- 
    Document   : CartHover
    Created on : Mar 15, 2022, 8:01:55 PM
    Author     : ADMIN
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<table class="text-dark cart-table row pe-3" style="border: 1px solid gray;">
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
