<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
        <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
    </head>
    <body>
        <div class="container-fluid">
            <%@include file="./partial/navbar.jsp"  %>
            <div class="container" style="margin-top:30px">
                <div class="row">
                    <div class="col-sm-4">
                        <h2>About Me</h2>
                        <h5>Photo of me:</h5>
                        <div class="fakeimg">Fake Image</div>
                        <p></p>
                        <h3>Some Links</h3>
                        <p></p>
                        <ul class="nav nav-pills flex-column">
                            <li class="nav-item">
                                <a class="nav-link active" href="#">Active</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#">Link</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#">Link</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link disabled" href="#">Disabled</a>
                            </li>
                        </ul>
                        <hr class="d-sm-none">
                    </div>
                    <div class="col-sm-8">
                        <h2>Teacher Part</h2>
                        <a href="lectureschedule.jsp">View Schedule</a><br>
                        <a href="#">Take Attendance</a><br>
                        <a href="#">View Attendance</a><br>
                        
                        <h2>Student Part</h2>
                        <a href="studentschedule.jsp">View Schedule</a><br>
                        <a href="#">View Attendance</a><br>
                    </div>
                </div>
            </div>

            <%@include file="./partial/footer.jsp"  %>
        </div>
    </body>
</html>
