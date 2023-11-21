<%-- 
    Document   : order_viewOrder
    Created on : Oct 20, 2023
    Author     : PhongLDM
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <title>Order List</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <!-- Google Font -->
        <link href="https://fonts.googleapis.com/css2?family=Cairo:wght@200;300;400;600;900&display=swap" rel="stylesheet">

        <!-- Css Styles -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" 
              integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <link rel="stylesheet" href="css/font-awesome.min.css" type="text/css">
        <link rel="stylesheet" href="css/elegant-icons.css" type="text/css">
        <link rel="stylesheet" href="css/nice-select.css" type="text/css">
        <link rel="stylesheet" href="css/jquery-ui.min.css" type="text/css">
        <link rel="stylesheet" href="css/owl.carousel.min.css" type="text/css">
        <link rel="stylesheet" href="css/slicknav.min.css" type="text/css">
        <link rel="stylesheet" href="css/style.css" type="text/css">

        <link rel="stylesheet" href="https://cdn.datatables.net/1.13.7/css/dataTables.bootstrap5.min.css"/>
        <style>
            /* Style the tab */
            .tab {
                overflow: hidden;
                border: 1px solid #ccc;
                background-color: #f1f1f1;
                margin-top: 15px;
            }

            /* Style the buttons inside the tab */
            .tab button {
                background-color: inherit;
                float: left;
                border: none;
                outline: none;
                cursor: pointer;
                padding: 6px 20px;
                transition: 0.3s;
                font-size: 17px;
            }

            /* Change background color of buttons on hover */
            .tab button:hover {
                background-color: #ddd;
            }

            /* Create an active/current tablink class */
            .tab button.active {
                background-color: #ccc;
            }

            /* Style the tab content */
            .tabcontent {
                display: none;
                padding: 6px 12px;
                border: 1px solid #ccc;
                border-top: none;
            }
        </style>
    </head>

    <body>
        <!-- Header Section Begin -->
        <jsp:include page="header.jsp"></jsp:include>
            <!-- Header Section End -->

            <!-- Hero Section Begin -->
            <section class="hero">
                <div class="container">
                    <div class="row">
                        <!-- User Dashboard Begin -->
                    <jsp:include page="user_dashbroad.jsp"></jsp:include>
                        <!-- User Dashboard End -->

                        <!-- Manage User List Begin -->
                        <div class="col-lg-9">
                            <div class="container">
                                <div class="row">
                                    <div class="col-lg-12">
                                        <div>  
                                            <b style="font-size: 30px">Sale</b><br>
                                            <b style="font-size: 25px">Manage Order</b>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="container tab">
                                <button class="tablinks active" onclick="openTab(event, 'order-list')">List</button>
                            <c:if test="${user_Data.getRole() == 1 || user_Data.getRole() == 3}">
                                <button class="tablinks" onclick="openTab(event, 'order-chart')">Chart</button>
                            </c:if>
                        </div>
                        <div id="order-list" class="tabcontent" style="display: block">
                            <div class="container">
                                <table class="table table-striped table-hover" id="example">
                                    <thead>
                                        <tr>
                                            <th>Name</th>
                                            <th>Phone Number</th>
                                            <th>Date</th>
                                            <th>Status</th>
                                            <th>Action</th>
                                        </tr>
                                    </thead>
                                    <tbody>                                   
                                        <c:forEach items="${orders}" var="o">
                                            <tr>
                                                <td>${o.getName()}</td>
                                                <td>${o.getPhoneNumber()}</td>
                                                <td>${o.getOrder_Date()}</td>
                                                <td>${o.getStatus()}</td>
                                                <td>
                                                    <a href="order-detail?orderId=${o.getOrder_ID()}" class="site-btn" style="padding: 5px 10px">View</a>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        <c:if test="${user_Data.getRole() == 1 || user_Data.getRole() == 3}">
                            <div id="order-chart" class="tabcontent">
                                <div>  
                                    <b style="font-size: 30px">Total Order: </b>
                                    <b style="font-size: 30px">${total}</b>
                                    <br>
                                    <fmt:formatNumber value="${amount}" pattern="#,##0.##" var="format_Amount" />
                                    <b style="font-size: 25px">Total Amount: </b>
                                    <b style="font-size: 25px">${format_Amount} VND</b>
                                </div>
                                <hr>
                                <canvas id="myChart" style="width:100%;max-width:600px"></canvas>
                            </div>
                        </c:if>
                    </div>
                    <!-- Manage User List Begin -->
                </div>
            </div>
        </section>
        <!-- Hero Section End -->

        <!-- Footer Section Begin -->
        <jsp:include page="footer.jsp"></jsp:include>
            <!-- Footer Section End -->

            <!-- Js Plugins -->
            <script src="https://code.jquery.com/jquery-3.7.0.js"></script>
            <script src="https://cdn.datatables.net/1.13.7/js/jquery.dataTables.min.js"></script>
            <script src="https://cdn.datatables.net/1.13.7/js/dataTables.bootstrap5.min.js"></script>
            <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.5.0/Chart.min.js"></script>

            <script>
                                    new DataTable('#example');

                                    function openTab(evt, tabName) {
                                        var i, tabcontent, tablinks;
                                        tabcontent = document.getElementsByClassName("tabcontent");
                                        for (i = 0; i < tabcontent.length; i++) {
                                            tabcontent[i].style.display = "none";
                                        }
                                        tablinks = document.getElementsByClassName("tablinks");
                                        for (i = 0; i < tablinks.length; i++) {
                                            tablinks[i].className = tablinks[i].className.replace(" active", "");
                                        }
                                        document.getElementById(tabName).style.display = "block";
                                        evt.currentTarget.className += " active";
                                    }

            <c:if test="${user_Data.getRole() == 1 || user_Data.getRole() == 3}">
                                    // Make barColors, xValues, and yValues dynamic
                                    var barColors = getRandomColors(${order_TotalAmount.size()});
                                    var xValues = ${order_Month};
                                    var yValues = ${order_TotalAmount};

                                    function getRandomColors(num) {
                                        var colors = [];
                                        for (var i = 0; i < num; i++) {
                                            var randomColor = '#' + Math.floor(Math.random() * 16777215).toString(16);
                                            colors.push(randomColor);
                                        }
                                        return colors;
                                    }

                                    new Chart("myChart", {
                                        type: "bar",
                                        data: {
                                            labels: xValues,
                                            datasets: [{
                                                    backgroundColor: barColors,
                                                    data: yValues
                                                }]
                                        },
                                        options: {
                                            legend: {display: false},
                                            title: {
                                                display: true,
                                                text: "Order 2023"
                                            }
                                        }
                                    });
            </c:if>
        </script>
    </body>

</html>
