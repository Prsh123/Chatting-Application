<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Chatter List</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
        integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
  <style>
    .container {
      margin: 0 auto;
      max-width: 500px;
      padding: 0 20px;
      padding-top: 60px;
    }
    .table {
      border-collapse: collapse;
    }
    .table th, .table td {
      padding: 10px;
      text-align: center;
      border: 1px solid #ccc;
    }
    .table th {
      background-color: #ffffff;
      color: #000000;
      padding: 20px;
    }
    .table a {
      text-decoration: none;
      color: black;
    }
    .table a:hover {
      text-decoration: underline;
    }
  </style>
</head>
<body>
<%@ include file="../includes/nav.jsp" %>
<div class="container">
  <table class="table table-striped table-light">
    <thead>
    <tr>
      <th scope="col">Rooms</th>
      <th scope="col"></th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="room" items="${roomList}">
      <tr>
        <td>${room.roomName}</td>
        <td><a href="user?page=roomLogin2&roomName=${room.roomName}" style="color: black;">Start Chatting</a></td>
      </tr>
    </c:forEach>
    </tbody>
  </table>
</div>
</body>
</html>
