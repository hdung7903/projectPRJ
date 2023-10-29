/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.AttendanceDBContext;
import dal.SessionDBContext;
import entity.Attendance;
import entity.Session;
import entity.Student;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;

/**
 *
 * @author leduy
 */
public class TakeAttendanceController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        SessionDBContext sesDB = new SessionDBContext();
        Session s = new Session();
        int id = Integer.parseInt(request.getParameter("id"));
        s.setId(id);
        Session ses = sesDB.get(s);
        request.setAttribute("ses", ses);

        AttendanceDBContext attDB = new AttendanceDBContext();
        ArrayList<Attendance> attendances = attDB.getAttendances(id);

        request.setAttribute("atts", attendances);

        request.getRequestDispatcher("../lecture/takeattendance.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String[] stuids = request.getParameterValues("stuid");
        Session ses = new Session();
        ses.setId(Integer.parseInt(request.getParameter("sesid")));
        ArrayList<Attendance> atts = new ArrayList<>();
        for (String stuid : stuids) {
            int id = Integer.parseInt(stuid);
            Attendance a = new Attendance();
            Student s = new Student();
            s.setId(id);
            a.setStudent(s);
            a.setSession(ses);
            a.setDescription(request.getParameter("description" + stuid));
            a.setStatus(request.getParameter("status" + stuid).equals("present"));
            atts.add(a);
        }
        ses.setAtts(atts);
        SessionDBContext sesDB = new SessionDBContext();
        sesDB.addAttendances(ses);        
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
