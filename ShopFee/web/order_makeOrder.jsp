<%-- 
    Document   : order_makeOrder
    Created on : Oct 5, 2023
    Author     : PhiNX
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <title>Make Order</title>
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
            .shoping__discount input {
                width: 255px;
                height: 46px;
                border: 1px solid #cccccc;
                font-size: 16px;
                text-align: left;
                display: inline-block;
                margin-right: 15px;
            }
            .error-message{
                margin-top: 10px;
                color:#721c24;
                background-color:#f8d7da;
                border-color:#f5c6cb
            }
        </style>
    </head>

    <body>
        <!-- Header Section Begin -->
        <jsp:include page="header.jsp"></jsp:include>
            <!-- Header Section End -->

            <!-- Breadcrumb Section Begin -->
            <section class="breadcrumb-section set-bg" style="padding: 0px">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-12 text-center">
                            <h1><b>Make Order</b></h1>
                        </div>
                    </div>
                </div>
            </section>
            <!-- Breadcrumb Section End -->

            <!-- Shoping Cart Section Begin -->
            <section class="shoping-cart spad" style="padding: 50px">
                <div class="container">
                    <form action="checkout" method="post" id="checkout">
                        <div class="row">
                            <div class="col-lg-12">                            
                                <div class="shoping__cart__table">
                                    <table>
                                        <thead>
                                            <tr>
                                                <th class="shoping__product">Products</th>
                                                <th colspan="2">Price</th>
                                                <th>Quantity</th>
                                                <th colspan="2">Total</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                        <c:set var="total" value="0" /> 
                                        <c:choose>
                                            <c:when test="${empty cart_list}">
                                                <tr>
                                                    <td colspan="5" style="color: red">You have no order</td>
                                                </tr>
                                            </c:when>
                                            <c:otherwise>
                                                <c:forEach items="${cart_list}" var="c">      
                                                    <tr>
                                                        <td class="shoping__cart__item">
                                                            <img style="height: 150px" src="img/laptop/${c.getBrand()}/${c.getImage()}" alt="${o.getModel()}">
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
                                                                <td class="shoping__cart__quantity">
                                                                    <div class="quantity">
                                                                        <div class="pro-qty">
                                                                            <input type="text" value="${c.getQuantity()}">
                                                                        </div>
                                                                    </div>
                                                                </td>
                                                                <td colspan="2" class="shoping__cart__total">
                                                                    <fmt:formatNumber value="${(c.getPrice() - c.getPrice() * c.getDiscount()) * c.getQuantity()}" pattern="#,##0.##" var="total_Price" />
                                                                    ${total_Price} VND
                                                                    <c:set var="total" value="${total + ((c.getPrice() - c.getPrice() * c.getDiscount()) * c.getQuantity())}" />
                                                                </td>
                                                            </c:when>
                                                            <c:otherwise>
                                                                <td colspan="2" class="shoping__cart__price">
                                                                    <!--View Price does not have Discount Event -->
                                                                    <div class="product__item__price">${origin_Price} VND <br><span></span></div>

                                                                </td>
                                                                <td class="shoping__cart__quantity">
                                                                    <div class="quantity">
                                                                        <div class="pro-qty">
                                                                            <input type="text" value="${c.getQuantity()}">
                                                                        </div>
                                                                    </div>
                                                                </td>
                                                                <td colspan="2" class="shoping__cart__total">
                                                                    <fmt:formatNumber value="${c.getPrice() * c.getQuantity()}" pattern="#,##0.##" var="total_Price" />
                                                                    ${total_Price} VND
                                                                    <c:set var="total" value="${total + (c.getPrice() * c.getQuantity())}" />
                                                                </td>
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </tr>
                                                </c:forEach>
                                            </c:otherwise>
                                        </c:choose>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        <div class="col-lg-6">
                            <div class="shoping__checkout">
                                <div class="table-responsive">
                                    <table class="table table-borderless">
                                        <tbody>
                                            <tr>
                                                <td>
                                                    <input required type="text" class="form-control" name="name" id="name" placeholder="Tên">
                                                    <span id="nameError" class="error-message"></span>
                                                </td>                                        
                                                <td>
                                                    <input required type="text" class="form-control" name="phonenumber" id="phonenumber" placeholder="Số điện thoại">
                                                    <span id="phoneError" class="error-message"></span>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <select required class="form-control" name="city" id="city">
                                                        <option value="" selected>Chọn tỉnh thành</option>
                                                        <option value="Thành phố Hà Nội">Thành phố Hà Nội</option>
                                                        <option value="Thành phố Hải Phòng">Thành phố Hải Phòng</option>
                                                        <option value="Tỉnh Hưng Yên">Tỉnh Hưng Yên</option>
                                                        <option value="Tỉnh Hải Dương">Tỉnh Hải Dương</option>
                                                        <option value="Tỉnh Nam Định">Tỉnh Nam Định</option>
                                                        <option value="Tỉnh Bắc Ninh">Tỉnh Bắc Ninh</option>
                                                        <option value="Tỉnh Vĩnh Phúc">Tỉnh Vĩnh Phúc</option>
                                                        <option value="Tỉnh Phú Thọ">Tỉnh Phú Thọ</option>
                                                        <option value="Tỉnh Hà Nam">Tỉnh Hà Nam</option>
                                                        <option value="Tỉnh Hà Giang">Tỉnh Hà Giang</option>
                                                        <option value="Tỉnh Thái Nguyên">Tỉnh Thái Nguyên</option>
                                                        <option value="Tỉnh Yên Bái">Tỉnh Yên Bái</option>
                                                        <option value="Tỉnh Lào Cai">Tỉnh Lào Cai</option>
                                                        <option value="Tỉnh Tuyên Quang">Tỉnh Tuyên Quang</option>
                                                        <option value="Tỉnh Lạng Sơn">Tỉnh Lạng Sơn</option>
                                                        <option value="Tỉnh Lai Châu">Tỉnh Lai Châu</option>
                                                        <option value="Tỉnh Cao Bằng">Tỉnh Cao Bằng</option>
                                                        <option value="Tỉnh Hoà Bình">Tỉnh Hoà Bình</option>
                                                        <option value="Tỉnh Ninh Bình">Tỉnh Ninh Bình</option>
                                                        <option value="Tỉnh Thanh Hóa">Tỉnh Thanh Hóa</option>
                                                        <option value="Tỉnh Nghệ An">Tỉnh Nghệ An</option>
                                                        <option value="Tỉnh Hà Tĩnh">Tỉnh Hà Tĩnh</option>
                                                        <option value="Tỉnh Quảng Bình">Tỉnh Quảng Bình</option>
                                                        <option value="Tỉnh Quảng Trị">Tỉnh Quảng Trị</option>
                                                        <option value="Tỉnh Thừa Thiên-Huế">Tỉnh Thừa Thiên-Huế</option>
                                                        <option value="Thành phố Đà Nẵng">Thành phố Đà Nẵng</option>
                                                        <option value="Tỉnh Quảng Nam">Tỉnh Quảng Nam</option>
                                                        <option value="Tỉnh Quảng Ngãi">Tỉnh Quảng Ngãi</option>
                                                        <option value="Tỉnh Bình Định">Tỉnh Bình Định</option>
                                                        <option value="Tỉnh Phú Yên">Tỉnh Phú Yên</option>
                                                        <option value="Tỉnh Khánh Hòa">Tỉnh Khánh Hòa</option>
                                                        <option value="Tỉnh Ninh Thuận">Tỉnh Ninh Thuận</option>
                                                        <option value="Tỉnh Bình Thuận">Tỉnh Bình Thuận</option>
                                                        <option value="Tỉnh Kon Tum">Tỉnh Kon Tum</option>
                                                        <option value="Tỉnh Gia Lai">Tỉnh Gia Lai</option>
                                                        <option value="Tỉnh Đắk Lắk">Tỉnh Đắk Lắk</option>
                                                        <option value="Tỉnh Đắk Nông">Tỉnh Đắk Nông</option>
                                                        <option value="Tỉnh Lâm Đồng">Tỉnh Lâm Đồng</option>
                                                        <option value="Tỉnh Bình Phước">Tỉnh Bình Phước</option>
                                                        <option value="Tỉnh Tây Ninh">Tỉnh Tây Ninh</option>
                                                        <option value="Tỉnh Bình Dương">Tỉnh Bình Dương</option>
                                                        <option value="Tỉnh Đồng Nai">Tỉnh Đồng Nai</option>
                                                        <option value="Tỉnh Bà Rịa-Vũng Tàu">Tỉnh Bà Rịa-Vũng Tàu</option>
                                                        <option value="Thành phố Hồ Chí Minh">Thành phố Hồ Chí Minh</option>
                                                        <option value="Tỉnh Long An">Tỉnh Long An</option>
                                                        <option value="Tỉnh Tiền Giang">Tỉnh Tiền Giang</option>
                                                        <option value="Tỉnh Bến Tre">Tỉnh Bến Tre</option>
                                                        <option value="Tỉnh Trà Vinh">Tỉnh Trà Vinh</option>
                                                        <option value="Tỉnh Vĩnh Long">Tỉnh Vĩnh Long</option>
                                                        <option value="Tỉnh Đồng Tháp">Tỉnh Đồng Tháp</option>
                                                        <option value="Tỉnh An Giang">Tỉnh An Giang</option>
                                                        <option value="Tỉnh Kiên Giang">Tỉnh Kiên Giang</option>
                                                        <option value="Tỉnh Cà Mau">Tỉnh Cà Mau</option>
                                                        <option value="Tỉnh Hậu Giang">Tỉnh Hậu Giang</option>
                                                        <option value="Tỉnh Sóc Trăng">Tỉnh Sóc Trăng</option>
                                                        <option value="Tỉnh Bạc Liêu">Tỉnh Bạc Liêu</option>
                                                        <option value="Thành phố Cần Thơ">Thành phố Cần Thơ</option>
                                                    </select>
                                                </td>
                                                <td>
                                                    <select required class="mb-3 form-control" name="payment" id="payment">
                                                        <option value="" selected>Payment method</option>
                                                        <c:if test="${user_Data.getRole() == 1 || user_Data.getRole() == 3}">
                                                            <option value="In store">In store</option>                                                            
                                                        </c:if>
                                                        <option value="Cast">Ship COD</option>
                                                        <option value="VNPAY">VNPAY</option>
                                                    </select>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="2">
                                                    <input required type="text" class="form-control" name="address" id="address" placeholder="Địa chỉ">
                                                    <span id="addressError" class="error-message"></span>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="2">
                                                    <input type="text" class="form-control" name="note" id="note" placeholder="Ghi chú">
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>                         
                        </div>  
                        <div class="col-lg-6">
                            <div class="shoping__checkout">
                                <fmt:formatNumber value="${total}" pattern="#,##0.##" var="total_last" />
                                <h5>Order Total</h5>
                                <ul>
                                    <li>Subtotal <span>${total_last} VND</span></li>
                                    <li>Ship Fee <span id="shipping-fee-amount">0 VND</span></li>
                                    <li>Total <span id="total-shipping-fee-amount">${total_last} VND</span></li>
                                </ul>
                                <input type="hidden" name="city1" id="city1" value="">
                                <input type="hidden" name="total" id="total" value="${total}">
                                <input type="hidden" name="shipFee" id="shipFee" value="">
                                <input style="width: 500px" class="site-btn" type="submit" value="PROCEED TO CHECKOUT">
                            </div>
                        </div>
                    </div>
                </form>
                <!--                <div class="row">
                                    <div class="shoping__continue">
                                        <div class="shoping__discount">
                                            <h5>Discount Codes</h5>
                                            <form>
                                                <input type="text" id="code" placeholder="Enter your coupon code">
                                                <button type="submit" class="site-btn" onclick="updateShippingFee()">APPLY COUPON</button>
                                            </form>
                                        </div>
                                    </div>
                                </div>-->
            </div>
        </section>
        <!-- Shoping Cart Section End -->

        <!-- Footer Section Begin -->
        <jsp:include page="footer.jsp"></jsp:include>
        <!-- Footer Section End -->

        Js Plugins 
        <script>
            const citis = document.getElementById("city");

            const shippingFees = {
                "Thành phố Hà Nội": 0,
                "Thành phố Hải Phòng": 1,
                "Tỉnh Hưng Yên": 1,
                "Tỉnh Hải Dương": 1,
                "Tỉnh Nam Định": 1,
                "Tỉnh Bắc Ninh": 1,
                "Tỉnh Vĩnh Phúc": 1,
                "Tỉnh Phú Thọ": 1,
                "Tỉnh Hà Nam": 1,
                "Tỉnh Hà Giang": 1,
                "Tỉnh Thái Nguyên": 1,
                "Tỉnh Yên Bái": 1,
                "Tỉnh Lào Cai": 1,
                "Tỉnh Tuyên Quang": 1,
                "Tỉnh Lạng Sơn": 1,
                "Tỉnh Lai Châu": 1,
                "Tỉnh Cao Bằng": 1,
                "Tỉnh Hoà Bình": 1,
                "Tỉnh Ninh Bình": 2,
                "Tỉnh Thanh Hóa": 2,
                "Tỉnh Nghệ An": 2,
                "Tỉnh Hà Tĩnh": 2,
                "Tỉnh Quảng Bình": 2,
                "Tỉnh Quảng Trị": 2,
                "Tỉnh Thừa Thiên-Huế": 2,
                "Thành phố Đà Nẵng": 2,
                "Tỉnh Quảng Nam": 2,
                "Tỉnh Quảng Ngãi": 2,
                "Tỉnh Bình Định": 2,
                "Tỉnh Phú Yên": 2,
                "Tỉnh Khánh Hòa": 2,
                "Tỉnh Ninh Thuận": 2,
                "Tỉnh Bình Thuận": 2,
                "Tỉnh Kon Tum": 3,
                "Tỉnh Gia Lai": 3,
                "Tỉnh Đắk Lắk": 3,
                "Tỉnh Đắk Nông": 3,
                "Tỉnh Lâm Đồng": 3,
                "Tỉnh Bình Phước": 3,
                "Tỉnh Tây Ninh": 3,
                "Tỉnh Bình Dương": 3,
                "Tỉnh Đồng Nai": 3,
                "Tỉnh Bà Rịa-Vũng Tàu": 3,
                "Thành phố Hồ Chí Minh": 3,
                "Tỉnh Long An": 3,
                "Tỉnh Tiền Giang": 3,
                "Tỉnh Bến Tre": 4,
                "Tỉnh Trà Vinh": 4,
                "Tỉnh Vĩnh Long": 4,
                "Tỉnh Đồng Tháp": 4,
                "Tỉnh An Giang": 4,
                "Tỉnh Kiên Giang": 4,
                "Tỉnh Cà Mau": 4,
                "Tỉnh Hậu Giang": 4,
                "Tỉnh Sóc Trăng": 4,
                "Tỉnh Bạc Liêu": 4,
                "Tỉnh Cần Thơ": 4,
                "Thành phố Cần Thơ": 4
            };

            function updateShippingFee() {
                const selectedCity = citis.options[citis.selectedIndex].text;
                const shipIndex = shippingFees[selectedCity] || 0;

                const shipFee = shipIndex * 20000;
                const formattedShipFee = shipFee.toLocaleString('vi-VN');
                document.getElementById("shipping-fee-amount").textContent = formattedShipFee + " VND";
                document.getElementById("shipFee").value = shipFee;

                const totalShipFee = parseFloat(document.getElementById("total").value) + shipFee;
                const formattedTotalShipFee = totalShipFee.toLocaleString('vi-VN');
                document.getElementById("total-shipping-fee-amount").textContent = formattedTotalShipFee + " VND";

                document.getElementById("city1").value = selectedCity;
            }

            citis.addEventListener("change", updateShippingFee);

//            document.getElementById("checkout").addEventListener("submit", function (event) {
//                event.preventDefault(); // Preveant form submission
//
//                const name = document.getElementsById("name")[0].value;
//                const phonenumber = document.getElementsById("phonenumber")[0].value;
//                const address = document.getElementsById("address")[0].value;
//
//                const validName = /^(?!^\s*$)[\w\s]+$/;
//                const validPhone = /^0\d{9,10}$/;
//                const validAddress = /^(?!^\s*$)[\w\s\-().,\\/]+$/;
//
//                if (!validName.test(name)) {
//                    nameError.textContent = "Name cannot just contain space and contain speacial characters.";
//                    nameError.style.display = "block";
//                } else {
//                    nameError.style.display = "none";
//                    nameError.textContent = "";
//                }
//
//                if (!validName.test(phonenumber)) {
//                    phoneError.textContent = "Phone number is invalid.";
//                    phoneError.style.display = "block";
//                } else {
//                    phoneError.style.display = "none";
//                    phoneError.textContent = "";
//                }
//
//                if (!validName.test(address)) {
//                    addressError.textContent = "Address is invalid.";
//                    addressError.style.display = "block";
//                } else {
//                    addressError.style.display = "none";
//                    addressError.textContent = "";
//                }
//
//                // Check if any errors were displayed
//                const errorMessages = document.querySelectorAll('.error-message');
//                let hasErrors = false;
//                errorMessages.forEach(function (message) {
//                    if (message.style.display === "block") {
//                        hasErrors = true;
//                    }
//                });
//
//                if (!hasErrors) {
//                    this.submit();
//                }
//            });

        </script>

    </body>

</html>
