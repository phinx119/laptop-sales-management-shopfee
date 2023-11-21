<%-- 
    Document   : user_updateUser
    Created on : Oct 28, 2023
    Author     : PhongLDM
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <title>Update User</title>
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
                                            <b style="font-size: 30px">Add new user</b><br>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="container" style="margin-top: 20px">   
                                <div class="row">
                                    <div class="col-lg-4">
                                        <form action="update-user" method="post">
                                            <label hidden for="userId">user ID:</label>
                                            <input hidden readonly value="${user_Detail.user_Id}" type="text" class="form-control" id="userId" name="userId">
                                        <label for="username">Username:</label>
                                        <input readonly value="${user_Detail.username}" type="text" class="form-control" id="username" name="username">
                                        <label for="email">Email</label>
                                        <input readonly value="${user_Detail.email}" type="email" class="form-control" id="email" name="email">
                                        <label for="name">Name:</label>
                                        <input readonly value="${user_Detail.name}" type="text" class="form-control" id="name" name="name">
                                        <label for="phonenumber">Phone Number:</label>
                                        <input readonly value="${user_Detail.phone_Number}" type="text" class="form-control" id="phonenumber" name="phonenumber">
                                        <label for="role">Role:</label>
                                        <c:choose>
                                            <c:when test="${user_Detail.getRole() eq 1}">
                                                <input readonly value="Admin" type="text" class="form-control" name="role">
                                            </c:when>
                                            <c:otherwise>
                                                <select class="form-control" id="role" name="role">
                                                    <c:forEach items="${role_List}" var="r">
                                                        <option value="${r.getRoleId()}" <c:if test="${r.getRoleId() == user_Detail.getRole()}">selected</c:if> >${r.getRoleName()}</option>
                                                    </c:forEach>
                                                </select><br>
                                                <button class="site-btn" type="submit">Edit</button>
                                            </c:otherwise>
                                        </c:choose>
                                    </form>
                                </div>
                            </div>
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

    </body>

</html>
