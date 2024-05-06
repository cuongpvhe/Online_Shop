<%-- 
    Document   : MKT-AddSale
    Created on : Oct 8, 2023, 10:33:35 AM
    Author     : admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>MKT Add Sale</title>
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/5.0.0-alpha1/js/bootstrap.min.js"></script>
        <style>
            body{
                margin-top:50px;
                background:#f8f8f8;
                padding: 20px;
            }
            .img-responsive {
                height: 125px;
                width: 250px;
                object-fit: cover;
            }
            .main {
                border: 3px solid black;
                box-shadow: 7px 7px 7px rgba(0, 0, 0.2, 0.5);
                border-radius: 30px;
                padding: 25px;
                /*                background: #9bd2b1;*/
            }
        </style>
    </head>
    <body>
        <jsp:include page="menu-MKT.jsp"></jsp:include>
            <div class="main">

                <form action="mktaddsale" method="post" onsubmit="return validateForm()" >
                    <ul class="nav nav-tabs">
                        <li class="nav-item"><a href="" class="active nav-link">Sale Product</a></li>
                    </ul>
                    <div class="row d-flex justify-content-center">
                        <div class="col-md-12" id="errorMessage" style="color: red; font-size: 20px; margin-bottom: 20px"></div>
                        <div class="col-md-4" >

                            <img src="${product.imageUrl}" alt="Image" id="displayImage" class="img-responsive mr-3">

                        <div class="col" >
                            <p>${product.name}</p>
                        </div>
                        <div class="col-md-8">
                            <div class="form-group">
                                <label for="originalPrice">Giá gốc:</label><br>
                                <span style="font-size: 18px" ><fmt:formatNumber maxFractionDigits = "3" value = "${product.price}" type = "number"/> VND</span>
                                <input class="form-control" type="hidden" id="originalPrice" name="price" value="${product.price}" readonly>
                                <input type="hidden"  name="id" value="${product.id}">
                            </div>
                        </div>
                        <div class="col-md-8">
                            <div class="form-group">
                                <label for="salePrice">Giá khuyến mãi:</label><br>
                                <input class="form-control" type="number" id="salePrice" name="salePrice" value="${product.price}" oninput=" calculateDiscountPercent()">
                            </div>
                        </div>
                        <div class="col-md-8">
                            <div class="form-group">
                                <label for="discountPercent">Phần trăm đã giảm:</label><br>
                                <input class="form-control" type="text" id="discountPercent" name="discount" oninput="calculatePrice2()" required><br>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-4">
                        <div class="col">
                            <div class="form-group">
                                <label for="datetime">Chọn ngày và giờ bắt đầu:</label>
                                <input class="form-control" type="datetime-local" id="starttime" name="starttime" required=""/>
                            </div>
                        </div>
                        <div class="col">
                            <div class="form-group">
                                <label for="datetime">Chọn ngày và giờ kết thúc:</label>
                                <input class="form-control" type="datetime-local" id="endtime" name="endtime"/>
                            </div>
                        </div>
                        <div class="col">
                            <div class="form-group">
                                <label for="flsale">Flash Sale</label>
                                <select id="flsale" class="form-select" name="isflashsale">
                                    <option value="0" selected>None</option>
                                    <option value="1">Flash Sale</option>
                                </select>
                            </div>
                        </div>
                        <div class="col">
                            <div class="form-group" id="timeframe" style="display: none;">
                                <label for="timeframe">Time Frame</label>
                                <select id="frame" class="form-select" name="timeframe" required disabled>
                                    <option value="">Choose</option>
                                    <option value="1">8 giờ sáng - 14 giờ chiều</option>
                                    <option value="2">18 giờ chiều - 22 giờ tối</option>
                                    <option value="3">Cả 2 khung giờ trên</option>
                                </select>
                            </div>
                        </div>
                        <div class="col">
                            <div class="form-group" id="quantity" style="display: none;">
                                <label for="quantity">Số lượng:</label><br>
                                <input class="form-control" type="number" id="input-quantity" name="quantity" required disabled>
                            </div>
                        </div>
                    </div>

                </div>
                <div class="row" style="">                
                    <div class="col d-flex justify-content-center">                             
                        <button id="save-button" class="btn btn-primary" type="submit">Save</button>
                    </div>

                </div>
            </form>
        </div>

        <script>
            function validateForm() {
                var originalPrice = parseFloat(document.getElementById('originalPrice').value);
                var salePrice = parseFloat(document.getElementById('salePrice').value);
                var startTime = new Date(document.getElementById('starttime').value);
                var endTime = new Date(document.getElementById('endtime').value);
                var discountPercent = document.getElementById("discountPercent").value;
                var quantity = document.getElementById("input-quantity");
                // Lấy thời điểm hiện tại
                var now = new Date();

                // Kiểm tra giá khuyến mãi
                if (salePrice < originalPrice * 0.5 || salePrice > originalPrice) {
                    document.getElementById("errorMessage").innerHTML = "Giá khuyến mãi phải lớn hơn 50% giá gốc và không được lớn hơn giá gốc.";
                    return false;
                }

                // Kiểm tra phần trăm giảm giá
                if (discountPercent <= 0 || discountPercent >= 50) {
                    document.getElementById("errorMessage").innerHTML = "Phần trăm giảm giá phải lớn hơn 0% và nhỏ hơn 50%.";
                    return false;
                }

                // Kiểm tra thời gian bắt đầu và kết thúc
                if (startTime <= now || endTime <= now) {
                    document.getElementById("errorMessage").innerHTML = "Ngày bắt đầu và kết thúc phải lớn hơn thời điểm bây giờ!";
                    return false;
                }
                if (startTime > endTime) {
                    document.getElementById("errorMessage").innerHTML = "Ngày kết thúc phải sau ngày bắt đầu!";
                    return false;
                }
                if (!/^\d+(\.\d+)?$/.test(discountPercent)) {
                    document.getElementById("errorMessage").innerHTML = "Phần trăm giảm giá phải là kiểu số";
                    return false;
                }

                // Kiểm tra xem số lượng nhập vào có lớn hơn 0 không
                if (!quantity.disabled && (isNaN(quantity.value) || Number(quantity.value) <= 0)) {
                    document.getElementById("errorMessage").innerHTML = "Số lượng cần lớn hơn 0!";
                    return false;
                }

                // Nếu tất cả các điều kiện đều thoả mãn, trả về true
                return true;
            }

//            function formatNumber(input) {
//                var num = input.value.replace(/\./g, '');
//                if (!isNaN(num)) {
//                    num = num.split('').reverse().join('');
//                    var numFormat = '';
//                    for (var i = 0; i < num.length; i++) {
//                        if (i % 3 == 0 && i != 0) {
//                            numFormat += '.';
//                        }
//                        numFormat += num[i];
//                    }
//                    input.value = numFormat.split('').reverse().join('');
//                } else {
//                    alert('Chỉ nhập số');
//                    input.value = input.value.replace(/[^\d\.]*/g, '');
//                }
//            }

            function calculateDiscountPercent() {
                var originalPrice = parseFloat(document.getElementById('originalPrice').value);
                var salePrice = parseFloat(document.getElementById('salePrice').value);

                if (originalPrice > 0) {
                    var discountPercent = ((originalPrice - salePrice) / originalPrice) * 100;
                    document.getElementById('discountPercent').value = discountPercent.toFixed(2);
                }
            }


            function calculateDiscountPercent() {
                var originalPrice = document.getElementById('originalPrice').value;
                var salePrice = document.getElementById('salePrice').value;
                var discountPercent = ((originalPrice - salePrice) / originalPrice) * 100;
                document.getElementById('discountPercent').value = discountPercent.toFixed(2);

            }


            function calculatePrice2() {
                var originalPrice = document.getElementById('originalPrice').value;
                var discountPercent = document.getElementById('discountPercent').value;

                var salePrice = originalPrice * (1 - discountPercent / 100);
                document.getElementById('salePrice').value = salePrice.toFixed(2);
            }

            window.onload = function () {
                var flsale = document.getElementById('flsale');
                var timeframe = document.getElementById('timeframe');
                var quantity = document.getElementById('quantity');

                flsale.addEventListener('change', function () {
                    if (flsale.value === '1') {
                        timeframe.style.display = '';
                        document.getElementById('frame').disabled = false;
                        quantity.style.display = '';
                        document.getElementById('input-quantity').disabled = false;
                    } else {
                        timeframe.style.display = 'none';
                        document.getElementById('frame').disabled = true;
                        quantity.style.display = 'none';
                        document.getElementById('input-`quantity').disabled = true;
                    }
                });
            }
        </script>
    </body>
</html>

