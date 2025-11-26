package com.serenityhub.controller;

import com.serenityhub.model.User;
import com.serenityhub.repo.UserRepo;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        String email = req.getParameter("email");
        String password = req.getParameter("password");

        if (email.equals("admin@gmail.com") && password.equals("admin123")) {
            HttpSession session = req.getSession();
            session.setAttribute("role", "admin"); // save role in session
            session.setAttribute("userEmail", email); // optional
            resp.sendRedirect("adminhome.jsp"); // redirect to admin page
            return; // stop here (prevent going to normal login)
        }

        User u = UserRepo.login(email, password);

        if (u != null) {
            HttpSession session = req.getSession();
            session.setAttribute("role", "student"); // student role
            session.setAttribute("user", u);
            resp.sendRedirect("home.jsp");

        } else {
            req.setAttribute("error", "Invalid email or password!");
            req.getRequestDispatcher("login.jsp").forward(req, resp);
        }
    }
}
