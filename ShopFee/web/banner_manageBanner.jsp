<%-- 
    Document   : banner_bannerManage
    Created on : oct 23, 2023
    Author     : HuyLD
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <title>Manage Banner</title>
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

                        <!-- Manage Banner Begin -->
                        <div class="col-lg-9">
                            <div class="container">
                                <div class="row">
                                    <div class="col-lg-12">
                                        <div>  
                                            <b style="font-size: 30px">Marketing</b><br>
                                            <b style="font-size: 25px">Manage Banner</b><br>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="container" style="margin-top: 20px">
                                <a class="site-btn" href="add-banner">Add Banner</a>
                                <div class="row">
                                    <div class="col-lg-12">
                                        <div style="margin-top: 20px">
                                            <table class="table table-striped table-hover" id="example">
                                                <thead>
                                                    <tr>
                                                        <th style="text-align: center">Banner ID</th>
                                                        <th style="text-align: center">Banner Name</th>
                                                        <th style="text-align: center">Banner Link</th>
                                                        <th style="text-align: center">Banner Image</th>
                                                        <th>Update</th>
                                                        <th>Delete</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                <c:forEach items="${banner_List}" var="b" >
                                                    <tr>
                                                        <td style="text-align: center">${b.getBanner_Id()}</td>
                                                        <td style="text-align: center">${b.getBanner_Name()}</td>
                                                        <td style="text-align: center"><a style="color: #96C2DB" href="${b.getBanner_Link()}">Go to banner</a></td>
                                                        <td style="text-align: center"><img style="height: 50px; width: 84px" src="img/banner/${b.getBanner_Image()}" alt=""></td>
                                                        <td style="text-align: center"><a class="site-btn" style="padding: 5px 10px" href="update-banner?id=${b.getBanner_Id()}">Update</a></td>
                                                        <td style="text-align: center"><a class="danger-btn" style="padding: 5px 10px" href="manage-banner?id=${b.getBanner_Id()}&action=delete" onclick="confirmDelete(event)">Delete</a></td>
                                                    </tr>
                                                </c:forEach>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- Manage Banner End -->
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

                                                            //confirm delete banner
                                                            function confirmDelete(event) {
                                                                event.preventDefault(); // Prevent the default behavior of the link
                                                                const result = confirm("Are you sure you want to delete this item?");
                                                                if (result) {
                                                                    // If the user clicks "OK" in the confirmation dialog, proceed with the delete action
                                                                    location.href = event.target.getAttribute("href");
                                                                }
                                                            }
        </script>
    </body>

</html>
