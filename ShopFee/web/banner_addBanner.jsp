<%-- 
    Document   : Banner_addBanner
    Created on : 30-Oct-2023
    Author     : HuyLD
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <title>Add Banner</title>
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
        <style>
            .input-form{
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
            #previewbanner{
                width: 75%;
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

                        <!-- Manage Banner Begin -->
                        <div class="col-lg-9">
                            <div class="container">
                                <div class="row">
                                    <div class="col-lg-12">
                                        <div>  
                                            <b style="font-size: 30px">Add Banner</b><br>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="container" style="margin-top: 20px">
                                <div class="row">
                                    <div class="col-lg-12"> 
                                        <!--Message -->
                                    <c:if test="${message != null}">
                                        <div style="width: 500px" class="alert alert-danger" role="alert">
                                            ${message}
                                        </div>
                                    </c:if>
                                    <!-- Form add banner -->
                                    <form id="myForm" action="add-banner" method="post" enctype="multipart/form-data">
                                        <!-- banner name -->
                                        <div class="mb-4">                                            
                                            <label for="banner-name">Banner Name</label>
                                            <input class="form-control" id="banner-name" style="border-radius: 0%; width: 300px" type="text" name="banner_Name" required>
                                            <p id="validationResult1" style="width: 500px; display: none" class="alert alert-danger mt-2"></p>
                                        </div>

                                        <!-- banner link -->
                                        <div class="mb-4">
                                            <label for="banner-link">Banner Link</label>
                                            <input class="form-control" id="banner-link" style="border-radius: 0%; width: 300px" type="text" name="banner_Link" required>
                                            <p id="validationResult2" style="width: 500px; display: none" class="alert alert-danger mt-2"></p>
                                        </div>

                                        <!-- banner image and preview -->
                                        <img id="previewbanner" src="img/banner/${banner.getBanner_Image()}" alt="Banner Image"><br>
                                        <input type="file" name="Banner_Image" id="imageInput" onchange="previewAvatar()" required="" hidden>
                                        <label for="imageInput" style="margin-top: 10px" class="site-btn">
                                            Choose Image
                                        </label>

                                        <!-- button -->
                                        <button class="site-btn" type="submit">Save Change</button>
                                    </form>
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

        <!-- Js Plugins -->
        <script src="js/jquery-3.3.1.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/jquery.nice-select.min.js"></script>
        <script src="js/jquery-ui.min.js"></script>
        <script src="js/jquery.slicknav.js"></script>
        <script src="js/mixitup.min.js"></script>
        <script src="js/owl.carousel.min.js"></script>
        <script src="js/main.js"></script>
        <script>
                                            //preview banner image
                                            function previewAvatar() {
                                                console.log("alo");
                                                const imageInput = document.getElementById('imageInput');
                                                const previewbanner = document.getElementById('previewbanner');

                                                if (imageInput.files && imageInput.files[0]) {
                                                    const reader = new FileReader();

                                                    reader.onload = function (e) {
                                                        previewbanner.src = e.target.result;
                                                    };

                                                    reader.readAsDataURL(imageInput.files[0]);
                                                }
                                            }

                                            //validate input to create new banner
                                            document.getElementById("myForm").addEventListener("submit", function (event) {
                                                event.preventDefault(); // Preveant form submission

                                                const input1 = document.getElementById("banner-name").value;
                                                const input2 = document.getElementById("banner-link").value;
                                                const validationResult1 = document.getElementById("validationResult1");
                                                const validationResult2 = document.getElementById("validationResult2");

                                                // Define a regular expression pattern to allow spaces but not just spaces
                                                const pattern = /^(?!^\s*$)[a-zA-Z0-9\s]*$/;

                                                //check valid banner name
                                                if (pattern.test(input1)) {
                                                    validationResult1.style.display = "none";
                                                    validationResult1.textContent = ""; // Clear the validation message
                                                    // Proceed with form submission
                                                    this.submit(); // Submit the form
                                                } else {
                                                    validationResult1.style.display = "block";
                                                    validationResult1.textContent = "Input contains only spaces or special characters and is not valid.";
                                                    window.scrollTo(0, 0);
                                                }

//                                                //check valid banner link
//                                                if (pattern.test(input2)) {
//                                                    validationResult2.style.display = "none";
//                                                    validationResult2.textContent = ""; // Clear the validation message
//                                                    // Proceed with form submission
//                                                    this.submit(); // Submit the form
//                                                } else {
//                                                    validationResult2.style.display = "block";
//                                                    validationResult2.textContent = "Input contains only spaces or special characters and is not valid.";
//                                                    window.scrollTo(0, 0);
//                                                }
                                            });
        </script>
    </body>

</html>

