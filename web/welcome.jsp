
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
    <body>
        <div clas="container-fluid">
            <div class="container mt-5">
                <h1 class="text-center mb-4">Welcome to my page!</h1>
                <div class="container">                   
                    <div class="border p-3 d-flex justify-content-around">
                        <a class="btn btn-outline-primary" href="#" data-toggle="modal" data-target="#loginModal">Sign In</a>
                        <a class="btn btn-outline-primary" href="#" data-toggle="modal" data-target="#registerModal">Sign Up</a>
                    </div>                  
                </div>             
            </div>
            <!-- Register Modal -->
            <%@include file="./modal/register.jsp"  %>
            <!-- Login Modal -->
            <%@include file="./modal/login.jsp"  %>
            
        <%@include file="./partial/footer.jsp"  %>
    </div>    
</body>
</html>
