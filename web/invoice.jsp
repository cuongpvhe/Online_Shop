<%-- 
    Document   : account.jsp
    Created on : Sep 18, 2023, 4:26:17 PM
    Author     : MSI GF
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <meta http-equiv="X-UA-Compatible" content="ie=edge" />
        <title>Invoice</title>
        <link
            rel="stylesheet"
            href="https://fonts.googleapis.com/css?family=Roboto:400,700"
            />
        <!-- Link icon boostrap -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
        <!-- https://fonts.google.com/specimen/Roboto -->
        <link rel="stylesheet" href="css/fontawesome.min.css" />
        <!-- https://fontawesome.com/ -->
        <link rel="stylesheet" href="css/bootstrap1.min.css" />
        <!-- https://getbootstrap.com/ -->
        <link rel="stylesheet" href="css/templatemo-style.css">
        <!--
            Product Admin CSS Template
            https://templatemo.com/tm-524-product-admin
        -->
    </head>

    <body id="reportsPage">
        <div class="" id="home">
            <%@include file="menu-dashboard.jsp" %>
            <div class="container mt-5">
                <div class="row tm-content-row">
                    <div class="col-12 tm-block-col">
                        <div class="tm-bg-primary-dark tm-block tm-block-h-auto">
                            <h2 class="tm-block-title">List of Invoice</h2>
                            <c:if test="${mess!=null }">
                                <div class="alert alert-success" role="alert">
                                    ${mess}
                                </div>
                            </c:if>
                            <form id="search" action="invoice?index=1" method="post">
                                <div  class="tm-signup-form row">
                                    <div class="form-group col-lg-6">
                                        <p class="text">Date</p>
                                        <label for="start-date">From:</label>
                                        <input type="date" id="start-date" name="cDate1">
                                        <label for="end-date">To:</label>
                                        <input type="date" id="end-date" name="cDate2">
                                        <button id="filter-button">Submit</button>
                                    </div>
                                    <div class="form-group col-lg-5">
                                        <p class="text">Search</p>
                                        <input
                                            name="search"
                                            type="text"
                                            class="form-control validate"
                                            placeholder="Search email user"
                                            value="${search}"
                                            />
                                        <input class="btn-block btn-primary" type="submit" value="Search" />
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
                <!-- row -->
                <div class="row tm-content-row">
                    <div class="col-12 tm-block-col">

                        <div class="tm-bg-primary-dark tm-block tm-block-products">

                            <div class="tm-product-table-container">
                                <table class="table table-hover tm-table-small tm-product-table">
                                    <thead>
                                        <tr>
                                            <th scope="col">Invoice Id</th>
                                            <th scope="col">Full Name</th>
                                            <th scope="col">Email</th>
                                            <th scope="col">Phone Number</th>
                                            <th scope="col">Address</th>
                                            <th scope="col">Price</th>
                                            <th scope="col">Created Date</th>
                                            <th scope="col">Action</th>
                                        </tr>
                                    </thead>
                                    <tbody >
                                        <c:forEach items="${listO}" var="o">
                                            <tr>
                                                <td>${o.id}</td>
                                                <td>${o.fullName}</td>
                                                <td>${o.email}</td>
                                                <td>${o.phoneNumber}</td>
                                                <td>${o.address}</td>
                                                <td>${o.totalMoney}</td>
                                                <td>${o.createDate}</td>
                                                <td>
                                                    <a href="loadAccount?id=${a.id}" class="tm-product-delete-link">
                                                        <i class="bi bi-pencil-square tm-product-delete-icon"></i>
                                                    </a>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                            
                            <div class="col-12 col-md-4 text-center" style="display: contents">
                                <nav aria-label="Page navigation example">
                                    <ul class="pagination pagination-circle float-md-right mb-0">
                                        <c:if test="${tag != 1}">
                                            <li class="page-item"><a href="invoice?index=${tag-1 }&search=${search}&cDate1=${cDate1}&cDate2=${cDate2}" class="page-link"><i class="fas fa-chevron-left"></i></a></li>
                                                </c:if> 
                                                <c:forEach begin="1" end="${endPage }" var="i">
                                            <li class="${tag==i?"page-item active":"page-item" }"><a href="invoice?index=${i}&search=${search}&cDate1=${cDate1}&cDate2=${cDate2}" class="page-link">${i }</a></li>
                                            </c:forEach>
                                            <c:if test="${tag != endPage}">
                                            <li class="page-item"><a href="invoice?index=${tag+1 }&search=${search}&cDate1=${cDate1}&cDate2=${cDate2}" class="page-link"><i class="fas fa-chevron-right"></i></a></li>
                                                </c:if> 
                                    </ul>
                                </nav>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
            <footer class="tm-footer row tm-mt-small">
                <div class="col-12 font-weight-light">
                    <p class="text-center text mb-0 px-4 small">
                        Copyright &copy; <b>2018</b> All rights reserved. 

                        Design: <a rel="nofollow noopener" href="https://templatemo.com" class="tm-footer-link">Template Mo</a>
                    </p>
                </div>
            </footer>
        </div>

        <script src="js/jquery-3.3.1.min.js"></script>
        <!-- https://jquery.com/download/ -->
        <script src="js/bootstrap1.min.js"></script>
        <!-- https://getbootstrap.com/ -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

        <script type="text/javascript">
            function search() {
                var form = document.getElementById('search');
                form.submit();
            }
            $(document).ready(function () {
                // Xử lý sự kiện khi nút Lọc được nhấn
                $("#filter-button").click(function () {
                    var startDate = $("#start-date").val();
                    var endDate = $("#end-date").val();
                    // Gửi yêu cầu lọc đến server hoặc xử lý dữ liệu trên client
                    // ...
                    // Cập nhật biểu đồ và dữ liệu thống kê
                    // ...
                });
            });

        </script>
    </body>
</html>

