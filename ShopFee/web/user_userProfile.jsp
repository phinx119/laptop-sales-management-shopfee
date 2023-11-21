<%-- 
    Document   : user_userProfile
    Created on : Sep 12, 2023
    Author     : PhiNX
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <title>User Profile</title>
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
        <!-- Style input box -->
        <style>
            .input-form{
                /*                display:block;*/
                width:100%;
                height:calc(1.5em + .75rem + 2px);
                padding:.375rem .75rem;
                font-size:1rem;
                font-weight:400;
                line-height:1.5;
                color:#495057;
                background-color:#fff;
                background-clip:padding-box;
                border:1px solid #ced4da;
                border-radius:.25rem;
                transition:border-color .15s ease-in-out,box-shadow .15s ease-in-out
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

                        <!-- Manage Profile Begin -->
                        <div class="col-lg-9">
                            <div class="container">
                                <div class="row">
                                    <div class="col-lg-12">
                                        <div>  
                                            <b style="font-size: 30px">My profile</b><br>
                                            <b style="font-size: 25px">Manage profile information to secure your account</b>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="container" style="margin-top: 20px">
                                <div class="row">
                                    <div class="col-lg-9">    
                                        <!-- Message -->
                                    <c:if test="${message != null}">
                                        <div style="width: 500px" class="alert alert-danger" role="alert">
                                            ${message}
                                        </div>
                                    </c:if>

                                    <!-- Username -->         
                                    <div class="mb-4">
                                        <label>Username</label>
                                        <input style="border-radius: 0%; width: 500px; height: 46px" name="username" type="text" value="${user_Data.getUsername()}" class="form-control" readonly/>                
                                    </div>

                                    <!-- Update Name Begin -->
                                    <form action="profile" method="post">
                                        <!-- Name input -->         
                                        <div class="mb-4">
                                            <label>Name</label><br>
                                            <input style="border-radius: 0%; width: 350px; height: 46px" name="name" type="text" value="${user_Data.getName()}" class="input-form" required/>                
                                            <button class="site-btn" type="submit" name="button" value="name">Save Change</button>
                                        </div>

                                        <!-- Message Begin -->
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
                                        <!-- Message End -->

                                        <input name="userid" type="text" value="${user_Data.getUser_Id()}" hidden/>           
                                    </form>
                                    <!-- Update Name End -->

                                    <!-- Update Email Begin -->
                                    <form action="profile" method="post">
                                        <!-- Email input -->         
                                        <div class="mb-4">
                                            <label>Email</label><br>
                                            <input style="border-radius: 0%; width: 350px; height: 46px" name="newemail" type="email" value="${user_Data.getEmail()}" class="input-form" required/>                
                                            <button class="site-btn" type="submit" name="button" value="email">Save Change</button>
                                        </div>

                                        <!-- Message Begin -->
                                        <c:if test="${message3 != null}">
                                            <div style="width: 500px" class="alert alert-success" role="alert">
                                                ${message3}
                                            </div>
                                        </c:if>

                                        <c:if test="${message4 != null}">
                                            <div style="width: 500px" class="alert alert-danger" role="alert">
                                                ${message4}
                                            </div>
                                        </c:if>

                                        <c:if test="${message7 != null}">
                                            <div style="width: 500px" class="alert alert-success" role="alert">
                                                ${message7}
                                            </div>
                                        </c:if>

                                        <c:if test="${message8 != null}">
                                            <div style="width: 500px" class="alert alert-danger" role="alert">
                                                ${message8}
                                            </div>
                                        </c:if>
                                        <!-- Message End -->

                                        <input name="oldemail" type="text" value="${user_Data.getEmail()}" hidden/>
                                        <input name="userid" type="text" value="${user_Data.getUser_Id()}" hidden/>        
                                    </form>
                                    <!-- Update Email End -->

                                    <!-- Update Phone number Begin -->
                                    <form action="profile" method="post">
                                        <!-- Phone number input -->         
                                        <div class="mb-4">
                                            <label>Phone number</label><br>
                                            <input style="border-radius: 0%; width: 350px; height: 46px" name="phonenumber" type="text" value="${user_Data.getPhone_Number()}" class="input-form"/>   
                                            <button class="site-btn" type="submit" name="button" value="phonenumber">Save Change</button>
                                        </div>

                                        <!-- Message Begin -->
                                        <c:if test="${message5 != null}">
                                            <div style="width: 500px" class="alert alert-success" role="alert">
                                                ${message5}
                                            </div>
                                        </c:if>

                                        <c:if test="${message6 != null}">
                                            <div style="width: 500px" class="alert alert-danger" role="alert">
                                                ${message6}
                                            </div>
                                        </c:if>
                                        <!-- Message End -->

                                        <input name="userid" type="text" value="${user_Data.getUser_Id()}" hidden/>           
                                    </form>
                                    <!-- Update Phone number End -->

                                    <!-- Delete Account Begin 
                                                                        <form id="myForm" action="profile" method="post">
                                                                            <input name="userid" type="text" value="${user_Data.getUser_Id()}" hidden/>
                                                                            <input name="button" type="text" value="delete" hidden/>
                                                                            <button style="background-color: #DB9673" onclick="showWarning(); return false;" class="site-btn" type="submit">Delete account</button>
                                                                        </form>
                                                                         Delete Account End -->
                                </div>

                                <!-- Update User Avatar Begin -->
                                <div class="col-lg-3">
                                    <form action="upload-avatar" method="post" enctype="multipart/form-data">
                                        <input name="userid" type="text" value="${user_Data.getUser_Id()}" hidden/>
                                        <img id="previewImage" style="height: 110px; width: 110px; border: solid #96C2DB 1px; border-radius: 90px; margin-left: 40px" src="img/user-avatar/${user_Data.getAvatar()}" alt="User Avatar">
                                        <input type="file" name="avatar" id="imageInput" onchange="previewAvatar()" required hidden/>
                                        <label for="imageInput" style="width: 100%; margin-top: 10px; text-align: center" class="site-btn">
                                            Choose a file
                                        </label>
                                        <button class="site-btn" style="width: 100%" type="submit" value="avatar">Save Change</button>
                                    </form>
                                </div>
                                <!-- Update User Avatar End -->
                            </div>
                        </div>
                    </div>
                    <!-- Manage Profile End -->
                </div>
            </div>
        </section>
        <!-- Hero Section End -->

        <!-- Footer Section Begin -->
        <jsp:include page="footer.jsp"></jsp:include>
        <!-- Footer Section End -->

        <!-- Show warning when click Delete Account button -->
        <script>
            function previewAvatar() {
                const imageInput = document.getElementById('imageInput');
                const previewImage = document.getElementById('previewImage');

                if (imageInput.files && imageInput.files[0]) {
                    const reader = new FileReader();

                    reader.onload = function (e) {
                        previewImage.src = e.target.result;
                    }

                    reader.readAsDataURL(imageInput.files[0]);
                }
            }

            function showWarning() {
                // Display a confirmation dialog
                var userResponse = confirm("Are you sure you want to delete the account?");

                // Check the user's response
                if (userResponse) {
                    alert("You clicked OK, form submitted.");
                    // Perform the form submission or any desired action here
                    document.getElementById("myForm").submit(); // Submit the form
                } else {
                    alert("You clicked Cancel, action canceled.");
                    // Optionally, you can perform some action here if the user cancels
                }
            }
        </script>

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
