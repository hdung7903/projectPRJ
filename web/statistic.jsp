<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
        <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
    </head>
    <body>
        <div clas="container-fluid">
            <%@include file="./partial/navbar.jsp"  %>
            <div class="container mt-3">
                <h1>Class List</h1>
                <table class="table">
                    <thead>
                        <tr>
                            <th scope="col">Semester</th>
                            <th scope="col">Major</th>
                            <th scope="col">Class</th>
                        </tr>
                    </thead>
                    <tbody>
                       
                        <tr>
                            <td>Major 4</td>
                            <td>Software Engineer</td>
                            <td>SE1753</td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </body>
</html>
