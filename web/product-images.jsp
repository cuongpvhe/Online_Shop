<%-- 
    Document   : product-images
    Created on : Oct 9, 2023, 4:22:40 PM
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
        <title>List Product Images</title>
        <link
            rel="stylesheet"
            href="https://fonts.googleapis.com/css?family=Roboto:400,700"
            />
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
        <%@include file="menu-dashboard.jsp" %>
        <div class="container mt-5">
            <div class="row tm-content-row">
                <div class="col-sm-6 offset-3 justify-content-center tm-block-col">
                    <div class="tm-bg-primary-dark tm-block tm-block-h-auto">
                        <h2 class="tm-block-title">List Images of ${product.name}</h2>
                        <c:if test="${mess!=null }">
                            <div class="alert alert-success" role="alert">
                                ${mess}
                            </div>
                        </c:if>
                        <c:if test="${error!=null }">
                            <div class="alert alert-danger" role="alert">
                                ${error}
                            </div>
                        </c:if>
                    </div>

                </div>
            </div>
            <!-- row -->
            <div class="row tm-content-row">
                <div class="col-sm-6 offset-3 justify-content-center tm-block-col">
                    <form action="" method="post" >
                        <div class="tm-bg-primary-dark tm-block tm-block-products">

                            <div class="tm-product-table-container">
                                <input type="hidden" value="${product.id}" name="pid"/>
                                <table class="table table-hover tm-product-table">
                                    <thead>
                                        <tr>
                                            <th scope="col">Images</th>
                                            <th scope="col">Action</th>
                                        </tr>
                                    </thead>
                                    <tbody >
                                        <c:forEach items="${image}" var="i">
                                            <tr>
                                                <input type="hidden" name="ImageId" value="${i.id}"/>   
                                                <td><img style="width: 50%" src="${i.imageUrl}" alt="Product Image"/></td>
                                                <td>
                                                    <a href="loadImage?pid=${product.id}&imageId=${i.id}" class="tm-product-delete-link">
                                                        <i class="bi bi-pencil-square tm-product-delete-icon"></i>
                                                    </a>
                                                    <a href="deleteImage?pid=${product.id}&imageId=${i.id}" class="tm-product-delete-link">
                                                        <i class="bi bi-trash-fill tm-product-delete-icon"></i>
                                                    </a>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                    </form>    
                    <!-- table container -->
                    <a
                        href="#addNewSize"
                        class="btn btn-primary btn-block text-uppercase mb-3"
                        data-toggle="modal">Add new Image</a>
                </div>
            </div>
        </div>
    </div>


    <div id="addNewSize" class="modal fade">
        <div class="modal-dialog" >
            <div class="modal-content" style="background-color: #4e657a">
                <form action="addImage" method="post" enctype="multipart/form-data">
                    <div class="modal-header">						
                        <h4 class="modal-title">Add Image</h4>
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    </div>
                    <div class="modal-body">	
                        <input type="hidden" value="${product.id}" name="pid"/>
                        <div class="form-group">
                            <label>Image</label><br/>
                            <img style="width: 50%" id="displayImage" src="" alt="Product Image"/>
                            <input id="imageUpload" name="file" type="file" style="display:none; width: 50%" />
                            <input id="changePhotoBtn" type="button" class="btn btn-primary" value="Upload Image" />
                            
                            
                            <!--<input name="quantity" type="text" class="form-control" placeholder="Quantity" value="0">-->
                        </div>

                    </div>
                         <div id="changeMessage" style="color: red;"></div>
                    <div class="modal-footer">  
                        <input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
                        <input type="submit" class="btn btn-success" value="Add">
                    </div>
                </form>
               
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

    <script src="js/manager.js" type="text/javascript"></script>                    
    <script src="js/jquery-3.3.1.min.js"></script>
    <!-- https://jquery.com/download/ -->
    <script src="js/bootstrap1.min.js"></script>
    <!-- https://getbootstrap.com/ -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
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

