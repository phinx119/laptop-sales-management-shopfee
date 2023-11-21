<%-- 
    Document   : change-password
    Created on : Sep 21, 2023
    Author     : PhiNX
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <title>Change Password</title>
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
    </head>

    <body>
        <!-- Header Section Begin -->
        <jsp:include page="header.jsp"></jsp:include>
            <!-- Header Section End -->

            <!-- User Dashbroad Begin -->
            <section class="hero">
                <div class="container">
                    <div class="row">
                        <!-- User Dashboard Begin -->
                    <jsp:include page="user_dashbroad.jsp"></jsp:include>
                        <!-- User Dashboard End -->

                        <!-- Manage User Profile Begin -->
                        <div class="col-lg-9">
                            <div class="container">
                                <div class="row">
                                    <div class="col-lg-12">
                                        <div>  
                                            <b style="font-size: 30px">My profile</b><br>
                                            <b style="font-size: 25px">Change Password</b>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="container" style="margin-top: 20px">
                                <div class="row">
                                    <div class="col-lg-9">            
                                        <div>
                                            <form action="change-password" method="post" id="change-password">

                                                <!-- Message -->
                                            <c:if test="${message1 != null}">
                                                <div style="width: 500px" class="alert alert-success" role="alert">
                                                    ${message1}
                                                </div>
                                            </c:if>

                                            <c:if test="${message2 != null}">
                                                <div style="width: 500px" class="alert alert-danger" role="alert">
                                                    ${message2}
                                                </div>
                                            </c:if>
                                            <!-- Message -->

                                            <!-- Old Password input -->         
                                            <div class="mb-4">
                                                <label>Old Password</label>
                                                <input style="border-radius: 0%; width: 500px" name="oldpassword" type="password" class="form-control" required/>
                                                <c:if test="${message3 != null}">
                                                    <div style="width: 500px" class="alert alert-danger" role="alert">
                                                        ${message3}
                                                    </div>
                                                </c:if>
                                            </div>

                                            <!-- New Password input -->         
                                            <div class="mb-4">
                                                <label>New Password</label>
                                                <input style="border-radius: 0%; width: 500px" name="newpassword" type="password" class="form-control" required/>                
                                            </div>

                                            <!-- Confirm New Password input -->         
                                            <div class="mb-4">
                                                <label>Confirm New Password</label>
                                                <input style="border-radius: 0%; width: 500px" name="confirmnewpassword" type="password" class="form-control" required/>   
                                                <c:if test="${message4 != null}">
                                                    <div style="width: 500px" class="alert alert-danger" role="alert">
                                                        ${message4}
                                                    </div>
                                                </c:if>
                                            </div>

                                            <!-- UserID use to get User Detail by ID -->
                                            <input name="userid" type="text" value="${user_Data.getUser_Id()}" hidden/>

                                            <!-- Submit button -->
                                            <div>
                                                <button class="site-btn" type="submit" value="savechange">Save Change</button>
                                            </div>            
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- Manage User Profile End -->

                </div>
            </div>
        </section>
        <!-- Hero Section End -->

        <!-- Footer Section Begin -->
        <jsp:include page="footer.jsp"></jsp:include>
        <!-- Footer Section End -->

        <!-- Js Plugins -->
        <script src="js/jquery-3.3.1.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/jquery.nice-select.min.js"></script>
        <script src="js/jquery-ui.min.js"></script>
        <script src="js/jquery.slicknav.js"></script>
        <script src="js/mixitup.min.js"></script>
        <script src="js/owl.carousel.min.js"></script>
        <script src="js/main.js"></script>      
    </body>

</html>

