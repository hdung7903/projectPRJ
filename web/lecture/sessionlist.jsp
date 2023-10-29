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
                 <form action="${pageContext.request.contextPath}/lecture/sessionlist" method="get">
                    Date: <input type="date" name="date" />
                    <input type="submit" value="Submit" class="btn btn-primary mb-2"/>
                </form>
                <table class="table table-striped">
                    <thead class="thead-dark">
                        <tr>
                            <th>ID</th>
                            <th>Date</th>
                            <th>Time</th>
                            <th>Group</th>
                            <th></th>
                        </tr>
                    </thead>
                   <tbody>
                        <c:forEach var="ses" items="${sessions}">
                            <tr>
                                <td>${ses.id}</td>
                                <td>${ses.date}</td>
                                <td>${ses.time.description}</td>
                                <td>${ses.group.name}</td>    
                                <td><a href="${pageContext.request.contextPath}/takeatt?id=${ses.id}" class="btn btn-primary">View Attendance</a></td> 
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </body>
</html>
