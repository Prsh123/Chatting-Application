<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<html>
<head>
    <title>SIGNUP</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="icon" type="image/x-icon" href="assets/favicon.ico">
    <link rel="stylesheet" href="style.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <script type="text/javascript">
        function displayAlert(message) {
            var alertDiv = document.getElementById('alertDiv');
            alertDiv.innerHTML = message;
            alertDiv.style.display = 'block';
        }
        function validateForm() {
            var password = document.getElementById('password').value;
            var userName = document.getElementById('userName').value;
            if (password === '' && userName === '') {
                alert('email and password are required fields');
                return false;
            }
            else if (userName===''){
                alert("email is required.");
                return false;
            }
            else if (password===''){
                alert("password is required.");
                return false;
            }
            else if (password.length < 8) {
                alert("Password must be at least 8 characters long.");
                return false;
            }
            else if (!/[A-Z]/.test(password)) {
                alert("Password must contain at least one uppercase letter.");
                return false;
            }
            else if (!/[a-z]/.test(password)) {
                alert("Password must contain at least one lowercase letter.");
                return false;
            }
            else if (!/\d/.test(password)) {
                alert("Password must contain at least one number.");
                return false;
            }
            else if (!/[@#$%^&+=]/.test(password)) {
                alert("Password must contain at least one special character (@, #, $, %, ^, &, +, or =).");
                return false;
            }
            else{
                alert("register successful")
                return true;
            }
        }
    </script>
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
                    <form id="myForm" onsubmit="return validateForm()" action="user?page=register" method="post">
                        <input type="text" class="login-input" id="userName" name="userName" placeholder="Enter Username">
                        <input type="password" class="login-input" id="password" name="password" placeholder="Password">
                        <div class="d-flex justify-content-center align-items-center">
                            <button type="submit" class="btn btn-primary btn-Login-login">Register</button>
                        </div>
                        <div class="d-flex justify-content-center align-items-center">
                            <a href="user?page=logins"><button type="button" class="btn btn-secondary btn-Signup-login">Already registered?</button></a>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>

