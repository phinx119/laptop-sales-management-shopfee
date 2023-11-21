<%-- 
    Document   : header
    Created on : Sep 20, 2023
    Author     : PhiNX
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- Header Section Begin -->

<header class="header">
    <div class="header__top">
        <div class="container">
            <div class="row">
                <div class="col-lg-6 col-md-6">
                    <div class="header__top__left">
                        <ul>
                            <li><i class="fa fa-envelope"></i> swp391g2shopfee@gmail.com</li>
                            <li>Free Shipping for all Order in FPTU</li>
                        </ul>
                    </div>
                </div>
                <c:choose>
                    <c:when test="${user_Data == null}">
                        <div class="col-lg-6 col-md-6">
                            <div class="header__top__right">
                                <div class="header__top__right__social">
                                    <a href="login">Login</a>
                                </div>
                                <div class="header__top__right__auth">
                                    <a href="get-otp?register=1">Register</a>
                                </div>
                            </div>
                        </div>
                    </c:when>
                    <c:otherwise>
                        <div class="col-lg-6 col-md-6">
                            <div class="header__top__right">
                                <div class="header__top__right__social">
                                    <a href="profile">
                                        <i class="fa pull-left">
                                            <img style="height: 20px; width: 20px; border: solid #96C2DB 1px; border-radius: 90px" src="img/user-avatar/${user_Data.getAvatar()}" alt="${user_Data.getAvatar()}">
                                        </i>
                                        ${user_Data.getName()}
                                    </a>
                                </div>
                                <div class="header__top__right__auth">
                                    <a href="logout">Logout</a>
                                </div>
                            </div>
                        </div>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>
    </div>
    <div class="container">
        <div class="row">
            <div class="col-lg-3">
                <div class="header__logo">
                    <a href="home"><img style="width: 120%" src="img/logo-1.png" alt=""></a>
                </div>
            </div>
            <div class="col-lg-9">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-8">
                            <nav class="header__menu">
                                <ul>
                                    <li><a href="home">Home</a></li>
                                    <li><a href="laptop-list">List Product</a></li>
                                </ul>
                            </nav>
                        </div>
                        <div class="col-lg-4">
                            <div class="header__cart">
                                <ul>
                                    <li><a href="manage-cart">
                                            <i class="fa fa-shopping-bag"></i>
                                            <span id="cart-size">${cart_size}</span>
                                        </a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="container">
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="hero__search">
                                <div style="width: 560px" class="hero__search__form">
                                    <form action="search" method="get">
                                        <input name="search" value="${searchParam}" type="text" placeholder="What do you need?">
                                        <button type="submit" class="site-btn">SEARCH</button>
                                    </form>
                                </div>
                                <div class="hero__search__phone">
                                    <div class="hero__search__phone__icon">
                                        <i class="fa fa-phone"></i>
                                    </div>
                                    <div class="hero__search__phone__text">
                                        <h5>0812 497 838</h5>
                                        <span>(may not) support 24/7 time</span>
                                    </div>
                                </div>
                            </div>
                        </div>                   
                    </div>
                </div>
            </div>
        </div>
    </div>
</header>
<!-- Header Section End -->
