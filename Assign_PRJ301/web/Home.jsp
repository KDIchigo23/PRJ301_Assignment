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
        <!-- Carousel -->
        <div id="demo" class="carousel slide" data-bs-ride="carousel">

            <!-- Indicators/dots -->
            <div class="carousel-indicators">
                <button type="button" data-bs-target="#demo" data-bs-slide-to="0" class="active"></button>
                <button type="button" data-bs-target="#demo" data-bs-slide-to="1"></button>
                <button type="button" data-bs-target="#demo" data-bs-slide-to="2"></button>
            </div>

            <!-- The slideshow/carousel -->
            <div class="carousel-inner">
                <div class="carousel-item active">
                    <img class="img-height-500" src="images/NBA-Playoffs-2022.png" alt="NBA-Playoffs-2022"
                         class="d-block w-100" style="width:100%">
                </div>
                <div class="carousel-item">
                    <img class="img-height-500" src="images/Allstars-2022/nba-allstars-2022-home.png"
                         alt="All-Star-Game-2022" class="d-block w-100" style="width:100%">
                </div>
                <div class="carousel-item">
                    <img class="img-height-500" src="images/Bucks-NBA-Champions-2021.png" alt="Bucks-NBA-Champions-2021"
                         class="d-block w-100" style="width:100%">
                </div>
            </div>

            <!-- Left and right controls/icons -->
            <button class="carousel-control-prev" type="button" data-bs-target="#demo" data-bs-slide="prev">
                <span class="carousel-control-prev-icon"></span>
            </button>
            <button class="carousel-control-next" type="button" data-bs-target="#demo" data-bs-slide="next">
                <span class="carousel-control-next-icon"></span>
            </button>
        </div>

        <!-- Blog preview section-->
        <section class="py-5 bg-secondary mt-2">
            <div class="container px-5 my-5">
                <div class="row gx-5 justify-content-center">
                    <div class="col-lg-8 col-xl-6">
                        <div class="text-center">
                            <h1 class="fw-bolder">----------News-----------</h1>
                            <p class="lead fw-normal text-muted mb-5">Lorem ipsum, dolor sit amet consectetur adipisicing
                                elit. Eaque fugit ratione dicta mollitia. Officiis ad.</p>
                        </div>
                    </div>
                </div>
                <div class="row gx-5">
                    <div class="row gx-5">
                        <div class="col-lg-4 mb-5">
                            <div class="card h-100 shadow border-0">
                                <img class="card-img-top" src="images/Allstars-2022/Steph-Curry-MVP-Allstars-2022.png"
                                     alt="..." style="width: 100%; height: 90%;" />
                                <div class="card-body p-4">
                                    <div class="badge bg-primary bg-gradient rounded-pill mb-2">News</div>
                                    <a class="text-decoration-none link-dark stretched-link" href="#!">
                                        <h5 class="card-title mb-3">Steph Curry first-time MVP-Allstar</h5>
                                    </a>
                                    <p class="card-text mb-0">Golden State Warriors guard Stephen Curry is having the worst
                                        3-point shooting season of his career in Cleveland.</p>
                                </div>
                                <div class="card-footer p-4 pt-0 bg-transparent border-top-0">
                                    <div class="d-flex align-items-end justify-content-between">
                                        <div class="d-flex align-items-center">
                                            <img class="rounded-circle me-3"
                                                 src="https://dummyimage.com/40x40/ced4da/6c757d" alt="..." />
                                            <div class="small">
                                                <div class="fw-bold">KDIchigo</div>
                                                <div class="text-muted">February 22, 2022 &middot; 4 min read</div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-4 mb-5">
                            <div class="card h-100 shadow border-0">
                                <img class="card-img-top" src="images/Allstars-2022/Lebron-GameWinner-Allstars-2022.png"
                                     alt="..." style="width: 100%; height: 90%;" />
                                <div class="card-body p-4">
                                    <div class="badge bg-primary bg-gradient rounded-pill mb-2">News</div>
                                    <a class="text-decoration-none link-dark stretched-link" href="#!">
                                        <h5 class="card-title mb-3">Lebron James Game-Winner</h5>
                                    </a>
                                    <p class="card-text mb-0">LeBron didn't have a great shooting night, missing nine of his
                                        11 3-pointers. But he had the best game-winning in NBA-Allstars</p>
                                </div>
                                <div class="card-footer p-4 pt-0 bg-transparent border-top-0">
                                    <div class="d-flex align-items-end justify-content-between">
                                        <div class="d-flex align-items-center">
                                            <img class="rounded-circle me-3"
                                                 src="https://dummyimage.com/40x40/ced4da/6c757d" alt="..." />
                                            <div class="small">
                                                <div class="fw-bold">KDIchigo</div>
                                                <div class="text-muted">February 22, 2022 &middot; 4 min read</div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-4 mb-5">
                            <div class="card h-100 shadow border-0">
                                <img class="card-img-top" src="images/Kevin-Durant-Dunk.png" alt="..."
                                     style="width: 100%; height: 90%;" />
                                <div class="card-body p-4">
                                    <div class="badge bg-primary bg-gradient rounded-pill mb-2">Media</div>
                                    <a class="text-decoration-none link-dark stretched-link" href="#!">
                                        <h5 class="card-title mb-3">Kevin Duran first dunk after injury</h5>
                                    </a>
                                    <p class="card-text mb-0">The first-time play for Nrooklyn Nets after injury in GSW.
                                        Then, he came back with the tibi-dunk.</p>
                                </div>
                                <div class="card-footer p-4 pt-0 bg-transparent border-top-0">
                                    <div class="d-flex align-items-end justify-content-between">
                                        <div class="d-flex align-items-center">
                                            <img class="rounded-circle me-3"
                                                 src="https://dummyimage.com/40x40/ced4da/6c757d" alt="..." />
                                            <div class="small">
                                                <div class="fw-bold">KDIchigo</div>
                                                <div class="text-muted">February 10, 2022 &middot; 10 min read</div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
        </section>

        <!-- Testimonial section-->
        <div class="py-5 mt-2" style="background-color: darkgray;">
            <div class="container px-5 my-5">
                <div class="row gx-5 justify-content-center">
                    <div class="col-lg-10 col-xl-7">
                        <div class="text-center">
                            <div class="fs-4 mb-4 fst-italic">"You can’t be afraid to fail. It’s the only way you succeed.
                                You’re not gonna succeed all the time and I know that!"</div>
                            <div class="d-flex align-items-center justify-content-center">
                                <img class="rounded-circle me-3" src="https://dummyimage.com/40x40/ced4da/6c757d"
                                     alt="..." />
                                <div class="fw-bold">
                                    King James
                                    <span class="fw-bold text-primary mx-1">/</span>
                                    The best player in the NBA present
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Call to action-->
            <aside class="bg-primary bg-gradient rounded-3 p-4 p-sm-5 mt-5 mx-auto" style="width: 70%;">
                <div
                    class="d-flex align-items-center justify-content-between flex-column flex-xl-row text-center text-xl-start">
                    <div class="mb-4 mb-xl-0">
                        <div class="fs-3 fw-bold text-white">New products, delivered to you.</div>
                        <div class="text-white-50">Sign up for our newsletter for the latest updates.</div>
                    </div>
                    <div class="ms-xl-4">
                        <div class="input-group mb-2">
                            <input class="form-control" type="text" placeholder="Email address..."
                                   aria-label="Email address..." aria-describedby="button-newsletter" />
                            <button class="btn btn-outline-light" id="button-newsletter" type="button">Sign
                                up</button>
                        </div>
                        <div class="small text-white-50">We care about privacy, and will never share your data.
                        </div>
                    </div>
                </div>
            </aside>
        </div>

    </body>

    <footer>
        <%@include file="components/footerComponent.jsp" %>
    </footer>

</html>