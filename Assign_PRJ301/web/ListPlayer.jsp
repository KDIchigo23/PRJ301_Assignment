<%-- 
    Document   : ListPlayer
    Created on : Mar 14, 2022, 12:58:29 AM
    Author     : ADMIN
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<select name="player" id="player" style="border: 1px solid #ced4da; width: 100% !important; padding: 8px">
    <c:forEach items="${listPlayers}" var="P">
        <option value="${P.pId}">
            ${P.pName}
        </option>
    </c:forEach>
</select>
