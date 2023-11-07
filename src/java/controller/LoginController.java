/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.AccountDBContext;
import entity.Account;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
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
        String remember = request.getParameter("remember");
        
        Account param = new Account();
        param.setUsername(username);
        param.setPassword(password);
        
        AccountDBContext db = new AccountDBContext();
        Account loggedUser = db.get(param);
        
        HttpSession session = request.getSession();
        if (loggedUser == null) {
            response.sendRedirect("./");
        } else {
             int id=db.getId(username);
            session.setAttribute("id", id);
            if(id==-1){
                response.sendRedirect(request.getContextPath()+"/denied");
            }else{
             
            session.setAttribute("account", loggedUser);
            String displayname = loggedUser.getDisplayname();
            session.setAttribute("displayname", displayname);
                                   
            if (remember != null) {
                Cookie c_user = new Cookie("user", username);
                Cookie c_pass = new Cookie("pass", password);
                c_user.setMaxAge(3600);
                c_pass.setMaxAge(3600);
                response.addCookie(c_user);
                response.addCookie(c_pass);
            }
            response.sendRedirect(request.getContextPath()+"/home");
        }
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

}
