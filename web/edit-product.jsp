<%-- 
    Document   : edit-product
    Created on : Sep 18, 2023, 4:27:45 PM
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
        <title>Edit Product</title>
        <link
            rel="stylesheet"
            href="https://fonts.googleapis.com/css?family=Roboto:400,700"
            />
        <!-- https://fonts.google.com/specimen/Roboto -->
        <link rel="stylesheet" href="css/fontawesome.min.css" />
        <!-- https://fontawesome.com/ -->
        <link rel="stylesheet" href="jquery-ui-datepicker/jquery-ui.min.css" type="text/css" />
        <!-- http://api.jqueryui.com/datepicker/ -->
        <link rel="stylesheet" href="css/bootstrap1.min.css" />
        <!-- https://getbootstrap.com/ -->
        <link rel="stylesheet" href="css/templatemo-style.css">
        <!--
            Product Admin CSS Template
            https://templatemo.com/tm-524-product-admin
        -->
    </head>

    <body>
        <%@include file="menu-dashboard.jsp" %>
        <div class="container tm-mt-big tm-mb-big">
            <div class="row">
                <div class="col-xl-9 col-lg-10 col-md-12 col-sm-12 mx-auto">
                    <div class="tm-bg-primary-dark tm-block tm-block-h-auto">
                        <div class="row">
                            <div class="col-12">
                                <h2 class="tm-block-title d-inline-block">Edit Product</h2>
                                <c:if test="${error!=null }">
                                    <div class="alert alert-danger" role="alert">
                                        ${error}
                                    </div>
                                </c:if>
                            </div>
                        </div>
                        <div class="row tm-edit-product-row">
                            <div class="col-xl-6 col-lg-6 col-md-12">
                                <form action="editProduct" method="post" class="tm-edit-product-form" enctype="multipart/form-data">
                                    <div class="form-group mb-3">
                                        <input
                                            id="id"
                                            name="id"
                                            type="hidden"
                                            value="${product.id}"
                                            class="form-control validate"
                                            />
                                    </div>
                                    <div class="form-group mb-3">
                                        <label
                                            for="name"
                                            >Product Name
                                        </label>
                                        <input
                                            id="name"
                                            name="name"
                                            type="text"
                                            value="${product.name}"
                                            class="form-control validate"
                                            />
                                    </div>
                                    <div class="form-group mb-3">
                                        <label
                                            for="description"
                                            >Description</label
                                        >
                                        <textarea                    
                                            class="form-control validate tm-small"
                                            name="description"
                                            rows="5"
                                            required
                                            >${product.description}</textarea>
                                    </div>
                                    <div class="form-group mb-3">
                                        <label
                                            for="price"
                                            >Price
                                        </label>
                                        <input
                                            id="price"
                                            name="price"
                                            type="text"
                                            value="${product.price}"
                                            class="form-control validate"
                                            />
                                    </div>
                                    <div class="row">
                                        <div class="form-group mb-3 col-xs-12 col-sm-6">
                                            <label
                                                for="category"
                                                >Category</label
                                            >
                                            <select
                                                class="custom-select tm-select-accounts"
                                                id="category"
                                                name="catgoryId"
                                                >
                                                <option value="${product.category.cid}">${product.category.name}</option>
                                                <c:forEach items="${category}" var="c">
                                                    <option value="${c.cid}">${c.name}</option>
                                                </c:forEach>                                           
                                            </select>

                                        </div>
                                        <div class="form-group mb-3 col-xs-12 col-sm-6">
                                            <label
                                                for="brand"
                                                >Brands</label
                                            >
                                            <select
                                                class="custom-select tm-select-accounts"
                                                id="brand"
                                                name="brandId"
                                                >
                                                <option value="${product.brand.rid}">${product.brand.name}</option>
                                                <c:forEach items="${brands}" var="b">
                                                    <option value="${b.rid}">${b.name}</option>
                                                </c:forEach>                                           
                                            </select>

                                        </div>
                                        <div class="form-group mb-3 col-xs-12 col-sm-6">
                                            <label
                                                for="manager"
                                                >Manager</label
                                            >
                                            <select
                                                class="custom-select tm-select-accounts"
                                                id="manager"
                                                name="managerId"
                                                >
                                                <option value="${product.manager.managerId}">${product.manager.fullName}</option>
                                                <c:forEach items="${manager}" var="m">
                                                    <option value="${m.managerId}">${m.fullName}</option>
                                                </c:forEach>                                           
                                            </select>
                                        </div>
                                        <div class="form-group mb-3 col-xs-12 col-sm-6">
                                            <label
                                                for="status"
                                                >Status</label
                                            >
                                            <select
                                                class="custom-select tm-select-accounts"
                                                id="status"
                                                name="status"
                                                >
                                                <c:if test="${product.status == 1}">
                                                    <option value="1">Active</option>
                                                </c:if>
                                                <c:if test="${product.status == 0}">
                                                    <option value="1">Blocked</option>
                                                </c:if>
                                                <option value="1">Active</option>
                                                <option value="0">Blocked</option>
                                            </select>
                                        </div>

                                    </div>

                            </div>
                            <div class="col-xl-6 col-lg-6 col-md-12 mx-auto mb-4">

                                <div class="tm-product-img-edit mx-auto col-sm-6">
                                    <img id="displayImage" src="${product.imageUrl}" alt="Product image" class="img-fluid d-block mx-auto">
                                    <i class="fas tm-upload-icon"></i>
                                </div>
                                <div class="custom-file mt-3 mb-3 col-sm-6">
                                    <input id="imageUpload" name="file" type="file" style="display:none;" />
                                    <input id="changePhotoBtn" type="button" class="btn btn-primary btn-block mx-auto" value="CHANGE IMAGE" />
                                </div>
                                    <div id="changeMessage" style="color: red;"></div>
                            </div>
                            <div class="col-12">
                                <button type="submit" class="btn btn-primary btn-block text-uppercase">Update Now</button>
                            </div>
                            </form>
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

        <script src="js/jquery-3.3.1.min.js"></script>
        <!-- https://jquery.com/download/ -->
        <script src="jquery-ui-datepicker/jquery-ui.min.js"></script>
        <!-- https://jqueryui.com/download/ -->
        <script src="js/bootstrap.min.js"></script>
        <!-- https://getbootstrap.com/ -->
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
        <script>
            document.getElementById('changePhotoBtn').addEventListener('click', function () {
                document.getElementById('imageUpload').click();
            });
            
            document.getElementById('imageUpload').addEventListener('change', function () {
            if (this.files && this.files[0]) {
                var fileType = this.files[0]['type'];
                var validImageTypes = ['image/gif', 'image/jpeg', 'image/png'];
                if (validImageTypes.includes(fileType)) {
                    var reader = new FileReader();
                    reader.onload = function (e) {
                        document.getElementById('displayImage').src = e.target.result;
                    }
                    reader.readAsDataURL(this.files[0]);
                } else {
                    document.getElementById("changeMessage").innerHTML = "File thay đổi phải là ảnh (jpg, jpeg, png)!";

                }
            }
        });


        </script>
    </body>
</html>
