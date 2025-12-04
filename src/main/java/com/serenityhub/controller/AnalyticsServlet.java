package com.serenityhub.controller;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.*;

@WebServlet("/admin/analytics/*")
public class AnalyticsServlet extends HttpServlet {
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        String pathInfo = request.getPathInfo();
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        
        PrintWriter out = response.getWriter();
        
        if (pathInfo == null || pathInfo.equals("/summary")) {
            out.print("{\"activeUsers\":167,\"completionRate\":71,\"avgSessionMinutes\":25,\"supportRequests\":100}");
        } else if (pathInfo.equals("/engagement")) {
            out.print("{\"labels\":[\"Mon\",\"Tue\",\"Wed\",\"Thu\",\"Fri\",\"Sat\",\"Sun\"],\"data\":[12,15,20,13,18,22,24]}");
        } else if (pathInfo.equals("/module-completion")) {
            out.print("{\"labels\":[\"Module 1\",\"Module 2\",\"Module 3\",\"Module 4\",\"Module 5\"],\"data\":[5,20,15,18,23]}");
        } else {
            response.setStatus(HttpServletResponse.SC_NOT_FOUND);
        }
    }
}