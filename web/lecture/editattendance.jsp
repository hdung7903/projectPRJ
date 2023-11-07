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
        <style>
            body {
                background-color: #f2f2f2;
            }
            .container {
                background-color: white;
                border-radius: 5px;
                box-shadow: 0 0 10px #ccc;
                padding: 20px;
            }
            h1 {
                color: #007bff;
            }
            .table {
                background-color: white;
            }
            .btn {
                background-color: #007bff;
                color: white;
            }
            .btn:hover {
                background-color: #0062cc;
            }
        </style>
    </head>
    <body>
        <div class="container-fluid">
            <%@include file="../partial/navbar.jsp"%>
            <div class="container mt-3">
                <h1 class="text-center mb-4">Attendance Sheet</h1>
                <div class="card-body text-center">
                    <h5 class="card-title d-inline-block mr-2">Class: ${requestScope.ses.group.name}</h5>
                    <h5 class="card-title d-inline-block mr-2">Subject:${requestScope.ses.subject.name}</h5><br>
                    <h5 class="card-title d-inline-block mr-2">at:${requestScope.ses.room.rid}</h5>
                    <h5 class="card-title d-inline-block">Time Slot:${requestScope.ses.time.description}</h5>
                </div>
                <div class="row">
                    <div class="col-md-12">
                        <form action="${pageContext.request.contextPath}/lecture/editatt" method="POST">
                            <table class="table table-bordered">
                                <thead class="thead-dark">
                                    <tr class="text-center">
                                        <th>Student</th>
                                        <th><input type="checkbox" name="showimage" id="toggleImageCheckbox" onclick="toggleImages()" />Image</th>
                                        <th>Status</th>
                                        <th>Description</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach items="${requestScope.atts}" var="a">
                                        <tr class="text-center">
                                            <td>${a.student.name}
                                                <input type="hidden" name="stuid" value="${a.student.id}"/>
                                            </td>
                                            <td><img class="toggleImage" style="width: 50px; height: 50px;" src="https://cdn.discordapp.com/attachments/947741416992436235/1171005032691404921/profile.png?ex=655b1a6c&is=6548a56c&hm=428202d73c6b3e95f3b966e3840f79186e79afdc98a879ea0492fa4957d08806&" alt=""/></td>                                                                                                        
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
                            <button type="submit" class="btn btn-primary" >Save Attendance</button>
                        </form>
                    </div> 
                </div>
            </div>
        </div>
        <script>
            document.getElementById("toggleImageCheckbox").addEventListener("change", function () {
                var images = document.getElementsByClassName('toggleImage');
                for (var i = 0; i < images.length; i++) {
                    if (this.checked) {
                        images[i].style.display = "none";
                    } else {
                        images[i].style.display = "block";
                    }
                }
            });

        </script>
    </body>
</html>
