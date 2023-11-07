<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Take Attendance</title>
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

            h1, h5 {
                color: #007bff;
            }

            th {
                background: #007bff;
                color: #fff;
            }
        </style>
    </head>
    <body>
        <div class="container-fluid">
            <%@include file="../partial/navbar.jsp"%>
            <div class="container my-5">
                <h1 class="text-center mb-4">Attendance Sheet</h1>
                <div class="card mb-3">
                    <div class="card-body text-center">
                        <h5 class="card-title d-inline-block mr-2">Class: ${requestScope.ses.group.name}</h5>
                        <h5 class="card-title d-inline-block mr-2">Subject:${requestScope.ses.subject.name}</h5><br>
                        <h5 class="card-title d-inline-block mr-2">at:${requestScope.ses.room.rid}</h5>
                        <h5 class="card-title d-inline-block">Time Slot:${requestScope.ses.time.description}</h5>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12">
                        <form action="${pageContext.request.contextPath}/lecture/takeatt" method="POST">
                            <table class="table table-bordered">
                                <thead class="thead-dark">
                                    <tr class="text-center">
                                        <th style="font-size: 12px; white-space: nowrap;">Student</th>
                                        <th style="font-size: 12px;"><input type="checkbox" name="show image" id="toggleImageCheckbox" onclick="toggleImages()" />Image</th>
                                        <th style="font-size: 12px; white-space: nowrap;">Status</th>
                                        <th style="white-space: nowrap;">Description</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach items="${requestScope.atts}" var="a">
                                        <tr class="text-center">
                                            <td style="font-size: 12px; white-space: nowrap;">${a.student.name}
                                                <input type="hidden" name="stuid" value="${a.student.id}"/>
                                            </td>
                                            <td><img class="toggleImage" style="width: 50px; height: 50px;" src="https://cdn.discordapp.com/attachments/947741416992436235/1171005032691404921/profile.png?ex=655b1a6c&is=6548a56c&hm=428202d73c6b3e95f3b966e3840f79186e79afdc98a879ea0492fa4957d08806&" alt=""/></td>                                                                                                        
                                            <td style="font-size: 12px; white-space: nowrap;">
                                                <div class="form-check form-check-inline">
                                                    <input class="form-check-input" type="radio" 
                                                           name="status${a.student.id}" value="absent"/>
                                                    <label class="form-check-label">Absent</label>
                                                </div>
                                                <div class="form-check form-check-inline">
                                                    <input class="form-check-input" type="radio" checked="checked"
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
                            <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#attendanceConfirmationModal">Take Attendance</button>                          
                        </form>
                    </div> 
                </div>
            </div>
        </div>
        <%@include file="../modal/submitattendance.jsp" %>
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

