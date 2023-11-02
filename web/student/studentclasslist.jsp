<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
            <%@include file="../partial/navbar.jsp"  %>
            <div class="container mt-3">
                <h1>Class List</h1>
                <form action="${pageContext.request.contextPath}/student/classlist" method="get">
                    Date: <input type="date" name="date" />
                    <input type="text" value="${param.id}" name="id" required />
                    <input type="submit" value="Submit" class="btn btn-primary mb-2"/>
                </form>
                <table class="table table-striped">
                    <thead class="thead-dark">
                        <tr>
                            <th>Group</th>
                            <th>Subject</th>
                            <th>Time Slot</th>
                            <th>Group</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:if test="${not empty groups}">
                            <c:forEach var="g" items="${groups}">
                                <tr>
                                    <td>${g.name}</td>
                                    <td>${g.subject.name}</td>
                                    <td>${g.timeslot.description}</td>    
                                    <c:choose>
                                        <c:when test="${g.attendance.status == true}">
                                            <td>Present</td>
                                        </c:when>
                                        <c:when test="${g.attendance.status == false}">
                                            <td>Absent</td>
                                        </c:when>
                                    </c:choose>
                                </tr>
                            </c:forEach>
                        </c:if>
                        <c:if test="${empty groups}">
                            <tr>
                                <td colspan="4">No sessions found</td>
                            </tr>
                        </c:if>
                    </tbody>
                </table>
            </div>
        </div>
    </body>
</html>
</html>
