

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
        <div style="border: 1px solid #ccc; border-radius: 5px; padding: 1rem; width: 40%" class="my-5">
            <h3>Add New Player</h3>
            <form action="create-player" method="POST" class="container">
                <div class="mb-3">
                    <input type="text" class="form-control" id="pImg_url" name="pImg_url" placeholder="Player Img_url Link">
                </div>
                <div class="mb-3">
                    <select name="team" id="team" style="border: 1px solid #ced4da; width: 100% !important; padding: 8px">
                        <c:forEach items="${sessionScope.listTeams}" var="T">
                            <option value="${T.tId}">
                                ${T.tName}
                            </option>
                        </c:forEach>
                    </select>
                </div>

                <div class="mb-3">
                    <input type="text" class="form-control" id="pName" name="pName" placeholder="Player Name">
                </div>
                <div class="mb-3 row d-flex" style="padding-left: 2%">
                    <input type="text" class="form-control col-6 me-2" id="pHeight" name="pHeight" placeholder="Player Height" style="width: 48% !important">
                    <input type="date" class="form-control col-6" id="pDob" name="pDob" placeholder="Player Date of Birth" style="width: 48% !important">
                </div>
                <div class="mb-3 row d-flex" style="padding-left: 2%">
                    <input type="text" class="form-control col-6 me-2" id="pPosition" name="pPosition" placeholder="Player Position" style="width: 48% !important">
                    <input type="text" class="form-control col-6" id="pNo" name="pNo" placeholder="Player Number" style="width: 48% !important">
                </div>
                <div class="mb-3">
                    <input type="text" class="form-control" id="pAchievement" name="pAchievement" placeholder="Player Achievement">
<!--                    <textarea class="form-control" id="pAchievement" name="pAchievement" rows="3" placeholder="Player Achievement"></textarea>-->
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
