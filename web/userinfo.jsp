<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
        <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
    </head>
    <body>
        <div class="container-fluid">
            <%@include file="./partial/navbar.jsp"  %>        
            <div class="container">
                <div class="container mt-3">
                    <h1>User Information</h1>
                    <table class="table table-bordered table-striped">
                        <tbody>
                            <tr>
                                <td class="col-3">ID</td>
                                <td class="col-9">1</td>
                            </tr>
                            <tr>
                                <td class="col-3">Name</td>
                                <td class="col-9">John Doe</td>
                            </tr>
                            <tr>
                                <td class="col-3">Email</td>
                                <td class="col-9">johndoe@example.com</td>
                            </tr>
                            <tr>
                                <td class="col-3">Role</td>
                                <td class="col-9">Teacher</td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </body>
</html>
