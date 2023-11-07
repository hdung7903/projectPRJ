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
                background: #f1f1f1;
            }

            .container {
                background: #fff;
                border-radius: 10px;
                box-shadow: 0 0 10px rgba(0,0,0,0.1);
                padding: 30px;
            }

            .btn-primary {
                background: #007bff;
                border: none;
            }

            .btn-primary:hover {
                background: #0062cc;
            }

            h1 {
                color: #007bff;
            }

            .table {
                background: #fff;
                box-shadow: 0 0 5px rgba(0,0,0,0.05);
            }

        </style>
    </head>
    <body>
        <div class="container-fluid">
            <%@include file="../partial/navbar.jsp"  %>
            <div class="container my-5">
                <h1>Group List</h1>
                <table class="table table-striped">
                    <thead class="thead-dark">
                        <tr>
                            <th>Group</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:choose>
                            <c:when test="${not empty groups}">
                                <c:forEach var="g" items="${groups}">
                                    <tr>                                    
                                        <td>${g.name}</td>
                                        <td><a href="${pageContext.request.contextPath}/lecture/statistic?id=${g.id}" class="btn btn-primary">View Statistic</a></td>
                                    </tr>
                                </c:forEach>
                            </c:when>
                            <c:otherwise>
                                <tr>
                                    <td colspan="2">No groups found</td>
                                </tr>
                            </c:otherwise>
                        </c:choose>
                    </tbody>
                </table>
            </div>
        </div>
    </body>
</html>
</html>
