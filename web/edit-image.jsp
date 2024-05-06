<%-- 
    Document   : edit-image
    Created on : Oct 13, 2023, 2:58:36 AM
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
        <title>Edit Image</title>
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
                            <form action="editImage" class="tm-signup-form row" method="post" enctype="multipart/form-data">
                                <input type="hidden" value="${product.id}" name="pid"/>
                                <div class="form-group">
                                    <input
                                        id="imageId"
                                        name="imageId"
                                        type="hidden"
                                        value="${image.id}"
                                        class="form-control validate"
                                        readonly required
                                        />
                                </div>
                                <div class="form-group col-lg-6">
                                    <label for="quantity">Image</label><br/>
                                    <img style="width: 50%" id="displayImage" src="${image.imageUrl}" alt="Product Img"/>
                                    <input id="imageUpload" name="file" type="file" style="display:none;" />
                                    <input id="changePhotoBtn" type="button" class="btn btn-primary" value="CHANGE IMAGE" />
                                </div>        
                                <div id="changeMessage" style="color: red;"></div>
                               <div class="form-group col-lg-6">
                                </div>
                                <div class="form-group col-lg-6">
                                    <label class="tm-hide-sm">&nbsp;</label>
                                    <button
                                        type="submit"
                                        class="btn btn-primary btn-block text-uppercase"
                                        >
                                        Update Image
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


