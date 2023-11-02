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
    </head>
    <body>
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <div class="collapse navbar-collapse" id="navbarNav">
                <c:choose>
                    <c:when test="${sessionScope.role =='Instructor'}">
                        <ul class="navbar-nav mr-auto">
                            <li class="nav-item active">
                                <a class="nav-link" href="${pageContext.request.contextPath}/lecture">Home <span class="sr-only">(current)</span></a>
                            </li>                                     
                            <li class="nav-item">
                                <a class="nav-link" href="${pageContext.request.contextPath}/lecture/schedule?id=${sessionScope.id}">Schedule</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="${pageContext.request.contextPath}/lecture/takeatt">Take Attendance</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="${pageContext.request.contextPath}/lecture/viewatt">View Attendance</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="${pageContext.request.contextPath}/lecture/statistic">Statistic Report</a>
                            </li>
                        </ul>                     
                    </c:when>
                    <c:when test="${sessionScope.role=='Student'}">
                        <ul class="navbar-nav mr-auto">
                            <li class="nav-item active">
                                <a class="nav-link" href="${pageContext.request.contextPath}/student${sessionScope.id}">Home <span class="sr-only">(current)</span></a>
                            </li>                                     
                            <li class="nav-item">
                                <a class="nav-link" href="${pageContext.request.contextPath}/student/schedule">Schedule</a>
                            </li>
                        </ul> 
                    </c:when>
                </c:choose>
                <ul class="navbar-nav ml-auto">
                    <c:if test="${sessionScope.displayname!=null}">
                        <li class="nav-item">
                            <a class="nav-link">${sessionScope.displayname}</a>
                        </li> 
                    </c:if>
                    <c:if test="${sessionScope.displayname==null}">
                        <li class="nav-item">
                            <a class="nav-link"></a>
                        </li> 
                    </c:if>
                    <li class="nav-item">
                        <a class="nav-link" data-toggle="modal" data-target="#logoutModal">Log Out</a>
                    </li>
                </ul>
            </div>
        </nav>

        <!-- Logout Modal HTML -->
        <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="logoutModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="logoutModalLabel">Confirm Logout</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        Are you sure you want to log out?
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
                        <form action="logout" method="post">    
                            <a class="btn btn-primary" id="confirmLogout" href="<%= request.getContextPath() %>/">Logout</a>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
