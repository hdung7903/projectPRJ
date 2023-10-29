/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.AttendanceDBContext;
import entity.Attendance;
import entity.AttendanceRecord;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author leduy
 */
public class StatisticController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        int groupId = Integer.parseInt(request.getParameter("id"));
        AttendanceDBContext attdb = new AttendanceDBContext();

        List<Attendance> attendanceRecords = attdb.getAttendanceRecords(groupId);
        for (Attendance attendance : attendanceRecords) {
            System.out.println("Group Name: " + attendance.getGroup().getName());
            System.out.println("Student ID: " + attendance.getStudent().getId());
            System.out.println("Student Name: " + attendance.getStudent().getName());
            System.out.println("Session ID: " + attendance.getSession().getId());
            System.out.println("Status: " + attendance.isStatus());

        }

        int totalSession = 5;
        int attended = attdb.sessionAttended(groupId);

        request.setAttribute("attendanceRecords", attendanceRecords);
        request.setAttribute("totalSession", totalSession);
        request.setAttribute("attended", attended);
        request.getRequestDispatcher("../lecture/vỉewstatistic.jsp").forward(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(StatisticController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(StatisticController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

}
