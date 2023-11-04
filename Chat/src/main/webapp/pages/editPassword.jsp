<%@ page import="com.example.demo.PasswordHashing.HashPassword" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    HttpSession session1 = request.getSession(false);
    String userPassword = (String) session1.getAttribute("UserPassword");
%>
<html>
<head>
    <title>Edit</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
          integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <script type="text/javascript">
        function validateForm() {
            var oldpassword = document.getElementById('old-password').value;
            var userPassword = '<%=userPassword%>';
            HashPassword.hash(userPassword);
            if (oldpassword === userPassword) {
                return true;
            } else {
                alert("old password is incorrect")
                return false;
            }
        }
    </script>
</head>

<body>
<%@ include file="../includes/nav.jsp" %>
<form id="myForm" onsubmit="return validateForm()" action="user?page=editedPassword&userName=${UserDetail.username}"
      method="post">
    <p style="font-size: 24px;">${UserDetail.username}</p>
    <input type="password" name="old-password" id="old-password" name="old-password" placeholder="Old Password">
    <input type="password" name="new-password" id="new-password" name="new-password" placeholder="New Password">
    <button type="submit" class="btn btn-primary">Submit</button>
</form>
</body>
</html>
