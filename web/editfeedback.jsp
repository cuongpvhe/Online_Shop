<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Order Detail</title>
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="stylesheet" href="css/fontawesome.min.css">
        <link rel="stylesheet" href="css/all.min.css">
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <style>
            body {
                color: #566787;
                background: currentColor;
                font-family: 'Varela Round', sans-serif;
                font-size: 13px;
            }
            .table-wrapper {
                background: #fff;
                padding: 20px 25px;
                margin: 30px auto;
                border-radius: 3px;
                box-shadow: 0 1px 1px rgba(0,0,0,.05);
            }
            .table-wrapper .btn {
                float: right;
                color: #333;
                background-color: #fff;
                border-radius: 3px;
                border: none;
                outline: none !important;
                margin-left: 10px;
            }
            .table-wrapper .btn:hover {
                color: #333;
                background: #f2f2f2;
            }
            .table-wrapper .btn.btn-primary {
                color: #fff;
                background: #03A9F4;
            }
            .table-wrapper .btn.btn-primary:hover {
                background: #03a3e7;
            }
            .table-title .btn {
                font-size: 13px;
                border: none;
            }
            .table-title .btn i {
                float: left;
                font-size: 21px;
                margin-right: 5px;
            }
            .table-title .btn span {
                float: left;
                margin-top: 2px;
            }
            .table-title {
                color: #fff;
                background: #4b5366;
                padding: 16px 25px;
                margin: -20px -25px 10px;
                border-radius: 3px 3px 0 0;
            }
            .table-title h2 {
                margin: 5px 0 0;
                font-size: 24px;
            }
            .show-entries select.form-control {
                width: 60px;
                margin: 0 5px;
            }
            .table-filter .filter-group {
                float: right;
                margin-left: 15px;
            }
            .table-filter input, .table-filter select {
                height: 34px;
                border-radius: 3px;
                border-color: #ddd;
                box-shadow: none;
            }
            .table-filter {
                padding: 5px 0 15px;
                border-bottom: 1px solid #e9e9e9;
                margin-bottom: 5px;
            }
            .table-filter .btn {
                height: 34px;
            }
            .table-filter label {
                font-weight: normal;
                margin-left: 10px;
            }
            .table-filter select, .table-filter input {
                display: inline-block;
                margin-left: 5px;
            }
            .table-filter input {
                width: 200px;
                display: inline-block;
            }
            .filter-group select.form-control {
                width: 110px;
            }
            .filter-icon {
                float: right;
                margin-top: 7px;
            }
            .filter-icon i {
                font-size: 18px;
                opacity: 0.7;
            }
            table.table tr th, table.table tr td {
                border-color: #e9e9e9;
                padding: 12px 15px;
                vertical-align: middle;
            }
            table.table tr th:first-child {
                width: 60px;
            }
            table.table tr th:last-child {
                width: 80px;
            }
            table.table-striped tbody tr:nth-of-type(odd) {
                background-color: #fcfcfc;
            }
            table.table-striped.table-hover tbody tr:hover {
                background: #f5f5f5;
            }
            table.table th i {
                font-size: 13px;
                margin: 0 5px;
                cursor: pointer;
            }
            table.table td a {
                font-weight: bold;
                color: #566787;
                display: inline-block;
                text-decoration: none;
            }
            table.table td a:hover {
                color: #2196F3;
            }
            table.table td a.view {
                width: 30px;
                height: 30px;
                color: #2196F3;
                border: 2px solid;
                border-radius: 30px;
                text-align: center;
            }
            table.table td a.view i {
                font-size: 22px;
                margin: 2px 0 0 1px;
            }
            table.table .avatar {
                border-radius: 50%;
                vertical-align: middle;
                margin-right: 10px;
            }
            .status {
                font-size: 30px;
                margin: 2px 2px 0 0;
                display: inline-block;
                vertical-align: middle;
                line-height: 10px;
            }
            .text-success {
                color: #10c469;
            }
            .text-info {
                color: #62c9e8;
            }
            .text-warning {
                color: #FFC107;
            }
            .text-danger {
                color: #ff5b5b;
            }
            .pagination {
                float: right;
                margin: 0 0 5px;
            }
            .pagination li a {
                border: none;
                font-size: 13px;
                min-width: 30px;
                min-height: 30px;
                color: #999;
                margin: 0 2px;
                line-height: 30px;
                border-radius: 2px !important;
                text-align: center;
                padding: 0 6px;
            }
            .pagination li a:hover {
                color: #666;
            }
            .pagination li.active a {
                background: #03A9F4;
            }
            .pagination li.active a:hover {
                background: #0397d6;
            }
            .pagination li.disabled i {
                color: #ccc;
            }
            .pagination li i {
                font-size: 16px;
                padding-top: 6px
            }
            .hint-text {
                float: left;
                margin-top: 10px;
                font-size: 13px;
            }

            .star-rating {
                display: flex;
                flex-direction: row-reverse;
                justify-content: center;
            }

            .star {
                cursor: pointer;
                font-size: 24px;
                margin: 0 5px;
            }

            .star:hover:before,
            .star:hover ~ .star:before {
                content: '\2605';
                color: gold;
            }

            .star:before {
                content: '\2606';
                color: #ccc;
            }

            input[type="radio"] {
                display: none;
            }

            input[type="radio"]:checked ~ label:before {
                content: '\2605';
                color: gold;
            }

            #error-message {
                color: red;
                font-weight: bold;
                display: none;
            }

        </style>
        <script>
            $(document).ready(function () {
                $('[data-toggle="tooltip"]').tooltip();
            });
        </script>
    </head>
    <body>
        <div class="container">
            <div class="table-wrapper">
                <div class="table-title">
                    <div class="row">
                        <div class="col-sm-4">
                            <h2>Edit <b>FeedBack</b></h2>
                        </div>
                        <div style="display: flex; gap: 10px;">
                            <a href="orderdetails?oid=${oid}" style="font-size: 20px;color: white;text-decoration: none; justify-items: center"><i class="far fa-arrow-circle-left fa-lg" style="color: white;"></i>Order Details</a>
                            <a href="listorder" style="margin-left: 10px;font-size: 20px;color: white;text-decoration: none; justify-items: center"><i class="far fa-arrow-circle-left fa-lg" style="color: white;"></i>List Order</a>
                            <a href="viewfeedback?aid=${aid}&pid=${pid}&oid=${oid}" style="margin-left: 10px;font-size: 20px;color: white;text-decoration: none; justify-items: center"><i class="far fa-arrow-circle-left fa-lg" style="color: white;"></i>View FeedBack</a>

                        </div>
                    </div>
                </div>

                <div id="formEditFeedBack">
                    <form enctype="multipart/form-data" action="editfeedback" method="post">
                        <div class="containerFeedback" style="display: flex; flex-direction: column; gap: 10px; padding: 20px;">
                            <div class="infoProduct">
                                <img style="width: 60px;
                                     height: 60px;
                                     border-radius: 4px;" src="${p.imageUrl}"/>
                                <span style="font-weight: 600">${p.name}</span>

                            </div>
                            <div class="rate" style="border-bottom: 1px solid #e5e5e5;">
                                <div class="rate-text">
                                    <span style="font-size: 15px; font-weight: 600">Rating</span>
                                </div>
                                <div class="star-rating" id="starContainer">
                                    <input hidden name="countStar" value="${listFb.star}"/>
                                    <c:set var="starCount" value="${listFb.star}" />
                                    <c:forEach var="i" begin="1" end="5">
                                        <c:set var="reverseIndex" value="${5 - i + 1}" />
                                        <input type="radio" id="star${reverseIndex}" name="rating" value="${reverseIndex}">
                                        <label class="star" for="star${reverseIndex}"></label>
                                    </c:forEach>
                                </div>



                                <input style="display: none;" type="number" name="aid" value="${aid}">
                                <input style="display: none;" type="number" name="pid" value="${pid}">
                                <input style="display: none;" type="number" name="oid" value="${oid}">
                                <input style="display: none;" type="number" name="fid" value="${fid}">

                            </div>
                            <input type="hidden" id="birthdate" name="birthdate">
                            <div class="reviewFeedbackTitle">
                                <span style="font-size: 15px; font-weight: 600">Title</span><br>
                                <input name="title" style="font-size: 15px; width: 50%" value="${listFb.title}">
                            </div>
                            <div>
                                <span style="font-size: 15px; font-weight: 600">Your Feedback</span><br>
                                <textarea name="des" style="font-size: 15px; width: 100%">${listFb.desFeedback}</textarea>
                            </div>
                            <div class="reviewFeedbackPhoto">
                                <span style="font-size: 15px; font-weight: 600">Your photos</span><br>
                                <div>
                                    <div id="contentImage" style="display: flex; gap: 50px;">
                                        <c:forEach items="${listFb.feedbackImages}" var="images">
                                            <div>
                                                <a href="imgFB/${images.imgFeedBack}"><img id="img-${images.id}" width="128px" height="128px" src="imgFB/${images.imgFeedBack}" alt="imageFeedBack"/></a>
                                                <button style="border: none; font-size: 20px; position: absolute;background-color: white; color: red;" class="delete-image-button" id="delete-image-button${images.id}" data-image-id="${images.id}" data-feedback-id="${listFb.id}">X</button>
                                            </div>
                                        </c:forEach>
                                    </div>
                                    <input hidden id="lengthImage" type="number" name="lengthImage" value="${lengthImage}"/>


                                </div>

                                <div class="reviewFeedbackPhoto">
                                    <span style="font-size: 15px; font-weight: 600">Upload photos</span>

                                    <input id="fileEdit" class="form-control" type="file" name="image" multiple>


                                </div>
                                <span style="color: red;">My Feedback can only contain a maximum of 3 images!</span>

                            </div>
                            <button style="width: 100%" class="btn btn-primary mb-3" type="submit" class ="btn btn-dark">Update</button>
                        </div>
                    </form>

                </div>
            </div>

        </div>

    </div>     

    <script>
        const buttonWfb = document.getElementById("writeFeedBack");
        const buttonVfb = document.getElementById("viewFeedBack");


        function validateForm() {
            var rating = document.querySelector('input[name="rating"]:checked');

            if (!rating) {
                document.getElementById('error-message').style.display = 'block';
                return false; // Ngăn form được gửi đi nếu không chọn số sao
            }

            // Lưu giá trị rating vào input ẩn để kiểm tra xem có số sao nào được chọn hay không
            document.getElementById('ratingHidden').value = rating.value;

            // Xử lý dữ liệu đánh giá ở đây (có thể gửi lên máy chủ, hiển thị thông báo khác, vv.)
            return true;
        }

        //checkCobaonhieuStarthisechonsantrenform
        var starCount = ${starCount}
        var starContainer = document.getElementById('starContainer');
        for (var i = 1; i <= 5; i++) {
            var radio = document.getElementById('star' + i);
            var label = radio.nextElementSibling;

            if (i <= starCount) {
                radio.checked = true;
                label.classList.add('checked');
            } else {
                label.classList.remove('checked');
            }


        }

        $(document).ready(function () {
            // Xử lý sự kiện khi nhấp vào button "X"
            $('.delete-image-button').on('click', function (event) {
                event.preventDefault();
                var imageId = $(this).data('image-id');
                var feedbackId = $(this).data('feedback-id');
                // Gửi yêu cầu xóa đến máy chủ
                $.ajax({
                    type: "POST",
                    url: "deleteImageF", // Đặt URL xử lý xóa ảnh
                    data: {imageId: imageId, feedbackId: feedbackId},
                    success: function (data) {
                        // Xóa ảnh khỏi giao diện người dùng mà không làm tải lại trang
//                        $(this).parent().remove();
                        // Xóa hình ảnh trên trang web
                        $("#img-" + imageId).remove();
                        $("#delete-image-button" + imageId).remove();
                        $('#lengthImage').val(data.imageCount);
                    },
                    error: function () {
                        alert("Lỗi khi xóa ảnh.");
                    }
                });
            });
        });


        //checkCountImage
        document.getElementById('formEditFeedBack').addEventListener('submit', function (event) {
            var fileInput = document.getElementById('fileEdit');
            var lengthImage = document.getElementById('lengthImage').value;
            var files = fileInput.files;
            // Kiểm tra số lượng file
            if (files.length > 3 || (files.length + parseInt(lengthImage)) > 3) {
                alert('Bạn chỉ được phép tải lên tối đa 3 file. Vui lòng chọn lại.');
                event.preventDefault(); // Ngăn chặn việc gửi form
            }
        });
    </script>
</body>
</html>                                		
