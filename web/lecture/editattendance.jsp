<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit Attendance</title>
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
                <div class="d-flex justify-content-center">
                    <div class="col-md-8">
                        <h5 class="mb-3 text-center">
                            Group: ${requestScope.ses.group.name}<br>
                            Subject:${requestScope.ses.subject.name}<br>
                            Room: ${requestScope.ses.room.rid}<br>
                            Time Slot: ${requestScope.ses.time.description}<br>
                        </h5>
                        <form action="${pageContext.request.contextPath}/lecture/editatt" method="POST">
                            <table class="table table-bordered">
                                <thead class="thead-dark">
                                    <tr>
                                        <th>Student</th>
                                        <th>Image</th>
                                        <th>Status</th>
                                        <th>Description</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach items="${requestScope.atts}" var="a">
                                        <tr>
                                            <td>${a.student.name}
                                                <input type="hidden" name="stuid" value="${a.student.id}"/>
                                            </td>
                                            <td><img src="../image/profile.png" alt="" style="width: 50px;"/></td>
                                            <td>
                                                <div class="form-check form-check-inline">
                                                    <input class="form-check-input" type="radio"
                                                           <c:if test="${!a.status}">
                                                               checked="checked"
                                                           </c:if>
                                                           name="status${a.student.id}" value="absent"/>
                                                    <label class="form-check-label">Absent</label>
                                                </div>
                                                <div class="form-check form-check-inline">
                                                    <input class="form-check-input" type="radio"
                                                           <c:if test="${a.status}">
                                                               checked="checked"
                                                           </c:if>
                                                           name="status${a.student.id}" value="present"/>
                                                    <label class="form-check-label">Present</label>
                                                </div>
                                            </td>
                                            <td>
                                                <input type="text" class="form-control" value="${a.description}"
                                                       name="description${a.student.id}"/>
                                            </td>
                                        </tr>   
                                    </c:forEach>
                                </tbody>
                            </table>
                            <input type="hidden" value="${requestScope.ses.id}" name="sesid"/>
                            <button type="submit" class="btn btn-primary">Save</button>
                        </form>
                    </div> 
                </div>
            </div>
        </div>                           
    </body>
</html>
