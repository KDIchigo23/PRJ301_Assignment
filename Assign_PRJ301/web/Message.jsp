

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
        <div style="border: 1px solid #ccc; border-radius: 5px; padding: 1rem; width: 40%; margin-bottom: 180px; margin-top: 120px">
            <h3>Message</h3>
            <form action="message" method="POST" class="container">
                <div class="mb-3">
                    <textarea class="form-control" id="message" name="message" rows="3" placeholder="Message"></textarea>
                </div>
                <button type="submit" class="btn btn-success w-100">Send</button>
            </form>
        </div>
    </center>

    <footer>
        <%@include file="components/footerComponent.jsp" %>
    </footer>

</body>
</html>
