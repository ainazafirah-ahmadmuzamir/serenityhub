package com.serenityhub.controller;

import com.serenityhub.model.CounsellingSession;
import com.serenityhub.model.CounsellingRequest;
import java.io.IOException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/counselling")
public class CounsellingServlet extends HttpServlet {
    
    // Simulated database - replace with actual database in production
    private static List<CounsellingSession> availableSessions = new ArrayList<>();
    private static List<CounsellingRequest> userRequests = new ArrayList<>();
    private static int requestIdCounter = 1;
    
    @Override
    public void init() throws ServletException {
        // Initialize sample counsellor sessions
        availableSessions.add(new CounsellingSession(1, "Dr. Norizan", 
            "images/counsellor1.jpg", "Anxiety & Stress Handling", 
            "0800 - 1700", "Available", "available", false));
        
        availableSessions.add(new CounsellingSession(2, "Dr. Noriman", 
            "images/counsellor2.jpg", "Depression & Mental Health", 
            "0800 - 1700", "Available", "available", false));
        
        availableSessions.add(new CounsellingSession(3, "Dr. Kalsom", 
            "images/counsellor3.jpg", "Relationship & Family Counselling", 
            "1400 - 2300", "Available", "available", false));
        
        availableSessions.add(new CounsellingSession(4, "Dr. Doon", 
            "images/counsellor4.jpg", "Career & Life Coaching", 
            "2200 - 0700", "Unavailable", "unavailable", false));
    }
    
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) 
            throws ServletException, IOException {
        
        HttpSession session = req.getSession();
        String action = req.getParameter("action");
        
        // Get current user's requests (filter by userId in production)
        List<CounsellingRequest> myRequests = getUserRequests(session);
        
        // Get active session (confirmed request)
        CounsellingRequest activeSession = getActiveSession(myRequests);
        
        // Set attributes
        req.setAttribute("availableSessions", availableSessions);
        req.setAttribute("myRequests", myRequests);
        req.setAttribute("activeSession", activeSession);
        
        if ("edit".equals(action)) {
            int requestId = Integer.parseInt(req.getParameter("id"));
            CounsellingRequest requestToEdit = findRequestById(requestId);
            req.setAttribute("editRequest", requestToEdit);
        }
        
        // Forward to JSP
        req.getRequestDispatcher("/WEB-INF/views/counselling.jsp").forward(req, resp);
    }
    
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) 
            throws ServletException, IOException {
        
        HttpSession session = req.getSession();
        String action = req.getParameter("action");
        
        if ("submitRequest".equals(action)) {
            handleRequestSubmission(req, session);
        } else if ("updateRequest".equals(action)) {
            handleRequestUpdate(req);
        } else if ("joinSession".equals(action)) {
            handleJoinSession(req, resp);
            return;
        } else if ("reschedule".equals(action)) {
            handleReschedule(req);
        }
        
        resp.sendRedirect(req.getContextPath() + "/counselling");
    }
    
    private void handleRequestSubmission(HttpServletRequest req, HttpSession session) {
        CounsellingRequest request = new CounsellingRequest();
        request.setId(requestIdCounter++);
        request.setUserId(1); // Replace with actual user ID from session
        request.setUserName("Current User"); // Replace with actual username
        request.setCounsellorPreference(req.getParameter("counsellor"));
        request.setConcernType(req.getParameter("concernType"));
        request.setDescription(req.getParameter("description"));
        request.setPreferredDate(req.getParameter("preferredDate"));
        request.setPreferredTime(req.getParameter("preferredTime"));
        request.setStatus("submitted");
        request.setSubmittedDate(LocalDateTime.now().format(
            DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm")));
        
        userRequests.add(request);
        
        // Simulate automatic confirmation for demo
        simulateRequestProcessing(request);
    }
    
    private void handleRequestUpdate(HttpServletRequest req) {
        int requestId = Integer.parseInt(req.getParameter("requestId"));
        CounsellingRequest request = findRequestById(requestId);
        
        if (request != null && !request.getStatus().equals("ongoing")) {
            request.setConcernType(req.getParameter("concernType"));
            request.setDescription(req.getParameter("description"));
            request.setPreferredDate(req.getParameter("preferredDate"));
            request.setPreferredTime(req.getParameter("preferredTime"));
        }
    }
    
    private void handleJoinSession(HttpServletRequest req, HttpServletResponse resp) 
            throws IOException {
        int sessionId = Integer.parseInt(req.getParameter("sessionId"));
        // In production, redirect to actual video conferencing page
        resp.sendRedirect(req.getContextPath() + "/video-session?id=" + sessionId);
    }
    
    private void handleReschedule(HttpServletRequest req) {
        int requestId = Integer.parseInt(req.getParameter("requestId"));
        CounsellingRequest request = findRequestById(requestId);
        
        if (request != null) {
            request.setStatus("submitted");
            request.setPreferredDate(req.getParameter("preferredDate"));
            request.setPreferredTime(req.getParameter("preferredTime"));
            simulateRequestProcessing(request);
        }
    }
    
    private void simulateRequestProcessing(CounsellingRequest request) {
        // Simulate system viewing and confirming request
        new Thread(() -> {
            try {
                Thread.sleep(2000); // Wait 2 seconds
                request.setStatus("viewed");
                
                Thread.sleep(3000); // Wait 3 more seconds
                request.setStatus("confirmed");
                
                // Assign counsellor based on preference
                CounsellingSession counsellor = availableSessions.stream()
                    .filter(s -> s.getCounsellorName().equals(request.getCounsellorPreference()))
                    .findFirst()
                    .orElse(availableSessions.get(0));
                
                request.setAssignedCounsellor(counsellor.getCounsellorName());
                request.setAssignedCounsellorImage(counsellor.getCounsellorImage());
                request.setConfirmedDate(request.getPreferredDate());
                request.setConfirmedTime(request.getPreferredTime());
                
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
        }).start();
    }
    
    private List<CounsellingRequest> getUserRequests(HttpSession session) {
        // In production, filter by actual user ID
        return new ArrayList<>(userRequests);
    }
    
    private CounsellingRequest getActiveSession(List<CounsellingRequest> requests) {
        return requests.stream()
            .filter(r -> "confirmed".equals(r.getStatus()) || "ongoing".equals(r.getStatus()))
            .findFirst()
            .orElse(null);
    }
    
    private CounsellingRequest findRequestById(int id) {
        return userRequests.stream()
            .filter(r -> r.getId() == id)
            .findFirst()
            .orElse(null);
    }
}