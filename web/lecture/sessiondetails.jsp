<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Session Information</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
        <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
    </head>
    <body> 
        <div class="container-fluid">
            <%@include file="../partial/navbar.jsp"%>
            <div class="container mt-3">
                <h1 class="text-center mb-4">Session Information</h1>
                <div class="container mt-3">
                    <table class="table table-striped table-bordered">                
                        <tr>
                            <th>Group</th>
                            <td>${requestScope.ses.group.name}</td>
                        </tr>
                        <tr>
                            <th>Subject</th>
                            <td>${requestScope.ses.subject.name}</td>                                
                        </tr>  
                        <tr>
                            <th>Room</th>
                            <td>${requestScope.ses.room.rid}</td>                                
                        </tr>  
                        <tr>
                            <th>Time Description</th>
                            <td>${requestScope.ses.time.description}</td>
                        </tr>
                        <tr>
                            <th>Lasted Update</th>
                            <td>                                
                               <fmt:formatDate value="${requestScope.attDateTime}" pattern="HH:mm dd-MM-yyyy" />
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
    </body>
</html>
