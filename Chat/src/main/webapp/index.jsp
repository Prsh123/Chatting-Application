<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>LOGIN</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="icon" type="image/x-icon" href="assets/favicon.ico">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <style>
        body {
            margin: 0;
            padding: 0;
            display: flex;
            flex-direction: column;
            min-height: 100vh;
        }
        .man-image{
            height:auto;
            width:759px;
        }
        .description li{
            padding: 20px;
        }
        .hero{
            list-style: none;
        }
        .arrow{
            padding-left: 10px;
            height:29px;
            width: 39px;
        }
        .btn-Start{
            background-color: #6BB9D6 !important;
            font-size: 24px !important;
            color: #000000 !important;
            height: 78px !important;
            width: 320px !important;
            border-radius: 20px !important;
            border: none !important;
        }
        .manga{
            padding: 50px;
        }
        .line{
            margin-left: 34px;
            margin-right: 34px;
            height:87px;
        }
        .rating{
            height: 74px;
            width: 182px
        }
        .message-example{
            width:425px;
            height: 87px;
        }
        .happy{
            margin-top: auto;
            margin-bottom: auto;
            margin-left: 40px;
        }
        .happy-chatters{
            height:87.01px;
            width:209px;
            margin-right: 27px;
        }
        .container-content {
            flex: 1;
        }
    </style>
</head>
<body>
<%@ include file="/includes/nav-1.jsp" %>
<div class="container-content">
    <div class="container">
        <div class="hero row">
            <div class="col-lg-7">
                <img src="assets/image1.jpg" alt = "man"  class="man-image">
            </div>
            <div class="col-lg-5">
                <div class="row">
                    <div class="description">
                        <li><p style="font-size: 36px">Start chatting with your friends, colleagues, and customers, anytime, anywhere</p></li>
                        <li><p style="font-size: 20px">Great software that allows you to Chat from any place at any time without any interruption.</p></li>
                        <li><a href="user?page=logins"><button class="btn btn-tertiary btn-Start">Start chatting Now<img src="assets/arrow.png" class="arrow" ></button></a></li>
                    </div>
                </div>
            </div>
        </div>
        <div class="manga row">
            <div class="col-lg-2">
                <img src="assets/2-profiles.png" class="happy-chatters" alt="Happy chatters">
            </div>
            <div class="happy col-lg-2">
                <p style ="font-size: 24px;color:#CE4DEB">Millions of</p>
                <p style="font-size: 18px;color:#CE4DEB;">happy chatters</p>
            </div>
            <div class="rating col-lg-3">
                <div class="row">
                    <div class="rating col-lg-2">
                        <img src="assets/line.png" alt="rating" class="line">
                    </div>
                    <div class="rating col-lg-10">
                        <img src="assets/rating.png" alt="rating" class="rating">
                    </div>
                </div>
            </div>
            <div class="message-example col-lg-4">
                <img src="assets/message-example.png" alt="message example" class="message-example">
            </div>
        </div>
    </div>
</div>
</body>
</html>