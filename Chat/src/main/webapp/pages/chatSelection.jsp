<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Chat Type</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f0f0;
            text-align: center;
            margin: 0;
            padding: 0;
        }

        .container {
            display: flex;
            flex-direction: column;
            align-items: center;
            margin-top: 70px;;
        }

        h1 {
            font-size: 28px;
        }

        .button-container {
            margin-top: 20px;
        }

        .chat-button {
            display: inline-block;
            margin: 10px;
            padding: 10px 20px;
            font-size: 18px;
            background-color: #6BB9D6;
            color: #fff;
            text-decoration: none;
            border: none;
            cursor: pointer;
            border-radius: 5px;
            width: 263px;
        }

        .private {
            height: 150px;
        }

        .group {
            height: 150px;
        }
    </style>
</head>
<body>
<%@ include file="../includes/nav.jsp" %>
<div class="container">
    <h1>Welcome to the Chat Application</h1>
    <div class="button-container">
        <img src="assets/private.jpg " class="private">
        <a class="chat-button" href="user?page=chatFriend&user1=${userName}">Direct Message with Friends</a>
        <img src="assets/group.jpg " class="group">
        <a class="chat-button" href="user?page=roomLogin">Group Chat with Friends</a>
    </div>
</div>

</body>
</html>
