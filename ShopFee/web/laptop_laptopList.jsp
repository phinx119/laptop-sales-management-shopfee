<%-- 
    Document   : laptop_laptopList
    Created on : Sep 12, 2023
    Author     : PhiNX
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <title>Laptop List</title>
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
    </head>

    <body>
        <!-- Header Section Begin -->
        <jsp:include page="header.jsp"></jsp:include>
            <!-- Header Section End -->

            <div class="toast position-fixed" style="right: 5vh; top: 5vh; z-index: 2" role="alert" aria-live="assertive" aria-atomic="true">
                <div class="toast-header">
                    <strong class="mr-auto">Noti:</strong>
                    <button type="button" class="ml-2 mb-1 close" data-dismiss="toast" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="toast-body" id="toast-content"></div>
            </div>

            <!-- Product Section Begin -->
            <section class="product spad">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-3">
                            <div class="sidebar">
                                <table class="table table-borderless">
                                    <tbody>
                                        <!-- Selection combo box Begin -->
                                        <tr>
                                            <td>
                                                <select id="brandSelect" class="form-control" style="width: 200px" onchange="filter()">
                                                    <option value="">Choose Brand</option>
                                                <c:forEach items="${brand_List}" var="b">
                                                    <option value="${b.getId()}">${b.getBrand_Name()}</option>
                                                </c:forEach>
                                            </select>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <select id="categorySelect" class="form-control" style="width: 200px" onchange="filter()">
                                                <option value="">Choose Category</option>
                                                <c:forEach items="${category_List}" var="c">
                                                    <option value="${c.getId()}">${c.getCategory_Name()}</option>
                                                </c:forEach>
                                            </select>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <select id="processor" class="form-control" style="width: 200px" onchange="filter()">
                                                <option value="">Choose Processor</option>
                                                <c:forEach items="${processor_List}" var="p">
                                                    <option value="${p.getId()}">${p.getProcessor_Name()}</option>
                                                </c:forEach>
                                            </select>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <select id="price" class="form-control" style="width: 200px" onchange="filter()">
                                                <option value="0">Choose price range</option>
                                                <option value="1">0 VND - 10.000.000 VND</option>
                                                <option value="2">10.000.000 VND - 20.000.000 VND</option>
                                                <option value="3">20.000.000 VND - 30.000.000 VND</option>
                                                <option value="4">30.000.000 VND - 40.000.000 VND</option>
                                                <option value="5">40.000.000 VND - 50.000.000 VND</option>
                                            </select>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <button class="site-btn" onclick="reset()">Reset</button>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                        <!-- Selection combo box End -->
                    </div>
                    <div class="col-lg-9">
                        <div>
                            <div class="row">
                                <!--  Option to Sort Begin -->
                                <div class="col-lg-4">
                                    <div class="filter__sort">
                                        <span>Sort By</span>
                                        <select style="border-color: #ced4da; color: #495057" class="form-control w-50" onchange="filter()" id="sort"> 
                                            <option value="0">Default</option>
                                            <option value="1">Name</option>
                                            <option value="2">Price</option>
                                        </select>
                                    </div>
                                </div>
                                <!--  Option to Sort End -->

                                <!--  Number of Product Begin -->
                                <!--<div class="col-lg-4">
                                    <div class="filter__found">
                                        <h6><span>16</span> Products</h6>
                                    </div>
                                </div>-->
                                <!--  Number of Product End -->
                            </div>
                        </div>
                        <%--Product--%>
                        <div class="row">
                            <c:if test="${not empty message}">
                                <p><strong>${message}</strong></p>
                            </c:if>
                            <div id="content" class="row">    
                                <c:forEach items="${laptop_List}" var="l">                              
                                    <div class="laptop col-lg-4">
                                        <div class="product__item product__discount__item">
                                            <div class="product__item__pic product__discount__item__pic">
                                                <!-- Product Image -->
                                                <a href="laptop-detail?product_ID=${l.getId()}">
                                                    <img src="img/laptop/${l.getBrand()}/${l.getLaptop_Image1()}" alt="alt"/>
                                                </a>
                                                <!-- Product Discount -->
                                                <c:if test="${l.getDiscount() != 0}">
                                                    <div class="product__discount__percent">-${l.getDiscount()*100}%</div>
                                                </c:if>
                                                <!-- Add to cart -->
                                                <ul class="product__item__pic__hover">
                                                    <li>
                                                        <a href="javascript:void(0);" onclick="addToCart(${l.getId()})">
                                                            <i class="fa fa-shopping-cart"></i>
                                                        </a>
                                                    </li>
                                                </ul>
                                            </div>
                                            <div class="product__item__text product__discount__item__text">
                                                <!-- Link to Product Detail -->
                                                <h6><a href="laptop-detail?product_ID=${l.getId()}">${l.getModel()}</a></h6>
                                                    <fmt:formatNumber value="${l.getPrice()}" pattern="#,##0.##" var="origin_Price" />
                                                    <c:choose>                                                
                                                        <c:when test="${l.getDiscount() != 0}">
                                                        <!-- View Price have Discount Event -->
                                                        <fmt:formatNumber value="${l.getPrice() - l.getPrice()*l.getDiscount()}" pattern="#,##0.##" var="discount_Price" />                                    
                                                        <div class="product__item__price">${discount_Price} VND <br><span>${origin_Price} VND</span></div>
                                                        </c:when>                                                
                                                        <c:otherwise>
                                                        <!-- View Price doesn't have Discount Event -->
                                                        <div class="product__item__price">${origin_Price} VND <br><span></span></div>
                                                        </c:otherwise>
                                                    </c:choose>
                                            </div>
                                        </div>
                                    </div>
                                </c:forEach>  
                            </div>    
                        </div>
                        <!--  Paging Begin -->
                        <!--                        <div id="paginationButtons">
                                                    <button class="btn btn-primary" id="prevButton">Previous</button>
                                                    <button class="btn btn-primary" id="nextButton">Next</button>
                                                </div>                     -->
                        <nav aria-label="...">
                            <ul class="pagination">
                                <li class="page-item">
                                    <p class="page-link" id="prevButton" href="#" tabindex="-1">Previous</p>
                                </li>
                                <!-- Page numbers dynamically generated based on the number of products -->
                                <c:forEach begin="1" end="${(laptop_List.size() / 9) + 1}" var="pageNumber">
                                    <li class="page-item">
                                        <p class="page-link" href="javascript:void(0);">${pageNumber}</p>
                                    </li>
                                </c:forEach>
                                <li class="page-item">
                                    <p class="page-link" id="nextButton" href="#">Next</p>
                                </li>
                            </ul>
                        </nav>
                        <!--  Paging End -->
                    </div>
                </div>
            </div>
        </section>
        <!-- Product Section End -->

        <!-- Footer Section Begin -->
        <jsp:include page="footer.jsp"></jsp:include>
        <!-- Footer Section End -->

        <!-- Js Plugins -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/jquery-ui.min.js"></script>
        <script src="js/jquery.slicknav.js"></script>
        <script src="js/mixitup.min.js"></script>
        <script src="js/owl.carousel.min.js"></script>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js"></script>

        <script>
                                            function filter() {
                                                var brand = $("#brandSelect").val();
                                                var category = $("#categorySelect").val();
                                                var processor = $("#processor").val();
                                                var price = $("#price").val();
                                                var sort = $("#sort").val();
                                                $.ajax({
                                                    url: "/ShopFee/filter",
                                                    type: "get", //send it through get method
                                                    data: {
                                                        brand: brand,
                                                        category: category,
                                                        processor: processor,
                                                        price: price,
                                                        sort: sort
                                                    },
                                                    success: function (list) {
                                                        var row = document.getElementById("content");
                                                        row.innerHTML = list;
                                                        paging('laptop', 9);
                                                    },
                                                    error: function (xhr) {
                                                        //Do Something to handle error
                                                    }
                                                });
                                            }
                                            function reset() {
                                                document.getElementById("brandSelect").selectedIndex = 0;
                                                document.getElementById("categorySelect").selectedIndex = 0;
                                                document.getElementById("processor").selectedIndex = 0;
                                                document.getElementById("price").selectedIndex = 0;
                                                document.getElementById("sort").selectedIndex = 0;

                                                var brand = "";
                                                var category = "";
                                                var processor = "";
                                                var price = 0;
                                                var sort = 0;

                                                $.ajax({
                                                    url: "/ShopFee/filter",
                                                    type: "get", //send it through get method
                                                    data: {
                                                        brand: brand,
                                                        category: category,
                                                        processor: processor,
                                                        price: price,
                                                        sort: sort
                                                    },
                                                    success: function (list) {
                                                        var row = document.getElementById("content");
                                                        row.innerHTML = list;
                                                        paging('laptop', 9);
                                                    },
                                                    error: function (xhr) {
                                                        //Do Something to handle error
                                                    }
                                                });
                                            }
                                            function paging() {
                                                var row = document.getElementById("content");
                                                row.innerHTML.length = totalproduct;

                                            }

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

                                            document.addEventListener("DOMContentLoaded", function () {
                                                // Get the "category" and "brand" values from the URL
                                                const url = new URL(window.location.href);
                                                const category = url.searchParams.get("category");
                                                const brand = url.searchParams.get("brand");

                                                // Get the select elements and their options
                                                const categorySelect = document.getElementById("categorySelect");
                                                const brandSelect = document.getElementById("brandSelect");

                                                const categoryOptions = categorySelect.getElementsByTagName("option");
                                                const brandOptions = brandSelect.getElementsByTagName("option");

                                                // Loop through the category options and set the selected index based on the "category" value
                                                for (let i = 0; i < categoryOptions.length; i++) {
                                                    if (categoryOptions[i].value === category) {
                                                        categorySelect.selectedIndex = i;
                                                        break;
                                                    }
                                                }

                                                // Loop through the brand options and set the selected index based on the "brand" value
                                                for (let i = 0; i < brandOptions.length; i++) {
                                                    if (brandOptions[i].value === brand) {
                                                        brandSelect.selectedIndex = i;
                                                        break;
                                                    }
                                                }
                                            });

                                            function paging(listname, itemsPerPage) {
                                                var list = document.querySelectorAll('.' + listname);
                                                var totalItems = list.length;
                                                var currentPage = 1;

                                                function showPage(page) {
                                                    var startIndex = (page - 1) * itemsPerPage;
                                                    var endIndex = startIndex + itemsPerPage;

                                                    list.forEach(function (item, index) {
                                                        if (index >= startIndex && index < endIndex) {
                                                            item.style.display = 'block';
                                                        } else {
                                                            item.style.display = 'none';
                                                        }
                                                    });
                                                }

                                                function updateButtons() {
                                                    var totalPages = Math.ceil(totalItems / itemsPerPage);

                                                    // Update UI for pagination (you can implement this part based on your UI structure)
                                                    // For example, you can create and update page navigation buttons.

                                                    console.log('Current Page: ' + currentPage + ' / Total Pages: ' + totalPages);
                                                }

                                                // Initial display
                                                showPage(currentPage);
                                                updateButtons();

                                                document.querySelectorAll('.pagination .page-link:not(#prevButton .page-link):not(#nextButton .page-link)').forEach(function (link) {
                                                    link.addEventListener('click', function () {
                                                        var pageNumber = parseInt(link.textContent);
                                                        if (!isNaN(pageNumber)) {
                                                            link.classList.add("active");
                                                            currentPage = pageNumber;
                                                            showPage(currentPage);
                                                            updateButtons();
                                                        }
                                                    });
                                                });

                                                // Example: Add event listeners for next and previous buttons
                                                // You can customize this based on your UI structure
                                                document.getElementById('nextButton').addEventListener('click', function () {
                                                    if (currentPage < Math.ceil(totalItems / itemsPerPage)) {
                                                        currentPage++;
                                                        showPage(currentPage);
                                                        updateButtons();
                                                    }
                                                });

                                                document.getElementById('prevButton').addEventListener('click', function () {
                                                    if (currentPage > 1) {
                                                        currentPage--;
                                                        showPage(currentPage);
                                                        updateButtons();
                                                    }
                                                });
                                            }

                                            // Example usage:
                                            paging('laptop', 9);
        </script>  
    </body>

</html>
