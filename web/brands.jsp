<%-- 
    Document   : brands
    Created on : Sep 18, 2023, 4:45:59 PM
    Author     : MSI GF
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta http-equiv="X-UA-Compatible" content="ie=edge" />
    <title>List Brands</title>
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
                        <h2 class="tm-block-title">List of Brands</h2>
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
                                <table class="table table-hover tm-product-table">
                                    <thead>
                                        <tr>
                                            <th scope="col">Brands</th>
                                            <th scope="col">Action</th>
                                        </tr>
                                    </thead>
                                    <tbody >
                                        <c:forEach items="${listB}" var="b">
                                            <tr>

                                                <td><input type="hidden" name="rid" value="${b.rid}"/>${b.name}</td>                                                 

                                                <td>
                                                    <a href="loadBrand?rid=${b.rid}" class="tm-product-delete-link">
                                                        <i class="bi bi-pencil-square tm-product-delete-icon"></i>
                                                    </a>
                                                    <a id="deleteButton" onclick="confirmDelete('${b.rid}')" class="tm-product-delete-link">
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
                        href="add-brand.jsp"
                        class="btn btn-primary btn-block text-uppercase mb-3"
                        >Add new Brand</a>
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

    <script src="js/manager.js" type="text/javascript"></script>                    
    <script src="js/jquery-3.3.1.min.js"></script>
    <!-- https://jquery.com/download/ -->
    <script src="js/bootstrap1.min.js"></script>
    <!-- https://getbootstrap.com/ -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script>
    function confirmDelete(rid) {
        if (confirm('Bạn có chắc chắn muốn xóa không?')) {
        var xhr = new XMLHttpRequest();
        xhr.open("GET", "deleteBrand?rid=" + rid, true);
        xhr.send();
        xhr.onreadystatechange = function() {
        if (this.readyState == 4 && this.status == 200) {
          // Hiển thị thông báo xác nhận
          alert('Brand đã được xóa thành công!');
          // Tải lại trang
          location.reload();
        }
      };
        } else {
        // Nếu người dùng không chấp nhận xóa, bạn có thể không thực hiện hành động gì
        }
                        }
    </script>

</body>
</html>

