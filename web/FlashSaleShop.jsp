<%-- 
    Document   : FlashSaleShop
    Created on : Oct 12, 2023, 11:11:12 AM
    Author     : admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="description" content="Male_Fashion Template">
        <meta name="keywords" content="Male_Fashion, unica, creative, html">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title>Flash Sale Page</title>
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
            .status{
                margin: auto 10px;
                color: #fff;
                background: #CB1C21;
                border-radius: 5px;
                padding: 0 8px;
                line-height: 24px;
                font-size: 16px;
                font-weight: 400;
                white-space: nowrap;
            }
            .col:hover {
                cursor: pointer;
            }
            .selected{
                background: #ff7604;
            }
        </style>
    </head>
    <body>
        <jsp:include page="header.jsp"></jsp:include>
            <div class="container">
                <div class="row">
                    <img src="Images/FlashSale.png" width="100%" height="250px" style="object-fit: cover;"/>

                </div>
            </div>

            <header>
                <div class="container">
                    <div class="row " style="background: #6A737A">
                        <!-- Khung thời gian 1 -->
                        <div class="col" id="timeSlot1" onclick="window.location = 'flsale?timeFrame=1'" >
                            <span style="color: white;font-size: 30px" >08:00-14:00</span><br>
                            <span class="status" id="status1"></span>
                        </div>
                        <!-- Khung thời gian 2 -->
                        <div class="col" id="timeSlot2" onclick="window.location = 'flsale?timeFrame=2'" >
                            <span style="color: white;font-size: 30px" >18:00-22:00</span><br>
                            <span class="status"  id="status2"></span>
                        </div>
                        <!-- Khung thời gian 3 -->
                        <div class="col" id="timeSlot3" onclick="window.location = 'flsale?timeFrame=3'">
                            <span style="color: white;font-size: 30px" >08:00-14:00</span><br>
                            <span class="status" >Ngày mai</span>
                        </div>
                        <!-- Khung thời gian 4 -->
                        <div class="col" id="timeSlot4" onclick="window.location = 'flsale?timeFrame=4'" >
                            <span style="color: white;font-size: 30px" >18:00-22:00</span><br>
                            <span class="status" >Ngày mai</span>
                        </div>
                        <div class="col-md-3">
                            <span style="color: #cc0000;font-size: 29px;margin-left: 40px" id="mess" ></span><br>
                            <span id="time" style="color: #fff;font-size: 20px;margin-left: 60px"></span>
                        </div>
                    </div>
                </div>
            </header>


            <section id="inTime">
                <div class="container">
                    <div class="row" style="background: linear-gradient(#FF9B00,#FF5C00);;margin: 50px 0px;">
                        <div class="col-lg-12 d-flex justify-content-center" style="margin: 10px 0px; ">
                            <h2 class="active">Giày Đang Giảm Giá</h2>
                        </div>
                    </div>
                    <div class="row">
                    <c:forEach items="${flsaleP}" var="item">
                        <div class="col-lg-3 col-md-6 col-sm-6">

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

            </div>
        </section>

        <script type="text/javascript">
            // Biến toàn cục để lưu khung thời gian được chọn
            var selectedTimeSlot = null;

            // Hàm để xử lý sự kiện nhấp chuột vào một khung thời gian
            function getParamFromURL(paramName) {
                var url = new URL(window.location.href);
                return url.searchParams.get(paramName);
            }
            selectedTimeSlot = getParamFromURL("timeFrame");

            // Hàm để cập nhật trạng thái và đếm ngược
            function updateStatusAndCountdown() {
                // Lấy thời gian hiện tại
                var now = new Date();
                var hour = now.getHours();

                // Xác định khung thời gian và trạng thái
                var timeSlot, status;
                if (hour < 8) {
                    timeSlot = document.getElementById('timeSlot1');
                    status = 'Sắp diễn ra';
                    document.getElementById("status1").innerHTML = 'Sắp diễn ra';
                    document.getElementById("status2").innerHTML = 'Sắp diễn ra';
                    document.getElementById("mess").innerHTML = 'Diễn ra sau';
                } else if (hour < 14) {
                    timeSlot = document.getElementById('timeSlot1');
                    document.getElementById("status1").innerHTML = 'Đang diễn ra';
                    document.getElementById("status2").innerHTML = 'Sắp diễn ra';
                    document.getElementById("mess").innerHTML = 'Kết thúc trong';
                    status = 'Đang diễn ra';
                } else if (hour < 18) {
                    timeSlot = document.getElementById('timeSlot2');
                    status = 'Sắp diễn ra';
                    document.getElementById("status1").innerHTML = 'Đã kết thúc';
                    document.getElementById("status2").innerHTML = 'Sắp diễn ra';
                    document.getElementById("mess").innerHTML = 'Diễn ra sau';
                    document.getElementById('timeSlot1').style.pointerEvents = 'none';
                } else if (hour < 22) {
                    timeSlot = document.getElementById('timeSlot2');
                    document.getElementById("status2").innerHTML = 'Đang diễn ra';
                    document.getElementById("mess").innerHTML = 'Kết thúc trong';
                    document.getElementById("status1").innerHTML = 'Đã kết thúc';
                    document.getElementById('timeSlot1').style.pointerEvents = 'none';
                    status = 'Đang diễn ra';
                } else {
                    // Nếu sau 22h, chuyển sang ngày mai
                    timeSlot = document.getElementById('timeSlot3');
                    status = 'Sắp diễn ra';
                    document.getElementById("status1").innerHTML = 'Đã kết thúc';
                    document.getElementById("status2").innerHTML = 'Đã kết thúc';
                    document.getElementById("mess").innerHTML = 'Diễn ra sau';
                    document.getElementById('timeSlot1').style.pointerEvents = 'none';
                    document.getElementById('timeSlot2').style.pointerEvents = 'none';
                }

                // Thêm lớp 'selected' cho khung thời gian được chọn
                var timeSlots = document.querySelectorAll('.col');
                for (var i = 0; i < timeSlots.length; i++) {
                    timeSlots[i].classList.remove('selected');
                }
                var countdown = new Date(now);

                if (selectedTimeSlot !== null) {
                    document.getElementById('timeSlot' + selectedTimeSlot).classList.add('selected');
                    timeSlot = document.getElementById('timeSlot' + selectedTimeSlot);
                    if (selectedTimeSlot === '1') {
                        countdown.setHours(8, 0, 0, 0);
                    }
                    if (selectedTimeSlot === '2' && hour < 18) {
                        status = 'Sắp diễn ra';
                        document.getElementById("mess").innerHTML = 'Diễn ra sau';
                        countdown.setHours(18, 0, 0, 0);
                    }
                    if (selectedTimeSlot === '3') {
                        document.getElementById("mess").innerHTML = 'Diễn ra sau';
                        countdown.setHours(8 + 24, 0, 0, 0);
                        status = 'Sắp diễn ra';
                    }
                    if (selectedTimeSlot === '4') {
                        document.getElementById("mess").innerHTML = 'Diễn ra sau';
                        countdown.setHours(18 + 24, 0, 0, 0);
                        status = 'Sắp diễn ra';
                    }
                } else {
                    timeSlot.classList.add('selected');
                }

                // Cập nhật đếm ngược
                var itemsSale = document.querySelectorAll('.showP');
                var hidden = document.querySelectorAll('.hideP');
                if (status === 'Sắp diễn ra') {
                    countdown.setHours(timeSlot === document.getElementById('timeSlot1') ? 8 : 18, 0, 0, 0);
                    if (timeSlot === document.getElementById('timeSlot3')) {
                        countdown.setHours(8 + 24, 0, 0, 0);
                    }
                    if (timeSlot === document.getElementById('timeSlot4')) {
                        countdown.setHours(18 + 24, 0, 0, 0);
                    }
                    for (var i = 0; i < itemsSale.length; i++) {
                        itemsSale[i].style.display = 'none';
                    }
                } else {
                    countdown.setHours(timeSlot === document.getElementById('timeSlot1') ? 14 : 22, 0, 0, 0);
                    for (var i = 0; i < hidden.length; i++) {
                        hidden[i].style.display = 'none';
                    }
                }

                var countdownElement = document.getElementById('time');

                var countdownTime = countdown - now;

                var hours = Math.floor((countdownTime % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
                var minutes = Math.floor((countdownTime % (1000 * 60 * 60)) / (1000 * 60));
                var seconds = Math.floor((countdownTime % (1000 * 60)) / 1000);

                hours = String(hours).padStart(2, '0');
                minutes = String(minutes).padStart(2, '0');
                seconds = String(seconds).padStart(2, '0');

                if ((selectedTimeSlot === '3' && hour < 8) || (selectedTimeSlot === '4' && hour < 18)) {
                    countdownElement.textContent = '1 ngày ' + hours + ": " + minutes + ": " + seconds;
                } else {
                    countdownElement.textContent = hours + ": " + minutes + ": " + seconds;
                }
            }
            setInterval(updateStatusAndCountdown, 1000);

//            function formatPrice(price) {
//            let priceStr = price.toString();
//            let millionDigit = priceStr.slice(0, 1);
//            let remainingDigits = priceStr.slice(1).replace(/\d/g, '?');
//            return millionDigit + remainingDigits;
//        }
//        document.getElementById('price${item.product.id}').innerText = formatPrice(${item.salePrice}) + ' VND';
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
