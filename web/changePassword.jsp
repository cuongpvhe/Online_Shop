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
        <title>JSP Page</title>
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
        <style>
            body{
                margin-top:20px;
                background:#f8f8f8
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
                                <li class="nav-item"><a class="nav-link px-3 active" href="home"><i class="fa fa-fw fa-bar-chart mr-1"></i><span>Home</span></a></li>
                                <li class="nav-item"><a class="nav-link px-3" href="profile" target="__blank"><i class="fa fa-fw fa-cog mr-1"></i><span>Profile</span></a></li>
                            </ul>
                        </div>
                    </div>
                </div>

                <div class="col">
                    <div class="row">
                        <div class="col mb-3">
                            <div class="card">
                                <div class="card-body">
                                    <ul class="nav nav-tabs">
                                        <li class="nav-item"><a href="" class="active nav-link">Settings</a></li>
                                    </ul>
                                    <div class="tab-content pt-3">
                                        <div class="tab-pane active">
                                            <form  action="changepassword" method="post" onsubmit="return validateForm()">
                                                <div class="mb-2" style="font-size: 25px; margin-left: 50px; color: #007bff"><b>Change Password</b></div>

                                                <div id="errorMessage" style="color: red; font-size: 20px; margin: 10px 0px"></div>
                                                <div class="row d-flex justify-content-center">
                                                    <div class="col-12 col-sm-6 mb-3">

                                                        <c:if test="${loginWith != 2}">
                                                            <div class="row">
                                                                <div class="col">
                                                                    <div class="form-group">
                                                                        <label>Current Password</label>
                                                                        <input class="form-control" type="password" id="inputPassword" name="currentpass" placeholder="••••••" required="">
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </c:if>
                                                        <div class="row">
                                                            <div class="col">
                                                                <div class="form-group">
                                                                    <label>New Password</label>
                                                                    <input class="form-control" type="password" id="inputPassword" name="newpass" placeholder="••••••" required="">
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="row">
                                                            <div class="col">
                                                                <div class="form-group">
                                                                    <label>Confirm <span class="d-none d-xl-inline">Password</span></label>
                                                                    <input class="form-control" type="password" id="inputPassword" name="comfirmpass" placeholder="••••••" required=""></div>
                                                            </div>
                                                        </div>
                                                    </div>

                                                </div>
                                                <div class="row">
                                                    <div class="col d-flex justify-content-center">                             
                                                        <button class="btn btn-primary" type="submit">Change</button>
                                                    </div>
                                                </div>
                                            </form>
                                        </div>
                                    </div>

                                </div>
                            </div>
                        </div>

                    </div>
                </div>

            </div>
        </div>
    </div>
    <script>
        window.onload = function () {
            var msg = "${msg}";
            if (msg) {
                document.getElementById("errorMessage").innerHTML = msg;
            }
        }

        function validateForm() {
            var currentpass = document.getElementsByName("currentpass")[0];
            var newpass = document.getElementsByName("newpass")[0];
            var comfirmpass = document.getElementsByName("comfirmpass")[0];
            var msg = "${msg}";

            if (newpass.value == "" || newpass.value.trim().length == 0) {
                document.getElementById("errorMessage").innerHTML = "Mật khẩu không được để trống";
                newpass.value = "";
                comfirmpass.value = "";
                return false;
            }
            if (newpass.value.length < 6) {
                document.getElementById("errorMessage").innerHTML = "Mật khẩu phải có ít nhất 6 ký tự";
                return false;
            }

            if (newpass.value != comfirmpass.value) {
                document.getElementById("errorMessage").innerHTML = "Mật khẩu mới và mật khẩu xác nhận phải giống nhau";
                return false;
            }
//            if(${msg} != null){
//                document.getElementById("errorMessage").innerHTML = ${msg};
//                return false;
//            }
//                
        }
    </script>
</body>
</html>
