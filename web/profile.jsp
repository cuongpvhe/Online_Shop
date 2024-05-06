<%-- 
    Document   : profile
    Created on : Sep 22, 2023, 2:30:14 PM
    Author     : admin
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Profile</title>
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
        <style>
            body{
                margin-top:20px;
                background:#f8f8f8
            }
            .img-responsive {
                max-width: 200px;
                height: 200px;
            }
        </style>
</head>
<body>
    <div class="container">
        <div class="row flex-lg-nowrap">
            <div class="col-12 col-lg-auto mb-3" style="width: 200px;">
                <div class="card p-3">
                    <div class="e-navlist e-navlist--active-bg">
                        <ul class="nav">
                            <li class="nav-item"><a class="nav-link px-2 active" href="home"><i class="fa fa-fw fa-bar-chart mr-1"></i><span>Home</span></a></li>
                            <li class="nav-item"><a class="nav-link px-2" href="listorder"><i class="fa fa-fw fa-th mr-1"></i><span>Order</span></a></li>
                            <li class="nav-item"><a class="nav-link px-2" href="changepassword" ><i class="fa fa-fw fa-cog mr-1"></i><span>Change Password</span></a></li>
                        </ul>
                    </div>
                </div>
            </div>

            <div class="col">
                <div class="row">
                    <div class="col mb-3">
                        <div class="card">
                            <div class="card-body">
                                <div class="e-profile">
                                    <div class="row">
                                        <div class="col-12 col-sm-auto mb-3">
                                            <form action="changeavt" method="post" enctype="multipart/form-data">
                                                <div class="mx-auto" style="width: 200px">
                                                    <c:if test="${account.img == null}" >
                                                        <img src="Images/Avatar/defaultavt.jpg" alt="Image" id="displayImage" class="img-responsive mr-3">
                                                    </c:if>
                                                    <c:if test="${account.img != null}" >
                                                        <img src="${account.img}" alt="Image" id="displayImage" class="img-responsive mr-3">
                                                    </c:if>

                                                    <input type="file" name="avatar" class="form-control-file" id="imageUpload" style="display: none;">

                                                    <div class="d-flex" >
                                                        <button type="button" class="btn btn-primary" id="changePhotoBtn">ChangeAvatar</button>

                                                        <button type="submit" class="btn btn-success" id="saveBtn" style="display: none;">Save</button>
                                                        <button class="btn btn-block" id="cancelBtn" style="display: none;">
                                                            <a href="profile">Cancel</a>
                                                        </button>

                                                    </div>
                                                </div>
                                            </form>
                                            <div id="changeMessage" style="color: red;"></div>
                                        </div>
                                        <div class="col d-flex flex-column flex-sm-row justify-content-between mb-3">
                                            <div class="text-center text-sm-left mb-2 mb-sm-0">
                                                <h4 class="pt-sm-2 pb-1 mb-0 text-nowrap">${account.fullName}</h4>
                                                <p class="mb-0">${account.email}</p>
                                            </div>
                                            <div class="text-center text-sm-right">
                                                <span class="badge badge-secondary">Customer</span>
                                                <div class="text-muted"><small>${account.lastDateLogin}</small></div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <ul class="nav nav-tabs">
                                    <li class="nav-item"><a href="" class="active nav-link">Settings</a></li>
                                </ul>
                                <div class="tab-content pt-3">
                                    <div class="tab-pane active">
                                        <form class="form" action="profile" method="post" onsubmit="return validateForm()">
                                            <div class="row ">
                                                <div class="col">

                                                    <div class="row d-flex justify-content-center">
                                                        <div class="col-md-8" id="errorMessage" style="color: red;"></div>
                                                        <div class="col-md-8">
                                                            <div class="form-group">
                                                                <label>Email</label>
                                                                <input class="form-control" type="text" name="email" value="${account.email}" id="input-email" oninput="emailChanged()" readonly required=""/>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-8">
                                                            <div class="form-group">
                                                                <label>Full Name</label>
                                                                <input class="form-control" type="text" name="fullname" value="${account.fullName}" id="input-fullname" readonly required=""/>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-8">
                                                            <div class="form-group">
                                                                Gender  <input type="radio" name="gender" value="1" ${account.gender==1?"checked":""} /> Male
                                                                <input type="radio" name="gender" value="0" ${account.gender==0?"checked":""} /> Female
                                                            </div>
                                                        </div>

                                                        <div class="col-md-8">
                                                            <div class="form-group">
                                                                <label>Phone Number</label>
                                                                <input class="form-control" type="text" name="phonenumber" value="${account.phoneNumber}" id="input-phonenumber" readonly/>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-8">
                                                            <div class="form-group">
                                                                <label>Address</label>
                                                                <input class="form-control" type="text" name="address" value="${account.address}" id="input-address" readonly/>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col d-flex justify-content-center">                             
                                                    <button id="edit-button" class="btn btn-primary" type="button">Edit</button>
                                                    <button id="save-button" class="btn btn-primary" type="submit" style="display: none;">Save Changes</button>
                                                    <button class="btn btn-block col-1" id="cancel" style="display: none;">
                                                        <a href="profile">Cancel</a>
                                                    </button>
                                                </div>

                                            </div>
                                        </form>

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-12 col-md-3 mb-3">
                    <div class="card mb-3">
                        <div class="card-body">
                            <div class="px-xl-3">
                                <button class="btn btn-block">
                                    <a href="logout">Logout</a>
                                </button>
                            </div>
                        </div>
                    </div>

                </div>
            </div>




        </div>

    </div>

    <script>
        function emailChanged() {
            document.getElementById("errorMessage").innerHTML = "Nếu bạn thay đổi email bạn phải thực hiện xác thực <br> (Làm theo hướng dẫn)";
        }

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
                        document.getElementById('saveBtn').style.display = 'block';
                        document.getElementById('cancelBtn').style.display = 'block';
                    }
                    reader.readAsDataURL(this.files[0]);
                } else {
                    document.getElementById("changeMessage").innerHTML = "File thay đổi phải là ảnh (jpg, jpeg, png)!";

                }
            }
        });

        window.onload = function () {
            var msg = "${msg}";
            var avtmsg = "${avtmsg}";
            if (msg) {
                document.getElementById("errorMessage").innerHTML = msg;
            }
            if (avtmsg) {
                document.getElementById("changeMessage").innerHTML = avtmsg;
            }
        }
        function validateForm() {
            var email = document.getElementsByName("email")[0];
            var phonenumber = document.getElementsByName("phonenumber")[0];

            var emailPattern = /^[^ ]+@[^ ]+\.[a-z]{2,3}$/;
            if (!email.value.match(emailPattern)) {
                document.getElementById("errorMessage").innerHTML = "Vui lòng nhập đúng định dạng email";
                return false;
            }

            if (phonenumber.value.length != 10 && phonenumber.value.length > 0) {
                document.getElementById("errorMessage").innerHTML = "Số điện thoại phải có 10 số";
                return false;
            }

            if ((address.value == "" && address.value.length != 0) || (address.value.trim().length == 0 && address.value.length != 0)) {
                document.getElementById("errorMessage").innerHTML = "Vui lòng điền đúng địa chỉ";
                return false;
            }
        }


        document.getElementById('edit-button').addEventListener('click', function () {
            // Khi người dùng nhấn "Edit", cho phép chỉnh sửa các trường nhập liệu
            document.getElementById('input-email').readOnly = false;
            document.getElementById('input-fullname').readOnly = false;
            document.getElementById('input-phonenumber').readOnly = false;
            document.getElementById('input-address').readOnly = false;
            // và thay đổi nút "Edit" thành "Save Changes"
            this.style.display = 'none';
            document.getElementById('save-button').style.display = 'block';
            document.getElementById('cancel').style.display = 'block';
        });
    </script>
</body>
</html>
