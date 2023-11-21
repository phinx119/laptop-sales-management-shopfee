<%-- 
    Document   : order_orderDetail
    Created on : Sep 22, 2023
    Author     : PhiNX
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <title>Order Detail</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <!-- Google Font -->
        <link href="https://fonts.googleapis.com/css2?family=Cairo:wght@200;300;400;600;900&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.2/css/all.css" type="text/css">

        <!-- Css Styles -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" 
              integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <link rel="stylesheet" href="css/elegant-icons.css" type="text/css">
        <link rel="stylesheet" href="css/nice-select.css" type="text/css">
        <link rel="stylesheet" href="css/jquery-ui.min.css" type="text/css">
        <link rel="stylesheet" href="css/owl.carousel.min.css" type="text/css">
        <link rel="stylesheet" href="css/slicknav.min.css" type="text/css">
        <link rel="stylesheet" href="css/style.css" type="text/css">

        <style>
            @import url('https://fonts.googleapis.com/css?family=Open+Sans&display=swap');
            .card{
                position: relative;
                display: -webkit-box;
                display: -ms-flexbox;
                display: flex;
                -webkit-box-orient: vertical;
                -webkit-box-direction: normal;
                -ms-flex-direction: column;
                flex-direction: column;
                min-width: 0;
                word-wrap: break-word;
                background-color: #fff;
                background-clip: border-box;
                border: 1px solid rgba(0, 0, 0, 0.1);
                border-radius: 0.10rem
            }
            .card-header:first-child{
                border-radius: calc(0.37rem - 1px) calc(0.37rem - 1px) 0 0
            }
            .card-header{
                padding: 0.75rem 1.25rem;
                margin-bottom: 0;
                background-color: #fff;
                border-bottom: 1px solid rgba(0, 0, 0, 0.1)
            }
            .track{
                position: relative;
                background-color: #ddd;
                height: 7px;
                display: -webkit-box;
                display: -ms-flexbox;
                display: flex;
                margin-bottom: 60px;
                margin-top: 50px
            }
            .track .step{
                -webkit-box-flex: 1;
                -ms-flex-positive: 1;
                flex-grow: 1;
                width: 25%;
                margin-top: -18px;
                text-align: center;
                position: relative
            }
            .track .step.active:before{
                background: #96C2DB
            }
            .track .step::before{
                height: 7px;
                position: absolute;
                content: "";
                width: 100%;
                left: 0;
                top: 18px
            }
            .track .step.active .icon{
                background: #96C2DB;
                color: #fff
            }
            .track .icon{
                display: inline-block;
                width: 40px;
                height: 40px;
                line-height: 40px;
                position: relative;
                border-radius: 100%;
                background: #ddd
            }
            .track .step.active .text{
                font-weight: 400;
                color: #000
            }
            .track .text{
                display: block;
                margin-top: 7px
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
                            <h1>
                                <b>Order </b><b style="color: #96C2DB">#${order.getOrder_ID()}</b><b> detail</b>
                        </h1>
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
                            <table>
                                <thead>
                                    <tr>
                                        <th class="shoping__product">Products</th>
                                        <th colspan="2">Price</th>
                                        <th>Quantity</th>
                                        <th></th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:choose>
                                        <c:when test="${empty orderItem_List}">
                                            <tr>
                                                <td colspan="5" style="color: red">You have no order item.</td>
                                            </tr>
                                        </c:when>
                                        <c:otherwise>
                                            <c:forEach items="${orderItem_List}" var="o">      
                                                <tr>
                                                    <td class="shoping__cart__item" style="width: 700px">
                                                        <img style="height: 150px" src="img/laptop/${o.getBrand()}/${o.getImage()}" alt="${o.getModel()}">
                                                        <h6>${o.getModel()}</h6>
                                                    </td>
                                                    <fmt:formatNumber value="${o.getPrice()}" pattern="#,##0.##" var="origin_Price" />
                                                    <c:choose>
                                                        <c:when test="${o.getDiscount() != 0}">
                                                            <td colspan="2" class="shoping__cart__price product__discount__item__text">
                                                                <!--View Price have Discount Event and not -->
                                                                <fmt:formatNumber value="${o.getPrice() - o.getPrice() * o.getDiscount()}" pattern="#,##0.##" var="discount_Price" />                                    
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
                                                            <h4>${o.getQuantity()}</h4>
                                                        </div>
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                        </c:otherwise>
                                    </c:choose>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <div class="container">
                        <article class="card">
                            <div class="card-body">
                                <div class="track">
                                    <div class="step"> <span class="icon"> <i class="fa fa-clock"></i> </span> <span class="text"> Pending </span> </div>
                                    <div class="step"> <span class="icon"> <i class="fa fa-check"></i> </span> <span class="text"> Confirmed </span> </div>
                                    <div class="step"> <span class="icon"> <i class="fa fa-truck"></i> </span> <span class="text"> On the way </span> </div>
                                    <div class="step"> <span class="icon"> <i class="fa fa-box"></i> </span> <span class="text"> Successful delivery </span> </div>
                                </div>
                            </div>
                        </article>
                    </div>
                    <div class="col-lg-6">
                        <div class="shoping__checkout">
                            <div class="table-responsive">
                                <form id="myForm">
                                    <table class="table table-borderless">
                                        <tbody>
                                            <tr>
                                                <td>
                                                    <label for="name">Name:</label>
                                                    <input type="text" class="form-control" name="name" id="name" value="${order.getName()}" readonly>
                                                </td>
                                                <td>
                                                    <label for="phonenumber">Phone Number:</label>
                                                    <input type="text" class="form-control" name="phonenumber" id="phonenumber" value="${order.getPhoneNumber()}" readonly>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <c:choose>
                                                        <c:when test="${order.status == 'Cancel'}">
                                                            <label for="desiredStatus">Status:</label>
                                                            <input class="form-control" style="background-color: #DB9673; color: white" type="text" id="desiredStatus" value="${order.getStatus()}" readonly>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <c:if test="${user_Data.getRole() == 1 || user_Data.getRole() == 3}">
                                                                <label for="status">Status:</label>
                                                                <select class="form-control" id="status" name="status" required>
                                                                    <option value="Pending">Pending</option>
                                                                    <option value="Confirmed">Confirmed</option>
                                                                    <option value="On the way">On the way</option>
                                                                    <option value="Successful delivery">Successful delivery</option>                                                    
                                                                </select>
                                                                <input type="hidden" id="desiredStatus" value="${order.getStatus()}">
                                                            </c:if>
                                                            <c:if test="${user_Data.getRole() == 4}">
                                                                <label for="status">Status:</label>
                                                                <select class="form-control" id="status" name="status" hidden>
                                                                    <option value="Pending">Pending</option>
                                                                    <option value="Confirmed">Confirmed</option>
                                                                    <option value="On the way">On the way</option>
                                                                    <option value="Successful delivery">Successful delivery</option>                                                    
                                                                </select>
                                                                <input class="form-control" type="text" id="desiredStatus" value="${order.getStatus()}" readonly>
                                                            </c:if>
                                                        </c:otherwise>
                                                    </c:choose>                                                   
                                                </td>
                                                <td>
                                                    <label for="payment">Payment Method:</label>
                                                    <input type="text" class="form-control" name="payment" id="payment" value="${order.getPayment_Method()}" readonly>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="2">
                                                    <label for="address">Address:</label>
                                                    <input type="text" class="form-control" name="address" id="address" value="${order.getAddress()}" readonly>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="2">
                                                    <label for="note">Note:</label>
                                                    <input type="text" class="form-control" name="note" id="note" value="${order.getNote()}" readonly>
                                                </td>
                                            </tr>
                                        <input type="hidden" name="orderId" id="orderId" value="${order.getOrder_ID()}">
                                        <input type="submit" id="savechange" hidden>
                                        </tbody>
                                    </table>
                                </form>
                            </div>
                        </div>                         
                    </div>  
                    <div class="col-lg-6">
                        <div class="shoping__checkout">
                            <fmt:formatNumber value="${order.getTotal()}" pattern="#,##0.##" var="total" />
                            <fmt:formatNumber value="${order.getShipFee()}" pattern="#,##0.##" var="shipfee" />
                            <fmt:formatNumber value="${order.getTotal() + order.getShipFee()}" pattern="#,##0.##" var="total_last" />
                            <h5>Order Total</h5>
                            <ul>
                                <li>Subtotal <span>${total} VND</span></li>
                                <li>Ship Fee <span>${shipfee} VND</span></li>
                                <li>Total <span>${total_last} VND</span></li>
                            </ul>
                        </div> 
                        <hr>
                        <div>
                            <p style="width: 555px; display: none" class="alert alert-success" id="response"></p>
                            <p style="width: 555px; display: none" class="alert alert-danger" id="validationResult"></p>
                            <div>
                                <c:if test='${user_Data.getRole() == 1 or user_Data.getRole() == 3}'>
                                    <c:if test='${order.getStatus() != "Successful delivery" && order.getStatus() != "Cancel"}'>
                                        <label for="savechange" class="site-btn">Save change</label>
                                    </c:if>
                                </c:if>
                                <c:if test='${order.getStatus() == "Pending"}'>
                                    <a href="#" onclick="showWarning(); return false;" class="site-btn" style="background-color: #DB9673">Cancel order</a>
                                </c:if> 
                            </div>
                        </div>
                    </div>                    
                </div>
            </div>
        </section>
        <!-- Shoping Cart Section End -->

        <!-- Footer Section Begin -->
        <jsp:include page="footer.jsp"></jsp:include>
            <!-- Footer Section End -->

            <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

            <script>
                                            // Get the initial status from the hidden input field
                                            var initialStatus = document.getElementById("desiredStatus").value;

                                            // Get the status select element
                                            var statusSelect = document.getElementById("status");

                                            // Get all the step elements
                                            var steps = document.querySelectorAll('.step');

                                            // Function to update the status and activate/deactivate steps
                                            function updateStatus(newStatus) {
                                                // Activate the corresponding step based on the newStatus
                                                steps.forEach(function (step, index) {
                                                    if (index <= statusSelect.selectedIndex) {
                                                        step.classList.add('active');
                                                    } else {
                                                        step.classList.remove('active');
                                                    }
                                                });
                                            }

                                            // Set the selected option in the dropdown based on the initial status
                                            for (var i = 0; i < statusSelect.options.length; i++) {
                                                if (statusSelect.options[i].value === initialStatus) {
                                                    statusSelect.selectedIndex = i;
                                                    updateStatus(initialStatus); // Activate steps based on the initial status
                                                    break;
                                                }
                                            }

                                            // Add an event listener to the combo box to change the status
                                            statusSelect.addEventListener('change', function () {
                                                var newStatus = statusSelect.value;
                                                updateStatus(newStatus);
                                            });

                                            var options = statusSelect.options;

                                            if (initialStatus === "Pending") {
                                                options[2].style.display = "none";
                                                options[3].style.display = "none";
                                            } else if (initialStatus === "Confirmed") {
                                                options[0].style.display = "none";
                                                options[3].style.display = "none";
                                            } else if (initialStatus === "On the way") {
                                                options[0].style.display = "none";
                                                options[1].style.display = "none";
                                            } else if (initialStatus === "Successful delivery") {
                                                options[0].style.display = "none";
                                                options[1].style.display = "none";
                                                options[2].style.display = "none";
                                            }

                                            document.getElementById("myForm").onsubmit = function (event) {
                                                event.preventDefault();

                                                var nameInput = document.getElementById("name");
                                                var phoneNumberInput = document.getElementById("phonenumber");
                                                var status = document.getElementById("status");
                                                var payment = document.getElementById("payment");
                                                var addressInput = document.getElementById("address");
                                                var note = document.getElementById("note");
                                                var orderId = document.getElementById("orderId");
                                                var validationResult = document.getElementById("validationResult");

                                                if (
                                                        nameInput.value.trim() === "" ||
                                                        phoneNumberInput.value.trim() === "" ||
                                                        addressInput.value.trim() === ""
                                                        ) {
                                                    validationResult.style.display = "block";
                                                    validationResult.textContent = "Input contains only spaces or special characters and is not valid.";
                                                } else {
                                                    validationResult.style.display = "none";
                                                    validationResult.textContent = "";

                                                    $.ajax({
                                                        type: 'POST',
                                                        url: '/ShopFee/send-confirm-email',
                                                        data: {
                                                            name: nameInput.value,
                                                            phonenumber: phoneNumberInput.value,
                                                            status: status.value,
                                                            payment: payment.value,
                                                            address: addressInput.value,
                                                            note: note.value,
                                                            orderId: orderId.value
                                                        },
                                                        success: function () {
                                                            location.reload();
                                                        }
                                                    });
                                                }

                                                return false; // Prevent the default form submission
                                            };

                                            function showWarning() {
                                                // Display a confirmation dialog
                                                var confirmed = window.confirm("This is a warning. Are you sure you want to cancel the order?");

                                                // Check if the user confirmed
                                                if (confirmed) {
                                                    // If confirmed, navigate to the link's href
                                                    window.location.href = "send-confirm-email?orderId=${order.getOrder_ID()}";
                                                } else {
                                                    // If not confirmed, do nothing or take appropriate action
                                                }
                                            }
        </script>
    </body>

</html>
