<%--
    Document   : user_dashbroad
    Created on : Oct 18, 2023
    Author     : PhiNX
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- User Dashboard Begin -->
<div class="col-lg-3">
    <div class="hero__categories">
        <div class="hero__categories__all" style="padding: 10px">
            <table>
                <tr>
                    <td>
                        <img style="height: 60px; width: 60px; border: solid #96C2DB 1px; border-radius: 90px" src="img/user-avatar/${user_Data.getAvatar()}" alt="User Profile Picture">
                    </td>
                    <td>
                        <b style="padding: 10px; font-size: 15px; color: white">${user_Data.getName()}</b>
                    </td>
                </tr>
            </table>                                  
        </div>
        <ul>
            <li><a href="profile"><span>Profile</span></a></li>
            <li><a href="change-password"><span>Change password</span></a></li>
                <c:if test="${user_Data.getRole() == 4}">
                <li><a href="order-list"><span>Manage Order</span></a></li>
                </c:if>
                <c:if test="${user_Data.getRole() == 2}">
                <li><a href="manage-banner">Manage Banner</a></li>            
                <li><a href="manage-laptop"><span>Manage Laptop</span></a></li>
                </c:if>
                <c:if test="${user_Data.getRole() == 3}">
                <li><a href="order-list"><span>Manage Order</span></a></li>
                </c:if>
                <c:if test="${user_Data.getRole() == 1}">
                <li><a href="user-list"><span>Manage User</span></a></li> 
                <li><a href="manage-banner">Manage Banner</a></li>           
                <li><a href="manage-laptop"><span>Manage Laptop</span></a></li>
                <li><a href="order-list"><span>Manage Order</span></a></li>
                </c:if>
        </ul>
    </div>                                        
</div>

<script>
    //bold when selected
    document.addEventListener("DOMContentLoaded", function () {
        var currentPath = window.location.pathname.split("/").pop(); // Get the last part of the URL

        // Find the corresponding link and set it to bold
        var links = document.querySelectorAll("ul li a");
        for (var i = 0; i < links.length; i++) {
            var href = links[i].getAttribute("href");
            console.log(href);
            if (href === currentPath) {
                links[i].style.fontWeight = "bold";
            }
        }
    });
</script>


<!-- User Dashboard End -->
