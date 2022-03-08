<%-- 
    Document   : Login
    Created on : Feb 25, 2022, 4:39:03 PM
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
        <nav class="navbar navbar-expand-lg navbar-light bg-dark fixed-top">
            <div class="container-fluid px-4 px-lg-5 my-2">
                <a href="home-controller"><img src="https://cdn.nba.com/logos/nba/nba-logoman-75-word_white.svg" style="height: 40px;" alt=""></a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                        data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false"
                        aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
            </div>
        </nav>
    </header>

    <body>
        <section class="gradient-custom mx-auto">
            <div class="container py-5 h-100">
                <div class="row d-flex justify-content-center align-items-center h-100 pt-5 mt-3">
                    <div class="col-12 col-md-8 col-lg-6 col-xl-5">
                        <div class="card bg-dark text-white" style="border-radius: 1rem;">
                            <div class="card-body p-5 text-center">
                                <div class="mb-md-5 mt-md-4 pb-5">
                                    <form action="signup" method="POST">
                                        <h2 class="fw-bold mb-2 text-uppercase">Sign up</h2>
                                        <p class="text-white-50 mb-5">Please enter your login and password!</p>
                                        <input type="text" id="typeText" name="displayname" class="form-control form-control-lg bg-dark text-white"
                                               placeholder="Enter your Displayname">
                                        <input type="text" id="typeText" name="username" class="form-control form-control-lg bg-dark text-white mt-4"
                                               placeholder="Enter your Username">
                                        <input type="password" id="typePasswordX" name="password" class="form-control form-control-lg bg-dark text-white my-4"
                                               placeholder="Enter your Password" />
                                        <input type="password" id="typePasswordX" name="re_password" class="form-control form-control-lg bg-dark text-white mb-4"
                                               placeholder="Re-Enter your Password" />
                                        <div class="d-flex justify-content-center text-center mt-4 pt-1">
                                            <a href="#!" class="text-white"><i class="fab fa-facebook-f fa-lg"></i></a>
                                            <a href="#!" class="text-white"><i class="fab fa-twitter fa-lg mx-4 px-2"></i></a>
                                            <a href="#!" class="text-white"><i class="fab fa-google fa-lg"></i></a>
                                        </div>

                                        <button class="btn btn-outline-light btn-lg px-5" type="submit">Sign up</button>
                                        <div class="d-flex justify-content-center text-center mt-4 pt-1">
                                            <a href="#!" class="text-white"><i class="fab fa-facebook-f fa-lg"></i></a>
                                            <a href="#!" class="text-white"><i class="fab fa-twitter fa-lg mx-4 px-2"></i></a>
                                            <a href="#!" class="text-white"><i class="fab fa-google fa-lg"></i></a>
                                        </div>
                                        <div>
                                            <p class="mb-0">You have an account? <a href="Login.jsp" class="text-white-50 fw-bold">Login</a></p>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </body>

</html>
