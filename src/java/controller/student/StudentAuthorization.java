/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller.student;

import entity.Account;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 *
 * @author leduy
 */
public abstract class StudentAuthorization extends HttpServlet {

    private boolean isAuthenticated(HttpServletRequest request) {
        Account acc = (Account) request.getSession().getAttribute("account");
        return acc != null && acc.isIsStudent() && !acc.isIsInstructor();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        if (isAuthenticated(request)) {
            doGet(request, response, (Account) request.getSession().getAttribute("username"));
        } else {
            response.sendRedirect(request.getContextPath() + "/denied");
        }
    }

    protected abstract void doGet(HttpServletRequest request, HttpServletResponse response, Account account)
            throws ServletException, IOException;

    protected abstract void doPost(HttpServletRequest request, HttpServletResponse response, Account account)
            throws ServletException, IOException;

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
        if (isAuthenticated(request)) {
            //do business
            doPost(request, response, (Account) request.getSession().getAttribute("username"));
        } else {
            response.sendRedirect(request.getContextPath() + "/denied");
        }
    }
}
