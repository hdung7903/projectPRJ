package controller.lecture;

import controller.Authentication;
import dal.SessionDBContext;
import dal.TimeSlotDBContext;
import entity.Account;
import entity.Session;
import entity.TimeSlot;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.logging.Level;
import java.util.logging.Logger;
import util.DateTimeHelper;

public class TimeTableController extends Authentication {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int instructorid = Integer.parseInt(request.getParameter("id"));
        String r_from = request.getParameter("from");
        String r_to = request.getParameter("to");
        ArrayList<Date> dates = new ArrayList<>();
               
        
        if (r_from != null && r_to != null) {
        try {
            java.util.Date fromDate = new SimpleDateFormat("yyyy-MM-dd").parse(r_from);
            java.util.Date toDate = new SimpleDateFormat("yyyy-MM-dd").parse(r_to);

            if (toDate.before(fromDate)) {
                request.setAttribute("errorMessage", "Invalid date range. 'To' date cannot be before 'From' date.");
                request.getRequestDispatcher("../lecture/schedule.jsp").forward(request, response);
                return;
            } else {
                dates = DateTimeHelper.getSqlDatesInRange(r_from, r_to);
            }
        } catch (ParseException ex) {
            Logger.getLogger(TimeTableController.class.getName()).log(Level.SEVERE, null, ex);
        }
    } else if (r_from == null) {
        dates = DateTimeHelper.getCurrentWeekDates();
    }
        
         TimeSlotDBContext timeDB = new TimeSlotDBContext();
         ArrayList<TimeSlot> slots = timeDB.list();
         
         SessionDBContext sessDB = new SessionDBContext();
        ArrayList<Session> sessions = sessDB.getSessions(instructorid, dates.get(0), dates.get(dates.size()-1));
         
         request.setAttribute("slots", slots);
         request.setAttribute("dates", dates);
         request.setAttribute("from", dates.get(0));
         request.setAttribute("to", dates.get(dates.size()-1));
         request.setAttribute("sessions", sessions);

            request.getRequestDispatcher("../lecture/schedule.jsp").forward(request, response);
        }
    

    @Override
    public String getServletInfo() {
        return "Short description";
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response, Account account) throws ServletException, IOException {
        HttpSession session = request.getSession();
        int userid=(int) session.getAttribute("id");
        int id=Integer.parseInt(request.getParameter("id"));
        if(id==userid)
         processRequest(request, response);
        else
         response.sendRedirect(request.getContextPath()+"/home");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response, Account account) throws ServletException, IOException {
        processRequest(request, response);
    }

}
