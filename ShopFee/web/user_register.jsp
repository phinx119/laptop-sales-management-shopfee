<%--
    Document   : user_register
    Created on : Sep 18, 2023
    Author     : PhongLDM
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Register</title>
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

    <body style="height: 0">

        <!-- Logo Begin -->
        <div style="text-align: center; margin-top: 120px">
            <a style="display: inline-block; width: 22%;" href="home">
                <img src="img/logo-1.png" alt="Untitled" style="max-width: 100%; height: auto;">
            </a>
        </div>
        <!-- Logo End -->

        <form action="register" method="post" style="width: 20%;margin: 0px auto;">
            
            <!-- Message Begin -->
            <c:if test="${message != null}">
                <div class="alert alert-success" role="alert">
                    ${message}
                </div>
            </c:if>

            <c:if test="${message5 != null}">
                <div class="alert alert-danger" role="alert">
                    ${message5}
                </div>
            </c:if>
            <!-- Message End -->

            <!-- Username input -->
            <div class="form-outline mb-4">
                <label class="form-label" for="form2Example1">Username</label>
                <input style="border-radius: 0%" name="username" type="text" class="form-control" required/>
                <c:if test="${message1 != null}">
                    <div class="alert alert-danger" role="alert">
                        ${message1}
                    </div>
                </c:if>
            </div>

            <!-- Password input -->
            <div class="form-outline mb-4">
                <label class="form-label" for="form2Example2">Password</label>
                <input style="border-radius: 0%" name="password" type="password" class="form-control" required/>
            </div>

            <!--Confirm Password input -->
            <div class="form-outline mb-4">
                <label class="form-label" for="form2Example2">Confirm Password</label>
                <input style="border-radius: 0%" name="confirm-password" type="password" class="form-control" required/>
                <c:if test="${message2 != null}">
                    <div class="alert alert-danger" role="alert">
                        ${message2}
                    </div>
                </c:if>
            </div>

            <!-- Name input -->
            <div class="form-outline mb-4">
                <label class="form-label" for="form2Example2">Name</label>
                <input style="border-radius: 0%" name="name" type="text" class="form-control" required/>                
            </div>  

            <!-- Email input -->
            <div class="form-outline mb-4">
                <label class="form-label" for="form2Example2">Email</label>
                <input style="border-radius: 0%" name="email" type="email" class="form-control" value="${email}" placeholder="abc123@gmail.com" required/>
                <c:if test="${message3 != null}">
                    <div class="alert alert-danger" role="alert">
                        ${message3}
                    </div>
                </c:if>                
            </div>          

            <!-- Submit button -->
            <div style="text-align: center;">
                <button class="site-btn" type="submit" value="register" name="btAction">Register</button>
                <!-- Register buttons -->
                <div class="text-center">
                    Already have account? <a style="color: #96C2DB" href="login">Login</a>
                </div>
            </div>            
        </form>
    </body>
</html>


