<%-- 
    Document   : user_login
    Created on : Sep 12, 2023
    Author     : HieuNT
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <title>Login</title>
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

        <form action="login" method="post" style="width: 20%;margin: 30px auto;">
            <!-- Mesage Begin -->
            <c:if test="${message != null}">
                <div class="alert alert-success" role="alert">
                    ${message}
                </div>
            </c:if>
            <!-- Message End -->

            <!-- Username input -->         
            <div class="mb-4">
                <label>Username</label>
                <input style="border-radius: 0%" name="username" type="text" class="form-control" required/>                
            </div>

            <!-- Password input -->
            <div class="mb-4">
                <label>Password</label>
                <input style="border-radius: 0%" name="password" type="password" class="form-control" required/>                
            </div>

            <div class="row mb-4">
<!--                <div class="col d-flex justify-content-center">
                     Remember User Account 
                    <div class="form-check">
                        <input class="form-check-input" type="checkbox" value="" id="form2Example31" checked />
                        <label class="form-check-label" for="form2Example31"> Remember me </label>
                    </div>
                </div>-->

                <div class="col d-flex justify-content-center">
                    <!-- Reset Password -->
                    <a style="color: #96C2DB" href="get-otp">Forgot password?</a>
                </div>
            </div>

            <!-- Submit button -->
            <div style="text-align: center;">
                <button class="site-btn" type="submit" value="Login">Sign in</button>
            </div>            
        </form>

        <!-- Register buttons -->
        <div class="text-center">
            <p>Not a member? <a style="color: #96C2DB" href="get-otp?register=1">Register</a></p>
        </div>
    </body>

</html>

