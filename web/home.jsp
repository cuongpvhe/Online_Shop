<%-- 
    Document   : home
    Created on : Sep 23, 2023, 9:19:03 AM
    Author     : MSI GF
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="zxx">

    <head>
        <meta charset="UTF-8">
        <meta name="description" content="Male_Fashion Template">
        <meta name="keywords" content="Male_Fashion, unica, creative, html">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title>Home</title>

        <!-- Google Font -->
        <link href="https://fonts.googleapis.com/css2?family=Nunito+Sans:wght@300;400;600;700;800;900&display=swap"
              rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

        <!-- Bootstrap JS -->
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        <!-- Css Styles -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
        <link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">
        <link rel="stylesheet" href="css/font-awesome.min.css" type="text/css">
        <link rel="stylesheet" href="css/elegant-icons.css" type="text/css">
        <link rel="stylesheet" href="css/magnific-popup.css" type="text/css">
        <link rel="stylesheet" href="css/nice-select.css" type="text/css">
        <link rel="stylesheet" href="css/owl.carousel.min.css" type="text/css">
        <link rel="stylesheet" href="css/slicknav.min.css" type="text/css">
        <link rel="stylesheet" href="css/style.css" type="text/css">
        <style>
            #carouselExampleDark{
                z-index: 1;
                margin-top: 46px;
            }
            .carousel-control-next,.carousel-control-prev {
                position: absolute;
                top: 0;
                bottom: 0;
                z-index: 1;
                display: -ms-flexbox;
                display: flex;
                -ms-flex-align: center;
                align-items: center;
                -ms-flex-pack: center;
                justify-content: center;
                width: 15%;
                color: #fff;
                text-align: center;
                /* opacity:0; */
                transition: opacity .15s ease
            }

            .carousel-inner img {
                height: 400px;
                object-fit: cover; /* This will prevent the image from being distorted */
            }

        </style>

    </head>

    <body>
        <!-- Page Preloder -->
        <div id="preloder">
            <div class="loader"></div>
        </div>

        <!--     Offcanvas Menu Begin 
            <div class="offcanvas-menu-overlay"></div>
            <div class="offcanvas-menu-wrapper">
                <div class="offcanvas__option">
                    <div class="offcanvas__links">
                        <a href="#">Sign in</a>
                        <a href="#">FAQs</a>
                    </div>
                    <div class="offcanvas__top__hover">
                        <span>Usd <i class="arrow_carrot-down"></i></span>
                        <ul>
                            <li>USD</li>
                            <li>EUR</li>
                            <li>USD</li>
                        </ul>
                    </div>
                </div>
                <div class="offcanvas__nav__option">
                    <a href="#" class="search-switch"><img src="img/icon/search.png" alt=""></a>
                    <a href="#"><img src="img/icon/heart.png" alt=""></a>
                    <a href="#"><img src="img/icon/cart.png" alt=""> <span>0</span></a>
                    <div class="price">$0.00</div>
                </div>
                <div id="mobile-menu-wrap"></div>
                <div class="offcanvas__text">
                    <p>Free shipping, 30-day return or refund guarantee.</p>
                </div>
            </div>
             Offcanvas Menu End -->

        <!-- Header Section Begin -->
        <jsp:include page="header.jsp"></jsp:include>
            <!-- Header Section End -->
            <!-- Hero Section Begin -->
            <section class="hero">
                <div class="container">
                    <div id="carouselExampleDark" class="carousel carousel-dark slide" data-bs-ride="carousel">
                        <div id="carouselExampleCaptions" class="carousel slide" data-bs-ride="carousel" >
                            <div class="carousel-indicators">

                                <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
                            <c:forEach begin="1" end="${numofslider}" var="c">
                                <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="${c}" aria-label="Slide ${c+1}"></button>
                            </c:forEach>

                        </div>

                        <div class="carousel-inner" >

                            <c:forEach items="${listS}" var="s" >
                                <div class="carousel-item ${s.id == firstS.id ? "active" : ""}">
                                    <a href="${s.backlink}"><img src="${s.image}" class="d-block w-100" alt="..."></a>

                                </div> 

                            </c:forEach>
                        </div>
                        <div class="carousel-control-prev" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="prev">
                            <div style="background-color: rgba(0, 0, 0, 0.3);width: 100px; border-radius: 30px; display: flex; align-content: center; padding: 5px">
                                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                <span class="visually-hidden" >Previous</span>
                            </div>
                        </div>
                        <div class="carousel-control-next" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="next">
                            <div style="background-color: rgba(0, 0, 0, 0.3);width: 65px; border-radius: 30px; display: flex; align-content: center; padding: 5px">
                                <span class="visually-hidden" >Next</span>
                                <span class="carousel-control-next-icon" aria-hidden="true" ></span>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
            <!-- Banner Section End -->
        </section>


        <section  style="margin-top: 100px" id="fl">
            <div class="container">
                <div class="row" style="background: linear-gradient(#FF9B00,#FF5C00);;margin: 50px 0px;">
                    <div class="col-md-3 d-flex justify-content-center" style="margin: 10px 0px; ">
                        <h2 class="active">Flash Sale</h2>
                    </div>
                    <div class="col-md-6 " style="margin: auto; ">
                        <span id="status" style="font-size: 18px; color: #000d0c ; margin-right: 10px"></span>
                        <span id="time" style="font-size: 23px; color: #ffe39b"></span>
                    </div>
                    <div class="col-md-3 d-flex justify-content-center" style="margin:auto; ">
                        <a href="flsale" ><i class="" style="font-size: 20px ; color: black;margin-left: 25px">Xem tất cả</i></a>
                    </div>
                </div>
                <div style="position: relative;">
                    <div class="row" id="productContainer">
                        <c:forEach items="${flsale}" var="item">
                            <div class="col-lg-3 col-md-6 col-sm-6 flashsale">

                                <div class="product_item sale">

                                    <div class="product__item__pic set-bg" data-setbg="${item.product.imageUrl}" onclick="window.location = 'details?pid=${item.product.id}&sale=isflsale'" style="cursor: pointer;">
                                        <span class="label">Sale</span><br>
                                    </div>




                                    <div class="product__item__text">
                                        <h6 class="text-center">${item.product.name}</h6>
                                        <a href="#" class="add-cart">+ Add To Cart</a>

                                        <span class="label" style="background: #ff7b1e; padding:0 5px;border-radius: 5px">Giảm: <fmt:formatNumber value="${item.discount}" pattern="#"/>%</span>
                                        <span style="text-decoration: line-through; color: black;"><fmt:formatNumber maxFractionDigits = "3" value = "${item.product.price}" type = "number"/></span><br>

                                        <span style="color: red; font-size: 18px;" class="showP"><fmt:formatNumber maxFractionDigits = "3" value = "${item.salePrice}" type = "number"/> VND </span>
                                        <span style="color: red; font-size: 18px;" id="price${item.product.id}" class="hideP"><fmt:formatNumber maxFractionDigits = "3" value = "${item.salePrice}" type = "number"/> </span>



                                    </div>
                                </div>
                            </div>
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

                                document.getElementById('price${item.product.id}').innerText = formatPrice(${item.salePrice}) + ' VND';
                            </script>
                        </c:forEach>
                    </div>
                    <span id="btnPrev" style="position: absolute; left: 0;top: 120px;"><i class="fa-solid fa-chevron-left fa-beat fa-2xl" style="color: #fd6a08;"></i></span>
                    <span id="btnNext" style="position: absolute; right: 0;top: 120px;"><i class="fa-solid fa-chevron-right fa-beat fa-2xl" style="color: #fd6a08;"></i></span>
                </div>
                <div class="row col-md-12 d-flex justify-content-center" >

                </div>

            </div>
        </section>

        <section class="product spad" style="margin-top: 100px">
            <div class="container">
                <div class="row" style="background: linear-gradient(#FF9B00,#FF5C00);;margin: 50px 0px;">
                    <div class="col-lg-12 d-flex justify-content-center" style="margin: 10px 0px; ">
                        <h2 class="active">Giày Đang Giảm Giá</h2>
                    </div>
                </div>
                <div class="row product__filter">

                    <c:forEach items="${sale}" var="item">
                        <div class="col-lg-3 col-md-6 col-sm-6">

                            <div class="product_item sale saleproduct">

                                <div class="product__item__pic set-bg" data-setbg="${item.product.imageUrl}" onclick="window.location = 'details?pid=${item.product.id}&sale=issale'" style="cursor: pointer;">
                                    <span class="label">Sale</span><br>
                                </div>




                                <div class="product__item__text">
                                    <h6 class="text-center">${item.product.name}</h6>
                                    <a href="#" class="add-cart">+ Add To Cart</a>

                                    <span class="label" style="background: #ff7b1e; padding:0 5px;border-radius: 5px">Giảm: <fmt:formatNumber value="${item.discount}" pattern="#"/>%</span>
                                    <span style="text-decoration: line-through; color: black;"><fmt:formatNumber maxFractionDigits = "3" value = "${item.product.price}" type = "number"/> </span><br>

                                    <span style="color: red; font-size: 18px;"><fmt:formatNumber maxFractionDigits = "3" value = "${item.salePrice}" type = "number"/> VND</span>



                                </div>
                            </div>
                        </div>
                    </c:forEach>
                    <div class="col-md-12 d-flex justify-content-center" style="margin-top: 50px;">
                        <button id="btnSeeMore" class="primary-btn" type="button">Xem Thêm</button>
                        <button class="primary-btn" id="btnSeeAll" style="display: none;">
                            <a href="saleshop">Xem tất cả</a>
                        </button>
                    </div>


                </div>

            </div>
        </section>

        <section class="product spad" style="margin-top: 100px">
            <div class="container">
                <div class="row" style="background: linear-gradient(#FF9B00,#FF5C00);;margin: 50px 0px;">
                    <div class="col-lg-12 d-flex justify-content-center" style="margin: 10px 0px; ">
                        <h2 class="active">Sản phẩm mới</h2>
                    </div>
                </div>
                <div class="row product__filter">
                    <c:forEach items="${newP}" var="o">
                        <div class="col-lg-3 col-md-6 col-sm-6 col-sm-6">
                            <div class="product__item">
                                <div class="product__item__pic set-bg" data-setbg="${o.imageUrl}" onclick="window.location = 'details?pid=${o.id}&sale=issale'" style="cursor: pointer;">
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
                    <div class="col-md-12 d-flex justify-content-center" style="margin-top:">
                        <button class="primary-btn" type="button"><a href="shop">Đến Shop Mua Hàng</a></button>
                    </div>
                </div>
            </div>
        </section>

        <!-- Categories Section Begin -->
        <section class="categories spad">
            <div class="container">
                <div class="row">
                    <div class="col-lg-5">
                        <div class="categories__hot__deal">
                            <img src="${bigS.product.imageUrl}" onclick="window.location = 'details?pid=${bigS.product.id}&sale=issale'"  alt="">
                            <div class="hot__deal__sticker" style="background: #fd6a08">
                                <span>Sale Of</span>
                                <h5><fmt:formatNumber value="${bigS.discount}" pattern="#"/>%</h5>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6 offset-lg-1">
                        <div class="" style="margin-top: 150px">
                            <span style="color: red;font-size: 25px;">Sản phẩm giảm giá lớn</span>
                            <h3 style="margin-bottom: 35px">${bigS.product.name}</h3>
                            <h2 style="font-size: 40px;color: #ff110c;margin-bottom: 30px">Ưu đãi chỉ còn ${remain} ngày</h2>
                            <a href="details?pid=${bigS.product.id}" class="primary-btn">Shop now</a>
                        </div>
                    </div>
                </div>
            </div>
        </section>


        <script>

            // slider
            $(document).ready(function () {
                // Start the carousel automatically
                $('.carousel').carousel({
                    interval: 5000 // changes every 5 seconds
                });

                // Listen for a click on the "next" button
                $('.carousel-control-next').on('click', function () {
                    // Move to the next slide
                    $('.carousel').carousel('next');
                });

                // Listen for a click on the "previous" button
                $('.carousel-control-prev').on('click', function () {
                    // Move to the previous slide
                    $('.carousel').carousel('prev');
                });
            });

            // sale product
            window.addEventListener('load', function () {
                var itemsSale = document.querySelectorAll('.saleproduct');
                var btnSeeMore = document.getElementById('btnSeeMore');
                var btnSeeAll = document.getElementById('btnSeeAll');
                var count = 4;

                // Ẩn tất cả sản phẩm
                for (var i = 0; i < itemsSale.length; i++) {
                    itemsSale[i].style.display = 'none';
                }

                // Hiển thị 4 sản phẩm đầu tiên
                for (var i = 0; i < count; i++) {
                    itemsSale[i].style.display = 'block';
                }

                // Khi nhấn nút "Xem thêm", hiển thị thêm 3 sản phẩm
                btnSeeMore.onclick = function () {
                    count += 4;
                    for (var i = 0; i < count && i < itemsSale.length; i++) {
                        itemsSale[i].style.display = 'block';
                    }
                    if (count > 4) {
                        btnSeeMore.style.display = 'none';
                        btnSeeAll.style.display = 'block';
                    }
                }
            });

            //đồng hồ đếm ngược
            var times = [8, 14, 18, 22];

            // Cập nhật đồng hồ sau mỗi 1 giây
            var countdown = setInterval(function () {
                // Lấy thời gian hiện tại
                var now = new Date();
                var nowHours = now.getHours();

                // Tìm mốc thời gian tiếp theo
                var nextTime = times.find(time => time > nowHours);
                if (nextTime === undefined) {
                    nextTime = times[0] + 24; // Nếu đã qua mốc cuối cùng trong ngày, chuyển sang mốc đầu tiên của ngày hôm sau
                }

                // Tính thời gian kết thúc là mốc thời gian tiếp theo
                var end = new Date();
                end.setHours(nextTime, 0, 0, 0);

                // Tính thời gian chênh lệch giữa thời điểm hiện tại và thời điểm kết thúc
                var distance = end - now;

                // Tính số giờ, phút, giây 
                var hours = Math.floor((distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
                var minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
                var seconds = Math.floor((distance % (1000 * 60)) / 1000);

                var itemsSale = document.querySelectorAll('.showP');
                var hidden = document.querySelectorAll('.hideP');

                // Xác định trạng thái
                var status;
                if ((nowHours < times[0] || nowHours >= times[1]) && (nowHours < times[2] || nowHours >= times[3])) {
                    status = "Diễn ra sau";

                    for (var i = 0; i < itemsSale.length; i++) {
                        itemsSale[i].style.display = 'none';
                    }
                } else {
                    status = "Kết thúc trong";
                    for (var i = 0; i < hidden.length; i++) {
                        hidden[i].style.display = 'none';
                    }
                }
                // Thêm số 0 vào trước nếu chỉ có một chữ số
                hours = String(hours).padStart(2, '0');
                minutes = String(minutes).padStart(2, '0');
                seconds = String(seconds).padStart(2, '0');

                // Hiển thị chuỗi thời gian 
                document.getElementById("status").innerHTML = status;
                document.getElementById("time").innerHTML = hours + ":" + minutes + ":" + seconds;

            }, 1000);

            window.onload = function () {
                var items = Array.from(document.querySelectorAll('.flashsale'));
                var btnNext = document.getElementById('btnNext');
                var btnPrev = document.getElementById('btnPrev');
                var start = 0;
                var end = 4;

                function displayItems() {
                    // Xóa tất cả sản phẩm hiện tại
                    document.getElementById('productContainer').innerHTML = '';

                    // Thêm các sản phẩm mới vào container
                    for (var i = start; i < end; i++) {
                        document.getElementById('productContainer').appendChild(items[i]);
                    }

                    // Kiểm tra nút
                    btnPrev.style.display = start > 0 ? 'block' : 'none';
                    btnNext.style.display = end < items.length ? 'block' : 'none';
                }

                displayItems();

                btnNext.onclick = function () {
                    if (end < items.length) {
                        start++;
                        end++;
                        displayItems();
                    }
                }

                btnPrev.onclick = function () {
                    if (start > 0) {
                        start--;
                        end--;
                        displayItems();
                    }
                }
            }

        </script>
        <script src="js/jquery-3.3.1.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/jquery.nice-select.min.js"></script>
        <script src="js/jquery.nicescroll.min.js"></script>
        <script src="js/jquery.magnific-popup.min.js"></script>
        <script src="js/jquery.countdown.min.js"></script>
        <script src="js/jquery.slicknav.js"></script>
        <script src="js/mixitup.min.js"></script>
        <script src="js/owl.carousel.min.js"></script>
        <script src="js/main.js"></script>
    </body>

</html>
