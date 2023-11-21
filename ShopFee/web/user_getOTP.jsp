<%-- 
    Document   : user_getOTP
    Created on : Sep 22, 2023
    Author     : HuyLD
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <title>Get OTP</title>
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
        <!-- Logo -->
        <div style="text-align: center; margin-top: 120px">
            <a style="display: inline-block; width: 22%;" href="home">
                <img src="img/logo-1.png" alt="Untitled" style="max-width: 100%; height: auto;">
            </a>
        </div>
        <!-- Logo -->

        <c:choose>
            <c:when test="${email != null}">
                <!-- Get OTP for Change Email -->
                <form action="get-otp?changeemail=1" method="post" style="width: 20%;margin: 30px auto;">            
                    <!-- Email input -->         
                    <div class="mb-4">
                        <input style="border-radius: 0%" name="email" type="text" value="${email}" class="form-control" required/>                
                    </div>

                    <!-- Submit button -->
                    <div class="text-center" style="padding-bottom: 20px">
                        <button class="site-btn" type="submit">Get Your OTP</button>
                    </div>

                    <!-- Link to Login Screen -->
                    <div class="text-center">
                        <a style="color: #96C2DB" href="home">Go back home</a>
                    </div>
                </form>
                
                <!-- Link to Login Screen -->
                <div style="text-align: center;">
                    <a href="profile" class="site-btn" type="submit" name="button" value="back">back</a>
                </div> 
            </c:when>
            <c:otherwise>
                <!-- Get OTP for Register -->
                <form action="get-otp" method="post" style="width: 20%;margin: 30px auto;">
                    <!-- Message -->
                    <c:if test="${message != null}">
                        <div class="alert alert-danger" role="alert">
                            ${message}
                        </div>
                    </c:if>
                    <!-- Email input -->
                    <div class="mb-4">
                        <label>Enter Your Email</label>
                        <input style="border-radius: 0%" name="email" type="text" class="form-control" required/>
                    </div>

                    <!-- Submit button -->
                    <div style="text-align: center;">
                        <button class="site-btn" type="submit" name="button" value="getotp">Get Your OTP</button>
                    </div>

                    <!-- Link to Login Screen -->
                    <div class="mt-2" style="text-align: center;">
                        <a style="color: #96C2DB" href="login">Go back to Login</a>
                    </div>
                </form>
            </c:otherwise>
        </c:choose>        
    </body>

</html>