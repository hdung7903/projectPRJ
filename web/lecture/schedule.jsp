<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Schedule</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
        <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>       
    </head>
    <body>
        <div class="container-fluid">
            <%@include file="../partial/navbar.jsp"  %>
            <div class="container mt-3">                   
                <h1 class="text-center mb-4">Timetable</h1>
                <form action="schedule" method="GET" class="form-inline justify-content-center mb-3">
                    <label for="from" class="mr-2">From</label>
                    <input type="date" id="from" name="from" value="${requestScope.from}" class="form-control mr-3"/>
                    <label for="to" class="mr-2">To</label>
                    <input type="date" id="to" name="to" value="${requestScope.to}" class="form-control mr-3"/>
                    <input type="text" value="${param.id}" name="id" required />
                    <button type="submit" class="btn btn-primary">View</button>
                </form>
                <table class="table table-bordered table-striped">
                    <thead>
                        <tr>
                            <th></th>
                                <c:forEach items="${requestScope.dates}" var="date">
                            <tr>
                                <td><fmt:formatDate value="${date}" pattern="EEEE dd-MM-yyyy" /></td>
                        </tr>
                    </c:forEach>
                    </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${requestScope.slots}" var="s">
                            <tr>
                                <td>${s.description}</td>
                                <c:forEach items="${requestScope.dates}" var="d">
                                    <td>
                                        <c:forEach items="${requestScope.sessions}" var="ses">
                                            <c:if test="${ses.time.id eq s.id and ses.date eq d}">
                                                ${ses.group.name}-${ses.subject.name}-${ses.room.rid}
                                            </c:if>
                                        </c:forEach>
                                    </td>
                                </c:forEach>
                            </tr>  
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>                            
    </body>
</html>
