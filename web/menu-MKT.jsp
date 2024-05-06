<%-- 
    Document   : menu-MKT
    Created on : Oct 6, 2023, 11:06:34 PM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>JSP Page</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
        <!-- JS -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="table-css/header.css">
    </head>
    <body>
        <header role="banner">
            <nav class="navbar navbar-expand-md navbar-dark bg-dark">
                <div class="container">
                    <a class="navbar-brand" href="shop">
                        <h1 class="tm-site-title mb-0">FBT Shoes Shop</h1>
                    </a>
                    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarsExample05" aria-controls="navbarsExample05" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>

                    <div class="collapse navbar-collapse" id="navbarsExample05">
                        <ul class="navbar-nav ml-auto pl-lg-5 pl-0">
                            <li class="nav-item">
                                <a class="nav-link active" href="home">Home</a>
                            </li>
                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle" href="#" id="dropdown" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Sliders</a>
                                <div class="dropdown-menu" aria-labelledby="dropdown04">
                                    <a class="dropdown-item" href="sliderlist">List Slider</a>
                                    <a class="dropdown-item" href="addslider">Add Slider</a>
                                    <a class="dropdown-item" href="changesliderarrange">Change Arrange</a>
                                </div>
                            </li>
                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle" href="#" id="dropdown" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Product</a>
                                <div class="dropdown-menu" aria-labelledby="dropdown04">
                                    <a class="dropdown-item" href="mktproductlist">List Product</a>
                                    <a class="dropdown-item" href="mktsalelist">Product Sale</a>
                                </div>
                            </li>
                        </ul>

                        <ul class="navbar-nav ml-auto">
                            <li class="nav-item cta-btn">
                                <a class="nav-link" href="profile">Profile</a>
                            </li>
                        </ul>

                    </div>
                </div>
            </nav>
        </header>
        <script>
            $(document).ready(function () {
                $(".nav-item.dropdown").hover(function () {
                    $(this).find(".dropdown-menu").slideDown(300);
                }, function () {
                    $(this).find(".dropdown-menu").slideUp(300);
                });
            });
        </script>
        <script src="js/jquery.min.js"></script>
        <script src="js/popper.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/main.js"></script>
    </body>
</html>
