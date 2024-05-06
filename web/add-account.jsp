<%-- 
    Document   : add-account
    Created on : Sep 19, 2023, 3:50:37 PM
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
        <title>Add Account</title>
        <link
            rel="stylesheet"
            href="https://fonts.googleapis.com/css?family=Roboto:400,700"
            />
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
                        <div class="tm-bg-primary-dark tm-block tm-block-settings">
                            <h2 class="tm-block-title">Add New Account</h2>
                            <c:if test="${error!=null }">
                                <div class="alert alert-danger" role="alert">
                                    ${error}
                                </div>
                            </c:if>

                            <form action="addAccountControll" class="tm-signup-form row" method="post">
                                <div class="form-group col-lg-6">
                                    <label for="name">Full Name</label>
                                    <input
                                        id="name"
                                        name="name"
                                        type="text"
                                        class="form-control validate"
                                        />
                                </div>
                                <div class="form-group col-lg-6">
                                    <label for="email">Email</label>
                                    <input
                                        id="email"
                                        name="email"
                                        type="email"
                                        class="form-control validate"
                                        />
                                </div>
                                <div class="form-group col-lg-6">
                                    <label for="password">Password</label>
                                    <input
                                        id="password"
                                        name="password"
                                        type="password"
                                        class="form-control validate"
                                        />
                                </div>
                                <div class="form-group col-lg-6">
                                    <label for="role">Role</label>
                                    <select name="roleId" class="custom-select">
                                        <option value="1">Admin</option>
                                        <option value="2">Customer</option>
                                        <option value="3">Sales</option>
                                        <option value="4">Marketing Manager</option>
                                    </select>
                                </div>
                                <div class="form-group col-lg-6">
                                    <label for="gender">Gender</label><br/>
                                    <input
                                        id="gender"
                                        checked name="gender"
                                        type="radio"
                                        value="1"
                                        /><label for="gender">Male</label><br/>
                                    <input
                                        id="gender"
                                        name="gender"
                                        type="radio"
                                        value="0"
                                        /><label for="gender">Female</label>
                                </div>
                                <div class="form-group col-lg-6">
                                    <label for="phone">Phone Number</label>
                                    <input
                                        id="phone"
                                        name="phoneNumber"
                                        type="tel"
                                        class="form-control validate"
                                        />
                                </div>
                                <div class="form-group col-lg-6">
                                    <label for="phone">Address</label>
                                    <input
                                        id="address"
                                        name="address"
                                        type="tel"
                                        class="form-control validate"
                                        />
                                </div>
                               
                                <div class="form-group col-lg-6">
                                    <label class="tm-hide-sm">&nbsp;</label>
                                    <button
                                        type="submit"
                                        class="btn btn-primary btn-block text-uppercase"
                                        >
                                        Add Account
                                    </button>
                                </div>

                            </form>
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
        <script src="js/bootstrap.min.js"></script>
        <!-- https://getbootstrap.com/ -->
    </body>
</html>
