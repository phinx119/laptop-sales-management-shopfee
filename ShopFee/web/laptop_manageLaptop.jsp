<%-- 
    Document   : laptop_manageLaptop
    Created on : Sep 29, 2023
    Author     : HIeuNT
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <title>Manage Laptop</title>
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
                                            <b style="font-size: 30px">Manage Laptop</b><br>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="container tab">
                                <button class="tablinks active" onclick="openTab(event, 'laptop-list')">Laptop List</button>
                            <c:if test="${user_Data.getRole() == 1}">
                                <button class="tablinks" onclick="openTab(event, 'unapproved-list')">Unapproved List</button>
                                <button class="tablinks" onclick="openTab(event, 'deleted-list')">Deleted List</button>
                            </c:if>
                            <button class="tablinks" onclick="openTab(event, 'discount-list')">Discount Manage</button>
                            <button class="tablinks" onclick="openTab(event, 'laptop-chart')">Chart</button>
                        </div>
                        <div id="laptop-list" class="tabcontent" style="display: block;">
                            <div class="container">
                                <a class="site-btn" href="add-laptop">Add laptop</a>
                                <div class="container" style="margin-top: 20px">
                                    <table class="table table-striped table-hover" id="datatable-1">
                                        <thead>
                                            <tr>
                                                <th>ID</th>
                                                <th>Model</th>
                                                <th>Price</th>
                                                <th>Quantity</th>
                                                <th></th>
                                                <th></th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach items="${laptop_List}" var="l">
                                                <tr>
                                                    <td>${l.getId()}</td> 
                                                    <td>${l.getModel()}</td>  
                                                    <td>
                                                        <fmt:formatNumber value="${l.getPrice()}" pattern="#,##0.##" var="origin_Price" />
                                                        <c:choose>
                                                            <c:when test="${l.getDiscount() != 0}">
                                                                <fmt:formatNumber value="${l.getPrice() - l.getPrice()*l.getDiscount()}" pattern="#,##0.##" var="discount_Price" />                                    
                                                                ${discount_Price} VND
                                                            </c:when>
                                                            <c:otherwise>
                                                                ${origin_Price} VND
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </td> 
                                                    <td>${l.getQuantity()}</td> 
                                                    <td><a class="site-btn" style="padding: 7px 12px" href="update-laptop?id=${l.getId()}">Edit</a></td>
                                                    <td><button class="danger-btn" style="padding: 7px 12px" onclick="showMess(${l.getId()})">Delete</button></td>
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                        <c:if test="${user_Data.getRole() == 1}">
                            <div id="unapproved-list" class="tabcontent" style="display: block;">
                                <div class="container">
                                    <table class="table table-striped table-hover" id="datatable-2">
                                        <thead>
                                            <tr>
                                                <th>ID</th>
                                                <th>Model</th>
                                                <th>Brand</th>
                                                <th>Price</th>
                                                <th>Quantity</th>
                                                <th>Action</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach items="${unapproved_List}" var="u">
                                                <tr>
                                                    <td>${u.getId()}</td>
                                                    <td>${u.getModel()}</td>
                                                    <td>${u.getBrand()}</td>
                                                    <td>
                                                        <fmt:formatNumber value="${u.getPrice()}" pattern="#,##0.##" var="origin_Price" />
                                                        <c:choose>
                                                            <c:when test="${u.getDiscount() != 0}">
                                                                <fmt:formatNumber value="${u.getPrice() - u.getPrice()*u.getDiscount()}" pattern="#,##0.##" var="discount_Price" />                                    
                                                                ${discount_Price} VND
                                                            </c:when>
                                                            <c:otherwise>
                                                                ${origin_Price} VND
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </td>
                                                    <td>${u.getQuantity()}</td>
                                                    <td>
                                                        <form action="unapproved-list" method="get">
                                                            <input type="hidden" name="id" value="${u.getId()}">
                                                            <input type="submit" class="site-btn" style="padding: 7px 12px" value="Detail">
                                                        </form>
                                                    </td>
                                                </tr>                                
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            </div>

                            <div id="deleted-list" class="tabcontent" style="display: block;">
                                <div class="container">
                                    <table class="table table-striped table-hover" id="datatable-3">
                                        <thead>
                                            <tr>
                                                <th>ID</th>
                                                <th>Model</th>
                                                <th>Price</th>
                                                <th>Quantity</th>
                                                <th></th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach items="${deleted_List}" var="d">
                                                <tr>
                                                    <td>${d.getId()}</td>
                                                    <td>${d.getModel()}</td>
                                                    <td>
                                                        <fmt:formatNumber value="${d.getPrice()}" pattern="#,##0.##" var="origin_Price" />
                                                        <c:choose>
                                                            <c:when test="${d.getDiscount() != 0}">
                                                                <fmt:formatNumber value="${d.getPrice() - d.getPrice()*d.getDiscount()}" pattern="#,##0.##" var="discount_Price" />                                    
                                                                ${discount_Price} VND
                                                            </c:when>
                                                            <c:otherwise>
                                                                ${origin_Price} VND
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </td>
                                                    <td>${d.getQuantity()}</td>
                                                    <td><a class="site-btn" style="padding: 7px 12px" href="deleted-list?id=${d.getId()}">Restore</a></td>
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </c:if>
                        <div id="discount-list" class="tabcontent">
                            <div class="container">
                                <table class="table table-striped table-hover" id="datatable-3">
                                    <thead>
                                        <tr>
                                            <th>Category</th>
                                            <th>Discount</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach items="${dl}" var="d">
                                        <form action="manage-discount" method="POST"> 
                                            <tr>
                                                <td><input type="text" name="cateID" value="${d.getCateID()}" hidden>${d.getCateName()}</td>
                                                <td><input type="number" id="discount" name="discount" value="${d.getDiscount()}" min="0" max="1.0" step="0.1" inputmode="numeric" onchange="updateDiscount()"></td>
                                                <td>
                                                    <input type="submit" value="Confirm">
                                                </td>
                                            </tr>
                                        </form>
                                    </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>

                        <div id="laptop-chart" class="tabcontent">
                            <canvas id="myChart" style="width:100%;max-width:400px"></canvas>
                        </div>
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
        </body>
        <script src="https://code.jquery.com/jquery-3.7.0.js"></script>
        <script src="https://cdn.datatables.net/1.13.7/js/jquery.dataTables.min.js"></script>
        <script src="https://cdn.datatables.net/1.13.7/js/dataTables.bootstrap5.min.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.5.0/Chart.min.js"></script>

        <script>
                                                    document.addEventListener('DOMContentLoaded', function () {
                                                        document.querySelector('.tablinks').click();
                                                    });

                                                    new DataTable('#datatable-1');
        <c:if test="${user_Data.getRole() == 1}">
                                                    new DataTable('#datatable-2');
                                                    new DataTable('#datatable-3');
        </c:if>

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

                                                    function showMess(id) {
                                                        var option = confirm('Are you sure to delete this Laptop.');
                                                        if (option === true) {
                                                            window.location.href = 'delete-laptop?id=' + id;
                                                        }
                                                    }
                                                    function updateDiscount() {
                                                        var discount = $("#discount").val();
                                                        var cateID = $("#cateID").val();

                                                        $.ajax({
                                                            url: "/ShopFee/manange-discount",
                                                            type: "get", //send it through get method
                                                            data: {
                                                                discount: discount,
                                                                cateID: cateID
                                                            },
                                                            success: function (list) {
                                                                var row = document.getElementById("content");
                                                                row.innerHTML = list;
                                                            },
                                                            error: function (xhr) {
                                                                //Do Something to handle error
                                                            }
                                                        });
                                                    }

                                                    var xValues = ["Graphics, Architecture", "General, Office", "Business", "Gaming"];
                                                    ;
                                                    var yValues = ${category_Count};
                                                    var pieColors = getRandomColors(${category_Count.size()});

                                                    function getRandomColors(num) {
                                                        var colors = [];
                                                        for (var i = 0; i < num; i++) {
                                                            var randomColor = '#' + Math.floor(Math.random() * 16777215).toString(16);
                                                            colors.push(randomColor);
                                                        }
                                                        return colors;
                                                    }

                                                    new Chart("myChart", {
                                                        type: "pie",
                                                        data: {
                                                            labels: xValues,
                                                            datasets: [{
                                                                    backgroundColor: pieColors,
                                                                    data: yValues
                                                                }]
                                                        },
                                                        options: {
                                                            title: {
                                                                display: true,
                                                                text: "Laptop Category (%)"
                                                            }
                                                        }
                                                    });
    </script>
</html>
