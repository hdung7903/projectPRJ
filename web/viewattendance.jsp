<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Take Report</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
        <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
    </head>
    <body>
        <div class="container-fluid">
            <%@include file="./partial/navbar.jsp"  %>
            <div class="container mt-3">
                <h1 class="text-center mb-4">Attendance Report</h1>
                <h4>Class:SE1753</h4>
                <h4>Room:BE201</h4>
                <h4>Record time: 12:50PM 04/10/2023 </h4>
                <table class="table" border="1">
                    <thead>
                        <tr>
                            <th scope="col">No</th>
                            <th scope="col">Class</th>
                            <th scope="col">Student ID</th>
                            <th scope="col">Status</th>
                            <th scope="col">Comment</th>
                            <th scope="col">Taker</th>                            
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <th scope="row">1</th>
                            <td>Class A</td>
                            <td>12345</td>
                            <td>Active</td>
                            <td>Good student</td>
                            <td>John Doe</td>                            
                        </tr>
                    </tbody>
                </table> 
            </div>
        </div>
    </body>
</html>
