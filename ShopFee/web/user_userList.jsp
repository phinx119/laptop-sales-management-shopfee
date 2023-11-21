<%-- 
    Document   : user_userList
    Created on : Sep 26, 2023
    Author     : PhongLDM
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <title>Manage User</title>
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
                                            <b style="font-size: 30px">Admin</b><br>
                                            <b style="font-size: 25px">Manage profile of all user</b><br>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="container tab">
                                <button class="tablinks active" onclick="openTab(event, 'user-list')">List</button>
<!--                                <button class="tablinks" onclick="openTab(event, 'user-chart')">Chart</button>-->
                            </div>
                            <div id="user-list" class="tabcontent" style="display: block">
                            <c:if test="${not empty message}">
                                <div class="alert  alert-${type}">
                                    ${message}
                                </div>
                            </c:if>
                            <div class="container">
                                <!-- Search Bar -->
                                <form method="post" action="user-list">
                                    <a href="add-update-user" class="site-btn" style="margin-bottom: 20px">Add new</a>

                                    <!--                                    <select class="form-control w-25 mt-3 mb-3" id="role" name="role" onchange="this.form.submit()">
                                                                            <option value="0">All Role</option>
                                    <c:forEach items="${role_List}" var="r">
                                        <option value="${r.getRoleId()}" ${selectedId==r.roleId?"selected":""}>${r.getRoleName()}</option>
                                    </c:forEach>
                                </select>-->

                                    <table class="table table-striped table-hover" id="example">
                                        <thead>
                                            <tr>
                                                <th>ID</th>
                                                <th>Username</th>
                                                <th>Name</th>
                                                <th>Role</th>
                                                <th>Status</th>
                                                <th>Edit</th>
                                                <th>Actions</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach items="${user_List}" var="o">
                                                <tr>
                                                    <td>${o.user_Id}</td>
                                                    <td>${o.username}</td>
                                                    <td>${o.name}</td>
                                                    <td>
                                                        <c:choose>
                                                            <c:when test="${o.role eq 1}">Admin</c:when>
                                                            <c:when test="${o.role eq 2}">Marketing</c:when>
                                                            <c:when test="${o.role eq 3}">Sale</c:when>
                                                            <c:when test="${o.role eq 4}">Customer</c:when>
                                                            <c:otherwise>Unknown</c:otherwise>
                                                        </c:choose>
                                                    </td>
                                                    <td>
                                                        <c:if test="${o.status eq 1}">
                                                            <span style="color: green">Active</span>
                                                        </c:if>
                                                        <c:if test="${o.status ne 1}">
                                                            <span style="color: red">Block</span>
                                                        </c:if>
                                                    </td>                                            
                                                    <td>
                                                        <a href="update-user?userId=${o.user_Id}" class="site-btn" style="padding: 5px 10px">Edit</a>
                                                    </td>
                                                    <td>
                                                        <c:choose>
                                                            <c:when test="${o.status eq 1}">
                                                                <a class="danger-btn" style="padding: 5px 10px" href="block-user?userId=${o.user_Id}">Block</a>
                                                            </c:when>
                                                            <c:when test="${o.status eq 0}">
                                                                <a class="site-btn" style="padding: 5px 10px" href="block-user?userId=${o.user_Id}">Unblock</a>
                                                            </c:when>
                                                        </c:choose>
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </form>
                            </div>
                        </div>
<!--                        <div id="user-chart" class="tabcontent">

                        </div>-->
                    </div>
                    <!-- Manage User List Begin -->
                </div>
            </div>
        </section>
        <!-- Hero Section End -->

        <!-- Footer Section Begin -->
        <jsp:include page="footer.jsp"></jsp:include>
        <!-- Footer Section End -->

        <script src="https://code.jquery.com/jquery-3.7.0.js"></script>
        <script src="https://cdn.datatables.net/1.13.7/js/jquery.dataTables.min.js"></script>
        <script src="https://cdn.datatables.net/1.13.7/js/dataTables.bootstrap5.min.js"></script>
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
        </script>
    </body>

</html>
