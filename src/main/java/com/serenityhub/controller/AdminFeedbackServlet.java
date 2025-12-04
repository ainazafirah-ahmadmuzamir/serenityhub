package com.serenityhub.controller;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.*;

@WebServlet("/admin/feedback")
public class AdminFeedbackServlet extends HttpServlet {
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        // Check if user is admin (you should implement proper admin authentication)
        HttpSession session = request.getSession();
        Object user = session.getAttribute("user");
        
        if (user == null) {
            // Redirect to login if not logged in
            response.sendRedirect(request.getContextPath() + "/login.jsp");
            return;
        }
        
        // Show admin feedback management page
        request.getRequestDispatcher("/adminFeedback.jsp").forward(request, response);
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        // Handle admin actions like updating feedback status
        String action = request.getParameter("action");
        
        if ("updateStatus".equals(action)) {
            // In a real app, you would update database here
            String feedbackId = request.getParameter("id");
            String status = request.getParameter("status");
           // String responseText = request.getParameter("adminResponse");
            
            
            request.setAttribute("success", "Feedback #" + feedbackId + " updated to " + status);
        } else if ("delete".equals(action)) {
            String feedbackId = request.getParameter("id");
            request.setAttribute("success", "Feedback #" + feedbackId + " deleted successfully");
        }
        
        request.getRequestDispatcher("/adminFeedback.jsp").forward(request, response);
    }
}