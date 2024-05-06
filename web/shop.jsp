

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
        <title>Shop</title>

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
        </style>
    </head>

    <body>
        <div id="preloder">
            <div class="loader"></div>
        </div>
        <!-- Header Section Begin -->
        <jsp:include page="header.jsp"></jsp:include>

            <header class="header">
                <div class="">
                    <div class="row d-flex justify-content-center">
                        <div class="col-lg-9 col-md-9">

                            <nav class="header__menu mobile-menu" >
                                <ul  >
                                    <form action="${pageContext.request.contextPath}/shop" method="post">
                                    <c:forEach items="${listC}" var="category">

                                        <li class="active" style="">
                                            <input hidden type="radio" name="category" value="${category.cid}" id="category_${category.cid}" onchange="this.form.submit()">
                                            <label style="cursor: pointer;align-content: center; font-size: 15px"  for="category_${category.cid}">${category.name}</label>
                                        </li>
                                    </c:forEach>
                                </form>

                            </ul>
                        </nav>
                    </div>
                </div>

            </div>
        </header>

        <!-- Shop Section Begin -->
        <section class="shop spad">
            <div class="container">
                <form action="" method="POST">

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
                                                        <input type="checkbox" id="sale" onclick="window.location.href = 'saleshop'">
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

                                            <div class="product__item">

                                                <div class="product__item__pic set-bg" data-setbg="${item.imageUrl}" onclick="window.location = 'details?pid=${item.id}'" style="cursor: pointer;">
                                                    <!--                                                        <ul class="product__hover">
                                                                                                                <li><a href="#"><img src="img/icon/heart.png" alt=""></a></li>
                                                                                                                <li><a href="#"><img src="img/icon/compare.png" alt=""> <span>Compare</span></a>
                                                                                                                </li>
                                                                                                                <li><a href="#"><img src="img/icon/search.png" alt=""></a></li>
                                                                                                            </ul>-->
                                                </div>




                                                <div class="product__item__text">
                                                    <h6 class="text-center">${item.name}</h6>
                                                    <a href="./Shop-details.jsp" class="add-cart">+ Add To Cart</a>
                                                    <!--                                            <div class="rating">
                                                                                                    <i class="fa fa-star-o"></i>
                                                                                                    <i class="fa fa-star-o"></i>
                                                                                                    <i class="fa fa-star-o"></i>
                                                                                                    <i class="fa fa-star-o"></i>
                                                                                                    <i class="fa fa-star-o"></i>
                                                                                                </div>-->
                                                    <h5 style="text-align: center;"><fmt:formatNumber maxFractionDigits = "3" value = "${item.price}" type = "number"/> VND</h5>

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
            window.addEventListener('load', function () {
                setTimeout(function () {
                    var urlParams = new URLSearchParams(window.location.search);
                    if (urlParams.has('order') && urlParams.get('order') === '1') {
                        alert("Bạn đã đặt hàng thành công!\nVới phương thức thanh toán khi nhận được hàng!");
                    }
                    if (urlParams.has('order') && urlParams.get('order') === '2') {
                        alert("Bạn đã đặt hàng thành công!\nVới phương thức thanh toán VNPay!");
                    }
                    if (urlParams.has('order') && urlParams.get('order') === '3') {
                        var userChoice = confirm("Quá trình thanh toán thất bại!\n Vui lòng thực hiện lại thanh toán để đặt hàng thành công nhé!\n\
            \nClick OK để xem chi tiết đơn và thực hiện thanh toán!");
                        if (userChoice == true) {
                            window.location.href = "paymentvnpay?oid=" + urlParams.get('oid');
                        }
                    }
                }, 1000);
            });
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
