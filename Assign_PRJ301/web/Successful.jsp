

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



    <body style="margin: 100px 10px 0px 10px !important">
        <header>
            <%@include file="components/navBarComponent.jsp" %>
        </header>

    <center>
        <div class="container" style="min-height: 1000px">
            <div class="alert alert-success text-center mt-5" role="alert" >
                Order successfully, Thank you very much...
                <div class="text-center mt-2">
                    <a class="btn btn-outline-primary" href="home-controller">Continue Shopping</a>
                </div>
            </div>
        </div>
    </center>

    <footer>
        <%@include file="components/footerComponent.jsp" %>
    </footer>

</body>
</html>
