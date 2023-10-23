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
        <div class="container-fluid">
            <%@include file="../partial/navbar.jsp"  %>
            <div class="container mt-3">
                <h1>Class List</h1>
                <table summary="Select a group" border="0">
                    <caption>Select a course, then a group ...</caption>
                    <thead>
                        <tr>
                            <th scope="col">Term</th>
                            <th scope="col">Department</th>
                            <th scope="col">Course</th>
                            <th scope="col">Group</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td valign="top"><a href="#">Fall2023</a></td>
                            <td valign="top"><a href="#">Computer Science</a></td>
                            <td valign="top"><a href="#">Data Structures and Algorithms (CSD201)</a></td>
                            <td valign="top"><a href="#">PRJ301.E1</a></td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </body>
</html>
