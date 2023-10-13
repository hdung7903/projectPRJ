<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
        <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
    </head>
    <style>
      

    </style>
    <body>
        <div class="container-fluid">
            <h1 class="text-center mb-4">            </h1>
            <nav class="navbar navbar-expand-sm bg-dark navbar-light sticky-top">
                <h1>Welcome to my page!</h1>
                <ul class="navbar-nav ml-auto">
                    <li class="nav-item">
                        <a class="btn btn-info split" href="#" data-toggle="modal" data-target="#loginModal">Sign In</a>
                    </li>
                    <li class="nav-item ml-2">
                        <button class="btn btn-info split" data-toggle="modal" data-target="#registerModal">Sign Up</button>
                    </li>
                </ul>
            </nav> 
            <div class="container">
                <div id="carouselExampleControls" class="carousel slide mt-4 mb-4" data-ride="carousel">
                    <div class="carousel-inner">
                        <div class="carousel-item active">
                            <img src="https://scontent.fhan2-4.fna.fbcdn.net/v/t39.30808-6/382226814_7441896912506512_1598362730259548959_n.png?_nc_cat=110&ccb=1-7&_nc_sid=52f669&_nc_ohc=L_DIY96d24wAX-lF4GM&_nc_ht=scontent.fhan2-4.fna&oh=00_AfCWn2GhfBuTKWeptLd9p3utJo2nvB6id0VvqV2iZYnl6A&oe=65244166" class="d-block w-100" alt="First Slide">
                        </div>
                        <div class="carousel-item">
                            <img src="https://scontent.fhan2-3.fna.fbcdn.net/v/t39.30808-6/310744903_6250747208288161_8821814777399000400_n.jpg?stp=cp6_dst-jpg&_nc_cat=102&ccb=1-7&_nc_sid=52f669&_nc_ohc=XOxBCLI67ZYAX8ZalQI&_nc_ht=scontent.fhan2-3.fna&oh=00_AfDf_RlaH6KjLgJLu0mr-zkURLNCyHk-2xb5HzPCX6CSxw&oe=6524431B" class="d-block w-100" alt="Second Slide">
                        </div>
                        <!-- Add more carousel items as needed -->
                    </div>
                    <a class="carousel-control-prev" href="#carouselExampleControls" role="button" data-slide="prev">
                        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                        <span class="sr-only">Previous</span>
                    </a>
                    <a class="carousel-control-next" href="#carouselExampleControls" role="button" data-slide="next">
                        <span class="carousel-control-next-icon" aria-hidden="true"></span>
                        <span class="sr-only">Next</span>
                    </a>
                </div>
            </div> 
            <%@include file="./partial/footer.jsp"  %>
        </div>
        <!-- Register Modal -->
        <%@include file="./modal/register.jsp"  %>

        <!-- Login Modal -->
        <%@include file="./modal/login.jsp"  %>

    </body>
</html>
