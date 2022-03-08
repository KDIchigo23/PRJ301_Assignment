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
        <link rel="stylesheet" href="css/Home.css">
        <link href="css/styles.css" rel="stylesheet"/>        
    </head>



    <body style="margin: 66px 10px 0px 10px !important">
        <header>
            <%@include file="components/navBarComponent.jsp" %>
        </header>

    <center>
        <div style="border: 1px solid #ccc; border-radius: 5px; padding: 1rem; width: 40%">
            <h3>Add new product</h3>
            <form action="checkout-controller" method="POST" class="container">
                <div class="my-3">
                    <input type="text" class="form-control" id="proName" name="proName" placeholder="Product Name">
                </div>
                <div class="mb-3">
                    <input type="text" class="form-control" id="proImg_url" name="proImg_url" placeholder="Product Img_url">
                </div>
                <div class="mb-3">
                    <input type="text" class="form-control" id="pId" name="pId" placeholder="Player Id">
                </div>
                <div class="mb-3">
                    <input type="text" class="form-control" id="pName" name="pName" placeholder="Player Name">
                </div>
                <div class="mb-3">
                    <textarea class="form-control" id="pDescription" name="pDescription" rows="3" placeholder="Player Description"></textarea>
                </div>
                <div class="mb-3">
                    <input type="text" class="form-control" id="proQuantity" name="proQuantity" placeholder="Product Quantity">
                </div>
                <div class="mb-3">
                    <input type="text" class="form-control" id="proPrice" name="proPrice" placeholder="Product Price">
                </div>
                <div class="mb-3">
                    <input type="text" class="form-control" id="ctId" name="ctId" placeholder="Category Id">
                </div>
                <div class="mb-3">
                    <input type="text" class="form-control" id="ctName" name="ctName" placeholder="Category Name">
                </div>
                <button type="submit" class="btn btn-success w-100">Create</button>
            </form>
        </div>
    </center>

    <footer>
        <%@include file="components/footerComponent.jsp" %>
    </footer>

</body>
</html>
