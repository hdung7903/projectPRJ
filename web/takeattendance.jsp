<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Class List</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
        <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
    </head>
    <body>
        <div class="container-fluid">
            <%@include file="./partial/navbar.jsp"  %>
            <div class="container mt-3">
                <h1 class="text-center mb-4">Attendance Sheet</h1>
                <table class="table" border="1">
                    <thead>
                        <tr>
                            <th scope="col">No</th>
                            <th scope="col">Student ID</th>
                            <th scope="col">Name</th>
                            <th scope="col">Status</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <th scope="row">1</th>
                            <td>12345</td>
                            <td>John Doe</td>
                            <td>                               
                                <div class="form-check form-check-inline">
                                    <input class="form-check-input" type="radio" name="status1" id="absent1" value="absent" checked>
                                    <label class="form-check-label" for="absent1">
                                        Absent
                                    </label>
                                </div>
                                <div class="form-check form-check-inline">
                                    <input class="form-check-input" type="radio" name="status1" id="present1" value="present">
                                    <label class="form-check-label" for="present1">
                                        Present
                                    </label>
                                </div>                                                                  
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>  
        </div>
    </body>
</html>
