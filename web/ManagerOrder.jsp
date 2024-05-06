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
        <title>Manager Order</title>
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
                border: 1px solid black;
                color: black;
            }
        </style>

    </head>

    <body id="reportsPage">
        <%@include file="menu-sales.jsp" %>
        <div class="container mt-5" style="max-width: 100%">

            <span style="color: black;">Total number order: <span style="font-weight: 800; color: red;">${totalNumberOrder}</span></span><br>
            <span style="color: black;">Total amount sold: <span style="font-weight: 800; color: red;"><fmt:formatNumber maxFractionDigits = "3" value = "${totalSold}" type = "number"/>đ</span></span>

            <div class="row tm-content-row">
                <div class="col-12 tm-block-col">
                    <div class="row tm-content-row">
                        <div class="col-12 tm-block-col">
                            <div>
                                <table class="table table-hover tm-table-small tm-product-table">
                                    <thead>
                                        <tr>
                                            <th scope="col">ID</th>
                                            <th scope="col">Product Name</th>
                                            <th scope="col">Image</th>
                                            <th scope="col">Quantity</th>
                                            <th scope="col">Size</th>
                                            <th scope="col">Full Name</th>
                                            <th scope="col">Address</th>
                                            <th scope="col">Phone</th>
                                            <th scope="col">Note</th>
                                            <th scope="col">Total Money</th>
                                            <th scope="col">Created Date</th>
                                            <th scope="col">Order Number</th>
                                            <th scope="col">Payment</th>
                                            <th scope="col">Payment Status</th>
                                            <th scope="col">Status</th>

                                        </tr>
                                    </thead>
                                    <tbody >
                                        <% int stt = 0;
                                            int totalOrder=0;
                                        %>
                                        <c:forEach items="${listOrderSale}" var="list">
                                            <tr>
                                                <td><% 
                                                   ++stt;
                                                   ++totalOrder;
                                                   out.print(stt);
                                                    %></td>
                                                <td>${list.name}</td>
                                                <td>
                                                    <a href="${list.imageUrl}"><img style="width: 50px;" src="${list.imageUrl}"/></a>
                                                </td>
                                                <td>${list.quantity}</td>
                                                <td>
                                                    ${list.size}
                                                </td>
                                                <td>${list.fullnameOrder}</td>
                                                <td>${list.addressOrder}</td>
                                                <td>${list.phoneOrder}</td>
                                                <td>${list.notOrder}</td>
                                                <td style="color: red;"><fmt:formatNumber maxFractionDigits = "3" value = "${list.totalMoney}" type = "number"/>đ</td>
                                                <td style="white-space: nowrap;">${list.updateDate}</td>
                                                <td>${list.orderID}</td>
                                                <td>${list.payment}</td>
                                                <td style="white-space: nowrap;">
                                                    <c:choose>

                                                        <c:when test="${list.paymentStatus == 'Wait refund'}">
                                                            <span style="color: #0084fb">${list.paymentStatus}</span>
                                                        </c:when>
                                                        <c:when test="${list.paymentStatus == 'Cancell'}">
                                                            <span style="color: red;">${list.paymentStatus}</span>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <span>${list.paymentStatus}</span>
                                                        </c:otherwise>
                                                    </c:choose>


                                                </td>
                                                <td>
                                                    <c:choose>

                                                        <c:when test="${list.statusOrderDetail == 3 || (list.statusOrderDetail == 4 && list.paymentStatus != 'Wait refund')}">
                                                            <span style="color: chartreuse; white-space: nowrap;">Complete</span>
                                                        </c:when>
                                                        <c:when test="${list.statusOrderDetail == 4 && list.paymentStatus == 'Wait refund'}">
                                                            <span style="color: #0084fb; white-space: nowrap;">Waiting</span>
                                                        </c:when>

                                                        <c:otherwise>
                                                            <form id="statusForm" action="updateStatusOrder" method="post">
                                                                <select class="selectedOption" name="selectedOption">
                                                                    <c:choose>
                                                                        <c:when test="${list.payment == 'vnpay' && list.paymentStatus == 'Đang chờ thanh toán'}">
                                                                            <option value="0" <c:if test="${list.statusOrderDetail == 0}">selected</c:if>>Chờ xác nhận</option>
                                                                            <option value="1" <c:if test="${list.statusOrderDetail == 1}">selected</c:if>>Đơn hàng được chuẩn bị</option>
                                                                                <!--<option value="4">Hủy đơn</option>-->
                                                                        </c:when>
                                                                        <c:when test="${list.statusOrderDetail == 0}">
                                                                            <option value="0" <c:if test="${list.statusOrderDetail == 0}">selected</c:if>>Chờ xác nhận</option>
                                                                            <option value="1" <c:if test="${list.statusOrderDetail == 1}">selected</c:if>>Đơn hàng được chuẩn bị</option>
                                                                            <option value="2" <c:if test="${list.statusOrderDetail == 2}">selected</c:if>>Đang giao hàng</option>
                                                                                <!--<option value="4">Hủy đơn</option>-->
                                                                        </c:when>
                                                                        <c:when test="${list.statusOrderDetail == 1}">
                                                                            <option value="1" <c:if test="${list.statusOrderDetail == 1}">selected</c:if>>Đơn hàng được chuẩn bị</option>
                                                                            <option value="2" <c:if test="${list.statusOrderDetail == 2}">selected</c:if>>Đang giao hàng</option>
                                                                                <!--<option value="4">Hủy đơn</option>-->
                                                                        </c:when>
                                                                        <c:when test="${list.statusOrderDetail == 2}">
                                                                            <option value="2" <c:if test="${list.statusOrderDetail == 2}">selected</c:if>>Đang giao hàng</option>
                                                                            <c:if test="${list.checkStatusOrderSale > 0}">
                                                                                <option value="3" <c:if test="${list.statusOrderDetail == 3}">selected</c:if>>Giao thành công</option>
                                                                                <option value="4">Hủy đơn</option>
                                                                            </c:if>
                                                                        </c:when>
                                                                    </c:choose>



                                                                </select>
                                                                <input type="hidden" name="oid" value="${list.idOrderDetail}">
                                                                <input type="hidden" name="pid" value="${list.id}">
                                                                <input type="hidden" name="quantity" value="${list.quantity}">
                                                                <input type="hidden" name="payment" value="${list.payment}">

                                                                <c:if test="${list.size == 36}">
                                                                    <input type="hidden" name="sizeId" value="1">
                                                                </c:if>
                                                                <c:if test="${list.size == 37}">
                                                                    <input type="hidden" name="sizeId" value="2">
                                                                </c:if>
                                                                <c:if test="${list.size == 38}">
                                                                    <input type="hidden" name="sizeId" value="3">
                                                                </c:if>
                                                                <c:if test="${list.size == 39}">
                                                                    <input type="hidden" name="sizeId" value="4">
                                                                </c:if>
                                                                <c:if test="${list.size == 40}">
                                                                    <input type="hidden" name="sizeId" value="5">
                                                                </c:if>
                                                                <c:if test="${list.size == 41}">
                                                                    <input type="hidden" name="sizeId" value="6">
                                                                </c:if>
                                                                <c:if test="${list.size == 42}">
                                                                    <input type="hidden" name="sizeId" value="7">
                                                                </c:if>
                                                                <c:if test="${list.size == 43}">
                                                                    <input type="hidden" name="sizeId" value="8">
                                                                </c:if>
                                                                <c:if test="${list.size == 44}">
                                                                    <input type="hidden" name="sizeId" value="9">
                                                                </c:if>

                                                                <!--<input type="hidden" name="sizeId" value="${list.size}">-->
                                                                <input type="hidden" name="money" value="${list.totalMoney}">
                                                                <input type="hidden" name="idOrder" value="${list.orderID}">
                                                            </form>
                                                        </c:otherwise>
                                                    </c:choose>

                                                </td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                            <div class="clearfix" style="display: flex; justify-content: center;">
                                <ul class="pagination" style="float: bottom">
                                    <c:forEach begin="1" end="${numberPage}" var="i">
                                        <li class="page-items" style="background: none;margin-right: 7px; margin-top: 10px;">
                                            <a class="page-link" href="listordersale?index=${i}" id="${tag == i?"none-active":""}">${i}</a>
                                        </li>
                                    </c:forEach>

                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </div>
        <script>
            // Lắng nghe sự kiện thay đổi trên tất cả các phần tử có class "selectedOption"
            document.querySelectorAll(".selectedOption").forEach(function (selectElement) {
                selectElement.addEventListener("change", function () {
                    // Tìm phần tử form cha gần nhất của phần tử select và gửi nó khi có sự thay đổi
                    var closestForm = selectElement.closest("form");
                    if (closestForm) {
                        closestForm.submit();
                    }
                });
            });
        </script>
        <script src="js/jquery-3.3.1.min.js"></script>
        <script src="js/bootstrap1.min.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    </body>
</html>
