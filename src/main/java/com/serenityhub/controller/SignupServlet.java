package com.serenityhub.controller;

import com.serenityhub.model.User;
import com.serenityhub.repo.UserRepo;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/signup")
public class SignupServlet extends HttpServlet {

    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String fullname = req.getParameter("fullname");
        String email = req.getParameter("email");
        String password = req.getParameter("password");
        String confirm = req.getParameter("confirm");

        // form validation
        if (fullname == null || fullname.isBlank() ||
                email == null || email.isBlank() ||
                password == null || password.isBlank() ||
                confirm == null || confirm.isBlank()) {

            req.setAttribute("error", "All fields are required!");
            req.getRequestDispatcher("signup.jsp").forward(req, resp);
            return;
        }

        if (!password.equals(confirm)) {
            req.setAttribute("error", "Passwords do not match!");
            req.getRequestDispatcher("signup.jsp").forward(req, resp);
            return;
        }

        final String ADMIN_EMAIL = "admin@gmail.com";
        final String ADMIN_PASSWORD = "admin123";
        if (email != null && password != null
                && email.equalsIgnoreCase(ADMIN_EMAIL)
                && password.equals(ADMIN_PASSWORD)) {
            req.setAttribute("error", "Credentials already exists");
            req.getRequestDispatcher("signup.jsp").forward(req, resp);
            return;
        }

        boolean isRegistered = UserRepo.register(new User(fullname, email, password));

        if (!isRegistered) {
            req.setAttribute("error", "Email already exists!");
            req.getRequestDispatcher("signup.jsp").forward(req, resp);
            return;
        }

        req.setAttribute("success", "Account created! You can now log in.");
        req.getRequestDispatcher("login.jsp").forward(req, resp);
    }
}
