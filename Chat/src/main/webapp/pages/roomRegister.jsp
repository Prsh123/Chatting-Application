<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<html>
<head>
    <title>Room Register</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css"
          integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
    <script type="text/javascript">
        function displayAlert(message) {
            var alertDiv = document.getElementById('alertDiv');
            alertDiv.innerHTML = message;
            alertDiv.style.display = 'block';
        }
        function validateForm() {
            var password = document.getElementById('password').value;
            var roomName = document.getElementById('roomName').value;
            if (password === '' && roomName === '') {
                alert('email and password are required fields');
                return false;
            }
            else if (roomName===''){
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
</head>
<body>
<%@ include file="../includes/nav.jsp" %>
<div class="container mt-5">
    <div class="row justify-content-center">
        <div class="col-md-6">
            <div class="card">
                <div class="card-header">Room Register</div>
                <div class="card-body">
                    <form onsubmit="return validateForm()" action="user?page=roomsRegister" method="post">
                        <div class="form-group">
                            <label for="roomName">Room Name</label>
                            <input type="text" class="form-control" id="roomName" name="roomName"
                                   placeholder="Enter Room Name">
                        </div>
                        <div class="form-group">
                            <label for="password">Password</label>
                            <input type="password" class="form-control" id="password" name="password"
                                   placeholder="Password">
                        </div>
                        <button type="submit" class="btn btn-primary">Submit</button>
                        <a href="user?page=roomLogin">Already a member?</a>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
