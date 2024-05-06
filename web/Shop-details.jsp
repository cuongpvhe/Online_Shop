<%-- 
    Document   : Shop-details
    Created on : Sep 16, 2023, 5:10:20 PM
    Author     : win
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="listMoreImage" value="${listImage}" />
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Product Detail</title>
        <!-- Google Font -->
        <link href="https://fonts.googleapis.com/css2?family=Nunito+Sans:wght@300;400;600;700;800;900&display=swap"
              rel="stylesheet">
        <!-- Css Styles -->
        <link rel="stylesheet" href="css/bootstrap3.min.css" type="text/css">
        <link rel="stylesheet" href="css/style.css" type="text/css">
        <link rel="stylesheet" href="css/all.min.css" type="text/css">
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <!--<script src="js/jquery-3.3.1.min.js"></script>-->
        <script src="js/jquery.nice-select.min.js"></script>
        <script src="js/jquery.nicescroll.min.js"></script>
        <script src="js/jquery.magnific-popup.min.js"></script>
        <script src="js/jquery.countdown.min.js"></script>
        <script src="js/jquery.slicknav.js"></script>
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
                    cookieValue = getCookie('cartSize' + aid);
                } else {
                    cookieValue = getCookie('cartSize');
                }
                document.getElementById("show").innerHTML = cookieValue;

            });
        </script>

        <!--<script src="js/jquery-3.3.1.min.js"></script>-->
        <script src="js/jquery.nice-select.min.js"></script>
        <script src="js/jquery.nicescroll.min.js"></script>
        <script src="js/jquery.magnific-popup.min.js"></script>
        <script src="js/jquery.countdown.min.js"></script>
        <script src="js/jquery.slicknav.js"></script>
    </head>
    <body>
        <div id="moreFeedback" style="display: none;">
            <div class="header" style="display: flex; justify-content: space-between; position: sticky; top: 0;">
                <div class="" style="display: flex; padding-top: 16px; padding-left: 6px; padding-right: 6px;">
                    <img style="max-width: 60px; max-height: 60px;"
                         src="${details.imageUrl}"
                         alt="Nike Air Force 1 '07 Men's Shoes" class="css-ldouik">
                    <div style="display: flex; align-items: center; flex-direction: column; justify-content: center; margin-left: 10px;">

                        <h1 style="font-size: 15px; font-weight: 700">${details.name}</h1>
                        <div class="product-price css-11s12ax is--current-price css-tpaepq" data-test="product-price">
                            <fmt:formatNumber maxFractionDigits = "3" value = "${details.price}" type = "number"/></div>
                    </div>

                </div>
                <button onclick="closes()" id="closeMoreFeedBack" style="border: 0; background-color: white; height: 50%; margin-top: 20px; margin-right: 20px;"><i class="fas fa-times fa-lg"></i></button>
            </div>
            <div style="border-bottom: .0625rem solid rgba(0,0,0,.12);">
                <div style="text-align: center;">
                    <span style="font-size: 1.875rem; font-weight: 700">${rateStarFeedBack}</span><span style="font-size: 1.125rem;"> trên 5</span>
                </div>

                <div class="moreStar" style="text-align: center; font-size: 25px;">
                    <i style="color: #f7941d;" class="fas fa-star fa-lg"></i>
                    <i style="color: #f7941d;" class="fas fa-star fa-lg"></i>
                    <i style="color: #f7941d;" class="fas fa-star fa-lg"></i>
                    <i style="color: #f7941d;" class="fas fa-star fa-lg"></i>
                    <i style="color: #f7941d;" class="fas fa-star fa-lg"></i>
                </div>

                <div style="text-align: center; font-size: 20px; font-weight: 700; margin-top: 10px;">
                    <!--<span>${countFeedBack} FEEDBACK</span>-->
                </div>
            </div>

            <c:forEach items="${listP}" var="lisT">
                <div class="row">
                    <div class="col-7" style="border-bottom: .0625rem solid rgba(0,0,0,.12); border-right: .0625rem solid rgba(0,0,0,.12); padding: 20px;">
                        <span>${lisT.fullnameFeedback}</span>
                        <div class="fbStar" style="width: 100%">
                            <c:set var="starCount" value="${lisT.star}" />
                            <c:forEach var="i" begin="1" end="${starCount}">
                                <i style="color: #f7941d;" class="fas fa-star fa-sm"></i>

                            </c:forEach>

                        </div>
                        <span>${lisT.date}</span>
                        <div style="width: 100%">
                            <div style="display: flex; flex-direction: column; margin-top: 7px;">
                                <span style="font-weight: 700">${lisT.title}</span>
                                <span>${lisT.desFeedback}</span>
                            </div>
                        </div>

                    </div>
                    <div class="col-5" style="display: flex; align-items: center; justify-content: space-around; border-bottom: .0625rem solid rgba(0,0,0,.12); border-right: .0625rem solid rgba(0,0,0,.12); padding: 15px;">
                        <c:forEach items="${lisT.feedbackImages}" var="images">
                            <a href="imgFB/${images.imgFeedBack}"><img width="128px" height="128px" src="imgFB/${images.imgFeedBack}" alt="imageFeedBack"/></a>
                            </c:forEach>
                    </div>

                </div>

            </c:forEach>



            <div class="phantrang">


                <ul class="pagination" style="    display: flex;
                    justify-content: center;
                    list-style: none;
                    padding: 0;
                    font-size: 18px;">

                    <c:forEach begin="1" end="${numberPage}" var="i">
                        <li>
                            <a class="page" href="details?pid=${details.id}&index=${i}" id="${tag == i?"active":""}">${i}</a>
                        </li>
                    </c:forEach>


                </ul>
            </div>
        </div>

        <div id="registrationForm" class="hidden">
            <div id="form">
                <form enctype="multipart/form-data" id="formFeedback" action="feedback" method="POST" style="border: 1px solid; border-radius: 24px;">
                    <button id="closeWriteButton" onclick="closeFormAddFB()" style="font-size: 25px;color: red; float: right; border: none; background-color: white;">x</button>

                    <div class="containerFeedback" style="display: flex; flex-direction: column; gap: 10px; padding: 20px;">
                        <div class="feedback-header">
                            <div style="font-weight: 700"class="feedback-header-heading">Write a Review</div>
                            <div style="color: #757575;" class="feedback-header-text">Share your thoughts with the community.</div>
                        </div>

                        <div class="infoProduct">
                            <img style="width: 60px;
                                 height: 60px;
                                 border-radius: 4px;" src="https://wac.edgecastcdn.net/001A39/prod/item/ZhFiFzTWXNodQyjsite/8758L.png"/>
                            <span style="font-weight: 600">${details.name}</span>

                        </div>

                        <div class="rate" style="border-bottom: 1px solid #e5e5e5;">
                            <div class="rate-text">
                                <span class="tt-o-field-group__label-text">Overall rating</span>
                                <span style="color: red;"> *</span>
                            </div>
                            <input style="display: none;" type="number" name="aid" value="${account.id}">
                            <input style="display: none;" type="number" name="pid" value="${details.id}">

                            <div class="rating" style="margin-bottom: 15px;">
                                <label class="star" for="star1">☆</label>
                                <label class="star" for="star2">☆</label>
                                <label class="star" for="star3">☆</label>
                                <label class="star" for="star4">☆</label>
                                <label class="star" for="star5">☆</label>
                                <input type="radio" id="star1" name="rating" value="1">
                                <input type="radio" id="star2" name="rating" value="2">
                                <input type="radio" id="star3" name="rating" value="3">
                                <input type="radio" id="star4" name="rating" value="4">
                                <input type="radio" id="star5" name="rating" value="5">
                            </div>
                        </div>

                        <input type="hidden" id="birthdate" name="birthdate">


                        <div class="reviewFeedbackTitle">

                            <span>Review Title</span>
                            <span style="color: red;"> *</span>

                            <input name="title" style="border: 1px solid;" class="form-control" required/>
                        </div>

                        <div class="reviewFeedbackText">
                            <span>Your Feedback</span>
                            <span style="color: red;"> *</span>
                            <textarea name="desFeedback" required style="border: 1px solid;" class="form-control" id="exampleFormControlTextarea1" rows="3"></textarea>
                        </div>

                        <div class="reviewFeedbackPhoto">
                            <span>Share your photos</span>
                            <div>
                                <span style="color: #757575;">Add up to 3 photos that show how you wear and style this product.</span>
                            </div>
                            <input id="fileAdd" class="form-control" type="file" name="image" multiple>


                        </div>

                        <button id="submitAddFB" class="btn btn-primary mb-3" type="button" onclick="validateFiless()" class ="btn btn-dark">Submit</button>
                    </div>
                </form>
            </div>
        </div>

        <!--formEditFeedBack-->
        <div id="editFeedBack" class="hidden">

            <form id="formEditFB" action="editfb" method="post" enctype="multipart/form-data" style="border: 1px solid; border-radius: 24px;">
                <button type="button" id="closeEditButton" style="font-size: 25px;color: red; float: right; border: none; background-color: white;">x</button>
                <div class="containerFeedback" style="display: flex; flex-direction: column; gap: 10px; padding: 10px;">                                    
                    <div class="infoProduct">
                        <img style="width: 60px;
                             height: 60px;
                             border-radius: 4px;" src="https://wac.edgecastcdn.net/001A39/prod/item/ZhFiFzTWXNodQyjsite/8758L.png"/>
                        <span style="font-weight: 600">${details.name}</span>

                    </div>
                    <div class="rate" style="border-bottom: 1px solid #e5e5e5;">
                        <div class="rate-text">
                            <span class="tt-o-field-group__label-text">Overall rating</span>
                            <span style="color: red;"> *</span>
                        </div>
                        <input style="display: none;" name="aidFB" value="${account.id}">
                        <input style="display: none;" name="pidFB" value="${details.id}">
                        <input style="display: none;" id="fidFB" name="fidFB">
                        <div class="ratingg" style="margin-bottom: 15px;"">


                            <input class="ratingEdit" type="radio" id="star5" name="rating" value="1" required >1
                            <input class="ratingEdit" type="radio" id="star4" name="rating" value="2">2
                            <input class="ratingEdit" type="radio" id="star3" name="rating" value="3">3
                            <input class="ratingEdit" type="radio" id="star2" name="rating" value="4">4
                            <input class="ratingEdit" type="radio" id="star1" name="rating" value="5">5

                        </div>
                    </div>
                    <div class="reviewFeedbackTitle">
                        <span>Review Title</span>
                        <span style="color: red;"> *</span>

                        <input id="title" name="title" style="border: 1px solid;" class="form-control"  required/>
                    </div>
                    <div class="reviewFeedbackText">
                        <span>Your Feedback</span>
                        <span style="color: red;"> *</span>
                        <textarea name="desFeedback" required style="border: 1px solid;" class="form-control" id="desFeedback" rows="3"></textarea>
                    </div>
                    <div class="reviewFeedbackPhoto">
                        <div >
                            <div id="contentImage" style="display: flex; gap: 50px;">
                            </div>
                        </div>
                        <br>
                        <div>
                            <span style="color: #757575;">Add up to max 3 photos that show how you wear and style this product.</span>
                        </div>
                        <input id="fileEdit" class="form-control" type="file" name="image" multiple>


                    </div>
                    <button id="hideFormEditFB" onclick="validateFiles()" class="btn btn-primary mb-3" type="button" class ="btn btn-dark">Update</button>
                </div>
            </form>


        </div>

        <div id="main" style="display: block;">
            <!-- Page Preloder -->
            <div id="preloder">
                <div class="loader"></div>
            </div>
            <!-- Header Section Begin -->
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
                                    <c:if test="${account != null}" >
                                        <li><a href="#" style="font-size: 18px">${account.fullName} ${account.fullName==null?"Xin Chào":""} </a>
                                            <ul class="dropdown">
                                                <li><a href="profile">Profile</a></li>
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
                                                                                                                                                              font-weight: 600;">0</span></a>
                            </div>
                        </div>
                    </div>
                </div>
            </header>
            <!-- Header Section End -->


            <!-- Shop Details Section Begin -->
            <section class="shop-details">
                <div class="product__details__pic">
                    <div class="container">
                        <div class="row">
                            <div class="col-lg-12">
                                <div class="product__details__breadcrumb">

                                <!--<span>${details.name}</span>-->
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <!--3-->
                            <div class="col-lg-2 col-md-3">
                                <ul id="list4Image" class="nav nav-tabs" role="tablist">
                                    <c:forEach items="${listImage}" var="images" varStatus="loop">
                                        <c:if test="${loop.index < 4}">
                                            <li class="nav-item">
                                                <a style="cursor: pointer"onclick="displayImage('${images.imageUrl}')" class="nav-link" data-toggle="tab" role="tab">
                                                    <div id="image${loop.index + 1}" class="product__thumb__pic set-bg" data-setbg="${images.imageUrl}">
                                                    </div>
                                                </a>
                                            </li>
                                        </c:if>
                                    </c:forEach> 


                                </ul>
                                <button id="showMoreImages" onclick="showMoreItems()" style="border: 0; padding: 13px; background-color: white; width: 97px; display: flex; justify-content: center;"><i class="fas fa-arrow-down fa-sm" style="color: #000000;"></i></button>


                            </div>

                            <!--6-9-->
                            <c:if test="${empty detailps}">
                                <div class="col-lg-4 col-md-5">
                                    <div class="tab-content">
                                        <div class="tab-pane active" id="" role="tabpanel">
                                            <div class="product__details__pic__item">
                                                <img id="displayedImg" src="${details.imageUrl}" alt="">
                                            </div>
                                        </div>
                                        <c:forEach items="${listImage}" var="images">
                                            <div  class="tab-pane" id="tabs-${images.id}" role="tabpanel">
                                                <div class="product__details__pic__item">
                                                    <img src="${images.imageUrl}" alt="">
                                                </div>
                                            </div>
                                        </c:forEach>
                                    </div>
                                </div>
                                <!--6-9-->
                                <div class="col-lg-6 col-md-4">
                                    <div class="product__details__content">
                                        <div class="container">
                                            <div class="row d-flex justify-content-center">
                                                <div class="col-lg-8" style="width: 100%;">
                                                    <div class="product__details__text">
                                                        <h4 style="font-size: 30px;">${details.name}</h4>   
                                                        <div class="rating" style="justify-content: center; font-weight: 600">
                                                            <span> ${checkCountFb} FeedBack</span>
                                                        </div>
                                                        <h3 style="font-size: 26px; color: red;"><fmt:formatNumber maxFractionDigits = "3" value = "${details.price}" type = "number"/> VND </h3>
                                                    <!--<p>${details.description}</p>-->

                                                        <div class="product__details__option">
                                                            <div class="product__details__option__size" style="display: flex;">
                                                                <span>Size:</span>
                                                                <c:forEach items="${psize}" var="psize">
                                                                    <label id="quantityProduct" onclick="showQuantity('${psize.sizeId}', '${psize.quantity}');" for="${psize.pid}">${psize.sizeId}
                                                                        <input type="radio" id="${psize.sizeId}">
                                                                    </label>
                                                                </c:forEach>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-12" id="errorMessage" style="color: red; font-size: 20px;"></div>
                                                        <div class="product__details__cart__option">
                                                            <form action="addtocart" method="post" onsubmit="return validateFormCart()">
                                                                <div class="quantity" style="display: flex;align-content: center">
                                                                    <input type="hidden" name="id" value="${details.id}">
                                                                    <input type="hidden" name="urlredirect" value="details?pid=${details.id}">
                                                                    <input type="hidden" name="size" id="size" value="">
                                                                    <input type="hidden" id="maxquantity">
                                                                    <div style="align-content: center;margin: auto 60px;">
                                                                        <button type="button" id="decreaseButton" onclick="decrease()" style="width: 30px; height: 30px"><i class="fas fa-minus"></i></button>
                                                                        <input id="quantity" name="quantity" value="1" style="width: 40px; text-align: center;border: 2px solid black;" type="text">
                                                                        <button type="button" id="increaseButton" onclick="increase()" style="width: 30px; height: 30px"><i class="fas fa-plus"></i></button>
                                                                    </div>

                                                                    <button type="submit" class="primary-btn">add to cart</button>
                                                                </div>
                                                            </form>

                                                            <i class="fad fa-shipping-fast fa-sm"></i>
                                                            <span style="font-weight: 700;">FREE NATIONWIDE SHIPPING</span>
                                                            <br>
                                                            <i class="fad fa-retweet-alt fa-sm"></i>
                                                            <span style="font-weight: 700;">EASY REIMBURSEMENT</span>

                                                            <div class="product__details__last__option">
                                                                <ul>
                                                                    <li><span>Sold:</span> ${details.quantity}</li>
                                                                    <li id="displayQuantity"><span>Quantity: </span>  </li>
                                                                    <li><span>Brand: </span> ${brandsProduct.name}</li>
                                                                </ul>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>

                                        </div>
                                    </div>
                                </c:if>
                                <c:if test="${not empty detailps}">
                                    <div class="col-lg-4 col-md-5">
                                        <div class="tab-content">
                                            <div class="tab-pane active" id="" role="tabpanel">
                                                <div class="product__details__pic__item">
                                                    <img id="displayedImg" src="${detailps.product.imageUrl}" alt="">
                                                </div>
                                            </div>
                                            <c:forEach items="${listImage}" var="images">
                                                <div  class="tab-pane" id="tabs-${images.id}" role="tabpanel">
                                                    <div class="product__details__pic__item">
                                                        <img src="${images.imageUrl}" alt="">
                                                    </div>
                                                </div>
                                            </c:forEach>
                                        </div>
                                    </div>
                                    <!--6-9-->
                                    <div class="col-lg-6 col-md-4">
                                        <div class="product__details__content">
                                            <div class="container">
                                                <div class="row d-flex justify-content-center">
                                                    <div class="col-lg-8" style="width: 100%;">
                                                        <div class="product__details__text">
                                                            <h4 style="font-size: 30px;">${detailps.product.name}</h4>   
                                                            <div class="rating" style="justify-content: center; font-weight: 600">
                                                                <span> 1000 FeedBack</span>
                                                            </div>
                                                            <span class="label" style="background: #ff7b1e; padding:0 5px;border-radius: 5px">Giảm: <fmt:formatNumber value="${detailps.discount}" pattern="#"/>%</span>
                                                            <span style="text-decoration: line-through; color: black;"><fmt:formatNumber maxFractionDigits = "3" value = "${detailps.product.price}" type = "number"/></span><br>
                                                            <c:if test="${type=='issale'}">
                                                                <span style="color: red; font-size: 23px;"><fmt:formatNumber maxFractionDigits = "3" value = "${detailps.salePrice}" type = "number"/> VND</span>
                                                            </c:if>
                                                            <c:if test="${type=='isflsale'}">
                                                                <span style="color: red; font-size: 18px;" class="showP"><fmt:formatNumber maxFractionDigits = "3" value = "${detailps.salePrice}" type = "number"/> VND </span>
                                                                <span style="color: red; font-size: 18px;" id="price${detailps.product.id}" class="hideP"><fmt:formatNumber maxFractionDigits = "3" value = "${detailps.salePrice}" type = "number"/> </span>
                                                                <script>
                                                                    function formatPrice(price) {
                                                                        let priceStr = price.toString();
                                                                        let millionDigit = priceStr.slice(0, 2);
                                                                        let remainingDigits = priceStr.slice(2).replace(/\d/g, '?');
                                                                        let hiddenP = millionDigit + remainingDigits;
                                                                        let count = 0;
                                                                        let formattedPrice = '';
                                                                        for (let i = hiddenP.length - 1; i >= 0; i--) {
                                                                            count++;
                                                                            formattedPrice = hiddenP[i] + formattedPrice;

                                                                            if (count % 3 === 0 && i !== 0) {
                                                                                formattedPrice = ',' + formattedPrice;
                                                                            }
                                                                        }

                                                                        return formattedPrice;
                                                                    }
                                                                    document.getElementById('price${detailps.product.id}').innerText = formatPrice(${detailps.salePrice}) + ' VND';

                                                                    var times = [8, 14, 18, 22];
                                                                    var countdown = setInterval(function () {
                                                                        // Lấy thời gian hiện tại
                                                                        var now = new Date();
                                                                        var nowHours = now.getHours();

                                                                        var itemsSale = document.querySelectorAll('.showP');
                                                                        var hidden = document.querySelectorAll('.hideP');
                                                                        if ((nowHours < times[0] || nowHours >= times[1]) && (nowHours < times[2] || nowHours >= times[3])) {
                                                                            for (var i = 0; i < itemsSale.length; i++) {
                                                                                itemsSale[i].style.display = 'none';
                                                                            }
                                                                        } else {
                                                                            for (var i = 0; i < hidden.length; i++) {
                                                                                hidden[i].style.display = 'none';
                                                                            }
                                                                        }

                                                                    }, 1000);
                                                                </script>
                                                            </c:if>
                                                        <!--<p>${detailps.product.description}</p>-->

                                                            <div class="product__details__option">
                                                                <div class="product__details__option__size" style="display: flex;">
                                                                    <span>Size:</span>
                                                                    <c:forEach items="${psize}" var="psize">
                                                                        <label id="quantityProduct" onclick="showQuantity('${psize.sizeId}', '${psize.quantity}');" for="${psize.pid}">${psize.sizeId}
                                                                            <input type="radio" id="${psize.sizeId}">
                                                                        </label>
                                                                    </c:forEach>
                                                                </div>
                                                            </div>
                                                            <div class="col-md-12" id="errorMessage" style="color: red; font-size: 20px;"></div>
                                                            <div class="product__details__cart__option">
                                                                <form action="addtocart" method="post" onsubmit="return validateFormCart()">
                                                                    <div class="quantity" style="display: flex;align-content: center">
                                                                        <input type="hidden" name="id" value="${detailps.product.id}">
                                                                        <input type="hidden" name="size" id="size" value="">
                                                                        <input type="hidden" name="urlredirect"value="details?pid=${detailps.product.id}&sale=${type}">
                                                                        <input type="hidden" id="maxquantity">
                                                                        <div style="align-content: center;margin: auto 60px;">
                                                                            <button type="button" id="decreaseButton" onclick="decrease()" style="width: 30px; height: 30px"><i class="fas fa-minus"></i></button>
                                                                            <input id="quantity" name="quantity" value="1" style="width: 40px; text-align: center;border: 2px solid black;" type="text">
                                                                            <button type="button" id="increaseButton" onclick="increase()" style="width: 30px; height: 30px"><i class="fas fa-plus"></i></button>
                                                                        </div>

                                                                        <button type="submit" class="primary-btn" >add to cart</button>
                                                                    </div>
                                                                </form>

                                                                <i class="fad fa-shipping-fast fa-sm"></i>
                                                                <span style="font-weight: 700;">FREE NATIONWIDE SHIPPING</span>
                                                                <br>
                                                                <i class="fad fa-retweet-alt fa-sm"></i>
                                                                <span style="font-weight: 700;">EASY REIMBURSEMENT</span>

                                                                <div class="product__details__last__option">
                                                                    <ul>
                                                                        <li><span>Sold:</span> ${detailps.product.quantity}</li>
                                                                        <li id="displayQuantity"><span>Quantity: </span>  </li>
                                                                        <li><span>Categories:</span> ${brandsProduct.name}</li>
                                                                    </ul>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>

                                            </div>
                                        </div>
                                    </c:if>
                                </div>

                                <!--a-->
                                <div class="row">
                                    <div class="col-lg-12">
                                        <div class="product__details__tab" style="display: flex; flex-direction: column;align-items: center;">
                                            <ul class="nav nav-tabs" role="tablist">
                                                <li class="nav-item">
                                                    <a class="nav-link active" data-toggle="tab" href="#tabs-5"
                                                       role="tab">Description</a>
                                                </li>


                                            </ul>
                                            <div class="tab-content" style="margin-top: 20px;">
                                                <div class="tab-pane active" id="tabs-5" role="tabpanel">
                                                    <div class="product__details__tab__content__item">
                                                        <p class="note">${details.description}</p>
                                                    </div>
                                                </div>





                                            </div>
                                        </div>


                                    </div>
                                </div>
                                </section>
                                <!-- Shop Details Section End -->
                                <!-- Related Section Begin -->
                                <!--Feedback-->
                                <div class="container">
                                    <div class="barFeedback" style="display: flex; justify-content: space-between; margin-bottom: 30px;">
                                        <h4 style="font-weight: 500">FeedBack(${countFeedBack})</h4>
                                        <div class="rating" style="display: flex; flex-direction: column">
                                            <div>
                                                <span style="font-size: 1.875rem; font-weight: 700">${rateStarFeedBack}</span><span style="font-size: 1.125rem;"> trên 5</span>
                                            </div>
                                            <div>
                                                <i style="color: #f7941d;" class="fa fa-star"></i>
                                                <i style="color: #f7941d;" class="fa fa-star"></i>
                                                <i style="color: #f7941d;" class="fa fa-star"></i>
                                                <i style="color: #f7941d;" class="fa fa-star"></i>
                                                <i style="color: #f7941d;" class="fa fa-star"></i>
                                            </div>

                                        </div>
                                    </div>

                                    <div class="fullcontentFeedback" style="display: flex; justify-content: space-between;">

                                        <c:forEach items="${listFeedBack}" var="feedback">

                                            <div class="contentFeedback">
                                                <div style="display: flex; justify-content: space-between">
                                                    <h5 style="font-weight: 600; margin-bottom: 10px;">${feedback.title}</h5>
                                                </div>

                                                <div class="box ratingg" style="display: flex;">
                                                    <c:set var="starCount" value="${feedback.star}" />
                                                    <c:forEach var="i" begin="1" end="${starCount}">
                                                        <i style="color: #f7941d;" class="fa fa-star"></i>
                                                    </c:forEach>
                                                    <span style="margin-left: 20px;"> ${feedback.fullnameFeedback} - ${feedback.date}</span>
                                                </div>
                                                <div class="box desFeedback">
                                                    <p>${feedback.desFeedback}</p>

                                                </div>

                                                <div>
                                                    <c:forEach items="${feedback.feedbackImages}" var="images">
                                                        <a href="imgFB/${images.imgFeedBack}"><img width="110px" height="110px" src="imgFB/${images.imgFeedBack}" alt="imageFeedBack"/></a>
                                                        </c:forEach>
                                                </div>

                                            </div>
                                        </c:forEach>

                                    </div>


                                    <div style="display: flex; gap: 20px; margin-top: 10px;">
                                        <!--<button class="btn btn-outline-dark" style="border-radius: 5px;" id="showAllFeedBack" onclick="showFeedBack()">More Reviews</button>-->
                                        <a href="morereviews?pid=${details.id}" class="btn btn-dark" role="button">More Reviews</a>

                                    </div>

                                    <div class="alert alert-danger" id="notifyEr" role="alert" style="display: none; margin-top: 10px;">
                                        Ban can dang nhap de thuc hien chuc nang nay.
                                    </div>
                                    <!--Su dung session de lay attribute-->
                                    <c:if test="${not empty sessionScope.error}">
                                        <div class="alert alert-danger" role="alert" style="margin-top: 10px;">
                                            ${sessionScope.error}
                                        </div>
                                        <!--<p style="color: red; font-weight: 700">${sessionScope.error}</p>-->
                                        <% session.removeAttribute("error"); %>
                                    </c:if>

                                </div>




                                <section class="related spad" style="padding-top: 20px;">
                                    <div class="container">
                                        <div class="row">
                                            <div class="col-lg-12">
                                                <h3 class="related-title">New Product</h3>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <c:forEach items="${list4new}" var="o">
                                                <div class="col-lg-3 col-md-6 col-sm-6 col-sm-6">
                                                    <div class="product__item">
                                                        <div class="product__item__pic set-bg" data-setbg="${o.imageUrl}" onclick="window.location = 'details?pid=${o.id}'" style="cursor: pointer;">
                                                            <span class="label">New</span>
                                                        </div>
                                                        <div class="product__item__text">
                                                            <h6>${o.name}</h6>
                                                            <a href="#" class="add-cart">+ Add To Cart</a>
                                                            <h5 style="text-align: center;"><fmt:formatNumber maxFractionDigits = "3" value = "${o.price}" type = "number"/> VND</h5>
                                                        </div>
                                                    </div>
                                                </div>
                                            </c:forEach>

                                        </div>
                                    </div>
                                </section>
                                <!-- Related Section End -->

                                <!-- Footer Section Begin -->
                                <footer class="footer">
                                    <div class="container">
                                        <div class="row">
                                            <div class="col-lg-3 col-md-6 col-sm-6">
                                                <div class="footer__about">
                                                    <div class="footer__logo">
                                                        <a href="#"><img src="img/footer-logo.png" alt=""></a>
                                                    </div>
                                                    <p>The customer is at the heart of our unique business model, which includes design.</p>
                                                    <a href="#"><img src="img/payment.png" alt=""></a>
                                                </div>
                                            </div>
                                            <div class="col-lg-2 offset-lg-1 col-md-3 col-sm-2">
                                                <div class="footer__widget">
                                                    <h6>Shopping</h6>
                                                    <ul>
                                                        <li><a href="#">Sale</a></li>
                                                    </ul>
                                                </div>
                                            </div>
                                            <div class="col-lg-2 col-md-3 col-sm-2">
                                                <div class="footer__widget">
                                                    <h6>Shopping</h6>
                                                    <ul>
                                                        <li><a href="#">Contact Us</a></li>
                                                    </ul>
                                                </div>
                                            </div>
                                            <div class="col-lg-3 offset-lg-1 col-md-6 col-sm-6">
                                                <div class="footer__widget">
                                                    <h6>NewLetter</h6>
                                                    <div class="footer__newslatter">
                                                        <p>Be the first to know about new arrivals, look books, sales &amp; promos!</p>
                                                        <form action="#">
                                                            <input type="text" placeholder="Your email">
                                                            <button type="submit"><span class="icon_mail_alt"></span></button>
                                                        </form>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-lg-12 text-center">
                                                <div class="footer__copyright__text">

                                                    <p>Copyright ©
                                                        <script>
                                                            document.write(new Date().getFullYear());
                                                        </script>
                                                        All rights reserved <i class="fa fa-heart-o"
                                                                               aria-hidden="true"></i>
                                                    </p>

                                                </div>
                                            </div>
                                        </div>

                                        <div class="box ratingg" style="display: flex;">
                                            <c:set var="starCount" value="${feedback.star}" />
                                            <c:forEach var="i" begin="1" end="${starCount}">
                                                <i style="color: #f7941d;" class="fa fa-star"></i>
                                            </c:forEach>
                                            <span style="margin-left: 20px;"> ${feedback.fullnameFeedback} - ${feedback.date}</span>
                                        </div>
                                        <div class="box desFeedback">
                                            <p>${feedback.desFeedback}</p>

                                        </div>

                                    </div>
                                </footer>
                                <!-- Footer Section End -->

                                <!-- Search Begin -->
                                <div class="search-model">
                                    <div class="h-100 d-flex align-items-center justify-content-center">
                                        <div class="search-close-switch">+</div>
                                        <form class="search-model-form">
                                            <input type="text" id="search-input" placeholder="Search here.....">
                                        </form>
                                    </div>
                                </div>
                                <!-- Search End -->

                            </div>

                            <div id="overlay" class="hidden"></div>



                            <!--//ShowthemImageProductDetails-->
                            <script type="text/javascript">
                                var listMoreImageData = [
                                <c:forEach items="${listMoreImage}" var="item" varStatus="loop">
                                {
                                "id": ${item.id},
                                        "imageUrl": "${item.imageUrl}",
                                        "pid": ${item.pid}
                                }
                                    <c:if test="${!loop.last}">, </c:if> <%-- Thêm dấu phẩy nếu không phải là phần tử cuối cùng --%>
                                </c:forEach>
                                ];

                                var displayedItems = 4; // Số lượng phần tử đã hiển thị ban đầu
                                function showMoreItems() {
                                    var totalItems = listMoreImageData.length
                                    if (displayedItems < totalItems) {
                                        // Tính số lượng mục cần hiển thị thêm (tối đa 4 mục)
                                        var remainingItems = totalItems - displayedItems;
                                        // Tạo một chuỗi HTML mới để hiển thị các mục mới
                                        var newItemsHtml = "";
                                        for (var i = displayedItems; i < displayedItems + remainingItems; i++) {
                                            var divId = "image" + (i + 1);
                                            var divContent = listMoreImageData[i].imageUrl; // Lấy dữ liệu từ danh sách
                                            newItemsHtml += '<li class="nav-item"><a style="cursor: pointer" onclick="displayImage(\'' + divContent + '\')" class="nav-link" data-toggle="tab" role="tab"><div style="background-image: url(' + divContent + ')" class="product__thumb__pic set-bg" id="' + divId + '" data-setbg="' + divContent + '">' + '<br/></div></a></li>';
                                            //                        newItemsHtml += `<li class="nav-item"><a style="cursor: pointer" onclick="displayImage('${divContent}')" class="nav-link" data-toggle="tab" role="tab"><div class="product__thumb__pic set-bg" style="background-image: ${divContent}" id="${divId}" data-setbg="${divContent}"><br/></div></a></li>`;
                                        }
                                        // Hiển thị các mục mới bằng cách thay đổi nội dung của thẻ div có id "listImage"
                                        var ulElement = document.getElementById("list4Image");
                                        ulElement.innerHTML += newItemsHtml;
                                        //                                displayedItems += remainingItems;
                                        document.getElementById("showMoreImages").style = "display: none;"
                                    }
                                }

                                const stars = document.querySelectorAll('.star');
                                let currentRating = 0;

                                stars.forEach((star, index) => {
                                    star.addEventListener('mouseover', () => {
                                        stars.forEach((s, i) => {
                                            if (i <= index) {
                                                s.classList.add('active');
                                            } else {
                                                s.classList.remove('active');
                                            }
                                        });
                                    });

                                    star.addEventListener('click', () => {
                                        currentRating = index + 1;
                                    });

                                    star.addEventListener('mouseout', () => {
                                        stars.forEach((s, i) => {
                                            if (i < currentRating) {
                                                s.classList.add('active');
                                            } else {
                                                s.classList.remove('active');
                                            }
                                        });
                                    });
                                });

                                var quantity = 1;

                                function validateFormCart() {
                                    var size = document.getElementById("size").value;
                                    var maxquantity = Number(document.getElementById("maxquantity").value);
                                    if (size === "") {
                                        document.getElementById("errorMessage").innerHTML = "Vui lòng chọn Size giày";
                                        return false;
                                    }
                                    if (quantity > maxquantity) {
                                        document.getElementById("errorMessage").innerHTML = "Số lượng tối đa size này là " + maxquantity;
                                        document.getElementById("quantity").value = maxquantity;
                                        return false;
                                    }
                                    return true;
                                }

                                function increase() {
                                    var maxquantity = Number(document.getElementById("maxquantity").value);
                                    if (quantity < maxquantity) {
                                        quantity++;
                                        document.getElementById("quantity").value = quantity;
                                        if (quantity >= maxquantity) {
                                            document.getElementById("errorMessage").innerHTML = "Số lượng tối đa size này là " + maxquantity;
                                            document.getElementById("increaseButton").disabled = true;
                                        }
                                        if (quantity > 1) {
                                            document.getElementById("decreaseButton").disabled = false;
                                        }
                                    }
                                }

                                function decrease() {
                                    var maxquantity = Number(document.getElementById("maxquantity").value);
                                    if (quantity > 1) {
                                        quantity--;
                                        document.getElementById("quantity").value = quantity;
                                        if (quantity == 1) {
                                            document.getElementById("decreaseButton").disabled = true;
                                        }
                                        if (quantity < maxquantity) {
                                            document.getElementById("errorMessage").innerHTML = null;
                                            document.getElementById("increaseButton").disabled = false;
                                        }
                                    }
                                }

                                function showQuantity(size, quantityM) {
                                    if (quantity >= quantityM) {
                                        document.getElementById("errorMessage").innerHTML = "Số lượng tối đa size này là " + quantityM;
                                        document.getElementById("increaseButton").disabled = true;
                                        document.getElementById("quantity").value = quantityM;
                                        quantity = quantityM;
                                    }
                                    if (quantity < quantityM) {
                                        document.getElementById("increaseButton").disabled = false;
                                    }
                                    document.getElementById("errorMessage").innerHTML = null;
                                    document.getElementById("size").value = size;
                                    document.getElementById("maxquantity").value = quantityM;
                                    var displayQuantity = document.getElementById("displayQuantity");
                                    displayQuantity.innerHTML = "<span>Quantity: </span>" + quantityM;
                                }

                                window.addEventListener('load', function () {
                                    setTimeout(function () {
                                        var urlParams = new URLSearchParams(window.location.search);
                                        if (urlParams.has('success') && urlParams.get('success') === 'true') {
                                            alert("Sản phẩm đã được thêm vào giỏ hàng !");
                                        }
                                    }, 800);
                                });
                            </script>

                            <!-- Js Plugins -->
                            <!--<script src="https://kit.fontawesome.com/dd418e2bee.js" crossorigin="anonymous"></script>-->
                            <!--<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>-->
                            <script src="js/bootstrap.min.js"></script>
                            <script src="js/scripts.js"></script>

                            <script src="js/mixitup.min.js"></script>
                            <script src="js/owl.carousel.min.js"></script>
                            <script src="js/main.js"></script>
                            </body>
                            </html>
