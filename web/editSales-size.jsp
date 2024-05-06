<%-- 
    Document   : edit-size
    Created on : Oct 11, 2023, 3:34:35 AM
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
        <title>Edit Size</title>
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
                            <h2 class="tm-block-title">Edit Size of ${product.name}</h2>
                            <c:if test="${error!=null }">
                                <div class="alert alert-danger" role="alert">
                                    ${error}
                                </div>
                            </c:if>
                            <form action="updateSalesSize" class="tm-signup-form row" method="post">
                                <input type="hidden" value="${product.id}" name="pid"/>
                                <div class="form-group">
                                    <input
                                        id="sizeId"
                                        name="sizeId"
                                        type="hidden"
                                        value="${size.id}"
                                        class="form-control validate"
                                        readonly required
                                        />
                                </div>
                                <div class="form-group col-lg-6">
                                    <label for="name">Size</label>
                                    <input
                                        id="name"
                                        name="name"
                                        type="text"
                                        value="${size.size}"
                                        class="form-control validate"
                                        disabled
                                        style="color: #0173b2"
                                        />
                                </div>
                                <div class="form-group col-lg-6">
                                    <label for="quantity">Quantity</label>
                                    <input
                                        id="quantity"
                                        name="quantity"
                                        type="text"
                                        value="${size.quantity}"
                                        class="form-control validate"
                                        />
                                </div>        
                                
                               <div class="form-group col-lg-6">
                                </div>
                                <div class="form-group col-lg-6">
                                    <label class="tm-hide-sm">&nbsp;</label>
                                    <button
                                        type="submit"
                                        class="btn btn-primary btn-block text-uppercase"
                                        >
                                        Update Size
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

