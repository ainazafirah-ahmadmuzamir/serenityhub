package com.serenityhub.controller;

import com.serenityhub.dao.CounsellingRequestDAO;
import com.serenityhub.dao.CounsellingSessionDAO;
import com.serenityhub.model.CounsellingRequest;
import com.serenityhub.model.CounsellingSession;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/counselling")
public class CounsellingServlet extends HttpServlet {
    
    private CounsellingSessionDAO sessionDAO;
    private CounsellingRequestDAO requestDAO;
    
    @Override
    public void init() throws ServletException {
        sessionDAO = new CounsellingSessionDAO();
        requestDAO = new CounsellingRequestDAO();
    }
    
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) 
            throws ServletException, IOException {
        
        HttpSession session = req.getSession();
        String action = req.getParameter("action");
        
        // Get current user ID (replace with actual user ID from session in production)
        int userId = 1; // TODO: Get from session
        
        // Get available sessions
        List<CounsellingSession> availableSessions = sessionDAO.getAvailableSessions();
        
        // Get current user's requests
        List<CounsellingRequest> myRequests = requestDAO.getRequestsByUserId(userId);
        
        // Get active session (confirmed or ongoing)
        CounsellingRequest activeSession = getActiveSession(myRequests);
        
        // Set attributes
        req.setAttribute("availableSessions", availableSessions);
        req.setAttribute("myRequests", myRequests);
        req.setAttribute("activeSession", activeSession);
        
        if ("edit".equals(action)) {
            int requestId = Integer.parseInt(req.getParameter("id"));
            CounsellingRequest requestToEdit = requestDAO.getRequestById(requestId);
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
        
        // TODO: Get actual user ID and name from session
        request.setUserId(1);
        request.setUserName("Current User");
        
        request.setCounsellorPreference(req.getParameter("counsellor"));
        request.setConcernType(req.getParameter("concernType"));
        request.setDescription(req.getParameter("description"));
        request.setPreferredDate(req.getParameter("preferredDate"));
        request.setPreferredTime(req.getParameter("preferredTime") + ":00"); // Add seconds
        request.setStatus("submitted");
        
        boolean success = requestDAO.addRequest(request);
        
        if (success) {
            session.setAttribute("successMessage", "Request submitted successfully!");
        } else {
            session.setAttribute("errorMessage", "Failed to submit request.");
        }
    }
    
    private void handleRequestUpdate(HttpServletRequest req) {
        int requestId = Integer.parseInt(req.getParameter("requestId"));
        CounsellingRequest request = requestDAO.getRequestById(requestId);
        
        if (request != null && ("submitted".equals(request.getStatus()) || "viewed".equals(request.getStatus()))) {
            request.setCounsellorPreference(req.getParameter("counsellor"));
            request.setConcernType(req.getParameter("concernType"));
            request.setDescription(req.getParameter("description"));
            request.setPreferredDate(req.getParameter("preferredDate"));
            request.setPreferredTime(req.getParameter("preferredTime") + ":00");
            
            requestDAO.updateRequest(request);
        }
    }
    
    private void handleJoinSession(HttpServletRequest req, HttpServletResponse resp) 
            throws IOException {
        int sessionId = Integer.parseInt(req.getParameter("sessionId"));
        CounsellingRequest request = requestDAO.getRequestById(sessionId);
        
        if (request != null && request.getGoogleMeetLink() != null) {
            // Update status to ongoing
            requestDAO.updateRequestStatus(sessionId, "ongoing");
            
            // Redirect to Google Meet link
            resp.sendRedirect(request.getGoogleMeetLink());
        } else {
            resp.sendRedirect(req.getContextPath() + "/counselling");
        }
    }
    
    private void handleReschedule(HttpServletRequest req) {
        int requestId = Integer.parseInt(req.getParameter("requestId"));
        CounsellingRequest request = requestDAO.getRequestById(requestId);
        
        if (request != null) {
            request.setStatus("submitted");
            request.setPreferredDate(req.getParameter("preferredDate"));
            request.setPreferredTime(req.getParameter("preferredTime") + ":00");
            requestDAO.updateRequest(request);
        }
    }
    
    private CounsellingRequest getActiveSession(List<CounsellingRequest> requests) {
        return requests.stream()
            .filter(r -> "confirmed".equals(r.getStatus()) || "ongoing".equals(r.getStatus()))
            .findFirst()
            .orElse(null);
    }
}