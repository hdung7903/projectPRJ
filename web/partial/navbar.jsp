<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
            .nav-link {
                color: #f8f9fa !important;
            }
            .nav-link:hover {
                color: #adb5bd !important;
            }
        </style>
    </head>
    <body>
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav">                    
                    <li class="nav-link px-2 text-secondary">                                
                        <a class="nav-link" href="${pageContext.request.contextPath}/home">Home <span class="sr-only">(current)</span></a>
                    </li>                                     
                    <li class="nav-link px-2 text-secondary">
                        <a class="nav-link" href="${pageContext.request.contextPath}/lecture/schedule?id=${sessionScope.id}">Schedule</a>
                    </li>
                    <li class="nav-link px-2 text-secondary">
                        <a class="nav-link" href="${pageContext.request.contextPath}/lecture/sessionlist?id=${sessionScope.id}">Attendance</a>
                    </li>
                    <li class="nav-link px-2 text-secondary">
                        <a class="nav-link" href="${pageContext.request.contextPath}/lecture/grouplist?id=${sessionScope.id}">Statistic Report</a>
                    </li>
                </ul>                                         
                <ul class="navbar-nav ml-auto">
                    <c:if test="${sessionScope.displayname!=null}">
                        <li class="nav-link px-2 text-secondary">
                            <a class="nav-link">Hi,${sessionScope.displayname}</a>
                        </li> 
                    </c:if>
                    <c:if test="${sessionScope.displayname==null}">
                        <li class="nav-link px-2 text-secondary">
                            <a class="nav-link"></a>
                        </li> 
                    </c:if>
                    <li class="nav-link px-2 text-secondary">
                        <a class="nav-link" data-toggle="modal" data-target="#logoutModal">Log Out</a>
                    </li>
                </ul>
            </div>
        </nav>

    </body>
    <%@include file="../modal/logout.jsp" %>
</html>
