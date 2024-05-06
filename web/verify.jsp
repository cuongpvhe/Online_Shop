<%-- 
    Document   : verify
    Created on : Sep 15, 2023, 11:22:04 AM
    Author     : admin
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Verify</title>
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
        <style>

            div#notes {
                margin-top: 30px;
            }

        </style>
    </head>
    <body>
        <div class="container">
            <!-- Instructions -->
            <div class="row d-flex justify-content-center align-items-center">
                <div class="alert alert-success col-md-12" role="alert" id="notes">
                    <h4>Xác nhận</h4>
                    <ul>
                        <li>Vui lòng kiểm tra email của bạn.Chúng tôi đã gửi mã xác nhận về mail của bạn!!</li>
                        <li>Nến bạn chưa nhận được mã xác nhận <a href="reverify">Ấn vào link để nhận mã xác thực</a></li>
                    </ul>
                </div>
            </div>
            <!-- Verification Entry Jumbotron -->
            <div class="row d-flex justify-content-center">
                <div class="col-md-12">
                    <div class="jumbotron text-center">
                        <h2>Nhập mã xác nhận bên dưới !!!</h2>
                        <c:if test="${err !=null}">
                            <font color ="red">  ${err}</font>
                        </c:if>
                        <div id="timeout" style="display: none;">
                            <p>Mã xác thực của bạn đã hết hiệu lực</p>
                            <p>Vui lòng ấn vào link bên dưới để nhận được mã xác thực mới</p>
                            <p><a href="reverify" onclick="showSubmitButton()">Nhận mã xác thực mới</a></p>
                        </div>
                        <form method="post" action="${authenticationfor}">
                            <div class="form-group d-flex justify-content-center align-items-center">
                                <input type="text" class="form-control col-md-6 " name="verify" required>
                                <input class="btn btn-primary" type="submit" value="Verify" style="margin-left: 20px">
                            </div>
                                <button class="btn btn-success"  style="margin-left: 50px">
                                    <a href="${authenticationfor}" style=" color: #000">Trở về trang trước</a>
                                </button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <script>

            function showSubmitButton() {
                document.getElementById('submit').disabled = false;
            }
            setTimeout(function () {
                document.getElementById('timeout').style.display = 'block';
                document.getElementById('submit').disabled = true;
            }, 1000 * 60 * 5);
        </script>
    </body>
</html>
