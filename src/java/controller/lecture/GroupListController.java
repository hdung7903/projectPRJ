/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller.lecture;

import controller.Authentication;
import dal.GroupDBContext;
import entity.Account;
import entity.Group;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;

/**
 *
 * @author leduy
 */
public class GroupListController extends Authentication {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        GroupDBContext groupdb= new GroupDBContext();
       int id=Integer.parseInt(request.getParameter("id"));
       ArrayList<Group> groups=groupdb.getInstructorGroup(id);
       request.setAttribute("groups", groups);
       request.getRequestDispatcher("../lecture/grouplist.jsp").forward(request, response);
    } 

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response, Account LoggedUser) throws ServletException, IOException {
        HttpSession session = request.getSession();
        int userid=(int) session.getAttribute("id");
        int id=Integer.parseInt(request.getParameter("id"));
        if(id==userid)
         processRequest(request, response);
        else
         response.sendRedirect(request.getContextPath()+"/home");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response, Account LoggedUser) throws ServletException, IOException {
        processRequest(request, response);
    }

}
