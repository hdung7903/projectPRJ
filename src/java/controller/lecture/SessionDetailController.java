/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.lecture;

import controller.Authentication;
import dal.AttendanceDBContext;
import dal.SessionDBContext;
import entity.Account;
import entity.Session;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.Timestamp;


/**
 *
 * @author leduy
 */
public class SessionDetailController extends Authentication {

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
        SessionDBContext sesDB = new SessionDBContext();
        AttendanceDBContext attDB = new AttendanceDBContext();

        int id = Integer.parseInt(request.getParameter("id"));

        Session s = new Session();
        s.setId(id);
        Session ses = sesDB.get(s);
        request.setAttribute("ses", ses);

        Timestamp attDateTime = sesDB.getAttendanceDateTime(id);
        request.setAttribute("attDateTime", attDateTime);

        request.getRequestDispatcher("../lecture/sessiondetails.jsp").forward(request, response);

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
