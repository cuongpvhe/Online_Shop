<%-- 
    Document   : header
    Created on : Oct 4, 2023, 2:05:00 PM
    Author     : admin
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="https://fonts.googleapis.com/css2?family=Nunito+Sans:wght@300;400;600;700;800;900&display=swap"
              rel="stylesheet">

        <!-- Css Styles -->
        <link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">
        <link rel="stylesheet" href="css/fontawesome.min.css" type="text/css">
        <link rel="stylesheet" href="css/elegant-icons.css" type="text/css">
        <link rel="stylesheet" href="css/magnific-popup.css" type="text/css">
        <link rel="stylesheet" href="css/nice-select.css" type="text/css">
        <link rel="stylesheet" href="css/owl.carousel.min.css" type="text/css">
        <link rel="stylesheet" href="css/slicknav.min.css" type="text/css">
        <link rel="stylesheet" href="css/style.css" type="text/css">
        <link rel="stylesheet" href="css/all.min.css" type="text/css">


        <style>
            .header__menu ul li:hover label {
                -webkit-transform: scale(1);
                -ms-transform: scale(1);
                transform: scale(1);
            }

            .header__menu ul li label {
                font-size: 18px;
                color: #111111;
                display: block;
                font-weight: 600;
                position: relative;
                padding: 3px 0;
                text-decoration: auto;
            }
            .codinh {
                position: fixed;
                top: 0;
                width: 100%;
                z-index: 100;

            }
            body {
                padding-top: 80px;
            }
        </style>
    </head>
    <body>
        <header class="header codinh" style="background-color: #eeeeef">
            <!--     <div class="header__top">
                    <div class="container">
                        <div class="row">
                            <div class="col-lg-6 col-md-7">
                                <div class="header__top__left">
                                    <p>Free shipping, 30-day return or refund guarantee.</p>
                                </div>
                            </div>
                            <div class="col-lg-6 col-md-5">
                                <div class="header__top__right">
                                    <div class="header__top__links">
                                        <a href="#">Sign in</a>
                                        <a href="#">FAQs</a>
                                    </div>
                                    <div class="header__top__hover">
                                        <span>Usd <i class="arrow_carrot-down"></i></span>
                                        <ul>
                                            <li>USD</li>
                                            <li>EUR</li>
                                            <li>USD</li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>-->

            <div class="container">
                <div class="row">
                    <div class="col-lg-1 col-md-1">
                        <div class="header__logo">
                            <a href="./index.html"><img src="img/logo.png" alt=""></a>
                        </div>
                    </div>

                    <div class="col-lg-6 col-md-6">
                        <nav class="header__menu mobile-menu">
                            <ul>
                                <li><a href="home">Home</a></li>
                                <li ><a href="shop">Shop</a></li>
                                <li><a href="saleshop">Sale</a></li>
                                <li><a href="flsale">FlashSale</a></li>
                            </ul>
                        </nav>
                    </div>
                    <div class="col-lg-4 col-md-4 d-flex justify-content-center align-content-center">
                        <c:if test="${account.img == null}" >
                            <img src="Images/Avatar/defaultavt.jpg" class="rounded-circle img-responsive" style="width: 65px; height: 65px; margin: auto 20px;">
                        </c:if>
                        <c:if test="${account.img != null}" >
                            <img src="${account.img}" class="rounded-circle img-responsive" style="width: 65px; height: 65px; margin: auto 20px;">
                        </c:if>

                        <nav class="header__menu mobile-menu">
                            <ul>
                                <c:if test="${account.roleId == 1}" >
                                    <li><a href="#" style="font-size: 18px">${account.fullName} ${account.fullName==null?"Xin Chào":""} </a>
                                        <ul class="dropdown">
                                            <li><a href="profile">Profile</a></li>
                                            <li><a href="listAccountControll?index=1">Dashboard</a></li>
                                            <li><a href="logout">Logout</a></li>
                                            <li><a href="show">Cart</a></li>
                                        </ul>
                                    </li>
                                </c:if>
                                <c:if test="${account.roleId == 2}" >
                                    <li><a href="#" style="font-size: 18px">${account.fullName} ${account.fullName==null?"Xin Chào":""} </a>
                                        <ul class="dropdown">
                                            <li><a href="profile">Profile</a></li>
                                            <li><a href="logout">Logout</a></li>
                                            <li><a href="show">Cart</a></li>
                                        </ul>
                                    </li>
                                </c:if>
                                <c:if test="${account.roleId == 3}" >
                                    <li><a href="#" style="font-size: 18px">${account.fullName} ${account.fullName==null?"Xin Chào":""} </a>
                                        <ul class="dropdown">
                                            <li><a href="profile">Profile</a></li>
                                            <li><a href="listProductSales?index=1">Sale Dashboard</a></li>
                                            <li><a href="logout">Logout</a></li>
                                            <li><a href="show">Cart</a></li>
                                        </ul>
                                    </li>
                                </c:if>
                                <c:if test="${account.roleId == 4}" >
                                    <li><a href="#" style="font-size: 18px">${account.fullName} ${account.fullName==null?"Xin Chào":""} </a>
                                        <ul class="dropdown">
                                            <li><a href="profile">Profile</a></li>
                                            <li><a href="mktsalelist">Marketing Dashboard</a></li>
                                            <li><a href="logout">Logout</a></li>
                                            <li><a href="show">Cart</a></li>
                                        </ul>
                                    </li>
                                </c:if>
                                <c:if test="${account == null}" >
                                    <li>
                                        <a href="login.jsp">Login</a>
                                    </li>
                                </c:if>
                            </ul>
                        </nav>

                        <div class="header__nav__option">
                            <input type="hidden" id="aid" value="${aid}">
                            <!--<a href="#" class="search-switch"><i class="fad fa-search fa-lg" style="color: #000000;"></i></a>-->
                            <a href="show" style="margin: auto 25px;"><i class="fad fa-shopping-cart" style="color: #000000;padding-left: 0px;"></i><span id="show" style="font-size: 11px;
                                                                                                                                                          display: flex;
                                                                                                                                                          justify-content: center;
                                                                                                                                                          top: 8px;
                                                                                                                                                          right: -10px;
                                                                                                                                                          border: 1px solid;
                                                                                                                                                          border-radius: 50%;
                                                                                                                                                          height: 16px;
                                                                                                                                                          width: 16px;
                                                                                                                                                          margin-left: 13px;
                                                                                                                                                          background-color: red;
                                                                                                                                                          color: white;
                                                                                                                                                          font-weight: 600;">${sizeCart}</span></a>
                        </div>
                    </div>
                </div>
            </div>
        </header>
        <script>
            window.addEventListener('load', function () {
                function getCookie(name) {
                    var nameEQ = name + "=";
                    var ca = document.cookie.split(';');
                    for (var i = 0; i < ca.length; i++) {
                        var c = ca[i];
                        while (c.charAt(0) == ' ')
                            c = c.substring(1, c.length);
                        if (c.indexOf(nameEQ) == 0)
                            return c.substring(nameEQ.length, c.length);
                    }
                    return "0";
                }
                var aid = document.getElementById('aid').value;
                var oid = getCookie('oid');
                var cookieValue;
                if (aid != null) {
                    cookieValue = getCookie('cartSize'+aid);
                } else {
                    cookieValue = getCookie('cartSize');
                }
                document.getElementById("show").innerHTML = cookieValue;
                console.log(aid);
            });
        </script>
    </body>
</html>
