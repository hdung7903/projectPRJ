<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>My Page</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
        <style>
             body {
                background-image: url('https://cdn.discordapp.com/attachments/947741416992436235/1171432282452668487/thumb.png?ex=655ca854&is=654a3354&hm=ddfa52e3206e4b8b9a31d219bf0c5fdd0b3d505b2a096754bb84ed171b0cda7a&');
                background-size: cover;
                background-repeat: no-repeat;
                background-position: 50% 0%;
            }
            .navbar {
                box-shadow: 0 2px 4px rgba(0,0,0,.1);
                background-color: rgba(255,255,255,0.9);
            }
        </style>
        <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
    </head>
    <body>
        <div class="container-fluid">
            <nav class="navbar navbar-expand-lg navbar-light bg-light mt-3">
                <a class="navbar-brand">My Page</a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarNav">
                    <ul class="navbar-nav ml-auto">
                        <li class="nav-item">
                            <a class="nav-link" href="#" data-toggle="modal" data-target="#loginModal">Login</a>
                        </li>                    
                    </ul>
                </div>
            </nav>            
        </div>
        <%@include file="./modal/login.jsp"  %>
    </body>
</html>
