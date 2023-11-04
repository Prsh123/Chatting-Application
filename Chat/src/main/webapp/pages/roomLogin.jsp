<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
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
                    <form action="user?page=roomsLogin" method="post">
                        <div class="form-group">
                            <label for="roomName">Room Name</label>
                            <input type="text" class="form-control" id="roomName" name="roomName"placeholder="Enter Room Name">
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