<%-- 
    Document   : MKT-productlist
    Created on : Oct 7, 2023, 8:51:18 PM
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
        <title>MKT Product List</title>
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
                                    </div>
                                    <form action="mktproductlist" method="post">
                                        <div class="row">
                                            <div class="col-md-6  d-flex justify-content-center align-content-between">
                                                <div class="search-form">
                                                    <input type="text" placeholder="Search..." name="search" value="${search}">
                                                <button type="submit"><i class="fas fa-search"></i></button>  
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
                                            <p>Status:</p>
                                            <select name="status" onchange="this.form.submit()" style="height: 30px">
                                                <option value="0" ${status == null ? 'selected' : ''}>Choose</option>
                                                <option value="1" ${status != null && status == '1' ? 'selected' : ''}>Active</option>
                                                <option value="2" ${status != null && status == '2' ? 'selected' : ''}>Disable</option>
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
                                                        <th>ID</th>
                                                        <th>Image</th>
                                                        <th>Name</th>
                                                        <th>Sold</th>
                                                        <th>Price</th>
                                                        <th>Status</th>
                                                        <th>Add Sale</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <c:forEach items="${listP}" var="i">
                                                        <tr >
                                                            <td> <p>${i.id}</p></td>
                                                            <td>
                                                                <img class="img-responsive" src="${i.imageUrl}">
                                                            </td>
                                                            <td><p> ${i.name}</p> </td>
                                                            <td> <p>${i.quantity}</p></td>
                                                            <td> <p><fmt:formatNumber maxFractionDigits = "3" value = "${i.price}" type = "number"/> VND</p></td>
                                                            <td class="status">
                                                                <c:if test="${i.status==1}">
                                                                    <span class="active">Active</span>
                                                                </c:if>
                                                                <c:if test="${i.status==0}">
                                                                    <span class="waiting">Disable</span>
                                                                </c:if>
                                                            </td>
                                                            <td>
                                                                <a href="mktaddsale?id=${i.id}" class="edit" ><i class="fas fa-edit" style="font-size: 2em;"></i></a>
                                                            </td>

                                                        </tr>
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
