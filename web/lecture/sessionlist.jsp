<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Session List</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
        <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
         <style>
            body {
                background-color: #f8f9fa;
            }
            .navbar {
                box-shadow: 0 2px 4px rgba(0,0,0,.1);
            }
            .table-container {
                background-color: white;
                border-radius: 15px;
                box-shadow: 0 2px 4px rgba(0,0,0,.1);
                padding: 20px;
                margin-bottom: 20px;
            }
        </style>
    </head>
    <body>
        <div class="container-fluid">
            <%@include file="../partial/navbar.jsp"  %>
            <div class="container mt-3">
                <h1>Session List</h1>
                <div class="form-floating">
                <form action="${pageContext.request.contextPath}/lecture/sessionlist" method="get">
                    <div class="input-group mb-3 w-25 p-1">
                    <label for="from" class="mr-2">Date</label>
                    <input type="date" id="date" name="date" value="${requestScope.date}" class="form-control mr-3" style="width:20px"/>
                    <input type="hidden" value="${param.id}" name="id" required />
                    <input type="submit" value="Submit" class="btn btn-primary mb-2"/>
                    </div>
                </form>
                </div>
                <table class="table table-striped">
                    <thead class="thead-dark">
                        <tr>
                            <th>Date</th>
                            <th>Time Slot</th>
                            <th>Group</th>
                            <th></th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:if test="${not empty sessions}">
                            <c:forEach var="ses" items="${sessions}">
                                <tr>
                                    <td>${ses.date}</td>
                                    <td>${ses.time.description}</td>
                                    <td>${ses.group.name}</td>    
                                    <c:choose>
                                        <c:when test="${ses.isAtt == true}">
                                            <td><a href="${pageContext.request.contextPath}/lecture/viewatt?id=${ses.id}" class="btn btn-primary">View Attendance</a></td>
                                        </c:when>
                                        <c:otherwise>
                                            <td><a href="${pageContext.request.contextPath}/lecture/takeatt?id=${ses.id}" class="btn btn-primary">Take Attendance</a></td>
                                        </c:otherwise>
                                    </c:choose>
                                </tr>
                            </c:forEach>
                        </c:if>
                        <c:if test="${empty sessions}">
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
