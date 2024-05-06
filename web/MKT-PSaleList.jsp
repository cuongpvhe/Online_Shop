<%-- 
    Document   : MKT-PSaleList
    Created on : Oct 8, 2023, 10:31:33 AM
    Author     : admin
--%>


<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>MKT Product Sale List</title>
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
                padding: 5px;
            }
            .table thead th {
                border: none;
                padding: 10px;
                font-size: 16px;
                font-weight: 600;
                color: #0084fb;
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

                                        <form action="mktsalelist" method="post">
                                            <div class="row">
                                                <div class="col-md-4  d-flex justify-content-center align-content-between">
                                                    <div class="search-form">
                                                        <input type="text" placeholder="Search..." name="search" value="${search}">
                                                    <button id="search-button" type="submit" class="btn btn-primary">
                                                        <i class="fas fa-search"></i>
                                                    </button>
                                                </div>
                                            </div>

                                            <div class="col-md-2  d-flex justify-content-center align-content-between">
                                                <p>Category:</p>
                                                <select name="cate" onchange="this.form.submit()" style="height: 30px">
                                                    <option value="" ${cate == null ? 'selected' : ''}>Choose</option>
                                                    <c:forEach items="${listC}" var="i">
                                                        <option value="${i.cid}" ${cate == i.cid  ? 'selected' : ''}>${i.name}</option>
                                                    </c:forEach>
                                                </select>
                                            </div>
                                            <div class="col-md-2  d-flex justify-content-center align-content-between">
                                                <p>Brand:</p>
                                                <select name="brand" onchange="this.form.submit()" style="height: 30px">
                                                    <option value="" >Choose</option>
                                                    <c:forEach items="${listB}" var="i">
                                                        <option value="${i.rid}"${brand == i.rid  ? 'selected' : ''}>${i.name}</option>
                                                    </c:forEach>
                                                </select>
                                            </div>
                                            <div class="col-md-2  d-flex justify-content-center align-content-between">
                                                <p>FlashSale:</p>
                                                <select name="isflsale" onchange="this.form.submit()" style="height: 30px">
                                                    <option value="0" ${isflsale == null ? 'selected' : ''}>Choose</option>
                                                    <option value="1" ${isflsale != null && isflsale == '1' ? 'selected' : ''}>None</option>
                                                    <option value="2" ${isflsale != null && isflsale == '2' ? 'selected' : ''}>FlashSale</option>
                                                </select>
                                            </div>
                                            <div class="col-md-2  d-flex justify-content-center align-content-between">
                                                <p>Create Date:</p>
                                                <select name="createdate" onchange="this.form.submit()" style="height: 30px;">
                                                    <option value="0" ${createdate == null ? 'selected' : ''}>Choose</option>
                                                    <option value="1" ${createdate != null && createdate == '1' ? 'selected' : ''}>ASC</option>
                                                    <option value="2" ${createdate != null && createdate == '2' ? 'selected' : ''}>DESC</option>
                                                </select>
                                            </div>
                                        </div>
                                    </form>

                                    <div class="row">
                                        <div class="col-md-8" id="errorMessage" style="color: red;"></div>
                                        <div class="col-md-12" style="margin-top: 15px">
                                            <div class="table-wrap">
                                                <table class="table table-responsive-xl" >
                                                    <thead >
                                                        <tr>
                                                            <th style="width: 15px">ID</th>
                                                            <th>Image</th>
                                                            <th style="width: 180px">Name</th>
                                                            <th>Price</th>
                                                            <th>Sale Price</th>
                                                            <th>Discount</th>
                                                            <th>Starttime</th>
                                                            <th>Endtime</th>
                                                            <!--<th >Create</th>-->
                                                            <th>FlashSale</th>
                                                            <th style="width: 20px">SL</th>

                                                            <th style="width: 20px">Edit</th>
                                                            <th style="width: 20px">Delete</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <c:forEach items="${ListPS}" var="i" varStatus="item">
                                                            <tr class="alert" role="alert">
                                                                <td> <p>${i.product.id}</p></td>
                                                                <td>
                                                                    <img class="img-responsive" src="${i.product.imageUrl}">
                                                                </td>
                                                                <td><p> ${i.product.name}</p> </td>
                                                                <td> <p><fmt:formatNumber maxFractionDigits = "3" value = "${i.product.price}" type = "number"/> VND</p></td>
                                                                <td> <p><fmt:formatNumber maxFractionDigits = "3" value = "${i.salePrice}" type = "number"/> VND</p></td>
                                                                <td> <p>${i.discount}</p></td>
                                                                <td> 
                                                                    <p id="timeDisplayS${item.index}"></p>
                                                                    <p id="dateDisplayS${item.index}"></p>
                                                                </td>
                                                                <td> 
                                                                    <p id="timeDisplayE${item.index}"></p>
                                                                    <p id="dateDisplayE${item.index}"></p>
                                                                </td>
<!--                                                                <td> 
                                                                    <p id="DisplayC${item.index}"></p>
                                                                    <p id="DisplayC${item.index}"></p>
                                                                </td>-->
                                                                <td class="status">
                                                                    <c:if test="${i.isFlashSale==1}">
                                                                        <span class="active">FlashSale</span>
                                                                    </c:if>
                                                                    <c:if test="${i.isFlashSale==0}">
                                                                        <span class="waiting">None</span>
                                                                    </c:if>
                                                                </td>
                                                                <td>${i.quantity}</td>
                                                                <td>
                                                                    <a href="editpsale?id=${i.product.id}" class="edit" ><i class="fas fa-edit" style="font-size: 1.5em;"></i></a>
                                                                </td>
                                                                <td>
                                                                    <a href="mktsalelist?id=${i.product.id}" onclick="return confirm('Sản phẩm này sẽ bị xóa khỏi danh sách giảm giá\nBạn có chắc chắn muốn xóa?')">
                                                                        <i class="fas fa-trash-alt" style="font-size: 1.5em;color: red"></i>
                                                                    </a>
                                                                </td>
                                                            </tr>
                                                        <script>
                                                            var startTime = "${i.startTime}";
                                                            var endTime = "${i.endTime}";
                                                            var createTime = "${i.createTime}";


                                                            var datetimePartsS = startTime.split(" ");
                                                            var date = datetimePartsS[0];
                                                            var time = datetimePartsS[1].split(".")[0];

                                                            document.getElementById("dateDisplayS" +${item.index}).textContent = "" + date;
                                                            document.getElementById("timeDisplayS" +${item.index}).textContent = "" + time;

                                                            var datetimePartsE = endTime.split(" ");
                                                            var dateE = datetimePartsE[0];
                                                            var timeE = datetimePartsE[1].split(".")[0];

                                                            document.getElementById("dateDisplayE" +${item.index}).textContent = "" + dateE;
                                                            document.getElementById("timeDisplayE" +${item.index}).textContent = "" + timeE;

                                                            var datetimePartsC = createTime.split(" ");
                                                            var dateC = datetimePartsC[0];
                                                            var timeC = datetimePartsC[1].split(".")[0];

                                                            document.getElementById("DisplayC" +${item.index}).textContent = "" + dateC;
                                                            document.getElementById("DisplayC" +${item.index}).textContent = "" + timeC;
                                                        </script>
                                                    </c:forEach>
                                                    </tbody>
                                                </table>
                                                <div style="display: flex; justify-content: center">                                    
                                                    <ul class="pagination"></ul>
                                                </div>
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
            $(document).ready(function () {
                var table = $('.table-wrap table');
                var rows = $('tbody tr', table);
                var rowsCount = rows.length;
                var rowsPerPage = 5;
                var totalPages = Math.ceil(rowsCount / rowsPerPage);

                // Tạo nút cho mỗi trang
                for (var i = 0; i < totalPages; i++) {
                    $('.pagination').append('<li class="page-item"><a class="page-link" href="#">' + (i + 1) + '</a></li>');
                }

                // Hiển thị hàng đầu tiên
                showPage(1);

                // Xử lý sự kiện click cho các nút phân trang
                $('.pagination li').click(function () {
                    var pageNum = $(this).text();
                    showPage(pageNum);
                });

                // Hàm hiển thị trang
                function showPage(pageNum) {
                    var startRow = (pageNum - 1) * rowsPerPage;
                    var endRow = startRow + rowsPerPage;

                    // Ẩn tất cả các hàng
                    rows.hide();

                    // Hiển thị các hàng cho trang hiện tại
                    rows.slice(startRow, endRow).show();
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
