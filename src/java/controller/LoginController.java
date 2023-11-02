/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.AccountDBContext;
import entity.Account;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 *
 * @author leduy
 */
public class LoginController extends HttpServlet {

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
        request.getRequestDispatcher("./"
                + "").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        Account param = new Account();
        param.setUsername(username);
        param.setPassword(password);

        AccountDBContext db = new AccountDBContext();
        Account loggedUser = db.get(param);

        if (loggedUser == null) {
            response.sendRedirect("./");
        } else {
             request.getSession().setAttribute("username", username);
            HttpSession session = request.getSession();
            session.setAttribute("account", loggedUser);
            String displayname = loggedUser.getDisplayname();
            session.setAttribute("displayname", displayname);
           
            String role="";
            if(db.getRole(username).isIsStudent()){
            response.sendRedirect("student");
            role="Student";
            }else if (db.getRole(username).isIsInstructor()){
            response.sendRedirect("lecture");
            role="Instructor";
            }
            session.setAttribute("role", role);
            int id =db.getId(username);
            session.setAttribute("id", id);
        
        }
        
        
        System.out.println(db.getRole(username).isIsStudent()+" "+db.getRole(username).isIsInstructor());
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
