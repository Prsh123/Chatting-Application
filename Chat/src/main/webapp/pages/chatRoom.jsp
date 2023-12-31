<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    HttpSession session1 = request.getSession(false);
    String roomName = (String) session1.getAttribute("roomName");
    String userName = (String) session1.getAttribute("userName");
%>
<html>
<head>
    <title><%=roomName%></title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css"
          integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"
            integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
    <style>
        body-b {
            margin: 0 auto;
            max-width: 1500px;
            padding: 0 20px;
            display: flex;
            justify-content: center;
            align-items: center;
        }
        .container {
            border: 2px solid #dedede;
            background-color: #f1f1f1;
            border-radius: 5px;
            padding: 10px;
            margin: 10px 0;
        }
        .container2 {
            border: 2px solid #f5f5f5;
            background-color: #b1e8ff;
            border-radius: 5px;
            padding: 10px;
            margin: 10px 0;
        }
        .container::after {
            content: "";
            clear: both;
            display: table;
        }
        .ex1 {
            height: 420px;
            overflow-y: scroll;
        }
        .form-control {
            margin-top: 10px;
            margin-bottom: 5px;
        }
        .bg-i {
            background-color: #8de6f5!important;
        }
        form {
            max-width: 400px;
            padding: 5px;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        input[type="file"] {
            margin-bottom: 10px;
        }

        input[type="submit"] {
            background-color: #4caf50;
            color: #fff;
            padding: 10px 15px;
            border: none;
            border-radius: 3px;
            cursor: pointer;
        }

        input[type="submit"]:hover {
            background-color: #45a049;
        }
    </style>
    <script>
        setInterval(loadmessage, 1000);
        function loadmessage() {
            $.post("pages/loadMessage.jsp", {roomName: '<%=roomName%>'}, function (data, status) {
                document.getElementsByClassName("ex1")[0].innerHTML = data;
            }).fail(function (xhr, status, error) {
                console.log("AJAX Error: " + error);
            });
        }
        function deleteMessage(messageId) {
            $.post("DeleteMessageServlet", { messageId: messageId }, function (data, status) {
                $("#message_" + messageId).remove();
            }).fail(function (xhr, status, error) {
                console.log("AJAX Error: " + error);
            });
        }
        $(document).ready(function () {
            var inputbox = document.getElementById("message");
            inputbox.addEventListener('keyup', function (event) {
                if (event.key === 13) {
                    $("#send").click();
                }
            });

            $("#send").click(function () {
                var message = $("#message").val();
                $.post("pages/sendMessage.jsp", {
                    roomName: '<%=roomName%>',
                    message: message,
                    userName: '<%=userName%>'
                }, function (data, status) {
                    $("#message").val("");
                });
            });
        });
    </script>
</head>
<body>
<%@ include file="../includes/nav.jsp" %>
<div class="body-b">
    <div class="container">
        <div class="row">
            <div class="col">
                <p style="font-size: 24px; font-weight: bold;"><%out.println("Welcome: " + roomName);%></p>
            </div>
        </div>
        <div class="row">
            <div class="col-12">
                <div class="ex1">

                </div>
                <div class="form-group d-flex">
                    <input type="text" class="form-control flex-grow-1" id="message" name="message" placeholder="Type message here">
                    <input type="submit" value="send" id="send" class="form-control w-25 bg-i ml-2">
                </div>
                <form action="UploadServlet" method="post" enctype="multipart/form-data">
                    <input type="hidden" id="userName" name="userName" value="<%=userName%>">
                    <input type="hidden" id="roomName" name="roomName" value="<%=roomName%>">
                    <input type="file" name="fileInput" id="fileInput" accept="image/jpeg">
                    <input type="submit" value="Upload">
                </form>

            </div>
        </div>
    </div>
</div>
</body>
</html>
