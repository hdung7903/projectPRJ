package controller.lecture;

import dal.SessionDBContext;
import entity.Account;
import entity.Session;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import util.DateTimeHelper;

public class SessionListController extends LectureAuthorization {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            int instructorid = Integer.parseInt(request.getParameter("id"));
            String dateStr = request.getParameter("date");

            java.sql.Date sqlDate;

            if (dateStr == null || dateStr.isEmpty()) {
                java.util.Date realTimeDate = new java.util.Date();
                sqlDate = new java.sql.Date(realTimeDate.getTime());
            } else {
                java.util.Date parsedDate = new SimpleDateFormat("yyyy-MM-dd").parse(dateStr);
                sqlDate = new java.sql.Date(parsedDate.getTime());
            }

            SessionDBContext sessionDB = new SessionDBContext();
            List<Session> sessions = sessionDB.getSessionByDate(instructorid, sqlDate);

            for (Session session : sessions) {
                System.out.println("Session ID: " + session.getId());
                System.out.println("Date: " + session.getDate());
                System.out.println("Is Attending: " + session.isIsAtt());
                System.out.println("Room ID: " + session.getRoom().getRid());
                System.out.println("Time Slot Description: " + session.getTime().getDescription());
                System.out.println("Group ID: " + session.getGroup().getId());
                System.out.println("Group Name: " + session.getGroup().getName());
                System.out.println("Subject ID: " + session.getSubject().getId());
                System.out.println("Subject Name: " + session.getSubject().getName());
                System.out.println("-------------------------------------------");
            }

            if (sessions.size() <= 0) {
                String mess = "No sessions found";
                request.getRequestDispatcher("sessionlist.jsp").forward(request, response);
            } else {
                request.setAttribute("sessions", sessions);
                request.getRequestDispatcher("sessionlist.jsp").forward(request, response);
            }

        } catch (ParseException ex) {
            Logger.getLogger(SessionListController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response, Account account) throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response, Account account) throws ServletException, IOException {
        processRequest(request, response);
    }

}
