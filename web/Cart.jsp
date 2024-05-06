<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cart</title>
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
        </style>
    </head>

    <body>
        
        <jsp:include page="header.jsp"></jsp:include>

        <div class="shopping-cart">
            <div class="px-4 px-lg-0">
                <div class="pb-5">
                    <div class="container">
                        <div class="row">
                            <div class="col-lg-12 p-5 bg-white rounded shadow-sm mb-5">

                                <!-- Shopping cart table -->
                                <div class="table-responsive">
                                <c:if test="${mes != null}">
                                    
                                    <h2 style="color: red">${mes}</h2>
                                </c:if>
                                    <table class="table">
                                        <thead>
                                            <tr>
                                                <th scope="col" class="border-0 bg-light">
                                                    <div class="p-2 px-3 text-uppercase">Sản Phẩm</div>
                                                </th>

                                                <th scope="col" class="border-0 bg-light">
                                                    <div class="py-2 text-uppercase">Đơn Giá</div>
                                                </th>
                                                <th scope="col" class="border-0 bg-light">

                                                    <div class="py-2 text-uppercase">Số Lượng</div>

                                                </th>
                                                <th scope="col" class="border-0 bg-light">

                                                    <div class="py-2 text-uppercase">Size</div>

                                                </th>
                                                <th scope="col" class="border-0 bg-light">

                                                    <div class="py-2 text-uppercase">Thành Tiền</div>
                                                </th>
                                                <th scope="col" class="border-0 bg-light">
                                                    <div class="py-2 text-uppercase">Xóa</div>
                                                </th>
                                            </tr>
                                        </thead>
                                        <tbody>

                                            <c:forEach items="${cart.items}" var="i">
                                                <tr>
                                                    <th scope="row">
                                                        <div class="p-2">
                                                            <img src="${i.product.imageUrl}" alt="" width="70" class="img-fluid rounded shadow-sm">
                                                            <div class="ml-3 d-inline-block align-middle">
                                                                <h5 class="mb-0"> <a href="details?pid=${i.product.id}" class="text-dark d-inline-block">${i.product.name}</a></h5><span class="text-muted font-weight-normal font-italic"></span>
                                                            </div>
                                                        </div>
                                                    </th>
                                                    <td class="align-middle"><strong><fmt:formatNumber maxFractionDigits = "3" value = "${i.product.price}" type = "number"/></strong></td>
                                                    <td class="align-middle">
                                                        <a href="editcart?num=-1&id=${i.product.id}&size=${i.size}"><button class="btnSub">-</button></a> 
                                                        <strong>${i.quantity}</strong>
                                                        <a href="editcart?num=1&id=${i.product.id}&size=${i.size}"><button class="btnAdd">+</button></a>
                                                    </td>
                                                    <td class="align-middle"><strong>${i.size}</strong></td>
                                                    <td class="align-middle"><strong><fmt:formatNumber maxFractionDigits = "3" value = "${i.product.price*i.quantity}" type = "number"/> VND</strong></td>   
                                                    <td class="align-middle">
                                                        <a href="editcart?num=0&id=${i.product.id}&size=${i.size}"><button class="btn btn-danger">Delete</button></a> 
                                                    </td>
                                                </tr> 
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                                <!-- End -->
                            </div>
                        </div>

                        <div class="row py-5 p-4 bg-white rounded shadow-sm">
                            <div class="col-lg-6">
                                <div class="bg-light rounded-pill px-4 py-3 text-uppercase font-weight-bold">Voucher</div>
                                <div class="p-4">
                                    <div class="input-group mb-4 border rounded-pill p-2">
                                        <input type="text" placeholder="Nhập Voucher" aria-describedby="button-addon3" class="form-control border-0">
                                        <div class="input-group-append border-0">
                                            <button id="button-addon3" type="button" class="btn btn-dark px-4 rounded-pill"><i class="fa fa-gift mr-2"></i>Sử dụng</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-6">
                                <div class="bg-light rounded-pill px-4 py-3 text-uppercase font-weight-bold">Thanh Toán</div>
                                <div class="p-4">
                                    <ul class="list-unstyled mb-4">

                                        <li class="d-flex justify-content-between py-3 border-bottom"><strong class="text-muted">Tổng tiền hàng</strong><strong><fmt:formatNumber maxFractionDigits = "3" value = "${originTotal}" type = "number"/> VND</strong></li>
                                        <li class="d-flex justify-content-between py-3 border-bottom"><strong class="text-muted">Phí vận chuyển</strong><strong>Free ship</strong></li>
                                        <li class="d-flex justify-content-between py-3 border-bottom"><strong class="text-muted">Đã Giảm Giá</strong><strong><fmt:formatNumber maxFractionDigits = "3" value = "${originTotal - cart.totalMoney}" type = "number"/> VND</strong></li>
                                        <li class="d-flex justify-content-between py-3 border-bottom"><strong class="text-muted">Tổng thanh toán</strong>
                                            <h5 class="font-weight-bold"><fmt:formatNumber maxFractionDigits = "3" value = "${cart.totalMoney}" type = "number"/> VND</h5>
                                        </li>

                                    </ul><button id="order" class="btn btn-dark rounded-pill py-2 btn-block">Đặt hàng</button>
                                </div>
                            </div>
                        </div>
                        <div class="row py-5 p-4 bg-white rounded shadow-sm" >
                            <div class="col-lg-12" style="background: #fff2d0; padding: 20px">
                                <div id="form" class="bg-light rounded-pill px-4 py-3 text-uppercase font-weight-bold" >Đặt Hàng</div>
                                <form action="checkout" method="post" onsubmit="return validateForm()">
                                    <div class="row d-flex justify-content-center align-items-center h-100" >
                                        <h4 class="col-lg-12" style="margin-top: 20px">1. Thông tin khách hàng</h4>
                                        <div class="col-lg-8" id="errorMessage" style="color: red;margin-top: 20px;font-size: 18px"></div>
                                        <div class=" col-lg-8">
                                            <small class="form-text" style="color: red;">* Bắt buộc</small>
                                            <input name="fullname"  type="text" id="inputPassword" class="form-control" placeholder="Họ và tên" required>
                                        </div>
                                        <div class=" col-lg-8">
                                            <small class="form-text" style="color: red;">* Bắt buộc</small>
                                            <input name="email"  type="email" id="inputEmail" class="form-control" placeholder="Email" required="" >
                                        </div>

                                        <div class=" col-lg-8">
                                            <small class="form-text" style="color: red;">* Bắt buộc</small>
                                            <input name="phonenumber"  type="number" id="inputPhone" class="form-control" placeholder="Số điện thoại" required="" >
                                        </div>

                                        <div class=" col-lg-8">
                                            <small class="form-text" style="color: red;">* Bắt buộc</small>
                                            <input name="address"  type="text" id="inputaddress" class="form-control" placeholder="Địa chỉ" required="">
                                        </div>

                                        <div class=" col-lg-8" style="margin-top: 20px">

                                            <input name="note"  type="text" class="form-control" placeholder="Ghi chú">
                                        </div>

                                        <h4 class="col-lg-12" style="margin-top: 20px">2. Phương thức thanh toán</h4>

                                        <div class="col-lg-8" style="margin-top: 20px">
                                            <input type="radio" id="cod" name="payment" value="cod" onclick="updatePaymentInfo('COD')" checked="">
                                            <label for="cod">COD</label><br>
                                            <input type="radio" id="vnpay" name="payment" value="vnpay" onclick="updatePaymentInfo('VNPay')">
                                            <label for="vnpay">VNPay</label><br>
                                            <p id="paymentInfo" style="color: red"></p>
                                        </div>
                                        <input type="hidden" name="cost" value="${cart.totalMoney}">
                                    </div>
                                    <div class="d-flex justify-content-center" style="margin-top: 30px"><br>
                                        <button id="cod-button" class="btn btn-primary" type="submit">Đặt hàng</button>
                                        <button id="vnpay-button" class="btn btn-primary" type="submit" style="display: none;">Thanh toán để đặt hàng</button>
                                    </div>
                                </form>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </div>
        <script>
            function validateForm() {
                var email = document.getElementsByName("email")[0];
                var fullname = document.getElementsByName("fullname")[0];
                var phonenumber = document.getElementsByName("phonenumber")[0];
                var address = document.getElementsByName("address")[0];


                if ((fullname.value == "" && fullname.value.length != 0) || (fullname.value.trim().length == 0 && fullname.value.length != 0)) {
                    document.getElementById("errorMessage").innerHTML = "Vui lòng điền tên của bạn";
                    return false;
                }

                var emailPattern = /^[^ ]+@[^ ]+\.[a-z]{2,3}$/;
                if (!email.value.match(emailPattern)) {
                    document.getElementById("errorMessage").innerHTML = "Vui lòng nhập đúng định dạng email";
                    return false;
                }


                if (phonenumber.value.length != 10 && phonenumber.value.length > 0) {
                    document.getElementById("errorMessage").innerHTML = "Số điện thoại phải có 10 số";
                    return false;
                }

                if ((address.value == "" && address.value.length != 0) || (address.value.trim().length == 0 && address.value.length != 0)) {
                    document.getElementById("errorMessage").innerHTML = "Vui lòng điền đúng địa chỉ";
                    return false;
                }

            }
            function updatePaymentInfo(paymentMethod) {
                var paymentInfo = document.getElementById("paymentInfo");
                var vnpayButton = document.getElementById("vnpay-button");
                var codButton = document.getElementById("cod-button");
                if (paymentMethod == 'COD') {
                    paymentInfo.innerHTML = "Nhận hàng thanh toán";
                    vnpayButton.style.display = "none";
                    codButton.style.display = "block";
                } else if (paymentMethod == 'VNPay') {
                    paymentInfo.innerHTML = "Quý khách chuyển khoản trước";
                    vnpayButton.style.display = "block";
                    codButton.style.display = "none";
                }
            }
            document.getElementById("order").addEventListener("click", function () {
                document.getElementById("form").scrollIntoView({behavior: "smooth"});
            });
        </script>                               
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    </body>

</html>
