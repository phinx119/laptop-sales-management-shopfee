<%-- 
    Document   : laptop_laptopDetail
    Created on : Sep 12, 2023
    Author     : PhiNX
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <title>Laptop Detail</title>
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
            td:first-child {
                font-weight: bold;
            }
            .primary-btn{
                border-color: white;
            }
            *{
                margin: 0;
                padding: 0;
            }
            .rate {
                float: left;
                height: 46px;
                padding: 0 10px;
            }
            .rate:not(:checked) > input {
                position:absolute;
                left: -999px;
            }
            .rate:not(:checked) > label {
                float:right;
                width:1em;
                overflow:hidden;
                white-space:nowrap;
                cursor:pointer;
                font-size:30px;
                color:#ccc;
            }
            .rate:not(:checked) > label:before {
                content: '★ ';
            }
            .rate > input:checked ~ label {
                color: #ffc700;
            }
            .rate:not(:checked) > label:hover,
            .rate:not(:checked) > label:hover ~ label {
                color: #deb217;
            }
            .rate > input:checked + label:hover,
            .rate > input:checked + label:hover ~ label,
            .rate > input:checked ~ label:hover,
            .rate > input:checked ~ label:hover ~ label,
            .rate > label:hover ~ input:checked ~ label {
                color: #c59b08;
            }
            .product__details__tab__desc .form-control {
                background-color: #eee;
            }

            .product__details__tab__desc .primary-btn{
                border-radius: 20px;
            }
            .comment_content {
                margin-top: 50px;
                padding: 10px;
                width: 700px;
                border-radius: 10px;
                background-color: #eee;
            }
            .avatar{
                margin-top: 50px;
            }
            .comment_wrap_left {
                float: left;
                padding: 10px;
            }
            .comment_wrap_left .comment_time {
                padding-left: 20px;
            }
            .comment_wrap_right {
                float: right;
                padding: 10px;
            }
            .comment_content .comment_text {
                padding: 10px;
                padding-top: 0px;
            }
            .comment_footer{
                width: 700px;
                padding-top: 7px;
            }
            .comment_footer .report{
                border-radius: 50px;
                background-color: #f1c1be;
                color: #af1310;
                float: right;
                font-size:14.8571px;
                width: 97px;
                height: 28px;
                padding: 4px;
                text-align: center;
            }
            .star{
                color: #ffc700;
            }
            .hidden-input {
                border: none; /* Ẩn khung viền */
                background: transparent; /* Ẩn nền */
                width: 300px; /* Điều chỉnh chiều rộng theo ý muốn */
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
                    <button type="button" class="ml-2 mb-1 close" data-dismiss="toast" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="toast-body" id="toast-content"></div>
            </div>

            <!-- Product Details Section Begin -->
            <section style="padding-top: 0px" class="product-details spad">
                <div class="container">
                    <div class="row">
                        <!-- Product Image Begin -->
                        <div class="col-lg-6">
                            <div class="product__details__pic">
                                <div class="product__details__pic__item product__discount__item__pic" style="padding-bottom: 450px">
                                    <img class="product__details__pic__item--large" src="img/laptop/${laptop_Detail.getBrand()}/${laptop_Detail.getLaptop_Image1()}" alt="">
                                <c:if test="${laptop_Detail.getDiscount() != 0}">
                                    <div class="product__discount__percent" style="height: 70px; width: 70px; font-size: 20px; padding-top: 12px"><b>-${laptop_Detail.getDiscount()*100}%</b></div>
                                </c:if>
                            </div>
                            <div class="product__details__pic__slider owl-carousel">
                                <img data-imgbigurl="img/laptop/${laptop_Detail.getBrand()}/${laptop_Detail.getLaptop_Image1()}"
                                     src="img/laptop/${laptop_Detail.getBrand()}/${laptop_Detail.getLaptop_Image1()}" alt="">
                                <img data-imgbigurl="img/laptop/${laptop_Detail.getBrand()}/${laptop_Detail.getLaptop_Image2()}"
                                     src="img/laptop/${laptop_Detail.getBrand()}/${laptop_Detail.getLaptop_Image2()}" alt="">
                                <img data-imgbigurl="img/laptop/${laptop_Detail.getBrand()}/${laptop_Detail.getLaptop_Image3()}"
                                     src="img/laptop/${laptop_Detail.getBrand()}/${laptop_Detail.getLaptop_Image3()}" alt="">
                            </div>
                        </div>
                    </div>
                    <!-- Product Image End -->

                    <div class="col-lg-6" style="padding-top: 40px">
                        <div class="product__details__text">
                            <h3>${laptop_Detail.getModel()}</h3>
                            <div class="product__item product__discount__item">
                                <div class="product__item__text product__discount__item__text">
                                    <fmt:formatNumber value="${laptop_Detail.getPrice()}" pattern="#,##0.##" var="origin_Price" />
                                    <c:choose>
                                        <c:when test="${laptop_Detail.getDiscount() != 0}">
                                            <fmt:formatNumber value="${laptop_Detail.getPrice() - laptop_Detail.getPrice()*laptop_Detail.getDiscount()}" pattern="#,##0.##" var="discount_Price" />                                    
                                            <div class="product__item__price" style="text-align: left; font-size: 30px">${discount_Price} VND <br><span style="font-size: 20px">${origin_Price} VND</span></div>
                                            </c:when>
                                            <c:otherwise>
                                            <div class="product__item__price" style="text-align: left; font-size: 30px">${origin_Price} VND <br><span></span></div>
                                            </c:otherwise>
                                        </c:choose>
                                </div>
                            </div>
                            <div class="product__details__quantity" style="display: flex">
                                <c:if test="${laptop_Detail.getQuantity() != 0}">
                                    <form action="laptop-detail" method="post">
                                        <input type="text" name="laptop_ID" value="${laptop_Detail.getId()}" hidden>
                                        <div class="pro-qty">
                                            <input type="number" name="quantity" value="1" min="1" max="${laptop_Detail.getQuantity()}">                                                                            
                                        </div>
                                        <input type="submit" id="make-order" hidden>
                                    </form>
                                </c:if>
                                <b style="padding-left:20px">Quantity: </b> <span>${laptop_Detail.getQuantity()}</span>
                            </div>
                            <div class="mt-3">
                                <c:if test="${laptop_Detail.getQuantity() != 0}">
                                    <label for="make-order" class="primary-btn">Make Order</label>
                                </c:if>
                                <a href="javascript:void(0);" class="primary-btn" onclick="addToCart(${laptop_Detail.getId()})">
                                    Add to Cart
                                </a>
                            </div>
                        </div>
                    </div>

                    <!-- Description -->
                    <div class="col-lg-12">
                        <div class="product__details__tab">
                            <ul class="nav nav-tabs" role="tablist">
                                <li class="nav-item">
                                    <a class="nav-link active" data-toggle="tab" href="#tabs-1" role="tab"
                                       aria-selected="true">Description</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" data-toggle="tab" href="#tabs-2" role="tab"
                                       aria-selected="false">Information</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" data-toggle="tab" href="#tabs-3" role="tab"
                                       aria-selected="false">Reviews <span>(${reviewTotal})</span></a>
                                </li>
                            </ul>
                            <div class="tab-content">
                                <div class="tab-pane active" id="tabs-1" role="tabpanel">
                                    <div class="product__details__tab__desc">
                                        <h6>${laptop_Detail.getModel()}</h6>
                                        <p>${laptop_Detail.getDescription()}</p>                                        
                                    </div>
                                </div>
                                <div class="tab-pane" id="tabs-2" role="tabpanel">
                                    <div class="product__details__tab__desc">
                                        <h6>${laptop_Detail.getModel()}</h6>
                                        <div class="container" style="margin-top: 20px">
                                            <table class="table table-striped table-hover" style="width: 700px">
                                                <tr>
                                                    <td>Tiêu chí</td>
                                                    <td>Nội dung</td>
                                                </tr>
                                                <tr>
                                                    <td>CPU</td>
                                                    <td>${laptop_Detail.getProcessor_Name()}</td>
                                                </tr>
                                                <tr>
                                                    <td>RAM</td>
                                                    <td>${laptop_Detail.getRAM()}</td>
                                                </tr>                                                
                                                <tr>
                                                    <td>Graphics Card</td>
                                                    <td>${laptop_Detail.getGraphic_Card()}</td>
                                                </tr>
                                                <tr>
                                                    <td>Screen Size</td>
                                                    <td>${laptop_Detail.getScreen_Size()}</td>
                                                </tr>
                                                <tr>
                                                    <td>Screen Resolution</td>
                                                    <td>${laptop_Detail.getScreen_Resolution()}</td>
                                                </tr>
                                                <tr>
                                                    <td>Screen Frequency</td>
                                                    <td>${laptop_Detail.getScreen_Frequency()}</td>
                                                </tr>
                                                <tr>
                                                    <td>Storage</td>
                                                    <td>${laptop_Detail.getStorage()}</td>
                                                </tr>
                                                <tr>
                                                    <td>Operating System</td>
                                                    <td>${laptop_Detail.getOperating_System()}</td>
                                                </tr>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                                <div class="tab-pane" id="tabs-3" role="tabpanel">
                                    <div class="product__details__tab__desc">
                                        <h6>Customers rate and comment</h6>
                                        <!-- Star rate score board -->
                                        <div class="avg-rate-count">
                                            <%
                                                int Num = 5;
                                                int[] starTotal = (int[]) request.getAttribute("starTotal");                                                
                                            %>
                                            <c:forEach var = "i" begin = "1" end = "5">
                                                <div class="avg-rate-item d-flex align-items-center">
                                                    <span class="rate-number"><%=Num--%> <i class="fa fa-star star"></i></span>
                                                    <div class="background-rate nhan-xet-bar">
                                                        <div class="bgb-in" style="width: 50%"></div>
                                                    </div>
                                                    <span class="total-avg-rate"  title='Xem các đánh giá này'><strong><%=starTotal[Num]%></strong> reviews</span>
                                                </div>                                                
                                            </c:forEach>    

                                            <!-- Form để người dùng đánh giá sản phẩm -->
                                            <form id="feedbackForm" action="laptop-detail" method="post">
                                                <input type="hidden" name="product_ID" id="product_ID" value="${laptop_Detail.getId()}">
                                                <p style="margin-bottom:4px">Rating:</p>
                                                <div class="rate col-md-12"">
                                                    <div class="rate" id="rate">
                                                        <input type="radio" id="star5" name="rate" value="5" required/>
                                                        <label for="star5" title="text">5 stars</label>
                                                        <input type="radio" id="star4" name="rate" value="4" required/>
                                                        <label for="star4" title="text">4 stars</label>
                                                        <input type="radio" id="star3" name="rate" value="3" required/>
                                                        <label for="star3" title="text">3 stars</label>
                                                        <input type="radio" id="star2" name="rate" value="2" required/>
                                                        <label for="star2" title="text">2 stars</label>
                                                        <input type="radio" id="star1" name="rate" value="1" required/>
                                                        <label for="star1" title="text">1 star</label>
                                                    </div>
                                                </div>                                            

                                                <!-- Feedback -->
                                                <br>
                                                <div class="mb-4">
                                                    <label class="form-label"  for="feedback_comments">Comments:</label>
                                                    <textarea class="form-control" required rows="6" name="comments" id="comments" placeholder="Message.." ></textarea>
                                                </div>
                                                <input type="hidden" name="comment_date" id="comment_date">                                               

                                                <c:if test="${user_ID != null}">
                                                    <button type="button" class="primary-btn" id="save" onclick="addComment()">Submit Feedback</button>
                                                </c:if>
                                                <c:if test="${user_ID == null}">
                                                    <input class="primary-btn" type="submit" value="Submit Feedback">
                                                </c:if>
                                            </form>       

                                            <!-- Comment list -->
                                            <div id="product_ID" style="display: none;">${laptop_Detail.getId()}</div><!-- Send pid voi id="product_ID"-->
                                            <div class="comments-area" style="padding-top: 40px">
                                                <h3 class="comment-title">${reviewTotal} Comments</h3>
                                                <div id="content" class="row"> 

                                                    <c:forEach items="${review_List}" var="r">                                                                                                               
                                                        <div class="container">
                                                            <div class="row">
                                                                <div class="col-lg-1">
                                                                    <div class="avatar">
                                                                        <img  style="height: 60px; width: 60px; border: solid #96C2DB 1px; border-radius: 90px" src="img/user-avatar/${r.getUser_avatar()}"> 

                                                                    </div>
                                                                </div>
                                                                <div class="col-lg-11">
                                                                    <div class="comment_content">
                                                                        <div class="comment_meta">
                                                                            <div class="comment_wrap_left">					
                                                                                <h4 class="comment_author"  style="display: inline">${r.getUser_name()}</h4> 
                                                                                <div class="comment_time" style="display: inline">${r.getDate_Posted()}</div>
                                                                            </div>
                                                                            <div class="comment_wrap_right">	
                                                                                <c:if test="${user_ID == r.getUser_ID()}">
                                                                                    <button class="comment_delete" id="comment_delete" style="display: inline; padding-left: 5px; color: #af1310; border: none;" onclick="deleteComment(${r.getReview_ID()})">Delete</button>
                                                                                </c:if>
                                                                            </div>
                                                                            <div class="clearfix"></div>
                                                                        </div>
                                                                        <div class="comment_text" >
                                                                            <p>${r.getCommnent()}</p>                                                                            
                                                                        </div>                                                                                
                                                                    </div>
                                                                    <!--                                                                    <div class="comment_footer">
                                                                                                                                            <a class="report" href="#" style="">
                                                                                                                                                <i class="fa fa-flag" aria-hidden="true"></i> Báo cáo
                                                                                                                                            </a>
                                                                                                                                        </div>-->
                                                                </div>
                                                            </div>
                                                        </div>                                                        
                                                    </c:forEach>
                                                </div>   
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
        </section>
        <!-- Product Details Section End -->
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
        <script src="js/main.js"></script>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js"></script>

        <script>
                                                                                        document.getElementById("comment_date").value = new Date().toJSON();
                                                                                        function addComment() {
                                                                                            var data = $("#feedbackForm").serialize();
                                                                                            $.ajax({
                                                                                                url: "/ShopFee/manage-review?action=add",
                                                                                                type: "POST", //send it through get method
                                                                                                data: data,
                                                                                                success: function (data) {
                                                                                                    console.log(data);
                                                                                                    $("#comments").val("");
                                                                                                    $("#rate").val("");
                                                                                                    showToast("Submit Success");
                                                                                                    var row = document.getElementById("content");
                                                                                                    row.innerHTML = data;
                                                                                                }
                                                                                            });
                                                                                        }
                                                                                        function deleteComment(rid) {
                                                                                            console.log("Review ID to delete: " + rid);
                                                                                            var RID = rid;
                                                                                            var PID = $("#product_ID").val();
                                                                                            $.ajax({
                                                                                                url: "/ShopFee/manage-review?action=delete",
                                                                                                type: "POST", //send it through get method
                                                                                                data: {
                                                                                                    Review_ID: RID,
                                                                                                    product_ID: PID
                                                                                                },
                                                                                                success: function (data) {
                                                                                                    console.log(data);
                                                                                                    showToast("Delete Success");
                                                                                                    var row = document.getElementById("content");
                                                                                                    row.innerHTML = data;
                                                                                                }
                                                                                            });
                                                                                        }

                                                                                        function reportComment(rid) {
                                                                                            var RID = rid;
                                                                                            var PID = $("#product_ID").val();
                                                                                            $.ajax({
                                                                                                url: "/ShopFee/manage-review?action=edit",
                                                                                                type: "POST",
                                                                                                data: {
                                                                                                    Review_ID: RID,
                                                                                                    product_ID: PID
                                                                                                },
                                                                                                success: function (data) {
                                                                                                    console.log(data);
                                                                                                    showToast("Please editing your comment");
                                                                                                    var row = document.getElementById("content");
                                                                                                    row.innerHTML = data;
                                                                                                    var input = document.getElementById("hidden-input");
                                                                                                    // Di con trỏ vào ô input
                                                                                                    input.focus();
                                                                                                    // Đặt vị trí của con trỏ vào cuối của văn bản trong ô input
                                                                                                    input.selectionStart = input.value.length;
                                                                                                    input.selectionEnd = input.value.length;
                                                                                                }
                                                                                            });
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
        </script>
    </body>
    
</html>
