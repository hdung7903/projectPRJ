<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
                <div class="container">
                    <h1 class="text-center">Attendance Statistic</h1>
                    <div class="table-responsive">
                        <table class="table table-bordered">
                            <thead>
                                <tr>
                                    <th>Student Name</th>
                                        <c:forEach var="i" begin="1" end="${totalSession}">
                                        <th>Session ${i}</th>
                                        </c:forEach>
                                    <th>Absent %</th>
                                    <th>Report</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="entry" items="${attendanceMap}">
                                    <c:set var="absentSessions" value="0" />
                                    <tr>
                                        <td>${entry.key}</td>
                                        <c:forEach var="status" items="${entry.value}">
                                            <td>
                                                <c:choose>
                                                    <c:when test="${status}">P</c:when>
                                                    <c:otherwise>
                                                        <c:set var="absentSessions" value="${absentSessions + 1}" />
                                                        A
                                                    </c:otherwise>
                                                </c:choose>
                                            </td>                                             
                                        </c:forEach>
                                        <c:forEach var="i" begin="${attended + 1}" end="${totalSession}">
                                            <td>-</td>
                                        </c:forEach>    
                                        <c:set var="totalSessions" value="${totalSession}" />
                                        <c:set var="absentPercent" value="${(absentSessions / totalSessions) * 100}" />
                                        <td style="color: ${absentPercent < 20 ? "red" : "blue"};">${absentPercent}%</td>
                                        <td>
                                            <c:choose>
                                                <c:when test="${absentPercent >= 20}">
                                                    <a href="mailto:recipient@example.com?subject=Warning: High Absentee Percentage" style="color: yellow;">Warning</a>
                                                </c:when>
                                                <c:otherwise>-</c:otherwise>
                                            </c:choose>
                                        </td>

                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
