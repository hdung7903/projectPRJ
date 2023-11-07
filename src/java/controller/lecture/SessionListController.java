package controller.lecture;

import controller.Authentication;
import dal.SessionDBContext;
import entity.Account;
import entity.Session;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import util.DateTimeHelper;

public class SessionListController extends Authentication {

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

//            request.setAttribute(dateStr, this);

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
        HttpSession session = request.getSession();
        int userid = (int) session.getAttribute("id");
        int id = Integer.parseInt(request.getParameter("id"));
        if (id == userid) {
            processRequest(request, response);
        } else {
            response.sendRedirect(request.getContextPath() + "/denied");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response, Account account) throws ServletException, IOException {
        processRequest(request, response);
    }

}
