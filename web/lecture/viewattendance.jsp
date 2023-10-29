<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View Attendance</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
        <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>       
    </head>
    <body>
        <div class="container-fluid">
            <%@include file="../partial/navbar.jsp"%>
            <div class="container mt-3">
                <h1 class="text-center mb-4">Attendance Sheet</h1>
                <div class="container mt-3">
                    <h5 class="mb-3">
                        Group: ${requestScope.ses.group.name}<br>
                        Subject:${requestScope.ses.subject.name}<br>
                        Room: ${requestScope.ses.room.rid}<br>
                        Time Slot: ${requestScope.ses.time.description}<br>
                        Lasted Update: <fmt:formatDate value="${requestScope.attDateTime}" pattern="HH:mm dd-MM-yyyy" />
                    </h5>
                    <form action="att" method="POST">
                        <table class="table table-bordered mx-auto">
                            <thead class="thead-dark">
                                <tr>
                                    <th>Student</th>
                                    <th>Image</th>
                                    <th>Status</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${requestScope.atts}" var="a">
                                    <tr>
                                        <td class="text-center">${a.student.name}
                                            <input type="hidden" name="stuid" value="${a.student.id}"/>
                                        </td>
                                        <td class="text-center"><img src="../image/profile.png" alt="" style="width: 50px;"/></td>
                                        <td class="text-center">
                                            <c:choose>
                                                <c:when test="${a.status}">
                                                    <p style="color: green;">Present</p>
                                                </c:when>
                                                <c:otherwise>
                                                    <p style="color: red;">Absent</p>
                                                </c:otherwise>
                                            </c:choose>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                        <input type="hidden" value="${requestScope.ses.id}" name="sesid"/>
                        <a href="${pageContext.request.contextPath}/lecture/editatt?id=${ses.id}" class="btn btn-primary d-block mx-auto">Edit</a>
                    </form>
                </div>  
            </div>                            
    </body>
</html>

