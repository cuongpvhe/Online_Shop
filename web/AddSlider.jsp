<%-- 
    Document   : AddSlider
    Created on : Oct 6, 2023, 12:57:24 PM
    Author     : admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Slider</title>
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/5.0.0-alpha1/js/bootstrap.min.js"></script>
        <style>
            body{
                margin-top:25px;
                background:#f8f8f8;
                padding: 30px;
            }
            .img-responsive {
                height: 300px;
                width: 100%;
                object-fit: cover;
            }
            .main {
                border: 3px solid black;
                box-shadow: 7px 7px 7px rgba(0, 0, 0, 0.5);
                border-radius: 30px;
                padding: 25px;
/*                background: #9bd2b1;*/
            }
        </style>
    </head>
    <body>
        <jsp:include page="menu-MKT.jsp"></jsp:include>
            <div class="main">
                <form action="addslider" method="post" onsubmit="return validateForm()" enctype="multipart/form-data">
                    <ul class="nav nav-tabs">
                        <li class="nav-item"><a href="" class="active nav-link">Add Slider</a></li>
                    </ul>
                    <div class="row d-flex justify-content-center">
                        <div class="col-md-8" id="errorMessage" style="color: red; font-size: 20px; margin-bottom: 20px"></div>
                        <div class="col-md-6" style="margin-right: 25px">
                            <div >
                            <c:if test="${slider.image == null}" >
                                <img src="Images/Slider/default.png" alt="Image" id="displayImage" class="img-responsive mr-3">
                            </c:if>
                            <c:if test="${slider.image != null}" >
                                <img src="${slider.image}" alt="Image" id="displayImage" class="img-responsive mr-3">
                            </c:if>

                            <input type="file" name="slider" class="form-control-file" id="imageUpload" style="display: none;" required>

                            <div class="d-flex" >
                                <button type="button" class="btn btn-primary" id="addPhotoBtn" >AddSlider</button>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="col">
                            <div class="form-group">
                                <label>Title</label>
                                <input class="form-control" type="text" name="title" value="${slider.title}" id="input-title"/>
                            </div>
                        </div>
                        <div class="col">
                            <div class="form-group">
                                <p>Status:</p>
                                <input type="radio" id="active" name="status" value="1" ${slider.status==1?"checked":""} ${slider.status==null?"checked":""}>
                                <label for="active">Active</label><br>
                                <input type="radio" id="disabled" name="status" value="0" ${slider.status==0?"checked":""} >
                                <label for="disabled">Disabled</label><br>
                            </div>
                        </div>
                        <div class="col">
                            <div class="form-group">
                                <label>Back Link</label>
                                <input class="form-control" type="text" name="link" value="${slider.backlink}" id="input-title"/>
                            </div>
<!--                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="link">Link to page</label>
                                    <select id="link" class="form-select" name="link">
                                        <option value="">Choose</option>
                                        <option value="shop">Shop</option>
                                        <option value="saleshop">Product Sale</option>
                                        <option value="flsale">Flashsale</option>
                                        <option value="cate">Category</option>
                                        <option value="brand">Brand</option>
                                        <option value="cate+brand">Cate+Brand</option>
                                    </select>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group" id="cateSelect" style="display: none;">
                                    <label for="cate">Category</label>
                                    <select id="cateS" class="form-select" name="cate" disabled>
                                        <c:forEach items="${listC}" var="i">
                                            <option value="${i.cid}">${i.name}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group" id="brandSelect" style="display: none;">
                                    <label for="brand">Brand</label>
                                    <select id="brandS" class="form-select" name="brand" disabled>
                                        <c:forEach items="${listB}" var="i">
                                            <option value="${i.rid}">${i.name}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                        </div>
                            </div>-->
                    </div>

                </div>
                <input type="hidden" name="id" value="${slider.id}" />
                <div class="row" style="">                
                    <div class="col d-flex justify-content-center">                             
                        <button id="save-button" class="btn btn-primary" type="submit" >Save</button>
                    </div>
                </div>
            </form>
        </div>

        <script>
            function validateForm() {
                var title = document.getElementsByName("title")[0];
                if ((title.value == "" && title.value.length != 0) || (title.value.trim().length == 0 && title.value.length != 0)) {
                    document.getElementById("errorMessage").innerHTML = "Title không được để trống";
                    title.value = "";
                    return false;
                }
            }
            document.getElementById('addPhotoBtn').addEventListener('click', function () {
                document.getElementById('imageUpload').click();
                document.getElementById('imageUpload').disabled = false;
            });

            document.getElementById('imageUpload').addEventListener('change', function () {
                if (this.files && this.files[0]) {
                    var fileType = this.files[0]['type'];
                    var validImageTypes = ['image/gif', 'image/jpeg', 'image/png'];
                    if (validImageTypes.includes(fileType)) {
                        var reader = new FileReader();
                        reader.onload = function (e) {
                            var img = new Image();
                            img.onload = function () {
                                if (this.width < 600 || this.height < 300) {
                                    document.getElementById('errorMessage').innerText = 'Kích thước hình ảnh tối thiểu là 600px chiều rộng và 300px chiều cao.';
                                } else {
                                    document.getElementById('displayImage').src = e.target.result;
                                    document.getElementById('errorMessage').innerText = 'Upload anh thành công';
                                }
                            };
                            img.src = e.target.result;
                        }
                        reader.readAsDataURL(this.files[0]);
                    } else {
                        document.getElementById("errorMessage").innerHTML = "File thay đổi phải là ảnh (jpg, jpeg, png)!";
                    }
                }
            });

            window.onload = function () {
                var msg = "${msg}";
                if (msg) {
                    document.getElementById("errorMessage").innerHTML = msg;
                }
            }
//            $(document).ready(function () {
//                $('#link').change(function () {
//                    var selectedValue = $(this).val();
//                    if (selectedValue === 'cate') {
//                        $('#cateSelect').show();
//                        $('#brandSelect').hide();
//                        document.getElementById('cateS').disabled = false;
//                    } else if (selectedValue === 'brand') {
//                        $('#brandSelect').show();
//                        $('#cateSelect').hide();
//                        document.getElementById('brandS').disabled = false;
//                    } else if (selectedValue === 'cate+brand') {
//                        $('#cateSelect').show();
//                        $('#brandSelect').show();
//                        document.getElementById('cateS').disabled = false;
//                        document.getElementById('brandS').disabled = false;
//                    } else {
//                        $('#cateSelect').hide();
//                        $('#brandSelect').hide();
//                    }
//                });
//            });
            document.getElementById('save-button').addEventListener('click', function () {
                var fileInput = document.getElementById('imageUpload');
                var file = fileInput.files[0];

                if (!file) {
                    document.getElementById('errorMessage').innerText = 'Vui lòng tải lên một hình ảnh.';
                    return;
                }
            });
        </script>
    </body>
</html>

