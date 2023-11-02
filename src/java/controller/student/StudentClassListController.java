/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.student;

import controller.lecture.SessionListController;
import dal.GroupDBContext;
import entity.Account;
import entity.Group;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author leduy
 */
public class StudentClassListController extends StudentAuthorization {

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
        try {
            int id = Integer.parseInt(request.getParameter("id"));
            String dateStr = request.getParameter("date");

            java.sql.Date sqlDate;

            if (dateStr == null || dateStr.isEmpty()) {
                java.util.Date realTimeDate = new java.util.Date();
                sqlDate = new java.sql.Date(realTimeDate.getTime());
            } else {
                java.util.Date parsedDate = new SimpleDateFormat("yyyy-MM-dd").parse(dateStr);
                sqlDate = new java.sql.Date(parsedDate.getTime());
            }

            GroupDBContext gdb = new GroupDBContext();
            List<Group> groups = gdb.getGroupList(id, sqlDate);

            for (Group group : groups) {
                System.out.println("Group Name: " + group.getName());
                System.out.println("Date: " + group.getSession().getDate());
                System.out.println("Subject Name: " + group.getSubject().getName());
                System.out.println("Time Slot: " + group.getTimeslot().getDescription());
                System.out.println("Status: " + group.getAttendance().isStatus());
                System.out.println("-------------------------------------------");
            }

            if (groups.size() <= 0) {
                String mess = "No sessions found";
                request.getRequestDispatcher("../student/studentclasslist.jsp").forward(request, response);
            } else {
                request.setAttribute("groups", groups);
                request.getRequestDispatcher("../student/studentclasslist.jsp").forward(request, response);
            }

        } catch (ParseException ex) {
            Logger.getLogger(SessionListController.class.getName()).log(Level.SEVERE, null, ex);
        }
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

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response, Account account) throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response, Account account) throws ServletException, IOException {
        processRequest(request, response);
    }

}
