<%-- 
    Document   : ManagerOrder
    Created on : Oct 29, 2023, 1:04:00 AM
    Author     : win
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>

<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <meta http-equiv="X-UA-Compatible" content="ie=edge" />
        <title>List Refund</title>
        <link
            rel="stylesheet"
            href="https://fonts.googleapis.com/css?family=Roboto:400,700"
            />
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
        <!-- https://fonts.google.com/specimen/Roboto -->
        <link rel="stylesheet" href="css/fontawesome.min.css" />
        <link rel="stylesheet" href="css/all.min.css"/>
        <link rel="stylesheet" href="css/bootstrap.min.css" />
        <link rel="stylesheet" href="css/templatemo-style.css">
        <style>
            #none-active{
                border: 1px solid white;
                background: none;
                color: white;
            }
        </style>

    </head>
    <%@include file="menu-dashboard.jsp" %>
    <body id="reportsPage">


        <div class="container mt-5" style="max-width: 100%">
            <div class="row tm-content-row">
                <div class="col-12 tm-block-col">
                    <!-- row -->
                    <div class="row tm-content-row">
                        <div class="col-12 tm-block-col">
                            <div>
                                <c:if test="${mes != null}">
                                    <h3 style="color: red">${mes}</h3>
                                </c:if>
                                <table class="table table-hover tm-table-small tm-product-table">
                                    <thead>
                                        <tr>
                                            <th scope="col">Order ID</th>
                                            <th scope="col">Total Money</th>
                                            <th scope="col">FullName</th>
                                            <th scope="col">Email</th>
                                            <th scope="col">PhoneNumber</th>
                                            <th scope="col">Address</th>
                                            <th scope="col">Payment</th>
                                            <th scope="col">Payment Status</th>
                                            <th scope="col">Refund</th>
                                        </tr>
                                    </thead>
                                    <tbody >
                                        <c:forEach items="${listOrder}" var="list">
                                            <tr>
                                                <td>${list.id}</td>
                                                <td><fmt:formatNumber maxFractionDigits = "3" value = "${list.totalMoney}" type = "number"/>đ</td>
                                                <td>${list.fullName}</td>
                                                <td>${list.email}</td>
                                                <td>${list.phoneNumber}</td>
                                                <td>${list.address}</td>
                                                <td>vnpay</td>
                                                <td>Wait refund</td>
                                                <td><a href="refund?oid=${list.id}&totalmoney=${list.totalMoney}"><button class=" btn-group-toggle btn-danger">Refund</button></a></td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                            <div class="clearfix" style="display: flex; justify-content: center;">
                                <ul class="pagination" style="float: bottom">
                                    <c:forEach begin="1" end="${numberPage}" var="i">
                                        <li class="page-items" style="background: none;margin-right: 7px; margin-top: 10px;">
                                            <a class="page-link" href="refund?index=${i}" id="${tag == i?"none-active":""}">${i}</a>
                                        </li>
                                    </c:forEach>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </div>
        <script src="js/jquery-3.3.1.min.js"></script>
        <script src="js/bootstrap1.min.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    </body>
</html>
