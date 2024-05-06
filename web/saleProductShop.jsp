<%-- 
    Document   : saleProductShop
    Created on : Oct 10, 2023, 1:44:25 PM
    Author     : admin
--%>



<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>

<jsp:useBean class="dal.CategoryDAO" id="cdao"/>
<jsp:useBean class="dal.BrandDAO" id="bdao"/>
<jsp:useBean class="ultils.support" id="sp"/>
<jsp:useBean class="dal.SizeDAO" id="sdao"/>
<!DOCTYPE html>
<html lang="zxx">

    <head>
        <meta charset="UTF-8">
        <meta name="description" content="Male_Fashion Template">
        <meta name="keywords" content="Male_Fashion, unica, creative, html">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title>Sale Product</title>

        <!-- Google Font -->
        <link href="https://fonts.googleapis.com/css2?family=Nunito+Sans:wght@300;400;600;700;800;900&display=swap"
              rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
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

    </head>

    <body>
        <!-- Page Preloder -->
        <!--        <div id="preloder">
                    <div class="loader"></div>
                </div>
        
                 Offcanvas Menu Begin 
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
                </div>-->
        <!-- Offcanvas Menu End -->

        <!-- Header Section Begin -->
        <jsp:include page="header.jsp"></jsp:include>
            <!-- Header Section End -->

            <!-- Breadcrumb Section Begin -->
            <!--        <section class="breadcrumb-option">
                        <div class="container">
                            <div class="row">
                                <div class="col-lg-12">
                                    <div class="breadcrumb__text">
                                        <h4>Shop</h4>
                                        <div class="breadcrumb__links">
                                            <a href="./index.html">Home</a>
                                            <span>Shop</span>
                                        </div>
                                        
                                    </div>
                                </div>
                            </div>
                        </div>
                    </section>-->
            <!-- Breadcrumb Section End -->
<!--            <section>
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

                                    <div class="product__item__pic set-bg" data-setbg="${item.product.imageUrl}" onclick="window.location = 'details?pid=${item.product.id}&sale=issale'" style="cursor: pointer;">
                                        <span class="label">Sale</span><br>
                                    </div>




                                    <div class="product__item__text">
                                        <h6 class="text-center">${item.product.name}</h6>
                                        <a href="#" class="add-cart">+ Add To Cart</a>

                                        <span class="label" style="background: #ff7b1e; padding:0 5px;border-radius: 5px">Giảm: <fmt:formatNumber value="${item.discount}" pattern="#"/>%</span>
                                        <span style="text-decoration: line-through; color: black;"><fmt:formatNumber maxFractionDigits = "3" value = "${item.product.price}" type = "number"/></span><br>

                                        <span style="color: red; font-size: 18px;"><fmt:formatNumber maxFractionDigits = "3" value = "${item.salePrice}" type = "number"/> VND</span>



                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                    <span id="btnPrev" style="position: absolute; left: 0;top: 120px;"><i class="fa-solid fa-chevron-left fa-beat fa-2xl" style="color: #fd6a08;"></i></span>
                    <span id="btnNext" style="position: absolute; right: 0;top: 120px;"><i class="fa-solid fa-chevron-right fa-beat fa-2xl" style="color: #fd6a08;"></i></span>
                </div>
                <div class="row col-md-12 d-flex justify-content-center" >

                </div>

            </div>
        </section>-->
        <!-- Shop Section Begin -->
        <section class="shop spad">
            <div class="container">
                <form action="saleshop" method="POST">

                    <div class="row">
                        <div class="col-lg-3">
                            <div class="shop__sidebar">
                                <div class="shop__sidebar__search">
                                    <div class="search-form">
                                        <input type="text" placeholder="Search..." name="search" value="${search}">
                                        <button type="submit"><span class="icon_search"></span></button> 
                                    </div>
                                </div>
                                <div class="shop__sidebar__accordion">
                                    <div class="accordion" id="accordionExample">
                                        <div class="card">
                                            <div class="card-heading">
                                                Sale
                                            </div>
                                            <div id="collapseOne" class="collapse show" data-parent="#accordionExample">
                                                <div class="card-body">
                                                    <div class="shop__sidebar__categories">
                                                        <input type="checkbox" id="sale" checked="" onclick="window.location.href = 'shop'">
                                                        <label for="sale">Sản phẩm giảm giá</label>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="card">
                                            <div class="card-heading">
                                                <a data-toggle="collapse" data-target="#collapseOne">Brand</a>
                                            </div>
                                            <div id="collapseOne" class="collapse show" data-parent="#accordionExample">
                                                <div class="card-body">
                                                    <div class="shop__sidebar__categories">
                                                        <ul class="nice-scroll">
                                                            <c:forEach items="${bdao.all}" var="item">
                                                                <li>
                                                                    <input name="brand" ${brand != null ? sp.isChecked(brand, item.rid) ? 'checked' : '' : ''} value="${item.rid}" type="checkbox" id="brand_${item.rid}" onchange="this.form.submit()">
                                                                    <label for="brand_${item.rid}">${item.name}</label>
                                                                </li>
                                                            </c:forEach>
                                                        </ul>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="card">
                                            <div class="card-heading">
                                                <a data-toggle="collapse" data-target="#collapseThree">Filter Price</a>
                                            </div>
                                            <div id="collapseThree" class="collapse show" data-parent="#accordionExample">
                                                <div class="card-body">
                                                    <div class="shop__sidebar__price">
                                                        <ul>
                                                            <li>
                                                                <input id="price_100-150" name="price" type="radio" value="100-150" onchange="this.form.submit()" hidden>
                                                                <label for="price_100-150" class="${price != null && price == '100-150' ? 'active' :''}">1000000đ - 1500000đ</label>
                                                            </li>
                                                            <li>
                                                                <input id="price_150-200" name="price" type="radio" value="150-200" onchange="this.form.submit()" hidden>
                                                                <label for="price_150-200" class="${price != null && price == '150-200' ? 'active' :''}">1500000đ - 2000000đ</label>
                                                            </li>
                                                            <li>
                                                                <input id="price_200-250" name="price" type="radio" value="200-250" onchange="this.form.submit()" hidden>
                                                                <label for="price_200-250" class="${price != null && price == '200-250' ? 'active' :''}">2000000đ - 2500000đ</label>
                                                            </li>
                                                            <li>
                                                                <input id="price_250-300" name="price" type="radio" value="250-300" onchange="this.form.submit()" hidden>
                                                                <label for="price_250-300" class="${price != null && price == '250-300' ? 'active' :''}">2500000đ - 3000000đ</label>
                                                            </li>
                                                            <li>
                                                                <input id="price_300-350" name="price" type="radio" value="300-350" onchange="this.form.submit()" hidden>
                                                                <label for="price_300-350" class="${price != null && price == '300-350' ? 'active' :''}">3000000đ - 3500000đ </label>
                                                            </li>
                                                            <li>
                                                                <input id="price_350-more" name="price" type="radio" value="350-more" onchange="this.form.submit()" hidden>
                                                                <label for="price_350-more" class="${price != null && price == '350-more' ? 'active' :''}">3500000đ + </label>
                                                            </li>
                                                        </ul>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="card">
                                            <div class="card-heading">
                                                <a data-toggle="collapse" data-target="#collapseFour">Size</a>
                                            </div>
                                            <div id="collapseFour" class="collapse show" data-parent="#accordionExample">
                                                <div class="card-body">
                                                    <div class="shop__sidebar__size">
                                                        <c:forEach items="${sdao.all}" var="item">
                                                            <label for="size_${item.id}" class="${sizeCheckbox != null ? sp.isChecked(sizeCheckbox, item.id) ? 'active' : '' : ''}">${item.size} 
                                                                <input type="checkbox" name="size" value="${item.id}" onchange="this.form.submit()" id="size_${item.id}" ${sizeCheckbox != null ? sp.isChecked(sizeCheckbox, item.id) ? 'checked' : '' : ''}>
                                                            </label>
                                                        </c:forEach>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-9">
                            <c:if test="${data.isEmpty()}">
                                <h3 class="mt-5 text-center">Not Found Any Product...</h3>
                            </c:if>
                            <c:if test="${!data.isEmpty()}">
                                <div class="shop__product__option">
                                    <div class="row">
                                        <div class="col-lg-6 col-md-6 col-sm-6">
                                            <div class="shop__product__option__left">
                                                <p>Showing ${start+1}–${end} of ${size} results</p>
                                            </div>
                                        </div>
                                        <div class="col-lg-6 col-md-6 col-sm-6">
                                            <div class="shop__product__option__right">
                                                <p>Sort By:</p>
                                                <select name="sort" onchange="this.form.submit()">
                                                    <option value="0" ${sort == null ? 'selected' : ''}>Choose</option>
                                                    <option value="1" ${sort != null && sort == '1' ? 'selected' : ''}>Price ASC</option>
                                                    <option value="2" ${sort != null && sort == '2' ? 'selected' : ''}>Price DESC</option>
                                                    <option value="3" ${sort != null && sort == '3' ? 'selected' : ''}>Name (A-Z)</option>
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <c:forEach items="${data}" var="item">
                                        <div class="col-lg-4 col-md-6 col-sm-6">

                                            <div class="product__item sale">

                                                <div class="product__item__pic set-bg" data-setbg="${item.product.imageUrl}" onclick="window.location = 'details?pid=${item.product.id}&sale=issale'" style="cursor: pointer;">
                                                    <span class="label">Sale</span><br>
                                                </div>




                                                <div class="product__item__text">
                                                    <h6 class="text-center">${item.product.name}</h6>
                                                    <a href="#" class="add-cart">+ Add To Cart</a>

                                                    <span class="label" style="background: #ff7b1e; padding:0 5px;border-radius: 5px">Giảm: <fmt:formatNumber value="${item.discount}" pattern="#"/>%</span>
                                                    <span style="text-decoration: line-through; color: black;"><fmt:formatNumber maxFractionDigits = "3" value = "${item.product.price}" type = "number"/></span><br>

                                                    <span style="color: red; font-size: 18px;"><fmt:formatNumber maxFractionDigits = "3" value = "${item.salePrice}" type = "number"/> VND</span>



                                                </div>
                                            </div>
                                        </div>
                                    </c:forEach>
                                </div>
                                <div class="row">
                                    <div class="col-lg-12">
                                        <div class="product__pagination">
                                            <c:forEach begin="1" end="${numberOfPage}" var="i">
                                                <input id="page_${i}"  type="radio" hidden name="page" value="${i}" onchange="this.form.submit()">
                                                <label style="cursor: pointer;" for="page_${i}" class="${page == i ? 'active': ''}">${i}</label>
                                            </c:forEach>
                                        </div>
                                    </div>
                                </div>
                            </c:if>
                        </div>
                    </div>
                </form>
            </div>
        </section>
        <!-- Shop Section End -->

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
                    <div class="col-lg-2 offset-lg-1 col-md-3 col-sm-6">
                        <div class="footer__widget">
                            <h6>Shopping</h6>
                            <ul>
                                <li><a href="#">Clothing Store</a></li>
                                <li><a href="#">Trending Shoes</a></li>
                                <li><a href="#">Accessories</a></li>
                                <li><a href="#">Sale</a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-lg-2 col-md-3 col-sm-6">
                        <div class="footer__widget">
                            <h6>Shopping</h6>
                            <ul>
                                <li><a href="#">Contact Us</a></li>
                                <li><a href="#">Payment Methods</a></li>
                                <li><a href="#">Delivary</a></li>
                                <li><a href="#">Return & Exchanges</a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-lg-3 offset-lg-1 col-md-6 col-sm-6">
                        <div class="footer__widget">
                            <h6>NewLetter</h6>
                            <div class="footer__newslatter">
                                <p>Be the first to know about new arrivals, look books, sales & promos!</p>
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
                            <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                            <p>Copyright ©
                                <script>
                                    document.write(new Date().getFullYear());
                                </script>2020
                                All rights reserved | This template is made with <i class="fa fa-heart-o"
                                                                                    aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a>
                            </p>
                            <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                        </div>
                    </div>
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

        <!-- Js Plugins -->
        <script>
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

                // Tính số giờ, phút, giây từ khoảng cách
                var hours = Math.floor((distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
                var minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
                var seconds = Math.floor((distance % (1000 * 60)) / 1000);

                // Xác định trạng thái
                var status;
                if ((nowHours < times[0] || nowHours >= times[1]) && (nowHours < times[2] || nowHours >= times[3])) {
                    status = "Diễn ra sau";
                } else {
                    status = "Kết thúc trong";
                }
                // Thêm số 0 vào trước nếu chỉ có một chữ số
                hours = String(hours).padStart(2, '0');
                minutes = String(minutes).padStart(2, '0');
                seconds = String(seconds).padStart(2, '0');

                // Hiển thị chuỗi thời gian trong thẻ p
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

