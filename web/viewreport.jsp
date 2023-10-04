<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View Report</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
        <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
    </head>
    <body>
        <div class="container-fluid">
            <%@include file="./partial/navbar.jsp"  %>
            <div class="container mt-3">
                <div class="row">
                    <div class="col-md-3">
                        <table class="table table-bordered">
                            <thead>
                            <th>Semester</th>                     
                            </thead>
                            <tbody>
                                <tr>
                                    <td><a href="#">Semester 1</a></td>
                                </tr>
                                <tr>
                                    <td><a href="#">Semester 2</a></td>
                                </tr>
                                <tr>
                                    <td><a href="#">Semester 3</a></td>
                                </tr>
                                <tr>
                                    <td><a href="#">Semester 4</a></td>
                                </tr>
                                <tr>
                                    <td><a href="#">Semester 5</a></td>
                                </tr>
                                <tr>
                                    <td><a href="#">Semester 6</a></td>
                                </tr>
                                <tr>
                                    <td><a href="#">Semester 7</a></td>
                                </tr>
                                <tr>
                                    <td><a href="#">Semester 8</a></td>
                                </tr>
                                <tr>
                                    <td><a href="#">Semester 9</a></td>
                                </tr>
                                <tr>
                                    <td><a href="#">Semester 10</a></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <div class="col-md-3">
                        <table class="table table-bordered">
                            <thead>
                                <tr>
                                    <th>Course</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td><a href="#">Course 1</a></td>
                                </tr>
                                <tr>
                                    <td><a href="#">Course 1</a></td>
                                </tr>
                                <tr>
                                    <td><a href="#">Course 1</a></td>
                                </tr>
                                <tr>
                                    <td><a href="#">Course 1</a></td>
                                </tr>
                                <tr>
                                    <td><a href="#">Course 1</a></td>
                                </tr>
                                <tr>
                                    <td><a href="#">Course 1</a></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
