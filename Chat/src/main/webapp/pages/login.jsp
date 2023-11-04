<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Login</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
          integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <style>
        body {
            margin: 0;
            padding: 0;
            display: flex;
            flex-direction: column;
            min-height: 100vh;
        }
        .login_image{
            height:auto;
            width:489px;
        }
        .logo{
            height: auto;
            width: 75px;
            margin-bottom: 20px;
        }
        @media (max-width: 768px) {
            .login_image {
                display: none;
            }
        }
        .login-input {
            padding: 10px;
            border: 2px solid #ccc;
            border-radius: 10px;
            width: 100%;
            margin-bottom: 30px;
        }
        .btn-Login-login {
            background-color: #6BB9D6!important;
            padding: 0px 37px!important;
            height: 48px!important;
            border-radius: 20px!important;
            border: none !important;
            margin-bottom:20px;
        }
        .btn-Signup-login {
            background-color: #6BB9D6!important;
            padding: 0px 32px!important;
            height: 48px!important;
            border-radius: 20px!important;
            border: none!important;
        }
        .nav-item a.nav-link {
            color: black;
            text-decoration: none;
        }
    </style>
</head>

<body>
<%@ include file="../includes/nav-1.jsp" %>

<div class="container-content">
    <div class="container">
        <div class="row">
            <div class="col-lg-6">
                <img src="assets/login_image.png" class="login_image">
            </div>
            <div class="col-lg-1">
            </div>
            <div class="col col-lg-3 d-flex justify-content-center align-items-center">
                <div class="row">
                    <div class="d-flex justify-content-center align-items-center">
                        <a class="logo" href="user?page=index"><img src="assets/logo.png " class="logo"></a>
                    </div>
                    <form id="myForm" onsubmit="return validateForm()" action="user?page=login" method="post">
                        <input type="text" class="login-input" id="userName" name="userName" placeholder="Enter Username">
                        <input type="password" class="login-input" id="password" name="password" placeholder="Password">
                        <div class="d-flex justify-content-center align-items-center">
                            <button type="submit" class="btn btn-primary btn-Login-login">Login</button>
                        </div>
                        <div class="d-flex justify-content-center align-items-center">
                            <a href="user?page=newUser"><button type="button" class="btn btn-secondary btn-Signup-login">Signup</button></a>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
        crossorigin="anonymous"></script>
</body>
</html>