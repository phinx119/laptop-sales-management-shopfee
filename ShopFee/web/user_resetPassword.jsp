<%-- 
    Document   : user_resetPassword
    Created on : Sep 22, 2023
    Author     : HuyLD
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Reset Password</title>
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
            <a style="margin-top: 100px; width: 22%" href="home">
                <img src="img/logo-1.png" alt="Untitled"/>
            </a>
        </div>
        <!-- Logo End -->        

        <form action="reset-password" method="post" style="width: 20%;margin: 30px auto;">
            
            <!-- Message -->
            <c:if test="${message != null}">
                <div class="alert alert-success" role="alert">
                    ${message}
                </div>
            </c:if>

            <!-- New Password input -->         
            <div class="mb-4">
                <label>New Password</label>
                <input style="border-radius: 0%" name="password" type="password" class="form-control" required/>                
            </div>

            <!-- Confirm Password input -->         
            <div class="mb-4">
                <label>Confirm Password</label>
                <input style="border-radius: 0%" name="re_password" type="password" class="form-control" required/>                
            </div>

            <!-- Submit button -->
            <div class="text-center">
                <button class="site-btn" type="submit">Reset password</button>
            </div>             
        </form>
    </body>
</html>
