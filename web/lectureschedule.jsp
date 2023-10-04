<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Schedule</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
        <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
    </head>
    <body>
        <div clas="container-fluid">
            <%@include file="./partial/navbar.jsp"  %>
            <div class="container mt-3">                   
                <h1 class="text-center mb-4">Timetable</h1>
                <label for="lecture_name">Lecture:</label>
                <input type="text" id="lecture_name" name="lecture" value="tuanvm2" readonly>
                <table class="table" border="1">
                    <thead>
                        <tr>
                            <th>
                                <label for="semesterDropdown" class="form-label">Semester:</label>
                                <select class="form-select" id="semesterDropdown">
                                    <option value="semester1">Semester 1</option>
                                    <option value="semester2">Semester 2</option>
                                    <option value="semester3">Semester 3</option>
                                </select><br>
                                <label for="weekDropdown" class="form-label">Week:</label>
                                <select class="form-select" id="weekDropdown">
                                    <option value="week1">Week 1</option>
                                    <option value="week2">Week 2</option>
                                    <option value="week3">Week 3</option>
                                    
                                </select>
                            </th>
                            <th>Monday</th>
                            <th>Tuesday</th>
                            <th>Wednesday</th>
                            <th>Thursday</th>
                            <th>Friday</th>
                            <th>Saturday</th>
                            <th>Sunday</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>Slot 1</td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td>Slot 2</td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td>Slot 3</td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td>Slot 4</td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td>Slot 5</td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td>Slot 6</td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                        </tr>
                    </tbody>
                </table>
            </div>         
        </div>                            
    </div>
</body>
</html>
