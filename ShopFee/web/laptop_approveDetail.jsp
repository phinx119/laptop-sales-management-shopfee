<%--
    Document   : laptop_addLaptop
    Created on : Oct 8, 2023, 4:02:22 PM
    Author     : HieuNT
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="description" content="Ogani Template">
        <meta name="keywords" content="Ogani, unica, creative, html">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title>Add Laptop</title>

        <!--Google Font--> 
        <link href="https://fonts.googleapis.com/css2?family=Cairo:wght@200;300;400;600;900&display=swap" rel="stylesheet">

        <!--Css Styles-->         
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
            .error-message{
                margin-top: 10px;
                color:#721c24;
                background-color:#f8d7da;
                border-color:#f5c6cb
            }
        </style>
    </head>

    <body>
        <!--Header Section Begin--> 
        <jsp:include page="header.jsp"></jsp:include>
            <!--Header Section End--> 

            <!--Hero Section Begin--> 
            <section class="hero">
                <div class="container">
                    <div class="row">
                        <!--User Dashboard Begin--> 
                    <jsp:include page="user_dashbroad.jsp"></jsp:include>
                        <!--User Dashboard End--> 

                        <!--Manage Profile Begin--> 
                        <div class="col-lg-9">
                            <div class="container">
                                <div class="row">
                                    <div class="col-lg-12">
                                        <div>  
                                            <b style="font-size: 30px">Unapproved Laptop's Detail</b><br>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="container" style="margin-top: 20px">
                                <div class="row">
                                    <div class="col-lg-12"> 
                                        <!--Message--> 
                                    <c:if test="${message != null}">
                                        <div style="width: 500px" class="alert alert-danger" role="alert">
                                            ${message}
                                        </div>
                                    </c:if>
                                </div>
                                <div class="col-lg-12"> 
                                    <div class="container">
                                        <div class="row">
                                            <div class="col-lg-12">
                                                <div class="mb-4">
                                                    <label>Model</label><br>
                                                    <input type="text" name="model" required="" value="${ld.getModel()}" readonly><br>
                                                </div>
                                            </div>
                                            <div class="col-lg-6">

                                                <div class="mb-4">
                                                    <label>Brand</label><br>
                                                    <select  style="width: 58%" name="brand" id="brandSelect" onchange="updateUploadDirectory()" required readonly><br>
                                                        <option selected>${ld.getBrand()}</option>
                                                    </select><br><input type="hidden" name="selectedBrand" id="selectedBrand" value="">
                                                </div>

                                                <div class="mb-4">
                                                    <label>Category</label><br>
                                                    <select style="width: 58%" name="category" required readonly><br>
                                                        <option selected>${ld.getCategory()}</option>
                                                    </select><br>
                                                </div>

                                                <div class="mb-4">
                                                    <label>Processor Type</label><br>
                                                    <select style="width: 58%" name="processor_Type" required readonly><br>
                                                        <option selected>${ld.getProcessor_Type()}</option>
                                                    </select><br>
                                                </div>

                                                <div class="mb-4">
                                                    <label>Processor Name</label><br>
                                                    <input type="text" name="processor_Name" value="${ld.getProcessor_Name()}" required readonly><br>
                                                </div>

                                                <div class="mb-4">
                                                    <label>Graphic Card</label><br>
                                                    <input type="text" name="graphic_Card" required="" value="${ld.getGraphic_Card()}" readonly><br>
                                                </div>

                                                <div class="mb-4">
                                                    <label>Ram</label><br>
                                                    <input type="text" name="RAM" required="" value="${ld.getRAM()}" readonly><br>
                                                </div>

                                                <div class="mb-4">
                                                    <label>Storage</label><br>
                                                    <input type="text" name="storage" value="${ld.getStorage()}" required="" readonly><br>
                                                </div>
                                            </div>
                                            <div class="col-lg-6">
                                                <div class="mb-4">
                                                    <label>Screen Size</label><br>
                                                    <input type="text" name="screen_Size" required="" value="${ld.getScreen_Size()}" readonly><br>
                                                </div>

                                                <div class="mb-4">
                                                    <label>Screen Resolution</label><br>
                                                    <input type="text" name="screen_Resolution" required="" value="${ld.getScreen_Resolution()}" readonly><br>
                                                </div>

                                                <div class="mb-4">
                                                    <label>Screen Frequency</label><br>
                                                    <input type="text" name="screen_Frequency" required="" value="${ld.getScreen_Frequency()}" readonly><br>
                                                </div>

                                                <div class="mb-4">
                                                    <label>Operating System</label><br>
                                                    <input type="text" name="operating_System" required="" value="${ld.getOperating_System()}" readonly><br>
                                                </div>

                                                <div class="mb-4">
                                                    <label>Price</label><br>
                                                    <input type="text" name="price" required="" value="${ld.getPrice()}" readonly><br>
                                                </div>

                                                <div class="mb-4">
                                                    <label>Quantity</label><br>
                                                    <input type="text" name="quantity" required="" value="${ld.getQuantity()}" readonly><br>
                                                </div>
                                            </div>
                                            <div class="col-lg-12 mb-5">
                                                <label>Description</label><br>
                                                <textarea class="h-100 w-75" type="text" name="description">${ld.getDescription()}</textarea>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="container">
                                        <div class="row">
                                            <div class="col-lg-4">
                                                <img style="height: 150px; width: 150px" id="previewImage1" src="img/laptop/${ld.getBrand()}/${ld.getLaptop_Image1()}" alt="Laptop Image 1"><br>
                                            </div>
                                            <div class="col-lg-4">
                                                <img style="height: 150px; width: 150px" id="previewImage2" src="img/laptop/${ld.getBrand()}/${ld.getLaptop_Image2()}" alt="Laptop Image 2"><br>
                                            </div>
                                            <div class="col-lg-4">
                                                <img style="height: 150px; width: 150px" id="previewImage3" src="img/laptop/${ld.getBrand()}/${ld.getLaptop_Image3()}" alt="Laptop Image 3"><br>
                                            </div>
                                        </div>
                                        <br>
                                        <div class="row">
                                            <div class="col-lg-2">
                                                <form action="unapproved-list" method="post">
                                                    <input type="hidden" name="id" value="${ld.getId()}">
                                                    <input type="submit" class="site-btn" value="Approve">
                                                </form>   
                                            </div>
                                            <div class="col-lg-2">
                                                <form action="permadel" method="post">
                                                    <input type="hidden" name="id" value="${ld.getId()}">
                                                    <input type="submit" class="danger-btn" value="Reject">
                                                </form>   
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!--Manage Profile End--> 
                        </div>
                    </div>
                </div>
        </section>
        <!--Hero Section End--> 

        <!--Footer Section Begin--> 
        <jsp:include page="footer.jsp"></jsp:include>
        <!--Footer Section End--> 

        <script>
            function previewAvatar1() {
                const imageInput = document.getElementById('imageInput1');
                const previewImage = document.getElementById('previewImage1');

                if (imageInput.files && imageInput.files[0]) {
                    const reader = new FileReader();

                    reader.onload = function (e) {
                        previewImage.src = e.target.result;
                    }

                    reader.readAsDataURL(imageInput.files[0]);
                }
            }

            function previewAvatar2() {
                const imageInput = document.getElementById('imageInput2');
                const previewImage = document.getElementById('previewImage2');

                if (imageInput.files && imageInput.files[0]) {
                    const reader = new FileReader();

                    reader.onload = function (e) {
                        previewImage.src = e.target.result;
                    }

                    reader.readAsDataURL(imageInput.files[0]);
                }
            }

            function previewAvatar3() {
                const imageInput = document.getElementById('imageInput3');
                const previewImage = document.getElementById('previewImage3');

                if (imageInput.files && imageInput.files[0]) {
                    const reader = new FileReader();

                    reader.onload = function (e) {
                        previewImage.src = e.target.result;
                    }

                    reader.readAsDataURL(imageInput.files[0]);
                }
            }

            function updateUploadDirectory() {
                var brandSelect = document.getElementById("brandSelect");
                var selectedBrand = document.getElementById("selectedBrand");

                // Set the selected brand value to the hidden input field
                selectedBrand.value = brandSelect.options[brandSelect.selectedIndex].text;
            }

            function showConfirmation() {
                if (confirm("Are you sure you want to save changes?")) {
                    // User clicked OK, proceed with form submission
                    document.getElementById("addLap").submit();
                } else {
                    // User clicked Cancel, do nothing
                }
            }

            document.getElementById("addLap").addEventListener("submit", function (event) {
                event.preventDefault(); // Preveant form submission

                //            const input = document.getElementById("BannerName").value;
                const model = document.getElementsByName("model")[0].value;
                const processorName = document.getElementsByName("processor_Name")[0].value;
                const graphicCard = document.getElementsByName("graphic_Card")[0].value;
                const RAM = document.getElementsByName("RAM")[0].value;
                const storage = document.getElementsByName("storage")[0].value;
                const screenSize = document.getElementsByName("screen_Size")[0].value;
                const screenResolution = document.getElementsByName("screen_Resolution")[0].value;
                const screenFrequency = document.getElementsByName("screen_Frequency")[0].value;
                const operatingSystem = document.getElementsByName("operating_System")[0].value;
                const price = document.getElementsByName("price")[0].value;
                const quantity = document.getElementsByName("quantity")[0].value;
                const description = document.getElementsByName("description")[0].value;
                const discount = document.getElementsByName("discount")[0].value;

                const validationResult = document.getElementById("validationResult");

                // Regular expressions for validation
                const validModel = /^[^\s]+$/; // Not just spaces/^[\w\s\d()/.-]+$/
                const validProcessorName = /^(?!^\s*$)[\w\s\-&®]+$/; // Not just spaces
                const validGraphicCard = /^(?!^\s*$)[a-zA-Z0-9\s\-&®]*$/; // Not just spaces
                const validRAM = /^\d{1,3}$/; // Integer less than 1000
                const validStorage = /^(?!^\s*$)[a-zA-Z0-9\s]*$/; // Not just spaces or special characters
                const validScreenSize = /^\d{1,4}(\.\d{1,2})?$/; // Decimal(4,2)
                const validscreenResolution = /^(?!^\s*$)[a-zA-Z0-9\s]*$/; // Not just spaces or special characters
                const validScreenFrequency = /^\d{1,3}$/; // Integer less than 1000
                const validOperatingSystem = /^(?!^\s*$)[a-zA-Z0-9\s]*$/; // Not just spaces
                const validPrice = /^\d{1,10}(\.\d{2})?$/; // Decimal(10,2)
                const validQuantity = /^\d+$/; // Integer
                const validDescription = /^(?!^\s*$)[a-zA-Z0-9\s]*$/;// Not just spaces or special characters
                const validDiscount = /^\d{1,10}(\.\d{2})?$/; // Decimal(10,2)
                if (!validModel.test(model)) {
                    modelError.textContent = "Model is invalid.";
                    modelError.style.display = "block";
                } else {
                    modelError.style.display = "none";
                    modelError.textContent = "";
                }

                if (!validProcessorName.test(processorName)) {
                    processorNameError.textContent = "Processor Name is invalid.";
                    processorNameError.style.display = "block";
                } else {
                    processorNameError.style.display = "none";
                    processorNameError.textContent = "";
                }

                if (!validGraphicCard.test(graphicCard)) {
                    graphicCardError.textContent = "graphic Card is invalid.";
                    graphicCardError.style.display = "block";
                } else {
                    graphicCardError.style.display = "none";
                    graphicCardError.textContent = "";
                }

                if (!validRAM.test(RAM)) {
                    RAMError.textContent = "RAM is invalid.";
                    RAMError.style.display = "block";
                } else {
                    RAMError.style.display = "none";
                    RAMError.textContent = "";
                }

                if (!validStorage.test(storage)) {
                    storageError.textContent = "Storage is invalid.";
                    storageError.style.display = "block";
                } else {
                    storageError.style.display = "none";
                    storageError.textContent = "";
                }

                if (!validScreenSize.test(screenSize)) {
                    screenSizeError.textContent = "Screen Size is invalid.";
                    RAMError.style.display = "block";
                } else {
                    screenSizeError.style.display = "none";
                    screenSizeError.textContent = "";
                }

                if (!validscreenResolution.test(screenResolution)) {
                    screenResolutionError.textContent = "Screen Resolution is invalid.";
                    screenResolutionError.style.display = "block";
                } else {
                    screenResolutionError.style.display = "none";
                    screenResolutionError.textContent = "";
                }

                if (!validScreenFrequency.test(screenFrequency)) {
                    screenFrequencyError.textContent = "Screen Frequency is invalid.";
                    screenFrequencyError.style.display = "block";
                } else {
                    screenFrequencyError.style.display = "none";
                    screenFrequencyError.textContent = "";
                }

                if (!validOperatingSystem.test(operatingSystem)) {
                    operatingSystemError.textContent = "Operating System is invalid.";
                    operatingSystemError.style.display = "block";
                } else {
                    operatingSystemError.style.display = "none";
                    operatingSystemError.textContent = "";
                }

                if (!validPrice.test(price)) {
                    priceError.textContent = "Price is invalid.";
                    priceError.style.display = "block";
                } else {
                    priceError.style.display = "none";
                    priceError.textContent = "";
                }

                if (!validQuantity.test(quantity)) {
                    quantityError.textContent = "Quantity is invalid.";
                    quantityError.style.display = "block";
                } else {
                    quantityError.style.display = "none";
                    quantityError.textContent = "";
                }

                if (!validDescription.test(description)) {
                    descriptionError.textContent = "Description is invalid.";
                    descriptionError.style.display = "block";
                } else {
                    descriptionError.style.display = "none";
                    descriptionError.textContent = "";
                }

                if (!validDiscount.test(discount)) {
                    discountError.textContent = "Discount is invalid.";
                    discountError.style.display = "block";
                } else {
                    discountError.style.display = "none";
                    discountError.textContent = "";
                }

                // Add similar validation and error message display logic for other fields

                // Check if any errors were displayed
                const errorMessages = document.querySelectorAll('.error-message');
                let hasErrors = false;
                errorMessages.forEach(function (message) {
                    if (message.style.display === "block") {
                        hasErrors = true;
                    }
                });

                if (!hasErrors) {
                    this.submit();
                }
            });


        </script>
    </body>
</html>
