<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>User Details</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
          integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <style>
        .container {
            margin: 0 auto;
            padding: 0 20px;
            padding-top: 60px;
        }
        .table {
            /*width: 100%; !* Full width within the container *!*/
            border-collapse: collapse;
        }
        .table th, .table td {
            padding: 10px;
            text-align: center;
            border: 1px solid #ccc;
        }
        .table th {
            padding: 20px;
        }
        .table a {
            text-decoration: none;
            color: black;
        }
    </style>
</head>
<body>
<%@ include file="../includes/nav.jsp" %>
<div class="container">
    <table class="table table-striped table-light">
        <thead>
        <tr>
            <th scope="col">User Name</th>
            <th scope="col">Password</th>
            <th scope="col">Edit Password</th>
        </tr>
        </thead>
        <tbody>
        <tr>
            <td>${UserDetail.username}</td>
            <td>${UserDetail.password}</td>
            <td> <a href="user?page=editPassword&id=${UserDetail.username}">Edit</a></td>
        </tr>
        </tbody>
    </table>
</div>
</body>
</html>
