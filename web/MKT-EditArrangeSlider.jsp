<%-- 
    Document   : MKT-EditArrangeSlider
    Created on : Oct 18, 2023, 4:28:38 PM
    Author     : admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>MKT Edit Arrange Slider</title>
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
        <link href='https://fonts.googleapis.com/css?family=Roboto:400,100,300,700' rel='stylesheet' type='text/css'>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
        <!-- CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
        <!-- JS -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="table-css/style.css">
        <link rel="stylesheet" href="table-css/header.css">
        <style>
            .flex-lg-nowrap{
                background:#F3F3F3
            }
            img{
                width: 100px;
                height: 50px;
                object-fit: cover;
            }
            .ftco-section {
                padding: 0px;
            }
            .table tbody td {
                padding: 15px;
            }
        </style>
    </head>
    <body>
        <div > 

            <div class="row flex-lg-nowrap">
                <div class="col">
                    <div >
                        <section class="ftco-section">
                            <div style="margin: 5px 50px">
                                <div class="row">
                                    <jsp:include page="menu-MKT.jsp"></jsp:include>

                                        <div class="row">
                                            <div class="col-md-8" id="errorMessage" style="color: red;"></div>
                                            <div class="col-md-12" style="margin-top: 15px">
                                                <div class="table-wrap">
                                                    <form id="orderForm" action="changesliderarrange" method="post">
                                                        <table class="table table-responsive-xl" >
                                                            <thead >
                                                                <tr>
                                                                    <th>ID</th>
                                                                    <th>Image</th>
                                                                    <th>Title</th>
                                                                    <th>Arrange</th>
                                                                    <th>Status</th>
                                                                </tr>
                                                            </thead>
                                                            <tbody>
                                                            <c:forEach items="${listS}" var="i">
                                                                <tr class="alert" role="alert">
                                                                    <td> <p>${i.id}</p></td>
                                                                    <td>
                                                                        <img class="img-responsive" src="${i.image}">
                                                                    </td>
                                                                    <td><p> ${i.title}</p> </td>
                                                                    <td>
                                                                        <input type="number" name="arrange" value="${i.arrange}" onchange="updateOrder(this)">
                                                                    </td>
                                                                    <td class="status">
                                                                        <c:if test="${i.status==1}">
                                                                            <span class="active">Active</span>
                                                                        </c:if>
                                                                        <c:if test="${i.status==0}">
                                                                            <span class="waiting">Disable</span>
                                                                        </c:if>
                                                                    </td>

                                                                </tr>
                                                            </c:forEach>
                                                        </tbody>
                                                    </table>
                                                    <div class="row" style="">                
                                                        <div class="col d-flex justify-content-center">                             
                                                            <button id="save-btn" class="btn btn-primary" type="submit" >Save</button>
                                                        </div>
                                                    </div>
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                            </div>
                        </section>
                    </div>

                </div>
            </div>
        </div>

        <script>
            var imageOrder = Array.from(document.querySelectorAll('input[type="number"]')).map(function (input) {
                return input.value;
            });

            function updateOrder(input) {
                var currentOrder = input.value;

                // Tìm tất cả các input
                var inputs = document.querySelectorAll('input[type="number"]');

                // Duyệt qua tất cả các input
                for (var i = 0; i < inputs.length; i++) {
                    var otherInput = inputs[i];

                    // Nếu tìm thấy một input khác có cùng số thứ tự với input hiện tại
                    if (otherInput !== input && otherInput.value === currentOrder) {
                        // Cập nhật số thứ tự của input tìm thấy bằng số thứ tự cũ của input hiện tại
                        otherInput.value = input.defaultValue;

                        // Cập nhật số thứ tự cũ của input hiện tại
                        input.defaultValue = currentOrder;
                        break;
                    }
                }

                // Lưu giá trị mới vào input sau mỗi lần thay đổi
                input.defaultValue = currentOrder;

                // Cập nhật giá trị của biến toàn cục
                imageOrder = Array.from(document.querySelectorAll('input[type="number"]')).map(function (input) {
                    return input.value;
                });
            }

            document.getElementById('orderForm').addEventListener('submit', function (event) {
                event.preventDefault();

                // Hiển thị giá trị của biến toàn cục
                console.log(imageOrder);
            });
            document.getElementById('orderForm').addEventListener('keydown', function (event) {
                if (event.key === 'Enter') {
                    event.preventDefault();
                }
            });

            document.getElementById('save-btn').addEventListener('click', function () {
                var values = Array.from(document.querySelectorAll('input[type="number"]')).map(function (input) {
                    return input.value;
                });

                var duplicates = values.filter(function (value, index, array) {
                    return array.indexOf(value) !== index;
                });

                if (duplicates.length > 0) {
                    alert("Lỗi: Có hai hoặc nhiều giá trị nhập vào giống nhau. Giá trị bị trùng là: " + duplicates.join(", ") + ". Vui lòng kiểm tra lại.");
                } else {
                    document.getElementById('orderForm').submit();
                }
            });
            window.onload = function () {
                var msg = "${msg}";
                if (msg) {
                    document.getElementById("errorMessage").innerHTML = msg;
                }
            }
        </script>
        <script src="js/jquery.min.js"></script>
        <script src="js/popper.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/main.js"></script>
    </body>
</html>
