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
            <%@include file="../partial/navbar.jsp"  %>
            <div class="mt-3">
                <h1 class="text-center">Attendance Statistic</h1>
                <div class="table-responsive">
                <table class="table table-striped table-bordered text-center" style="max-width: 800px; margin: auto;">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Name</th>
                            <c:forEach var="i" begin="1" end="20">
                                <th>Slot ${i}</th>
                            </c:forEach>
                            <th>Absent %</th> 
                            <th>Report</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td></td>
                            <td></td>
                            <c:forEach var="i" begin="1" end="20">
                                <c:set var="attendanceStatus" value="P" />
                                <c:if test="${i % 5 == 0}">
                                    <c:set var="attendanceStatus" value="A" />
                                    <c:set var="absentCount" value="${absentCount + 1}" />
                                </c:if>
                                <c:if test="${i  == 18}">
                                    <c:set var="attendanceStatus" value="A" />
                                    <c:set var="absentCount" value="${absentCount + 1}" />
                                </c:if>
                                <td>${attendanceStatus}</td>
                            </c:forEach>
                            <c:set var="absentPercentage" value="${(absentCount / 20) * 100}" />
                            <c:set var="color" value="${absentPercentage < 25 ? 'blue' : 'red'}" />
                            <td style="color: ${color};">${String.format('%.2f', absentPercentage)}%</td>
                            <c:set var="mess" value="${absentPercentage < 25 ? '-' : 'Warning'}" />
                            <c:set var="color2" value="${absentPercentage < 25 ? 'black' : 'yellow'}" />
                            <td>
                                <c:choose>
                                    <c:when test="${absentPercentage >= 25}">
                                        <a href="mailto:recipient@example.com?subject=Warning: High Absentee Percentage" style="color: ${color2};">Warning</a>
                                    </c:when>
                                    <c:otherwise>
                                        -
                                    </c:otherwise>
                                </c:choose>
                            </td>
                        </tr>                       
                    </tbody>
                </table>
                </div>
            </div>
        </div>
    </body>
</html>
