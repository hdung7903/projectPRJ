<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
                <h1 class="text-center mb-4">Attendance Sheet</h1>
                <form method="post">
                    <div class="table-responsive">
                        <table class="table table-striped table-bordered mx-auto text-center">
                            <thead>
                                <tr>
                                    <th scope="col">Student</th>
                                    <th scope="col">Name</th>
                                    <th scope="col">Status</th>
                                    <th scope="col">Description</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${requestScope.atts}" var="a">
                                    <tr>
                                        <td>${a.student.name}
                                            <input type="hidden" name="stuid" value="${a.student.id}"/>
                                        </td>
                                        <td>
                                            <input type="radio"
                                                   <c:if test="${!a.status}">
                                                       checked="checked"
                                                   </c:if>
                                                   name="status${a.student.id}" value="absent"/>absent
                                            <input type="radio"
                                                   <c:if test="${a.status}">
                                                       checked="checked"
                                                   </c:if>
                                                   name="status${a.student.id}" value="present"/>present
                                        </td>
                                        <td>
                                            <input type="text" value="${a.description}"
                                                   name="description${a.student.id}"/>
                                        </td>
                                        <td>${a.datetime}</td>
                                    </tr>   

                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                    <div class="d-flex justify-content-center mt-3">
                        <button type="submit" class="btn btn-primary" id="submitButton">Submit</button>
                    </div>
                </form>
            </div>  
        </div>
    </body>
</html>
