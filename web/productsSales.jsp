<%-- 
    Document   : products
    Created on : Sep 18, 2023, 4:27:19 PM
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
        <title>List Products</title>
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
        <%@include file="menu-sales.jsp" %>
        <div class="container mt-5">
            <div class="row tm-content-row">
                <div class="col-12 tm-block-col">
                    <div class="tm-bg-primary-dark tm-block tm-block-h-auto">
                        <h2 class="tm-block-title">List of Products</h2>
                        <c:if test="${mess!=null }">
                            <div class="alert alert-success" role="alert">
                                ${mess}
                            </div>
                        </c:if>
                        <form id="search" action="listProductSales?index=1" method="post">
                            <div  class="tm-signup-form row">
                                <div class="form-group col-lg-6">
                                    <p class="text">Category</p>
                                    <select name="categoryId" class="custom-select" onchange="search()">
                                        <option value="">All</option>
                                        <c:forEach items="${category}" var="c">
                                            <<option value="${c.cid}">${c.name}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                                <div class="form-group col-lg-6">
                                    <p class="text">Brand</p>
                                    <select name="brandId" class="custom-select" onchange="search()">
                                        <option value="">All</option>
                                        <c:forEach items="${brands}" var="b">
                                            <<option value="${b.rid}">${b.name}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                                <div class="form-group col-lg-5">
                                    <p class="text">Search</p>
                                    <input
                                        name="search"
                                        type="text"
                                        class="form-control validate"
                                        placeholder="Search product name"
                                        value="${search}"
                                        />
                                    <input class="btn-block btn-primary" type="submit" value="Search" />
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
            <!-- row -->
            <div class="row tm-content-row">
                <div class="col-12 tm-block-col">

                    <div class="tm-bg-primary-dark tm-block tm-block-products">

                        <div>
                            <table class="table table-hover tm-table-small tm-product-table">
                                <thead>
                                    <tr>
                                        <th scope="col">ID</th>
                                        <th scope="col">Product Name</th>
                                        <th scope="col">Image</th>
                                        <th scope="col">Price</th>
                                        <th scope="col">Quantity Saled</th>
                                        <th scope="col">Category</th>
                                        <th scope="col">Brand</th>
                                        <th scope="col">Created Date</th>
                                        <th scope="col">Status</th>
                                        <th scope="col">Quantity</th>
                                        <th scope="col">Sub Images</th>
                                        <th scope="col">Action</th>
                                    </tr>
                                </thead>
                                <tbody >
                                    <c:forEach items="${listP}" var="p">
                                        <tr>
                                            <td>${p.id}</td>
                                            <td>${p.name}</td>
                                            <td>
                                                <img style="width: 50%" src="${p.imageUrl}"/>
                                            </td>
                                            <td>${p.price} VND</td>
                                            <td>${p.quantity}</td>
                                            <td>${p.category.name}</td>
                                            <td>${p.brand.name}</td>
                                            <td>${p.createAt}</td>
                                            <c:if test="${p.status == 1}">
                                                <td>Active</td>
                                            </c:if>
                                            <c:if test="${p.status == 0}">
                                                <td>Blocked</td>
                                            </c:if>

                                            <td>
                                                
                                                <a href="loadSalesSize?id=${p.id}" class="tm-product-delete-link">
                                                    <i class="bi bi-file-ruled tm-product-delete-icon"></i>
                                                </a>
                                            </td>
                                            <td>
                                                <a href="loadProductImages?id=${p.id}" class="tm-product-delete-link">
                                                    <i class="bi bi-image tm-product-delete-icon"></i>
                                                </a>
                                             </td> 
                                             <td>
                                                <a href="loadProductSales?id=${p.id}" class="tm-product-delete-link">
                                                    <i class="bi bi-pencil-square tm-product-delete-icon"></i>
                                                </a>
                                                    
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>
                        <div class="col-12 col-md-4 text-center" style="display: contents">
                                <nav aria-label="Page navigation example">
                                    <ul class="pagination pagination-circle float-md-right mb-0">
                                        <c:if test="${tag != 1}">
                                            <li class="page-item"><a href="listProductSales?index=${tag-1 }&search=${search}&categoryId=${categoryId}&brandId=${brandId}" class="page-link"><i class="fas fa-chevron-left"></i></a></li>
                                                </c:if> 
                                                <c:forEach begin="1" end="${endPage }" var="i">
                                            <li class="${tag==i?"page-item active":"page-item" }"><a href="listProductSales?index=${i}&search=${search}&categoryId=${categoryId}&brandId=${brandId}" class="page-link">${i }</a></li>
                                            </c:forEach>
                                            <c:if test="${tag != endPage}">
                                            <li class="page-item"><a href="listProductSales?index=${tag+1 }&search=${search}&categoryId=${categoryId}&brandId=${brandId}" class="page-link"><i class="fas fa-chevron-right"></i></a></li>
                                                </c:if> 
                                    </ul>
                                </nav>
                            </div>

                        <div>
                            <a
                            href="loadAddSales"
                            class="btn btn-primary btn-block text-uppercase mb-3" style="margin-top: 50px">Add new product</a>
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
        <script src="js/bootstrap1.min.js"></script>
        <!-- https://getbootstrap.com/ -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

        <script type="text/javascript">
                                        function search() {
                                            var form = document.getElementById('search');
                                            form.submit();
                                        }
        </script>
        <script>
    function confirmDelete(id) {
        if (confirm('Bạn có chắc chắn muốn xóa không?')) {
        var xhr = new XMLHttpRequest();
        xhr.open("GET", "deleteProductSales?id=" + id, true);
        xhr.send();
        xhr.onreadystatechange = function() {
        if (this.readyState == 4 && this.status == 200) {
          // Hiển thị thông báo xác nhận
          alert('Sản phẩm đã được xóa thành công!');
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
