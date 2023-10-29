
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Statistic</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
        <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
    </head>
    <body>
        <div class="container-fluid">
            <%@include file="../partial/navbar.jsp"%>
            <div class="mt-3">
                <h1 class="text-center">Attendance Statistic</h1>
                <div class="table-responsive">
                    <table class="table table-striped table-bordered text-center" style="max-width: 800px; margin: auto;">
                        <tr>
                            <th>Group Name</th>
                            <th>Student ID</th>
                            <th>Student Name</th>
                            <th>Session ID</th>
                            <th>Status</th>
                        </tr>
                        <c:forEach var="attendance" items="${attendanceRecords}">
                            <tr>
                                <td>${attendance.group.name}</td>
                                <td>${attendance.student.id}</td>
                                <td>${attendance.student.name}</td>
                                <td>${attendance.session.id}</td>
                                <td>${attendance.status}</td>
                            </tr>
                        </c:forEach>
                    </table>
                </div>                                       
            </div>
        </div>
    </body>
</html>

