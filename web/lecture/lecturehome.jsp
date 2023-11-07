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
        <style>
            body {
                background-color: #f8f9fa;
            }
            .navbar {
                box-shadow: 0 2px 4px rgba(0,0,0,.1);
            }
            .content-container {
                background-color: white;
                border-radius: 15px;
                box-shadow: 0 2px 4px rgba(0,0,0,.1);
                padding: 20px;
                margin-bottom: 20px;
            }
            #icon-grid {
                background-color: white;
                border-radius: 15px;
                box-shadow: 0 2px 4px rgba(0,0,0,.1);
                padding: 20px;
            }
        </style>
    </head>
    <body>
        <div class="container-fluid">
            <%@include file="../partial/navbar.jsp"  %>
            <div class="container mt-3">
                <div class="container px-4 py-5" id="icon-grid">
                    <h2 class="pb-2 border-bottom">Features</h2>

                    <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 row-cols-lg-4 g-4 py-5">
                        <div class="col d-flex align-items-start">                          
                            <div>
                                <h3 class="fw-bold mb-0 fs-4 text-body-emphasis" style=" white-space: nowrap;">Information Access</h3>
                                <a href="${pageContext.request.contextPath}/lecture/schedule?id=${sessionScope.id}">Time Schedule</a>
                            </div>
                        </div>
                        <div class="col d-flex align-items-start">
                            <div>
                                <h3 class="fw-bold mb-0 fs-4 text-body-emphasis" style=" white-space: nowrap;">Attendance</h3>
                                <a href="${pageContext.request.contextPath}/lecture/sessionlist?id=${sessionScope.id}">Attendance</a>
                            </div>
                        </div>
                        <div class="col d-flex align-items-start">                            
                            <div>
                                <h3 class="fw-bold mb-0 fs-4 text-body-emphasis" style=" white-space: nowrap;">Attendance Statistic</h3>
                                <a href="${pageContext.request.contextPath}/lecture/grouplist?id=${sessionScope.id}">Statistic Report</a>
                            </div>
                        </div>                        
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
