<%-- 
    Document   : denied
    Created on : Oct 29, 2023, 9:39:25 PM
    Author     : leduy
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Access Denied</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
    <div class="container-fluid">
        <%@include file="./partial/deniednav.jsp"  %>
        <div class="container" style="margin-top:30px">
            <div class="container error-container">
                <div class="alert alert-danger error-heading" role="alert">
                    <c:if test="${not empty requestScope.errorMsg}">
                        <c:out value="${requestScope.errorMsg}" />
                    </c:if>
                    <c:if test="${empty requestScope.errorMsg}">
                        Access Denied - You do not have permission to view this page.
                    </c:if>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
