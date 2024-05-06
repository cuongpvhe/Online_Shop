<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Order Detail</title>
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="stylesheet" href="css/fontawesome.min.css">
        <link rel="stylesheet" href="css/all.min.css">
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <style>
            body {
                color: #566787;
                background: currentColor;
                font-family: 'Varela Round', sans-serif;
                font-size: 13px;
            }
            .table-wrapper {
                background: #fff;
                padding: 20px 25px;
                margin: 30px auto;
                border-radius: 3px;
                box-shadow: 0 1px 1px rgba(0,0,0,.05);
            }
            .table-wrapper .btn {
                float: right;
                color: #333;
                background-color: #fff;
                border-radius: 3px;
                border: none;
                outline: none !important;
                margin-left: 10px;
            }
            .table-wrapper .btn:hover {
                color: #333;
                background: #f2f2f2;
            }
            .table-wrapper .btn.btn-primary {
                color: #fff;
                background: #03A9F4;
            }
            .table-wrapper .btn.btn-primary:hover {
                background: #03a3e7;
            }
            .table-title .btn {
                font-size: 13px;
                border: none;
            }
            .table-title .btn i {
                float: left;
                font-size: 21px;
                margin-right: 5px;
            }
            .table-title .btn span {
                float: left;
                margin-top: 2px;
            }
            .table-title {
                color: #fff;
                background: #4b5366;
                padding: 16px 25px;
                margin: -20px -25px 10px;
                border-radius: 3px 3px 0 0;
            }
            .table-title h2 {
                margin: 5px 0 0;
                font-size: 24px;
            }
            .show-entries select.form-control {
                width: 60px;
                margin: 0 5px;
            }
            .table-filter .filter-group {
                float: right;
                margin-left: 15px;
            }
            .table-filter input, .table-filter select {
                height: 34px;
                border-radius: 3px;
                border-color: #ddd;
                box-shadow: none;
            }
            .table-filter {
                padding: 5px 0 15px;
                border-bottom: 1px solid #e9e9e9;
                margin-bottom: 5px;
            }
            .table-filter .btn {
                height: 34px;
            }
            .table-filter label {
                font-weight: normal;
                margin-left: 10px;
            }
            .table-filter select, .table-filter input {
                display: inline-block;
                margin-left: 5px;
            }
            .table-filter input {
                width: 200px;
                display: inline-block;
            }
            .filter-group select.form-control {
                width: 110px;
            }
            .filter-icon {
                float: right;
                margin-top: 7px;
            }
            .filter-icon i {
                font-size: 18px;
                opacity: 0.7;
            }
            table.table tr th, table.table tr td {
                border-color: #e9e9e9;
                padding: 12px 15px;
                vertical-align: middle;
            }
            table.table tr th:first-child {
                width: 60px;
            }
            table.table tr th:last-child {
                width: 80px;
            }
            table.table-striped tbody tr:nth-of-type(odd) {
                background-color: #fcfcfc;
            }
            table.table-striped.table-hover tbody tr:hover {
                background: #f5f5f5;
            }
            table.table th i {
                font-size: 13px;
                margin: 0 5px;
                cursor: pointer;
            }
            table.table td a {
                font-weight: bold;
                color: #566787;
                display: inline-block;
                text-decoration: none;
            }
            table.table td a:hover {
                color: #2196F3;
            }
            table.table td a.view {
                width: 30px;
                height: 30px;
                color: #2196F3;
                border: 2px solid;
                border-radius: 30px;
                text-align: center;
            }
            table.table td a.view i {
                font-size: 22px;
                margin: 2px 0 0 1px;
            }
            table.table .avatar {
                border-radius: 50%;
                vertical-align: middle;
                margin-right: 10px;
            }
            .status {
                font-size: 30px;
                margin: 2px 2px 0 0;
                display: inline-block;
                vertical-align: middle;
                line-height: 10px;
            }
            .text-success {
                color: #10c469;
            }
            .text-info {
                color: #62c9e8;
            }
            .text-warning {
                color: #FFC107;
            }
            .text-danger {
                color: #ff5b5b;
            }
            .pagination {
                float: right;
                margin: 0 0 5px;
            }
            .pagination li a {
                border: none;
                font-size: 13px;
                min-width: 30px;
                min-height: 30px;
                color: #999;
                margin: 0 2px;
                line-height: 30px;
                border-radius: 2px !important;
                text-align: center;
                padding: 0 6px;
            }
            .pagination li a:hover {
                color: #666;
            }
            .pagination li.active a {
                background: #03A9F4;
            }
            .pagination li.active a:hover {
                background: #0397d6;
            }
            .pagination li.disabled i {
                color: #ccc;
            }
            .pagination li i {
                font-size: 16px;
                padding-top: 6px
            }
            .hint-text {
                float: left;
                margin-top: 10px;
                font-size: 13px;
            }
        </style>
        <script>
            $(document).ready(function () {
                $('[data-toggle="tooltip"]').tooltip();
            });
        </script>
    </head>
    <body>
        <div class="container">
            <div class="table-wrapper">
                <div class="table-title">
                    <div class="row">
                        <div class="col-sm-4">
                            <h2>Order <b>Details</b></h2>
                        </div>
                        <div style="display: flex; gap: 10px;">
                            <c:if test="${account != null}">
                                <a href="listorder" style="font-size: 20px;color: white;text-decoration: none; justify-items: center"><i class="far fa-arrow-circle-left fa-lg" style="color: white;"></i>List Order</a>
                            </c:if>
                            <c:if test="${account == null}">
                                <a href="shop" style="font-size: 20px;color: white;text-decoration: none; justify-items: center"><i class="far fa-arrow-circle-left fa-lg" style="color: white;"></i>Home</a>
                            </c:if>
                        </div>

                    </div>
                </div>

                <table class="table table-striped table-hover">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Image</th>
                            <th>Product</th>						
                            <th>Size</th>
                            <th>Quantity</th>						
                            <th>Price</th>
                            <th>Payment</th>
                            <th>Payment Status</th>
                            <th>FB Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <% int stt = 0;
                        %>
                        <c:forEach items="${listOrder}" var="list">
                            <tr>
                                <td><% 
                                                   ++stt;
                                                   out.print(stt);
                                    %></td>
                                <td><a href="${list.image}"><img class="card-img-top" src="${list.image}" style="max-width: 50px" alt="imageProduct"></a></td>
                                <td>${list.nameProduct}</td>
                                <td>
                                    ${list.size}
                                </td>
                                <td>${list.quantity}</td>
                                <td><fmt:formatNumber maxFractionDigits = "3" value = "${list.totalMoney}" type = "number"/>đ</td>
                                <td>${list.payment}</td>
                                <td style="white-space: nowrap;">
                                    <c:choose>
                                        <c:when test="${list.orderDetailStatus eq 4}">
                                            ${list.paymentStatus}
                                        </c:when>
                                        <c:otherwise>
                                            ${list.paymentStatus}

                                        </c:otherwise>
                                    </c:choose>
                                </td>
                                <td>

                                    <c:choose>
                                        <c:when test="${list.orderDetailStatus == 3 && list.countFbAid < 1}">
                                            <a href="writefeedback?aid=${list.aid}&pid=${list.pid}&oid=${numberOid}"<button id="writeFeedBack">Write FeedBack</button></a>
                                        </c:when>
                                        <c:when test="${list.countFbAid == 1}">
                                            <div style="text-align: center;">
                                                <!--<a href="viewfeedback?aid=${list.aid}&pid=${list.pid}&oid=${numberOid}" style="margin-bottom: 20px; border: 0; background-color: white; text-decoration: none;"><button type="button" class="btn btn-primary" id="viewFeedBack">View FeedBack</button></a>-->

                                                <a class="btn btn-primary btn-sm" href="viewfeedback?aid=${list.aid}&pid=${list.pid}&oid=${numberOid}" role="button">View FeedBack</a>

                                            </div>
                                        </c:when>
                                        <c:otherwise>
                                            None
                                        </c:otherwise>
                                    </c:choose>
                                </td>
                                <!--                                <td>
                                <c:choose>
                                    <c:when test="${list.orderDetailStatus ne 2 && list.orderDetailStatus ne 3 && list.orderDetailStatus ne 4}">
                                        <a href="updatestatus?canceloid=${list.id}&c=1"><button style="background-color: red; color: white;" type="button" class="btn btn-sm">Hủy đơn hàng</button></a><br>
                                    </c:when>
                                    <c:when test="${list.orderDetailStatus eq 2}">
                                        <a href="updatestatus?receivedoid=${list.id}&c=2"><button style="background-color: green; color: white;" type="button" class="btn btn-sm">Đã nhận hàng</button></a>
                                    </c:when>

                                    <c:otherwise>
                                        <span>Complete</span>
                                    </c:otherwise>
                                </c:choose>

                            </td>-->
                            </tr>
                        </c:forEach>


                    </tbody>
                </table>




            </div>
        </div>     

        <script>
            const buttonWfb = document.getElementById("writeFeedBack");
            const buttonVfb = document.getElementById("viewFeedBack");


        </script>
    </body>
</html>                                		
