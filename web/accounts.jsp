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
        <title>List Account</title>
        <link
            rel="stylesheet"
            href="https://fonts.googleapis.com/css?family=Roboto:400,700"
            />
        <!-- Link icon boostrap -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
        <link rel="stylesheet" href="css/fontawesome.min.css" />
        <link rel="stylesheet" href="css/bootstrap1.min.css" />
        <link rel="stylesheet" type="text/css" href="css/templatemo-style.css">

    </head>

    <body id="reportsPage">
        <div class="" id="home">
            <%@include file="menu-dashboard.jsp" %>
            <div class="container mt-5">
                <div class="row tm-content-row">
                    <div class="col-12 tm-block-col">
                        <div class="tm-bg-primary-dark tm-block tm-block-h-auto">
                            <h2 class="tm-block-title">List of Accounts</h2>
                            <c:if test="${mess!=null }">
                                <div class="alert alert-success" role="alert">
                                    ${mess}
                                </div>
                            </c:if>
                            <form id="search" action="listAccountControll?index=1" method="post">
                                <div  class="tm-signup-form row">
                                    <div class="form-group col-lg-6">
                                        <p class="text">Accounts</p>
                                        <select name="roleId" class="custom-select" onchange="search()">
                                            <option value="">All</option>
                                            <option value="1">Admin</option>
                                            <option value="2">Customer</option>
                                            <option value="3">Sales</option>
                                            <option value="4">Marketing Manager</option>
                                        </select>
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

                            <div class="">
                                <table class="table table-hover tm-table-small tm-product-table">
                                    <thead>
                                        <tr>
                                            <th scope="col">ID</th>
                                            <th scope="col">Full Name</th>
                                            <th scope="col">Email</th>
                                            <th scope="col">Gender</th>
                                            <th scope="col">Phone Number</th>
                                            <th scope="col">Address</th>
                                            <th scope="col">Status</th>
                                            <th scope="col">Created Date</th>
                                            <th scope="col">Role</th>
                                            <th scope="col">Action</th>
                                        </tr>
                                    </thead>
                                    <tbody >
                                        <c:forEach items="${listA}" var="a">
                                            <tr>
                                                <td>${a.id}</td>
                                                <td>${a.fullName}</td>
                                                <td>${a.email}</td>
                                                <c:if test="${a.gender == 1}">
                                                    <td>Male</td>
                                                </c:if>
                                                <c:if test="${a.gender == 0}">
                                                    <td>Female</td>
                                                </c:if>
                                                <td>${a.phoneNumber}</td>
                                                <td>${a.address}</td>
                                                <c:if test="${a.status == 1}">
                                                    <td>Active</td>
                                                </c:if>
                                                <c:if test="${a.status == 0}">
                                                    <td>Blocked</td>
                                                </c:if>
                                                <td>${a.createDate}</td>
                                                <c:if test="${a.roleId == 1}">
                                                    <td>Admin</td>
                                                </c:if>
                                                <c:if test="${a.roleId == 2}">
                                                    <td>Customer</td>
                                                </c:if>
                                                <c:if test="${a.roleId == 3}">
                                                    <td>Sales</td>
                                                </c:if>
                                                <c:if test="${a.roleId == 4}">
                                                    <td>Marketing Manager</td>
                                                </c:if>
                                                <c:if test="${a.roleId == 1}">
                                                    <td></td>
                                                </c:if>
                                                <c:if test="${a.roleId != 1}">
                                                    <td>
                                                        <a href="loadAccount?id=${a.id}" class="tm-product-delete-link">
                                                            <i class="bi bi-pencil-square tm-product-delete-icon"></i>
                                                        </a>
                                                    </td>
                                                </c:if>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>

                            <div class="col-12 col-md-4 text-center" style="display: contents">
                                <nav aria-label="Page navigation example">
                                    <ul class="pagination pagination-circle float-md-right mb-0">
                                        <c:if test="${tag != 1}">
                                            <li class="page-item"><a href="listAccountControll?index=${tag-1 }&search=${search}&roleId=${roleId}" class="page-link"><i class="fas fa-chevron-left"></i></a></li>
                                                </c:if> 
                                                <c:forEach begin="1" end="${endPage }" var="i">
                                            <li class="${tag==i?"page-item active":"page-item" }"><a href="listAccountControll?index=${i}&search=${search}&roleId=${roleId}" class="page-link">${i }</a></li>
                                            </c:forEach>
                                            <c:if test="${tag != endPage}">
                                            <li class="page-item"><a href="listAccountControll?index=${tag+1 }&search=${search}&roleId=${roleId}" class="page-link"><i class="fas fa-chevron-right"></i></a></li>
                                                </c:if> 
                                    </ul>
                                </nav>
                            </div>
                            <div>
                                <a
                                    href="add-account.jsp"
                                    class="btn btn-primary btn-block text-uppercase mb-3" style="margin-top: 50px">Add new account</a>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
            <footer class="tm-footer row tm-mt-small">
                <div class="col-12 font-weight-light">

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
        </script>
    </body>
</html>

