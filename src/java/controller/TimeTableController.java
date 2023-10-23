/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.SessionDBContext;
import dal.TimeSlotDBContext;
import entity.BaseEntity;
import entity.Session;
import entity.TimeSlot;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import util.DateTimeHelper;

/**
 *
 * @author leduy
 */
public class TimeTableController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
    int instructorid = Integer.parseInt(request.getParameter("id"));
    String r_from = request.getParameter("from");
    String r_to = request.getParameter("to");

    List<Date> dates;
    if (r_from == null || r_to == null || r_from.isEmpty() || r_to.isEmpty()) {
        dates = DateTimeHelper.getDatesInRange("", "");
    } else {
        dates = DateTimeHelper.getDatesInRange(r_from, r_to);
    }

    TimeSlotDBContext timeDB = new TimeSlotDBContext();
    ArrayList<TimeSlot> slots = timeDB.list();

    SessionDBContext sessDB = new SessionDBContext();
    java.sql.Date sqlStartDate = DateTimeHelper.utilDateToSqlDate(dates.get(0));
    java.sql.Date sqlEndDate =  DateTimeHelper.utilDateToSqlDate(dates.get(dates.size() - 1));
    ArrayList<Session> sessions = sessDB.getSessions(instructorid, sqlStartDate, sqlEndDate);

    request.setAttribute("slots", slots);
    request.setAttribute("dates", dates);
    request.setAttribute("from", dates.get(0));
    request.setAttribute("to", dates.get(dates.size() - 1));
    request.setAttribute("sessions", sessions);

    request.getRequestDispatcher("./lecture/schedule.jsp").forward(request, response);
}

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
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
