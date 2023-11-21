<%-- 
    Document   : home-page
    Created on : Sep 12, 2023
    Author     : PhiNX
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <title>Home</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <!-- Google Font -->
        <link href="https://fonts.googleapis.com/css2?family=Cairo:wght@200;300;400;600;900&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">

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
            .slider{
                position: relative;
                background: #000116;
                width: 100%;
                min-height: 350px;
                max-height: 450px;
                /*margin: 20px;*/
                overflow: hidden;
                border-radius: 10px;
            }

            .slider .slide{
                position: absolute;
                width: 100%;
                height: 100%;
                clip-path: circle(0% at 0 50%);
            }

            .slider .slide.active{
                clip-path: circle(150% at 0 50%);
                transition: 2s;
            }

            .slider .slide img{
                position: absolute;
                width: 100%;
                height: 100%;
                object-fit: cover;
            }

            .navigation{
                height: 450px;
                display: flex;
                align-items: center;
                justify-content: space-between;
                opacity: 0;
                transition: opacity 0.5s ease;
            }

            .slider:hover .navigation{
                opacity: 1;
            }

            .prev-btn, .next-btn{
                z-index: 999;
                font-size: 2em;
                color: #222;
                background: rgba(255, 255, 255, 0.8);
                padding: 10px;
                cursor: pointer;
            }

            .prev-btn{
                border-top-right-radius: 3px;
                border-bottom-right-radius: 3px;
            }

            .next-btn{
                border-top-left-radius: 3px;
                border-bottom-left-radius: 3px;
            }

            .navigation-visibility{
                z-index: 999;
                display: flex;
                justify-content: center;
            }

            .navigation-visibility .slide-icon{
                z-index: 999;
                background: rgba(255, 255, 255, 0.5);
                width: 20px;
                height: 10px;
                transform: translateY(-25px);
                margin: 0 6px;
                border-radius: 2px;
                box-shadow: 0 5px 25px rgb(1 1 1 / 20%);
            }

            .navigation-visibility .slide-icon.active{
                background: #4285F4;
            }

            @media (max-width: 900px){
                .slider{
                    width: 100%;
                }
            }
        </style>
    </head>

    <body>
        <!-- Header Section Begin -->
        <jsp:include page="header.jsp"></jsp:include>
            <!-- Header Section End -->

            <div class="toast position-fixed" style="right: 5vh; top: 5vh; z-index: 2" role="alert" aria-live="assertive" aria-atomic="true">
                <div class="toast-header">
                    <strong class="mr-auto">Noti:</strong>
                    <button type="button" class="close" data-dismiss="toast" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="toast-body" id="toast-content"></div>
            </div>

            <!-- Hero Section Begin -->
            <section class="hero">
                <div class="container">
                    <div class="row">
                        <!-- Brand List Begin -->
                        <div class="col-lg-3">
                            <div class="hero__categories">
                                <div class="hero__categories__all">
                                    <i class="fa fa-bars"></i>
                                    <span>All Brands</span>
                                </div>
                                <ul>
                                <c:forEach items="${brand_List}" var="b">
                                    <li><a href="laptop-list?brand=${b.getId()}">${b.getBrand_Name()}</a></li>
                                    </c:forEach>
                            </ul>
                        </div>
                    </div>
                    <!-- Brand List End -->

                    <!-- Banner List Begin -->
                    <div class="col-lg-9">                        
                        <div class="slider">
                            <c:forEach items="${banner_List}" var="b" varStatus="status">
                                <div class="slide ${status.first ? 'active' : ''}">
                                    <a href="${b.getBanner_Link()}">
                                        <img src="img/banner/${b.getBanner_Image()}" alt="Banner">
                                    </a>
                                </div>
                            </c:forEach>
                            <div class="navigation">
                                <i class="fas fa-chevron-left prev-btn"></i>
                                <i class="fas fa-chevron-right next-btn"></i>
                            </div>
                            <div class="navigation-visibility">
                                <c:forEach items="${banner_List}" var="b" varStatus="status">
                                    <div class="slide-icon ${status.first ? 'active' : ''}"></div>
                                </c:forEach>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Banner List End -->
            </div>
        </div>
    </section>
    <!-- Hero Section End -->

    <!-- Categories Section Begin -->
    <section class="categories">
        <div class="container">
            <div class="row">
                <div class="categories__slider owl-carousel">
                    <c:forEach items="${category_List}" var="c">
                        <div class="col-lg-3">
                            <div class="categories__item set-bg" data-setbg="img/categories/${c.getCategory_Image()}">
                                <h5><a href="laptop-list?category=${c.getId()}">${c.getCategory_Name()}</a></h5>
                            </div>
                        </div>
                    </c:forEach>
                    <div class="col-lg-3">
                        <div class="categories__item set-bg" data-setbg="img/categories/cat-5.jpg">
                            <h5><a href="#">Featured Product</a></h5>
                        </div> 
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Categories Section End -->

    <!-- Featured Product Begin -->
    <section class="featured spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="section-title">
                        <h2>Product List</h2>
                    </div>
                    <div class="featured__controls">
                        <!-- Brand List Begin -->
                        <ul>
                            <li class="active" data-filter="*">All</li>
                                <c:forEach items="${brand_List}" var="b">
                                <li data-filter=".${b.getBrand_Name()}">${b.getBrand_Name()}</li>
                                </c:forEach>
                        </ul>
                        <!-- Brand List End -->
                    </div>
                </div>
            </div>
            <div class="row featured__filter">
                <!-- Product List Begin -->
                <c:forEach items="${laptop_List}" var="l">
                    <div class="col-lg-3 mix ${l.getBrand()}">
                        <div class="featured__item product__discount__item">                                
                            <div class="featured__item__pic product__discount__item__pic">
                                <!-- Product Image -->
                                <a href="laptop-detail?product_ID=${l.getId()}">
                                    <img src="img/laptop/${l.getBrand()}/${l.getLaptop_Image1()}" alt="alt"/>
                                </a>
                                <!-- Product Discount -->
                                <c:if test="${l.getDiscount() != 0}">
                                    <div class="product__discount__percent">-${l.getDiscount()*100}%</div>
                                </c:if>
                                <!-- Add to cart -->
                                <ul class="featured__item__pic__hover">
                                    <li>
                                        <a href="javascript:void(0);" onclick="addToCart(${l.getId()})">
                                            <i class="fa fa-shopping-cart"></i>
                                        </a>
                                    </li>
                                </ul>
                            </div>
                            <div class="featured__item__text product__discount__item__text">
                                <!-- Link to Product Detail -->
                                <h6><a href="laptop-detail?product_ID=${l.getId()}" title="View Product">${l.getModel()}</a></h6>                                     
                                    <fmt:formatNumber value="${l.getPrice()}" pattern="#,##0.##" var="origin_Price" />
                                    <c:choose>
                                        <c:when test="${l.getDiscount() != 0}">
                                        <!--View Price have Discount Event and not -->
                                        <fmt:formatNumber value="${l.getPrice() - l.getPrice()*l.getDiscount()}" pattern="#,##0.##" var="discount_Price" />                                    
                                        <div class="product__item__price">${discount_Price} VND <br><span>${origin_Price} VND</span></div>
                                        </c:when>
                                        <c:otherwise>
                                        <!--View Price does not have Discount Event -->
                                        <div class="product__item__price">${origin_Price} VND <br><span></span></div>
                                        </c:otherwise>
                                    </c:choose>
                            </div>
                        </div>
                    </div>  
                </c:forEach>
                <!-- Laptop List End -->
            </div>
        </div>
        <div id="messageDiv" class="message hidden"></div>
    </section>
    <!-- Featured Product End -->

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
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js"></script>

    <script type="text/javascript">
                                            const slider = document.querySelector(".slider");
                                            const nextBtn = document.querySelector(".next-btn");
                                            const prevBtn = document.querySelector(".prev-btn");
                                            const slides = document.querySelectorAll(".slide");
                                            const slideIcons = document.querySelectorAll(".slide-icon");
                                            const numberOfSlides = slides.length;
                                            var slideNumber = 0;

                                            //image slider next button
                                            nextBtn.addEventListener("click", () => {
                                                slides.forEach((slide) => {
                                                    slide.classList.remove("active");
                                                });
                                                slideIcons.forEach((slideIcon) => {
                                                    slideIcon.classList.remove("active");
                                                });

                                                slideNumber++;

                                                if (slideNumber > (numberOfSlides - 1)) {
                                                    slideNumber = 0;
                                                }

                                                slides[slideNumber].classList.add("active");
                                                slideIcons[slideNumber].classList.add("active");
                                            });

                                            //image slider previous button
                                            prevBtn.addEventListener("click", () => {
                                                slides.forEach((slide) => {
                                                    slide.classList.remove("active");
                                                });
                                                slideIcons.forEach((slideIcon) => {
                                                    slideIcon.classList.remove("active");
                                                });

                                                slideNumber--;

                                                if (slideNumber < 0) {
                                                    slideNumber = numberOfSlides - 1;
                                                }

                                                slides[slideNumber].classList.add("active");
                                                slideIcons[slideNumber].classList.add("active");
                                            });

                                            //image slider autoplay
                                            var playSlider;

                                            var repeater = () => {
                                                playSlider = setInterval(function () {
                                                    slides.forEach((slide) => {
                                                        slide.classList.remove("active");
                                                    });
                                                    slideIcons.forEach((slideIcon) => {
                                                        slideIcon.classList.remove("active");
                                                    });

                                                    slideNumber++;

                                                    if (slideNumber > (numberOfSlides - 1)) {
                                                        slideNumber = 0;
                                                    }

                                                    slides[slideNumber].classList.add("active");
                                                    slideIcons[slideNumber].classList.add("active");
                                                }, 4000);
                                            }
                                            repeater();

                                            //stop the image slider autoplay on mouseover
                                            slider.addEventListener("mouseover", () => {
                                                clearInterval(playSlider);
                                            });

                                            //start the image slider autoplay again on mouseout
                                            slider.addEventListener("mouseout", () => {
                                                repeater();
                                            });

                                            function addToCart(laptopId) {
                                                $.ajax({
                                                    url: "add-laptop-to-cart",
                                                    type: "GET",
                                                    data: {laptop_Id: laptopId},
                                                    success: function (response) {
                                                        var data = JSON.parse(response);
                                                        console.log(data.status);
                                                        console.log(data.cart_size);
                                                        if (data.status === "success") {
                                                            $("#cart-size").text(data.cart_size);
                                                            showToast("Product successfully added to the cart.");
                                                        } else if (data.status === "already_added") {
                                                            showToast("Product is already in the cart.");
                                                        } else if (data.status === "not_logged_in") {
                                                            //showMessage("Please log in to add products to your cart.");
                                                            // Redirect to the login page
                                                            window.location.href = "login";
                                                        } else {
                                                            showToast("An error occurred while adding the product to the cart.");
                                                        }
                                                    },
                                                    error: function (xhr, status, error) {
                                                        console.log("AJAX Error: " + status + " - " + error);
                                                        showToast("An error occurred while making the request.");
                                                    }
                                                });
                                            }

                                            function showToast(message) {
                                                const toastContent = document.getElementById('toast-content');
                                                toastContent.textContent = message;
                                                $('.toast').toast('show');
                                            }

                                            document.querySelector('.close').addEventListener('click', function () {
                                                $('.toast').toast('hide'); // Hide the toast
                                            });
    </script>
</body>

</html>
