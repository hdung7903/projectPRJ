/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.lecture;

import controller.Authentication;
import dal.AttendanceDBContext;
import dal.GroupDBContext;
import dal.SessionDBContext;
import entity.Account;
import entity.Student;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author leduy
 */
public class StatisticController extends Authentication {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        int groupId = Integer.parseInt(request.getParameter("id"));
        AttendanceDBContext attdb = new AttendanceDBContext();
        SessionDBContext sesdb = new SessionDBContext();
        HttpSession session = request.getSession();
        GroupDBContext gdb = new GroupDBContext();
        int id = (int) session.getAttribute("id");

        int totalSession = sesdb.getTotalSession(groupId, id);
        int attended = attdb.sessionAttended(groupId);
        Map<String, Student> attendanceMap = attdb.getAttendanceRecords(groupId);
        request.setAttribute("attendanceMap", attendanceMap);
        request.setAttribute("totalSession", totalSession);
        request.setAttribute("attended", attended);
        request.getRequestDispatcher("../lecture/viewstatistic.jsp").forward(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response, Account account) throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(StatisticController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response, Account account) throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(StatisticController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

}
