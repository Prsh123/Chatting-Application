<html>
<head>
    <title>Title</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <style>
        .navbar-nav{
            margin:auto;
        }
        .navbar_logo{
            height:auto;
            width: 50px;
        }
        .btn-Login {
            background-color: #6BB9D6!important;
            padding: 0px 32px!important;
            height: 48px!important;
            border-radius: 20px!important;
            border: none !important;
            margin-right: 40px!important;
        }
        .btn-Signup {
            background-color: #6BB9D6!important;
            padding: 0px 32px!important;
            height: 48px!important;
            border-radius: 20px!important;
            border: none!important;
        }
    </style>
</head>
<body>
<nav class="navbar navbar-expand-lg" style="background-color: #D7F3FC;">
    <div class="container-fluid">
        <a class="navbar-brand" href="user?page=index"><img src="assets/logo.png " class="navbar_logo"></a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
            </ul>
            <a href="user?page=logins"><button type="button" class="btn btn-primary btn-Login">Login</button></a>
            <a href="user?page=newUser"><button class="btn btn-secondary btn-Signup">Signup</button></a>
        </div>
    </div>
</nav>
</body>
</html>
