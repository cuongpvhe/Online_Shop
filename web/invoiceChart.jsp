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
                <div class="row tm-content-row">
                    <div class="col-sm-12 col-md-12 col-lg-6 col-xl-6 tm-block-col">
                        <div class=" tm-block tm-block-taller" style="background-color: #ededed">
                            <h2 >Doanh Thu Theo Tháng</h2>
                                <div id="pieChartContainer">
                                    <canvas id="horizontalBar" class="chartjs-render-monitor"></canvas>
                                </div> 
                        </div>
                    </div>
                    <div class="col-sm-12 col-md-12 col-lg-6 col-xl-6 tm-block-col">
                        <div class=" tm-block tm-block-taller" style="background-color: #ededed">
                            <h2 >Doanh Thu Theo Năm</h2>
                                <div id="pieChartContainer">
                                    <canvas id="horizontalBar2" class="chartjs-render-monitor"></canvas>
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
            new Chart(document.getElementById("horizontalBar"), {
                "type": "bar",
                "data": {
                    "labels": ["Tháng 1", "Tháng 2", "Tháng 3", "Tháng 4", "Tháng 5", "Tháng 6", "Tháng 7", "Tháng 8", "Tháng 9", "Tháng 10", "Tháng 11", "Tháng 12"],
                    "datasets": [{
                            "label": "Doanh thu $",
                            "data": [${totalMoneyMonth1}, ${totalMoneyMonth2}, ${totalMoneyMonth3}, ${totalMoneyMonth4}, ${totalMoneyMonth5}, ${totalMoneyMonth6}, ${totalMoneyMonth7}, ${totalMoneyMonth8}, ${totalMoneyMonth9}, ${totalMoneyMonth10}, ${totalMoneyMonth11}, ${totalMoneyMonth12}],
                            "fill": false,
                            "backgroundColor": ["rgba(255, 99, 132, 0.2)", "rgba(255, 159, 64, 0.2)",
                                "rgba(255, 205, 86, 0.2)", "rgba(75, 192, 192, 0.2)", "rgba(54, 162, 235, 0.2)",
                                "rgba(153, 102, 255, 0.2)", "rgba(201, 203, 207, 0.2)", "#99FF99", "#FFFF99", "#FFC1C1", "#FFB5C5", "#DDC488"
                            ],
                            "borderColor": ["rgb(255, 99, 132)", "rgb(255, 159, 64)", "rgb(255, 205, 86)",
                                "rgb(75, 192, 192)", "rgb(54, 162, 235)", "rgb(153, 102, 255)", "rgb(201, 203, 207)", "	#66FF99", "#FFFF66", "#EEB4B4", "#EEA9B8", "#ECAB53"
                            ],
                            "borderWidth": 1
                        }]
                },
                "options": {
                    "scales": {
                        "xAxes": [{
                                "ticks": {
                                    "beginAtZero": true
                                }
                            }]
                    }
                }
            });
            new Chart(document.getElementById("horizontalBar2"), {
                "type": "bar",
                "data": {
                    "labels": ["Năm 2021", "Năm 2022", "Năm 2023"],
                    "datasets": [{
                            "label": "Doanh thu $",
                            "data": [${totalMoneyYear2021}, ${totalMoneyYear2022}, ${totalMoneyYear2023}],
                            "fill": false,
                            "backgroundColor": ["rgba(255, 99, 132, 0.2)", "rgba(255, 159, 64, 0.2)",
                                "rgba(255, 205, 86, 0.2)"
                            ],
                            "borderColor": ["rgb(255, 99, 132)", "rgb(255, 159, 64)", "rgb(255, 205, 86)"
                            ],
                            "borderWidth": 1
                        }]
                },
                "options": {
                    "scales": {
                        "xAxes": [{
                                "ticks": {
                                    "beginAtZero": true
                                }
                            }]
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
