<%-- 
    Document   : MoreReviews
    Created on : Nov 13, 2023, 1:43:35 AM
    Author     : win
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <title>More Reviews</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="css/fontawesome.min.css" rel="stylesheet">
        <link href="css/all.min.css" rel="stylesheet">
        <style type="text/css">
            body{
                background:#dcdcdc;
            }
            .total-like-user-main a {
                display: inline-block;
                margin: 0 -17px 0 0;
            }
            .total-like {
                border: 1px solid;
                border-radius: 50px;
                display: inline-block;
                font-weight: 500;
                height: 34px;
                line-height: 33px;
                padding: 0 13px;
                vertical-align: top;
            }
            .restaurant-detailed-ratings-and-reviews hr {
                margin: 0 -24px;
            }
            .graph-star-rating-header .star-rating {
                font-size: 17px;
            }
            .progress {
                background: #f2f4f8 none repeat scroll 0 0;
                border-radius: 0;
                height: 30px;
            }
            .rating-list {
                display: inline-flex;
                margin-bottom: 15px;
                width: 100%;
            }
            .rating-list-left {
                height: 16px;
                line-height: 29px;
                width: 10%;
            }
            .rating-list-center {
                width: 80%;
            }
            .rating-list-right {
                line-height: 29px;
                text-align: right;
                width: 10%;
            }
            .restaurant-slider-pics {
                bottom: 0;
                font-size: 12px;
                left: 0;
                z-index: 999;
                padding: 0 10px;
            }
            .restaurant-slider-view-all {
                bottom: 15px;
                right: 15px;
                z-index: 999;
            }
            .offer-dedicated-nav .nav-link.active,
            .offer-dedicated-nav .nav-link:hover,
            .offer-dedicated-nav .nav-link:focus {
                border-color: #3868fb;
                color: #3868fb;
            }
            .offer-dedicated-nav .nav-link {
                border-bottom: 2px solid #fff;
                color: #000000;
                padding: 16px 0;
                font-weight: 600;
            }
            .offer-dedicated-nav .nav-item {
                margin: 0 37px 0 0;
            }
            .restaurant-detailed-action-btn {
                margin-top: 12px;
            }
            .restaurant-detailed-header-right .btn-success {
                border-radius: 3px;
                height: 45px;
                margin: -18px 0 18px;
                min-width: 130px;
                padding: 7px;
            }
            .text-black {
                color: #000000;
            }
            .icon-overlap {
                bottom: -23px;
                font-size: 74px;
                opacity: 0.23;
                position: absolute;
                right: -32px;
            }
            .menu-list img {
                width: 41px;
                height: 41px;
                object-fit: cover;
            }
            .restaurant-detailed-header-left img {
                width: 88px;
                height: 88px;
                border-radius: 3px;
                object-fit: cover;
                box-shadow: 0 .125rem .25rem rgba(0, 0, 0, .075)!important;
            }
            .reviews-members .media .mr-3 {
                width: 56px;
                height: 56px;
                object-fit: cover;
            }
            .rounded-pill {
                border-radius: 50rem!important;
            }
            .total-like-user {
                border: 2px solid #fff;
                height: 34px;
                box-shadow: 0 .125rem .25rem rgba(0, 0, 0, .075)!important;
                width: 34px;
            }
            .total-like-user-main a {
                display: inline-block;
                margin: 0 -17px 0 0;
            }
            .total-like {
                border: 1px solid;
                border-radius: 50px;
                display: inline-block;
                font-weight: 500;
                height: 34px;
                line-height: 33px;
                padding: 0 13px;
                vertical-align: top;
            }
            .restaurant-detailed-ratings-and-reviews hr {
                margin: 0 -24px;
            }
            .graph-star-rating-header .star-rating {
                font-size: 17px;
            }
            .progress {
                background: #f2f4f8 none repeat scroll 0 0;
                border-radius: 0;
                height: 30px;
            }
            .rating-list {
                display: inline-flex;
                margin-bottom: 15px;
                width: 100%;
            }
            .rating-list-left {
                height: 16px;
                line-height: 29px;
                width: 10%;
            }
            .rating-list-center {
                width: 80%;
            }
            .rating-list-right {
                line-height: 29px;
                text-align: right;
                width: 10%;
            }
            .restaurant-slider-pics {
                bottom: 0;
                font-size: 12px;
                left: 0;
                z-index: 999;
                padding: 0 10px;
            }
            .restaurant-slider-view-all {
                bottom: 15px;
                right: 15px;
                z-index: 999;
            }

            .progress {
                background: #f2f4f8 none repeat scroll 0 0;
                border-radius: 0;
                height: 30px;
            }




        </style>
    </head>
    <body>
        <link rel="stylesheet" href="https://allyoucan.cloud/cdn/icofont/1.0.1/icofont.css" integrity="sha384-jbCTJB16Q17718YM9U22iJkhuGbS0Gd2LjaWb4YJEZToOPmnKDjySVa323U+W7Fv" crossorigin="anonymous">
        <div class="container">

            <div class="tab-pane fade active show" id="pills-reviews" role="tabpanel" aria-labelledby="pills-reviews-tab">

                <div style="display: flex; justify-content: center;" id="ratings-and-reviews" class="bg-white rounded shadow-sm p-4 mb-4 clearfix restaurant-detailed-star-rating">

                    <img src="${p.imageUrl}" width="60px" height="60px" alt="alt"/>

                    <div style="display: flex; align-items: center; flex-direction: column; justify-content: center; margin-left: 10px;">

                        <h1 style="font-size: 15px; font-weight: 700">${p.name}</h1>
                        <div class="product-price css-11s12ax is--current-price css-tpaepq" data-test="product-price">
                            <fmt:formatNumber maxFractionDigits = "3" value = "${p.price}" type = "number"/>
                        </div>
                    </div>
                </div>

                <div class="bg-white rounded shadow-sm p-4 mb-4 clearfix graph-star-rating">
                    <h5 class="mb-0 mb-4">Ratings and Reviews</h5>
                    <div class="graph-star-rating-header">
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
                    </div>
                    <span>Number of reviews: </span>
                    <b class="text-black ml-1">${countFeedBack}</b>
                </div>
                <div class="bg-white rounded shadow-sm p-4 mb-4 restaurant-detailed-ratings-and-reviews">
                    <!--<a href="#" class="btn btn-outline-primary btn-sm float-right">Top Rated</a>-->
                    <h5 class="mb-1">All Ratings and Reviews</h5>
                    <c:forEach items="${listFeedBack}" var="listFb">
                        <div class="reviews-members pt-4 pb-4">
                            <div class="media">
                                <a href="#"><img alt="Generic placeholder image" src="http://bootdey.com/img/Content/avatar/avatar1.png" class="mr-3 rounded-pill"></a>
                                <div class="media-body">
                                    <div class="reviews-members-header">
                                        <span class="star-rating float-right">
                                            <a href="#"><i class="icofont-ui-rating active"></i></a>
                                            <a href="#"><i class="icofont-ui-rating active"></i></a>
                                            <a href="#"><i class="icofont-ui-rating active"></i></a>
                                            <a href="#"><i class="icofont-ui-rating active"></i></a>
                                            <a href="#"><i class="icofont-ui-rating"></i></a>
                                        </span>
                                        <h6 class="mb-1"><a class="text-black" href="#">${listFb.fullnameFeedback}</a></h6>
                                        <p class="text-gray">${listFb.date}</p>
                                    </div>

                                    <div class="titleReviews" style="margin-bottom: 10px;">
                                        <b>${listFb.title}</b>
                                    </div>
                                    <div class="reviews-members-body">
                                        <p>${listFb.desFeedback}</p>
                                    </div>
                                    <div class="col-5" style="display: flex; justify-content: space-around; gap: 20px; ">
                                        <c:forEach items="${listFb.feedbackImages}" var="images">
                                            <a href="imgFB/${images.imgFeedBack}"><img width="128px" height="128px" src="imgFB/${images.imgFeedBack}" alt="imageFeedBack"/></a>
                                            </c:forEach>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <hr>
                    </c:forEach>
                    <div class="phantrang" style="margin-top: 10px;display: flex; justify-content: center; gap: 8px">
                        <c:set value="${p.id}" var="pid"></c:set>
                        <c:forEach begin="1" end="${numberPage-1}" var="i">
                            <a onclick="toggleActiveClass(this)"class="btn btn-outline-dark my-button"href="morereviews?pid=${p.id}&index=${i}" role="button">${i}</a>
                        </c:forEach>
                    </div>
                    <!--<a class="text-center w-100 d-block mt-4 font-weight-bold" href="#">See All Reviews</a>-->
                    <a class="btn btn-danger" href="details?pid=${p.id}" role="button">Close</a>
                </div>
            </div>
        </div>
    </div>
</div>
</div>
<script>
    //Clickvaophantrangsangphantrangdo
    function toggleActiveClass(element) {
        // Lấy tất cả các thẻ a có class "my-button"
        var buttons = document.querySelectorAll('.my-button');

        // Lặp qua tất cả các thẻ và xóa class "active" khỏi chúng
        buttons.forEach(function (btn) {
            btn.classList.remove('active');
        });

        // Thêm class "active" cho thẻ được click
        element.classList.add('active');
    }

    // Khôi phục trạng thái class "active" từ tham số trên URL
    document.addEventListener('DOMContentLoaded', function () {
        var urlParams = new URLSearchParams(window.location.search);
        var activeIndex = urlParams.get('index');

        if (activeIndex) {
            var activeButton = document.querySelector('.my-button[href*="index=' + activeIndex + '"]');

            if (activeButton) {
                activeButton.classList.add('active');
            }
        }
    });
</script>
<script src="https://code.jquery.com/jquery-3.6.4.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js"></script>
<script src="js/bootstrap.bundle.min.js"></script>
</body>
</html>