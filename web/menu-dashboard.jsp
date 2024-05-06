<%-- 
    Document   : menu-dashboard
    Created on : Sep 18, 2023, 5:12:34 PM
    Author     : MSI GF
--%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<nav class="navbar navbar-expand-xl">
    <div class="container h-100">
        <a class="navbar-brand" href="shop">
            <h1 class="tm-site-title mb-0">FBT Shoes Shop</h1>
        </a>
        <button class="navbar-toggler ml-auto mr-0" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
                aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <i class="fas fa-bars tm-nav-icon"></i>
        </button>

        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav mx-auto h-100">
                <li class="nav-item dropdown">

                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown"
                       aria-haspopup="true" aria-expanded="false">
                        <i class="fas fa-tachometer-alt"></i>
                        <span>
                            Dashboard <i class="fas fa-angle-down"></i>
                        </span>
                    </a>
                    <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                        <a class="dropdown-item" href="orderAnalys">Order Chart</a>
                        <a class="dropdown-item" href="invoiceChart">Invoice Chart</a>
                    </div>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="invoice?index=1">
                        <i class="far fa-file-alt"></i>
                        Invoice
                        <span class="sr-only"></span>
                    </a>
                </li>
                <li class="nav-item dropdown">

                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown"
                       aria-haspopup="true" aria-expanded="false">
                        <i class="fas fa-shopping-cart"></i>
                        <span>
                            Product <i class="fas fa-angle-down"></i>
                        </span>
                    </a>
                    <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                        <a class="dropdown-item" href="listProduct?index=1">Product List</a>
                        <a class="dropdown-item" href="add-product.jsp">Add New Product</a>

                    </div>
                </li>
                <li class="nav-item dropdown">

                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown"
                       aria-haspopup="true" aria-expanded="false">
                        <i class="fas fa-shopping-cart"></i>
                        <span>
                            Categories & Brands<i class="fas fa-angle-down"></i>
                        </span>
                    </a>
                    <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                        <a class="dropdown-item" href="listCategories">Categories list</a>
                        <a class="dropdown-item" href="listBrands">Brands List</a>

                    </div>
                </li>
                <li class="nav-item dropdown">

                    <a class="nav-link dropdown-toggle" href="refund">
                        <i class="fas fa-shopping-cart"></i>
                        Refund
                    </a>

                </li>
                <li class="nav-item dropdown">

                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown"
                       aria-haspopup="true" aria-expanded="false">
                        <i class="far fa-user"></i>
                        <span>
                            Accounts <i class="fas fa-angle-down"></i>
                        </span>
                    </a>
                    <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                        <a class="dropdown-item" href="listAccountControll?index=1">Accounts list</a>
                        <a class="dropdown-item" href="add-account.jsp">Add New Accounts</a>

                    </div>
                </li>

            </ul>

            <c:if test="${sessionScope.account == null}">
                <li class="nav-item">
                    <a class="nav-link" href="login">Login</a>
                </li>
            </c:if>
            <c:if test="${sessionScope.account != null}">
                <ul class="navbar-nav">
                    <li class="nav-item">
                        <a class="nav-link d-block" href="logout">
                            Hello ${sessionScope.account.fullName} <b>Logout</b>
                        </a>
                    </li>
                </ul>
            </c:if>
        </div>
    </div>

</nav>
