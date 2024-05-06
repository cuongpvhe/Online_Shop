const main = document.getElementById("main");
const registrationForm = document.getElementById("registrationForm");

function handleDeleteButtonClick() {
    $(document).ready(function () {
        $("button.delete-button").click(function (event) {
            event.preventDefault();
            var imageId = $(this).data("image-id");
            $.ajax({
                type: "POST",
                url: "deleteImageF", // Thay thế bằng đường dẫn tới servlet của bạn
                data: {imageId: imageId},
                success: function (response) {
                    if (response === "success") {
                        // Xóa hình ảnh trên trang web
                        $("#img-" + imageId).remove();
                        $("#delete-button" + imageId).remove();
                    } else {
                        alert("Không thể xóa hình ảnh.");
                    }
                },
                error: function () {
                    alert("Lỗi trong quá trình xóa hình ảnh.");
                }
            });
        });
    });

}

function validateFiles() {
    const maxFileCount = 3; // Số tệp tối đa được phép tải lên
    const fileInput = document.getElementById("fileEdit");
    const selectedFiles = fileInput.files;

    if (selectedFiles.length > maxFileCount) {
        alert("Chỉ được tải lên tối đa " + maxFileCount + " ảnh.");
    } else {
        hideForm();
    }
}
function validateFiless() {
    const maxFileCount = 3; // Số tệp tối đa được phép tải lên
    const fileInput = document.getElementById("fileAdd");
    const selectedFiles = fileInput.files;

    if (selectedFiles.length > maxFileCount) {
        alert("Chỉ được tải lên tối đa " + maxFileCount + " ảnh.");
    } else {
        document.getElementById("formFeedback").submit();
    }
}


const showEditFeedBack = document.getElementById("showEditFeedBack");
var showFormEditFeedBack = document.getElementById("editFeedBack");

if (showFormEditFeedBack) {
    showEditFeedBack.addEventListener("click", (event) => {
        event.preventDefault();
        showFormEditFeedBack.style.display = "block";
        main.style.opacity = "0.2";

    });
}




$(document).ready(function () {
    $('#showEditFeedBack').click(function (event) {
        event.preventDefault();
        // Lấy href của thẻ 'a'
        var href = $(this).attr('href');
        // Phân tích URL để lấy các giá trị pid, fid, aid
        var params = new URLSearchParams(href.split('?')[1]);
        var pid = params.get('pid');
        var fid = params.get('fid');
        var aid = params.get('aid');
        $.ajax({
            type: "GET",
            url: "loadFeedback", 
            data: {pid: pid, fid: fid, aid: aid},
            success: function (data) {
                // Lấy tất cả các phần tử input có lớp "ratingEdit"
                var ratingInputs = $('.ratingEdit');
                // Duyệt qua các phần tử và thiết lập checked dựa trên data.star
                ratingInputs.each(function () {
                    if ($(this).val() == data.feedback.star) {
                        $(this).prop('checked', true);
                    } else {
                        $(this).prop('checked', false);
                    }
                });
                $('#title').val(data.feedback.title);
                $('#desFeedback').val(data.feedback.desFeedback);
                $('#fidFB').val(data.feedback.id);
                // Làm việc với danh sách hình ảnh
                var images = data.images;
                var imageContainer = $('#contentImage');
                for (var i = 0; i < images.length; i++) {
                    var imageSrc = images[i].imgFeedBack;
                    // Tạo một thẻ div để chứa hình ảnh và nút "X"
                    var imageDiv = $('<div>');
                    // Tạo phần tử hình ảnh và thiết lập src
                    var imgElement = $('<img>');
                    imgElement.attr('src', "imgFB/" + imageSrc);
                    imgElement.attr('id', "img-" + images[i].id);
                    imgElement.attr('width', "128px");
                    imgElement.attr('height', "128px");
                    // Thêm phần tử hình ảnh vào container
                    imageContainer.append(imgElement);
                    // Tạo nút "X" và thiết lập id và data-image-id
                    var deleteButton = $('<button>');
                    deleteButton.attr('class', 'delete-button');
                    deleteButton.attr('id', 'delete-button' + images[i].id);
                    deleteButton.attr('data-image-id', images[i].id);
                    deleteButton.text('x');
                    deleteButton.css({
                        'font-size': '20px',
                        'position': 'absolute',
                        'border': '0',
                        'color': 'red',
                        'background-color': 'white'
                    });
                    // Thêm phần tử hình ảnh và nút "X" vào thẻ div
                    imageDiv.append(imgElement);
                    imageDiv.append(deleteButton);
                    imageContainer.append(imageDiv);
                }
                handleDeleteButtonClick();
            },
            error: function () {
                alert("Lỗi.");
            }
        });
    });
});








window.onload = function () {
    var currentURL = window.location.href;
    if (currentURL.includes("index")) {
        document.getElementById('moreFeedback').style.display = 'block';
        document.getElementById('main').style.display = 'none';
    }

    if (currentURL.includes("pid")) {
        document.getElementById("editFeedBack").style.display = 'none';
    }

    if (currentURL.includes("pid") && currentURL.includes("fid")) {
        document.getElementById("editFeedBack").style.display = 'block';
        document.getElementById("formEditFB").classList.add("active");
        document.getElementById("overlay").classList.add("active");
        main.style.opacity = 0.3;
    }


};

//HieuungWritefeedback
const overlay = document.getElementById("overlay");


const showFormButton = document.getElementById("writeFeedback");
const showEditButton = document.getElementById("editFbButton");

const closeEditButton = document.getElementById("closeEditButton");


if (closeEditButton) {
    closeEditButton.addEventListener("click", () => {
        showFormEditFeedBack.style.display = "none";
        main.style.opacity = 1;
    });
}

const closeWriteButton = document.getElementById("closeWriteButton");
const notify = document.getElementById("notifyEr");
const aid = document.getElementsByName("aid")[0].value;



function showFormAddFB() {
    registrationForm.style.display = "block";
    main.style.opacity = 0.3;
}

function closeFormAddFB() {
    registrationForm.style.display = "none";
    main.style.opacity = 1;

}

function highlightButton(button) {
    // Loại bỏ lớp "highlight" từ tất cả các nút
    var buttons = document.querySelectorAll(".highlightable");
    buttons.forEach(function (btn) {
        btn.classList.remove("highlight");
    });
    // Thêm lớp "highlight" vào nút được click
    button.classList.add("highlight");
}


function displayImage(imageSrc) {
    var displayedImg = document.getElementById("displayedImg");
    displayedImg.src = imageSrc;
}


// Lấy danh sách các thẻ <a> có class "nav-item"
var navItems = document.querySelectorAll("a.nav-link");
var divItems = document.querySelectorAll("div.tab-pane");
// Thêm sự kiện click cho từng thẻ <li>
navItems.forEach(function (item) {
    item.addEventListener("click", function () {
        // Xóa class "active" từ tất cả các thẻ <li>
        navItems.forEach(function (a) {
            a.classList.remove("active");
        });
        // Thêm class "active" cho thẻ được click
        item.classList.add("active");
    });
});

//Validate Form FeedBack
// Function to validate the form
function validateForm() {

    const rating = document.querySelectorAll('input[type="radio"]:checked').length;
    const reviewTitle = document.querySelector('.reviewFeedbackTitle input').value;
    const feedbackText = document.querySelector('.reviewFeedbackText textarea').value;
    if (rating === 0) {
        alert('Please provide an overall rating.');
        return false;
    }

    if (reviewTitle.trim() === '') {
        alert('Please enter a review title.');
        return false;
    }

    if (feedbackText.trim() === '') {
        alert('Please enter your feedback.');
        return false;
    }

    return true;
}


function closes() {
    document.getElementById('moreFeedback').style.display = 'none';
    document.getElementById('main').style.display = 'block';
}

function showFeedBack() {
    document.getElementById('moreFeedback').style.display = 'block';
    document.getElementById('main').style.display = 'none';
}

function hideForm() {
    check = 1;
    document.getElementById("formEditFB").submit(); // Submit form

}

//// Attach the validateForm function to the form's submit event
//document.querySelector('form').addEventListener('submit', function (event) {
//    if (!validateForm()) {
//        event.preventDefault(); // Prevent the form from being submitted
//    }
//});



