<%-- 
    Document   : CreateProduct
    Created on : Mar 8, 2022, 2:46:31 PM
    Author     : ADMIN
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
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
        <link rel="stylesheet" href="/Assign_PRJ301/css/Home.css">
        <link href="/Assign_PRJ301/css/styles.css" rel="stylesheet"/>        
    </head>



    <body style="margin: 100px 10px 0px 10px !important">
        <header>
            <%@include file="components/navBarComponent.jsp" %>
        </header>

    <center>
        <div class="my-5" style="border: 1px solid #ccc; border-radius: 5px; padding: 1rem; width: 40%">
            <h3>Update Product ${sessionScope.onlyProductByProductId.getProName()}</h3>
            <form action="update-product" method="POST" class="container">
                <div class="mb-3">
                    <input type="text" class="form-control" id="proImg_url" name="proImg_url" placeholder="Product Img_url"
                           value="${sessionScope.onlyProductByProductId.getProImg_url()}">
                </div>
                <div class="my-3">
                    <input type="text" class="form-control" id="proName" name="proName" placeholder="Product Name"
                           value="${sessionScope.onlyProductByProductId.getProName()}">
                </div>
                <div class="mb-3">
                    <select name="team" id="team" style="border: 1px solid #ced4da; width: 100% !important; padding: 8px" onchange="updateProductAsync(this.value)">
                        <c:forEach items="${sessionScope.listTeams}" var="T">
                            <option value="${T.tId}"
                                    <c:if test="${T.tId == sessionScope.checkProTeamId}">
                                        selected
                                    </c:if>
                                    >
                                ${T.tName}
                            </option>
                        </c:forEach>
                    </select>
                </div>
                <div class="mb-3" id="update_player">
                    <select name="player" id="team" style="border: 1px solid #ced4da; width: 100% !important; padding: 8px">
                        <c:forEach items="${sessionScope.listPlayers}" var="P">
                            <option value="${P.pId}"
                                    <c:if test="${P.pId == sessionScope.onlyProductByProductId.getpId()}">
                                        selected
                                    </c:if>
                                    >
                                ${P.pName}
                            </option>
                        </c:forEach>
                    </select>
                </div>
                <div class="mb-3">
                    <input type="text" class="form-control" id="proDescription" name="proDescription" placeholder="Product Description"
                           value="${sessionScope.onlyProductByProductId.getProDescription()}">
                </div>
                <div class="mb-3 row d-flex" style="padding-left: 2%">
                    <input type="text" class="form-control me-2" id="proQuantity" name="proQuantity" placeholder="Product Quantity" style="width: 48% !important"
                           value="${sessionScope.onlyProductByProductId.getProQuantity()}">
                    <input type="text" class="form-control" id="proPrice" name="proPrice" placeholder="Product Price" style="width: 48% !important"
                           value="${sessionScope.onlyProductByProductId.getProPrice()}">
                </div>
                <div class="mb-3">
                    <select name="category" id="team" style="border: 1px solid #ced4da; width: 100% !important; padding: 8px">
                        <c:forEach items="${sessionScope.listCategories}" var="Ct">
                            <option value="${Ct.ctId}"
                                    <c:if test="${Ct.ctId == sessionScope.onlyProductByProductId.getCtId()}">
                                        selected
                                    </c:if>
                                    >
                                ${Ct.ctName}
                            </option>
                        </c:forEach>
                    </select>
                </div>
                <button type="submit" class="btn btn-success w-100">Update</button>
            </form>
        </div>
    </center>

    <footer>
        <%@include file="components/footerComponent.jsp" %>
    </footer>
    <script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
    <script>
        function updateProductAsync(teamId) {
            axios.get('http://localhost:8080/Assign_PRJ301/create-product-async', {
                params: {
                    teamId: teamId
                }
            }).then((response) => {
                document.getElementById("update_player").innerHTML = response.data;
            })
        }
    </script>
</body>
</html>
