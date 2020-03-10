package com.codeup.adlister.controllers;

import com.codeup.adlister.dao.DaoFactory;
import com.codeup.adlister.models.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(name = "controllers.UpdateServlet", urlPatterns = "/update")
public class UpdateServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if (request.getSession().getAttribute("user") == null) {
            response.sendRedirect("/login");
            return;
        }
        request.getRequestDispatcher("/WEB-INF/update.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        session.setAttribute("userEmpty", false);
        session.setAttribute("emailEmpty", false);
        session.setAttribute("notMatch", false);
        session.setAttribute("passwordChanged", false);
        String changeName = request.getParameter("updateName");
        String changeEmail = request.getParameter("updateEmail");
        String changePassword = request.getParameter("updatePassword");
        String checkPassword = request.getParameter("checkUpdate");
        session.setAttribute("currentName", changeName);
        session.setAttribute("currentEmail", changeEmail);
        if (changeName.isEmpty()) {
            session.setAttribute("userEmpty", true);
        }
        if (changeEmail.isEmpty()) {
            session.setAttribute("emailEmpty", true);
        }
        if (changePassword.isEmpty()) {
            session.setAttribute("passwordEmpty", true);
        }

        if (!changePassword.equals(checkPassword)){
            session.setAttribute("notMatch", true);
        }
        if (!changeName.isEmpty() && !changeEmail.isEmpty() && changePassword.equals(checkPassword)){
            User user = new User(changeName, changeEmail, changePassword);
            long id = (long) session.getAttribute("loggedId");

            User updated = DaoFactory.getUsersDao().updateUser(user, (int) id);
            session.setAttribute("user", updated);
            session.setAttribute("passwordChanged", true);
            response.sendRedirect("/profile");
            return;
        }
        response.sendRedirect("/update");
    }
}