package com.serenityhub.controller;

import com.serenityhub.dao.CounsellingRequestDAO;
import com.serenityhub.dao.CounsellingSessionDAO;
import com.serenityhub.model.CounsellingRequest;
import com.serenityhub.model.CounsellingSession;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

@WebServlet("/admin/counselling")
public class AdminCounsellingServlet extends HttpServlet {

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

        String action = req.getParameter("action");

        if ("sessions".equals(action)) {
            handleSessionsList(req, resp);
        } else if ("addSession".equals(action)) {
            req.getRequestDispatcher("/WEB-INF/views/admin/add-session.jsp").forward(req, resp);
        } else if ("editSession".equals(action)) {
            handleEditSession(req, resp);
        } else if ("viewRequest".equals(action)) {
            handleViewRequest(req, resp);
        } else {
            handleRequestsList(req, resp);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String action = req.getParameter("action");

        if ("addSession".equals(action)) {
            handleAddSession(req, resp);
        } else if ("editSession".equals(action)) {
            handleUpdateSession(req, resp);
        } else if ("deleteSession".equals(action)) {
            handleDeleteSession(req, resp);
        } else if ("updateRequestStatus".equals(action)) {
            handleUpdateRequestStatus(req, resp);
        } else if ("assignCounsellor".equals(action)) {
            handleAssignCounsellor(req, resp);
        }
    }

    private void handleRequestsList(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        List<CounsellingRequest> allRequests = requestDAO.getAllRequests();
        List<CounsellingSession> allSessions = sessionDAO.getAllSessions();
        
        req.setAttribute("requests", allRequests);
        req.setAttribute("sessions", allSessions);
        req.getRequestDispatcher("/WEB-INF/views/admin/counselling-requests.jsp").forward(req, resp);
    }

    private void handleSessionsList(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        List<CounsellingSession> sessions = sessionDAO.getAllSessions();
        req.setAttribute("sessions", sessions);
        req.getRequestDispatcher("/WEB-INF/views/admin/counselling-sessions.jsp").forward(req, resp);
    }

    private void handleEditSession(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        CounsellingSession session = sessionDAO.getSessionById(id);
        req.setAttribute("session", session);
        req.getRequestDispatcher("/WEB-INF/views/admin/edit-session.jsp").forward(req, resp);
    }

    private void handleViewRequest(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        CounsellingRequest request = requestDAO.getRequestById(id);
        List<CounsellingSession> sessions = sessionDAO.getAvailableSessions();
        
        req.setAttribute("request", request);
        req.setAttribute("sessions", sessions);
        req.getRequestDispatcher("/WEB-INF/views/admin/view-request.jsp").forward(req, resp);
    }

    private void handleAddSession(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        CounsellingSession session = new CounsellingSession();
        session.setCounsellorName(req.getParameter("counsellorName"));
        session.setCounsellorImage(req.getParameter("counsellorImage"));
        session.setSpecialty(req.getParameter("specialty"));
        session.setTimeSlot(req.getParameter("timeSlot"));
        session.setSessionDate(req.getParameter("sessionDate"));
        session.setSessionTime(req.getParameter("sessionTime"));
        session.setGoogleMeetLink(req.getParameter("googleMeetLink"));
        session.setStatus(req.getParameter("status"));

        boolean success = sessionDAO.addSession(session);
        
        if (success) {
            req.getSession().setAttribute("successMessage", "Session added successfully!");
        } else {
            req.getSession().setAttribute("errorMessage", "Failed to add session.");
        }
        
        resp.sendRedirect(req.getContextPath() + "/admin/counselling?action=sessions");
    }

    private void handleUpdateSession(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        CounsellingSession session = new CounsellingSession();
        session.setId(Integer.parseInt(req.getParameter("id")));
        session.setCounsellorName(req.getParameter("counsellorName"));
        session.setCounsellorImage(req.getParameter("counsellorImage"));
        session.setSpecialty(req.getParameter("specialty"));
        session.setTimeSlot(req.getParameter("timeSlot"));
        session.setSessionDate(req.getParameter("sessionDate"));
        session.setSessionTime(req.getParameter("sessionTime"));
        session.setGoogleMeetLink(req.getParameter("googleMeetLink"));
        session.setStatus(req.getParameter("status"));

        boolean success = sessionDAO.updateSession(session);
        
        if (success) {
            req.getSession().setAttribute("successMessage", "Session updated successfully!");
        } else {
            req.getSession().setAttribute("errorMessage", "Failed to update session.");
        }
        
        resp.sendRedirect(req.getContextPath() + "/admin/counselling?action=sessions");
    }

    private void handleDeleteSession(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        boolean success = sessionDAO.deleteSession(id);
        
        if (success) {
            req.getSession().setAttribute("successMessage", "Session deleted successfully!");
        } else {
            req.getSession().setAttribute("errorMessage", "Failed to delete session.");
        }
        
        resp.sendRedirect(req.getContextPath() + "/admin/counselling?action=sessions");
    }

    private void handleUpdateRequestStatus(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        String status = req.getParameter("status");
        
        boolean success = requestDAO.updateRequestStatus(id, status);
        
        if (success) {
            req.getSession().setAttribute("successMessage", "Request status updated successfully!");
        } else {
            req.getSession().setAttribute("errorMessage", "Failed to update request status.");
        }
        
        resp.sendRedirect(req.getContextPath() + "/admin/counselling");
    }

    private void handleAssignCounsellor(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        int requestId = Integer.parseInt(req.getParameter("requestId"));
        int sessionId = Integer.parseInt(req.getParameter("sessionId"));
        String adminNotes = req.getParameter("adminNotes");
        
        CounsellingSession session = sessionDAO.getSessionById(sessionId);
        
        if (session != null) {
            boolean success = requestDAO.assignCounsellor(
                requestId,
                session.getCounsellorName(),
                session.getCounsellorImage(),
                sessionId,
                session.getGoogleMeetLink(),
                req.getParameter("confirmedDate"),
                req.getParameter("confirmedTime"),
                adminNotes
            );
            
            if (success) {
                req.getSession().setAttribute("successMessage", "Counsellor assigned successfully!");
            } else {
                req.getSession().setAttribute("errorMessage", "Failed to assign counsellor.");
            }
        }
        
        resp.sendRedirect(req.getContextPath() + "/admin/counselling");
    }
}