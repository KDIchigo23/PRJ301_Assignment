<%-- 
    Document   : Home
    Created on : Feb 24, 2022, 3:52:48 PM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- Latest compiled and minified CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- Latest compiled JavaScript -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <link rel="stylesheet" href="/css/Home.css">
    <link href="css/styles.css" rel="stylesheet" />
    <title>NBA players</title>
</head>

<header>
    <nav class="navbar navbar-expand-lg navbar-light bg-dark fixed-top">
        <div class="container-fluid px-4 px-lg-5">
            <img src="https://cdn.nba.com/logos/nba/nba-logoman-75-word_white.svg" style="height: 40px;" alt="">
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false"
                aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4">
                    <li class="nav-item">
                        <a class="nav-link active text-white" aria-current="page" href="#!">NBA Team</a>
                    </li>
                    <li class="nav-item"><a class="nav-link text-white" href="#!">NBA All-Star</a></li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle text-white" id="navbarDropdown" href="#" role="button"
                            data-bs-toggle="dropdown" aria-expanded="false">Shop</a>
                        <ul class="dropdown-menu bg-dark" aria-labelledby="navbarDropdown">
                            <li><a class="dropdown-item text-white bg-color-grey-hover" href="#!">All Products</a></li>
                            <li>
                                <hr class="dropdown-divider" style="color: #d8e3e887;" />
                            </li>
                            <li><a class="dropdown-item text-white bg-color-grey-hover" href="#!">Popular Items</a></li>
                            <li><a class="dropdown-item text-white bg-color-grey-hover" href="#!">New Arrivals</a></li>
                        </ul>
                    </li>
                </ul>
                <form class="d-flex mx-auto">
                    <input class="form-control me-2" type="search" placeholder="Search in here" aria-label="Search" />
                    <button class="btn btn-outline-success" type="submit">
                        Search
                    </button>
                </form>
                <form class="d-flex my-2">
                    <button class="btn btn-outline-light" type="submit">
                        <i class="bi-cart-fill me-1"></i>
                        Cart
                        <span class="badge bg-light text-dark ms-1 rounded-pill">0</span>
                    </button>
                </form>
                <button class="btn btn-outline-primary ms-lg-2">Login</button>
            </div>
        </div>
    </nav>
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
                <img class="img-height-500" src="/images/NBA-Playoffs-2022.png" alt="NBA-Playoffs-2022"
                    class="d-block w-100" style="width:100%">
            </div>
            <div class="carousel-item">
                <img class="img-height-500" src="/images/Allstars-2022/nba-allstars-2022-home.png"
                    alt="All-Star-Game-2022" class="d-block w-100" style="width:100%">
            </div>
            <div class="carousel-item">
                <img class="img-height-500" src="/images/Bucks-NBA-Champions-2021.png" alt="Bucks-NBA-Champions-2021"
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
                            <img class="card-img-top" src="/images/Allstars-2022/Steph-Curry-MVP-Allstars-2022.png"
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
                            <img class="card-img-top" src="/images/Allstars-2022/Lebron-GameWinner-Allstars-2022.png"
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
                            <img class="card-img-top" src="/images/Kevin-Durant-Dunk.png" alt="..."
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
        %<aside class="bg-primary bg-gradient rounded-3 p-4 p-sm-5 mt-5 mx-auto" style="width: 70%;">
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

<footer class="container-fluid text-center text-lg-start border border-secondary mt-2 pt-4 bg-dark">
    <!-- Grid container -->
    <div class="container-fluid p-4">
        <!--Grid row-->
        <div class="row">
            <!--Grid column-->
            <div class="col-lg-3 col-md-6 mb-4 mb-lg-0 ps-5">
                <h5 class="text-uppercase mb-4 text-white-50">NBA</h5>

                <ul class="list-unstyled mb-4">
                    <li>
                        <a href="#!" class="text-white text-decoration-none">NBA Pre-season</a>
                    </li>
                    <li>
                        <a href="#!" class="text-white text-decoration-none">NBA All-star Game</a>
                    </li>
                    <li>
                        <a href="#!" class="text-white text-decoration-none">NBA Finals Game</a>
                    </li>
                    <li>
                        <a href="#!" class="text-white text-decoration-none">NBA 75 </a>
                    </li>
                </ul>
            </div>
            <!--Grid column-->

            <!--Grid column-->
            <div class="col-lg-3 col-md-6 mb-4 mb-lg-0 ps-5">
                <h5 class="text-uppercase mb-4 text-white-50">Skills</h5>

                <ul class="list-unstyled">
                    <li>
                        <a href="#!" class="text-white text-decoration-none">Dribbling Skills</a>
                    </li>
                    <li>
                        <a href="#!" class="text-white text-decoration-none">Shooting Skills</a>
                    </li>
                    <li>
                        <a href="#!" class="text-white text-decoration-none">Passing Skills</a>
                    </li>
                    <li>
                        <a href="#!" class="text-white text-decoration-none">Dunking Skills</a>
                    </li>
                </ul>
            </div>
            <!--Grid column-->

            <!--Grid column-->
            <div class="col-lg-3 col-md-6 mb-4 mb-lg-0 ps-5">
                <h5 class="text-uppercase mb-4 text-white-50">Shop</h5>

                <ul class="list-unstyled">
                    <li>
                        <a href="#!" class="text-white text-decoration-none">Jersey</a>
                    </li>
                    <li>
                        <a href="#!" class="text-white text-decoration-none">Ball</a>
                    </li>
                    <li>
                        <a href="#!" class="text-white text-decoration-none">Shoe</a>
                    </li>
                </ul>
            </div>
            <!--Grid column-->

            <!--Grid column-->
            <div class="col-lg-3 col-md-6 mb-4 mb-lg-0 ps-5">
                <h5 class="text-uppercase mb-4 text-white-50">Special Skills</h5>

                <ul class="list-unstyled">
                    <li>
                        <a href="#!" class="text-white text-decoration-none">Shooting 3-point</a>
                    </li>
                    <li>
                        <a href="#!" class="text-white text-decoration-none">Alley-oop Dunk</a>
                    </li>
                    <li>
                        <a href="#!" class="text-white text-decoration-none">Breaking Ankle</a>
                    </li>
                    <li>
                        <a href="#!" class="text-white text-decoration-none">Buzzer-Beater</a>
                    </li>
                </ul>
            </div>
            <!--Grid column-->

            <!--Grid column-->

        </div>
        <!--Grid row-->
    </div>
    <!-- Grid container -->

    <!-- Copyright -->
    <div class="text-center p-3 border-top border-white">
        <a class="text-white" href="#">Made by KDIchigo</a>
    </div>
</footer>

</html>