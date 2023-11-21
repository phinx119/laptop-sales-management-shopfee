<%-- 
    Document   : user_validateOTP
    Created on : 22-Sep-2023
    Author     : HuyLD
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <title>Validate OTP</title>
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

        <form action="validate-otp" method="post" style="width: 20%;margin: 30px auto;">

            <!-- Message Begin -->
            <c:if test="${message != null}">
                <div class="alert alert-success" role="alert">
                    ${message}
                </div>
            </c:if>
            <!-- Message End -->
            <!--<input style="border-radius: 0%" name="otp" type="text"value="${sessionScope.otp}">-->
            <!-- Enter OTP input -->         
            <div class="mb-4">
                <label>Enter OTP</label>
                <input style="border-radius: 0%" name="otp" type="text" class="form-control" required/>                
            </div>

            <!-- Submit button -->
            <div style="text-align: center;">
                <button class="site-btn" type="submit" name="button" value="validate">Submit</button>
            </div>  
        </form>
        <form action="validate-otp" method="post" style="width: 20%;margin: 30px auto;">
            <!-- Link to Home page -->
            <div style="text-align: center;">
                <a style="color: #96C2DB" href="login">Go back home</a>
<!--                <button class="site-btn" type="submit" name="button" value="back">back</button>-->
            </div>
        </form>
    </body>

</html>
