<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<%
  HttpSession session1 = request.getSession(false);
  String roomName = (String) session1.getAttribute("roomName");
%>
<html>
<head>
  <title>Room Login</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
</head>
<body>
<%@ include file="../includes/nav.jsp" %>
<div class="container mt-5">
  <div class="row justify-content-center">
    <div class="col-md-6">
      <div class="card">
        <div class="card-header">Room Login</div>
        <div class="card-body">
          <form action="user?page=roomsLogin&roomName=<%=roomName%>" method="post">
            <div class="form-group">
              <p style="font-size: 24px; font-weight: bold;">RoomName: <%=roomName%></p>
            </div>
            <div class="form-group">
              <label for="password">Password</label>
              <input type="password" class="form-control" id="password"  name = "password" placeholder="Password">
            </div>
            <button type="submit" class="btn btn-primary">Submit</button>
            <a href="user?page=newRoom"><button type ="button" class="btn btn-primary">Register</button></a>
          </form>
        </div>
      </div>
    </div>
  </div>
</div>
</body>
</html>