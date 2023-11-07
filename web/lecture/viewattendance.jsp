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
        <style>

            .container {
                background: #fff;
                border-radius: 10px;
                box-shadow: 0 0 10px rgba(0,0,0,0.1);
                padding: 30px;
            }

            .table {
                box-shadow: 0 0 5px rgba(0,0,0,0.1);
            }

            .btn-primary {
                background: #28a745;
                border: none;
            }

            .btn-primary:hover {
                background: #218838;
            }

        </style>
    </head>
    <body>
        <div class="container-fluid">
            <%@include file="../partial/navbar.jsp"%>
            <div class="container my-5">
                <h1 class="text-center mb-4">Attendance Sheet</h1>
                <div class="card mb-2">
                    <div class="card-body text-center">
                        <div class="card-body text-center">
                            <h5 class="card-title d-inline-block mr-2">Class: ${requestScope.ses.group.name}</h5>-
                            <h5 class="card-title d-inline-block mr-2">Subject:${requestScope.ses.subject.name}</h5><br>
                            <h5 class="card-title d-inline-block mr-2">Room: ${requestScope.ses.room.rid}</h5>-
                            <h5 class="card-title d-inline-block mr-2">Time Slot: ${requestScope.ses.time.description}</h5><br>
                            <h5 class="card-title d-inline-block mr-2">Lasted Update: <fmt:formatDate value="${requestScope.attDateTime}" pattern="HH:mm dd-MM-yyyy" /></h5>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12">
                            <form action="att" method="POST">
                                <table class="table table-bordered table-hover mx-auto">
                                    <thead class="thead-dark">
                                        <tr class="text-center">
                                            <th>Student</th>
                                            <th><input type="checkbox" name="show image" id="toggleImageCheckbox" onclick="toggleImages()" />Image</th>
                                            <th>Status</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach items="${requestScope.atts}" var="a">
                                            <tr class="text-center">
                                                <td class="text-center">${a.student.name}
                                                    <input type="hidden" name="stuid" value="${a.student.id}"/>
                                                </td>
                                                <td><img class="toggleImage" style="width: 50px; height: 50px;" src="https://cdn.discordapp.com/attachments/947741416992436235/1171005032691404921/profile.png?ex=655b1a6c&is=6548a56c&hm=428202d73c6b3e95f3b966e3840f79186e79afdc98a879ea0492fa4957d08806&" alt=""/></td>                                                                                                        
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

