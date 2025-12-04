package com.serenityhub.controller;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.*;

@WebServlet("/feedback")
public class FeedbackServlet extends HttpServlet {
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        // Just show the feedback form
        request.getRequestDispatcher("/feedback.jsp").forward(request, response);
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        // Just show success message without saving to database
        request.setAttribute("success", "Thank you! Your feedback has been submitted successfully.");
        request.getRequestDispatcher("/feedback.jsp").forward(request, response);
    }
}