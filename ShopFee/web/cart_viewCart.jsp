<%-- 
    Document   : cart_viewCart
    Created on : Sep 12, 2023
    Author     : PhiNX
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <title>User Cart</title>
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

            <!-- Breadcrumb Section Begin -->
            <section class="breadcrumb-section set-bg" style="padding: 0px">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-12 text-center">
                            <h1><b>Shopping Cart</b></h1>
                        </div>
                    </div>
                </div>
            </section>
            <!-- Breadcrumb Section End -->

            <!-- Shoping Cart Section Begin -->
            <section class="shoping-cart spad" style="padding: 50px">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="shoping__cart__table">
                                <form action="make-order" method="post">
                                    <table>
                                        <thead>
                                            <tr>
                                                <th></th>
                                                <th class="shoping__product">Products</th>
                                                <th colspan="2">Price</th>
                                                <th>Quantity</th>
                                                <th></th>
                                            </tr>
                                        </thead>
                                        <tbody id="cart-list">
                                        <c:choose>
                                            <c:when test="${empty cart_list}">
                                                <tr>
                                                    <td colspan="5" style="color: red">You have no order</td>
                                                </tr>
                                            </c:when>
                                            <c:otherwise>
                                                <c:forEach items="${cart_list}" var="c">      
                                                    <tr>
                                                        <td>
                                                            <c:if test="${c.getQuantity() != 0}">
                                                                <input type="checkbox" name="cartId" value="${c.getCart_ID()}">
                                                            </c:if>
                                                        </td>
                                                        <td class="shoping__cart__item" style="width: 700px">
                                                            <img style="height: 150px" src="img/laptop/${c.getBrand()}/${c.getImage()}" alt="">
                                                            <h6>${c.getProduct_name()}</h6>
                                                        </td>
                                                        <fmt:formatNumber value="${c.getPrice()}" pattern="#,##0.##" var="origin_Price" />
                                                        <c:choose>
                                                            <c:when test="${c.getDiscount() != 0}">
                                                                <td colspan="2" class="shoping__cart__price product__discount__item__text">
                                                                    <!--View Price have Discount Event and not -->
                                                                    <fmt:formatNumber value="${c.getPrice() - c.getPrice() * c.getDiscount()}" pattern="#,##0.##" var="discount_Price" />                                    
                                                                    <div class="product__item__price">${discount_Price} VND <br><span>${origin_Price} VND</span></div>
                                                                </td>
                                                            </c:when>
                                                            <c:otherwise>
                                                                <td colspan="2" class="shoping__cart__price">
                                                                    <!--View Price does not have Discount Event -->
                                                                    <div class="product__item__price">${origin_Price} VND <br><span></span></div>

                                                                </td>
                                                            </c:otherwise>
                                                        </c:choose>
                                                        <td class="shoping__cart__quantity">
                                                            <div class="quantity">
                                                                <c:if test="${c.getQuantity() != 0}">
                                                                    <div class="pro-qty">
                                                                        <input type="number" name="quantity" value="1" min="1" max="${c.getQuantity()}">                                                                            
                                                                    </div><br>
                                                                </c:if>
                                                                <span>Stock: ${c.getQuantity()}</span>
                                                            </div>
                                                        </td>
                                                        <td class="shoping__cart__item__close">
                                                            <span>
                                                                <a href="javascript:void(0);" style="color: #96C2DB" onclick="deleteItem(${c.getProduct_ID()})">
                                                                    <i class="icon_close"></i>
                                                                </a>
                                                            </span>
                                                        </td>
                                                    </tr>
                                                </c:forEach>
                                            </c:otherwise>
                                        </c:choose>
                                    </tbody>
                                </table>
                                <input type="submit" id="checkout" name="checkout" hidden>
                            </form>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-12">
                        <div class="shoping__cart__btns">
                            <a href="home" class="primary-btn cart-btn">CONTINUE SHOPPING</a>
                            <a href="manage-cart" class="primary-btn cart-btn"><span class="icon_loading"></span>
                                Upadate Cart</a>
                            <label for="checkout" class="primary-btn cart-btn cart-btn-right">
                                <span style="color: #6f6f6f">MAKE AN ORDER</span>
                            </label>
                        </div>
                    </div>                       
                </div>
            </div>
        </section>
        <!-- Shoping Cart Section End -->

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
                                                                    function deleteItem(laptopId) {
                                                                        $.ajax({
                                                                            url: "delete-cart-item",
                                                                            type: "GET",
                                                                            data: {laptop_Id: laptopId},
                                                                            success: function (cart_List) {
                                                                                console.log("cart: " + cart_List);
                                                                                if (cart_List !== null) {
                                                                                    showToast("Product successfully remove from the cart.");
                                                                                    var row = document.getElementById("cart-list");
                                                                                    row.innerHTML = cart_List;
                                                                                } else if (cart_List === null) {
                                                                                    showToast("Remove fail");
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
