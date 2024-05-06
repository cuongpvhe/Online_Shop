<%-- 
    Document   : dashboard
    Created on : Sep 18, 2023, 4:26:58 PM
    Author     : MSI GF
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title>Chart</title>
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:400,700">
        <!-- https://fonts.google.com/specimen/Roboto -->
        <link rel="stylesheet" href="css/fontawesome.min.css">
        <!-- https://fontawesome.com/ -->
        <link rel="stylesheet" href="css/bootstrap1.min.css">
        <!-- https://getbootstrap.com/ -->
        <link rel="stylesheet" href="css/templatemo-style.css">
       
            
    </head>

    <body id="reportsPage">
        <div class="" id="home">
            <%@include file="menu-dashboard.jsp" %>

            <div class="container">
                <div class="row">
                    <div class="col">
                        <p class="text mt-5 mb-5">Welcome back, <b>Admin</b></p>
                    </div>
                </div>
                <!-- row -->
                <div class="row tm-content-row" style="justify-content: center">
                    <div class=" tm-block" style="background-color: #efe9e" >
                            <h2 class="tm-block-title">Đơn Hàng</h2>
                            <form id="search" action="orderAnalys">
                                <div class="form-group">
                                <label for="start-date">From:</label>
                                <input type="date" id="start-date" name="date1">
                                <label for="end-date">To:</label>
                                <input type="date" id="end-date" name="date2">
                                <button id="filter-button">Submit</button>
                            </div>
                            <div id="pieChartContainer">
                                <canvas id="pieChart" class="chartjs-render-monitor"></canvas>
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
        </div>

        <script src="js/jquery-3.3.1.min.js"></script>
        <!-- https://jquery.com/download/ -->
        <script src="js/moment.min.js"></script>
        <!-- https://momentjs.com/ -->
        <script src="js/Chart.min.js"></script>
        <!-- http://www.chartjs.org/docs/latest/ -->
        <script src="js/bootstrap.min.js"></script>
        <!-- https://getbootstrap.com/ -->
        <script src="js/tooplate-scripts.js"></script>
        <script
            src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.js">
        </script>
        <script>
            var xValues = ["Đặt hàng thành công", "Chờ thanh toán", "Đang chuẩn bị hàng", "Đang giao hàng", "Giao hàng thành công", "Hủy đơn hàng"];
            var yValues = [${datHangThanhCong}, ${choThanhToan}, ${dangChuanBiDonHang}, ${dangGiaoHang}, ${giaoThanhCong}, ${huyDonHang}];
            var barColors = [
                "#b91d47",
                "#00aba9",
                "#2b5797",
                "#e8c3b9",
                "#1e7145",
                "#orange"
            ];

            new Chart("pieChart", {
                type: "pie",
                data: {
                    labels: xValues,
                    datasets: [{
                            backgroundColor: barColors,
                            data: yValues
                        }]
                },
                options: {
                    title: {
                        display: true,
                        text: "Đơn Hàng"
                    }
                }
            });


            function search() {
                var form = document.getElementById('search');
                form.submit();
            }
            $(document).ready(function () {
                // Xử lý sự kiện khi nút Lọc được nhấn
                $("#filter-button").click(function () {
                    var startDate = $("#start-date").val();
                    var endDate = $("#end-date").val();
                    
                });
            });

        </script>
    </body>

</html>
