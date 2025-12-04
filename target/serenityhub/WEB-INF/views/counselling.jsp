<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*, com.serenityhub.model.*" %>
<%
    // Get attributes from servlet
    List<CounsellingSession> availableSessions = (List<CounsellingSession>) request.getAttribute("availableSessions");
    List<CounsellingRequest> myRequests = (List<CounsellingRequest>) request.getAttribute("myRequests");
    CounsellingRequest activeSession = (CounsellingRequest) request.getAttribute("activeSession");
    CounsellingRequest editRequest = (CounsellingRequest) request.getAttribute("editRequest");
    
    // If no data from servlet, create dummy data for display
    if (availableSessions == null) {
        availableSessions = new ArrayList<>();
        availableSessions.add(new CounsellingSession(1, "Dr. Norizan", 
            "https://via.placeholder.com/80", "Anxiety & Stress Handling", 
            "0800 - 1700", "Available", "available", false));
        availableSessions.add(new CounsellingSession(2, "Dr. Noriman", 
            "https://via.placeholder.com/80", "Depression & Mental Health", 
            "0800 - 1700", "Available", "available", false));
        availableSessions.add(new CounsellingSession(3, "Dr. Kalsom", 
            "https://via.placeholder.com/80", "Relationship & Family Counselling", 
            "1400 - 2300", "Available", "available", false));
        availableSessions.add(new CounsellingSession(4, "Dr. Doon", 
            "https://via.placeholder.com/80", "Career & Life Coaching", 
            "2200 - 0700", "Unavailable", "unavailable", false));
    }
    
    if (myRequests == null) {
        myRequests = new ArrayList<>();
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Counselling & Support Hub - SerenityHub</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background: linear-gradient(135deg, #e6e6fa 0%, #f0e6ff 100%);
            font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, sans-serif;
        }
        
        .serenity-header {
            background: rgba(255, 255, 255, 0.9);
            padding: 1rem 0;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
        }
        
        .logo-section {
            display: flex;
            align-items: center;
            gap: 10px;
        }
        
        .logo-icon {
            width: 40px;
            height: 40px;
        }
        
        .brand-name {
            color: #323962;
            font-size: 1.5rem;
            font-weight: 700;
            margin: 0;
        }
        
        .nav-links a {
            color: #323962;
            text-decoration: none;
            margin-left: 2rem;
            font-weight: 500;
        }
        
        .nav-links a:hover {
            color: #8B5CF6;
        }
        
        .page-title {
            color: #323962;
            font-size: 2rem;
            font-weight: 700;
            margin: 2rem 0 0.5rem 0;
        }
        
        .page-subtitle {
            color: #4B5563;
            margin-bottom: 2rem;
        }
        
        .timeline-container {
            background: white;
            border-radius: 15px;
            padding: 2rem;
            margin: 2rem 0;
            box-shadow: 0 2px 8px rgba(0,0,0,0.1);
        }
        
        .timeline-header {
            font-size: 1.1rem;
            font-weight: 600;
            color: #323962;
            margin-bottom: 1.5rem;
        }
        
        .timeline {
            display: flex;
            justify-content: space-between;
            align-items: center;
            position: relative;
            margin: 1rem 0;
        }
        
        .timeline-step {
            display: flex;
            flex-direction: column;
            align-items: center;
            z-index: 2;
            flex: 1;
        }
        
        .timeline-circle {
            width: 50px;
            height: 50px;
            border-radius: 50%;
            border: 3px solid #D1D5DB;
            background: white;
            display: flex;
            align-items: center;
            justify-content: center;
            position: relative;
            color: white;
            font-weight: bold;
        }
        
        .timeline-circle.completed {
            background: #10B981;
            border-color: #10B981;
        }
        
        .timeline-circle.active {
            background: #F59E0B;
            border-color: #F59E0B;
        }
        
        .timeline-line {
            position: absolute;
            height: 3px;
            background: #D1D5DB;
            top: 25px;
            left: 0;
            right: 0;
            z-index: 1;
        }
        
        .timeline-line.completed {
            background: #10B981;
        }
        
        .timeline-label {
            margin-top: 0.75rem;
            font-size: 0.875rem;
            font-weight: 500;
            color: #6B7280;
            text-align: center;
        }
        
        .active-session-card {
            background: linear-gradient(135deg, #323962, #8B5CF6);
            color: white;
            border-radius: 15px;
            padding: 2rem;
            margin: 2rem 0;
        }
        
        .session-card {
            background: white;
            border: 2px solid #323962;
            border-radius: 15px;
            padding: 1.5rem;
            margin-bottom: 1.5rem;
            transition: transform 0.3s;
        }
        
        .session-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 10px 20px rgba(0,0,0,0.15);
        }
        
        .counsellor-image {
            width: 80px;
            height: 80px;
            border-radius: 50%;
            object-fit: cover;
            background: #e6e6fa;
        }
        
        .btn-custom {
            background: #323962;
            color: white;
            border: none;
            padding: 0.5rem 1.5rem;
            border-radius: 8px;
            font-weight: 500;
        }
        
        .btn-custom:hover {
            background: #8B5CF6;
            color: white;
        }
        
        .btn-outline-custom {
            border: 2px solid #323962;
            color: #323962;
            background: transparent;
            padding: 0.5rem 1.5rem;
            border-radius: 8px;
        }
        
        .btn-outline-custom:hover {
            background: #323962;
            color: white;
        }
        
        .form-section {
            background: white;
            border-radius: 15px;
            padding: 2rem;
            margin: 2rem 0;
        }
        
        .status-badge {
            display: inline-block;
            padding: 0.25rem 0.75rem;
            border-radius: 20px;
            font-size: 0.875rem;
            font-weight: 500;
        }
        
        .status-available {
            background: #D1FAE5;
            color: #065F46;
        }
        
        .status-unavailable {
            background: #FEE2E2;
            color: #991B1B;
        }
    </style>
</head>
<body>
    <!-- Header -->
    <header class="serenity-header">
        <div class="container">
            <div class="d-flex justify-content-between align-items-center">
                <div class="logo-section">
                    <svg class="logo-icon" viewBox="0 0 50 50" fill="#323962">
                        <circle cx="25" cy="25" r="20" fill="none" stroke="#323962" stroke-width="2"/>
                        <path d="M25 10 C 30 15, 35 20, 25 30 C 15 20, 20 15, 25 10 Z"/>
                    </svg>
                    <h1 class="brand-name">SerenityHub</h1>
                </div>
                <nav class="nav-links">
                    <a href="<%= request.getContextPath() %>">Home</a>
                    <a href="<%= request.getContextPath() %>/counselling">Counselling</a>
                    <a href="<%= request.getContextPath() %>/feedback">Feedback</a>
                    <a href="<%= request.getContextPath() %>/profile">Profile</a>
                </nav>
            </div>
        </div>
    </header>

    <main class="container py-4">
        <h2 class="page-title">Your Counselling & Support Hub</h2>
        <p class="page-subtitle">Dedicated, confidential support is here. Take the first step forward to live the full life you deserve.</p>

        <!-- Timeline for Request Status -->
        <% if (myRequests != null && !myRequests.isEmpty()) { 
       for (CounsellingRequest reqItem : myRequests) { 
%>

                <div class="timeline-container">
                    <div class="timeline-header">
                        Your Request
                        <a href="?action=edit&id=<%= reqItem.getId() %>" class="btn btn-sm btn-outline-custom float-end">
                            Manage Request
                        </a>
                    </div>
                    
                    <div class="position-relative">
                        <div class="timeline-line <%= !reqItem.getStatus().equals("submitted") ? "completed" : "" %>"></div>
                        <div class="timeline">
                            <div class="timeline-step">
                                <div class="timeline-circle completed">✓</div>
                                <div class="timeline-label">FORM SUBMITTED</div>
                            </div>
                            <div class="timeline-step">
                                <div class="timeline-circle <%= reqItem.getStatus().equals("viewed") || reqItem.getStatus().equals("confirmed") || reqItem.getStatus().equals("ongoing") || reqItem.getStatus().equals("completed") ? "completed" : "" %>">
                                    <%= reqItem.getStatus().equals("viewed") || reqItem.getStatus().equals("confirmed") || reqItem.getStatus().equals("ongoing") || reqItem.getStatus().equals("completed") ? "✓" : "" %>
                                </div>
                                <div class="timeline-label">VIEWED DETAILS</div>
                            </div>
                            <div class="timeline-step">
                                <div class="timeline-circle <%= reqItem.getStatus().equals("confirmed") || reqItem.getStatus().equals("ongoing") || reqItem.getStatus().equals("completed") ? "completed" : (reqItem.getStatus().equals("viewed") ? "active" : "") %>">
                                    <%= reqItem.getStatus().equals("confirmed") || reqItem.getStatus().equals("ongoing") || reqItem.getStatus().equals("completed") ? "✓" : "" %>
                                </div>
                                <div class="timeline-label">SESSION CONFIRMED</div>
                            </div>
                            <div class="timeline-step">
                                <div class="timeline-circle <%= reqItem.getStatus().equals("ongoing") ? "active" : (reqItem.getStatus().equals("completed") ? "completed" : "") %>">
                                    <%= reqItem.getStatus().equals("completed") ? "✓" : "" %>
                                </div>
                                <div class="timeline-label">ONGOING</div>
                            </div>
                            <div class="timeline-step">
                                <div class="timeline-circle <%= reqItem.getStatus().equals("completed") ? "completed" : "" %>">
                                    <%= reqItem.getStatus().equals("completed") ? "✓" : "" %>
                                </div>
                                <div class="timeline-label">ACHIEVED SUPPORT</div>
                            </div>
                        </div>
                    </div>
                </div>
        <% } } %>

        <!-- My Active Counselling Session -->
        <% if (activeSession != null) { %>
            <div class="active-session-card">
                <h3 class="mb-3">🚀 My Active Counselling Session</h3>
                <div class="row align-items-center">
                    <div class="col-md-2">
                        <img src="<%= request.getContextPath() %>/<%= activeSession.getAssignedCounsellorImage() %>" 
                             alt="<%= activeSession.getAssignedCounsellor() %>" 
                             class="counsellor-image">
                    </div>
                    <div class="col-md-6">
                        <h4 class="mb-1"><%= activeSession.getAssignedCounsellor() %></h4>
                        <p class="mb-1"><%= activeSession.getConcernType() %></p>
                        <p class="mb-0"><%= activeSession.getConfirmedDate() %> @ <%= activeSession.getConfirmedTime() %></p>
                    </div>
                    <div class="col-md-4 text-end">
                        <form action="<%= request.getContextPath() %>/counselling" method="post" class="d-inline">
                            <input type="hidden" name="action" value="joinSession">
                            <input type="hidden" name="sessionId" value="<%= activeSession.getId() %>">
                            <button type="submit" class="btn btn-light btn-lg mb-2">Join Session</button>
                        </form>
                        <button class="btn btn-outline-light" data-bs-toggle="modal" data-bs-target="#rescheduleModal<%= activeSession.getId() %>">
                            Reschedule
                        </button>
                    </div>
                </div>
            </div>
        <% } %>

        <!-- Online Session Access -->
        <h3 class="mt-5 mb-3">🚀 Online Session Access</h3>
        <div class="row">
            <% for (CounsellingSession cs : availableSessions) { %>
                <div class="col-md-3 mb-4">
                    <div class="session-card">
                        <div class="d-flex align-items-center mb-3">
                            <img src="<%= cs.getCounsellorImage() %>"alt="<%= cs.getCounsellorName() %>"class="counsellor-image me-3">
                            <div>
                                <h5 class="mb-1"><%= cs.getCounsellorName() %></h5>
                                <p class="mb-0 text-muted small"><%= cs.getTimeSlot() %></p>
                                <span class="status-badge <%= cs.getStatus().equals("available") ? "status-available" : "status-unavailable" %>">
                                    <%= cs.getDate() %>
                                </span>
                            </div>
                        </div>
                        <p class="mb-3"><%= cs.getSpecialty() %></p>
                        <% if (cs.getStatus().equals("available")) { %>
                            <button class="btn btn-custom w-100" onclick="attendSession('<%= cs.getId() %>')">
                                Attend Session
                            </button>
                        <% } else { %>
                            <button class="btn btn-custom w-100" disabled>Unavailable</button>
                        <% } %>
                    </div>
                </div>
            <% } %>
        </div>

        <!-- Request Form Section -->
        <div class="form-section" id="requestForm">
            <h3 class="mb-4"><%= editRequest != null ? "Edit Your Request" : "Schedule a Counselling Session" %></h3>
            <form action="<%= request.getContextPath() %>/counselling" method="post">
                <input type="hidden" name="action" value="<%= editRequest != null ? "updateRequest" : "submitRequest" %>">
                <% if (editRequest != null) { %>
                    <input type="hidden" name="requestId" value="<%= editRequest.getId() %>">
                <% } %>
                
                <div class="row">
                    <div class="col-md-6 mb-3">
                        <label for="counsellor" class="form-label">Preferred Counsellor</label>
                        <select class="form-select" id="counsellor" name="counsellor" required>
                            <option value="">Select Counsellor</option>
                            <% for (CounsellingSession cs : availableSessions) { %>
                                <option value="<%= cs.getCounsellorName() %>" <%=(editRequest !=null &&
                                    editRequest.getCounsellorPreference().equals(cs.getCounsellorName())) ? "selected" : "" %>>
                                    <%= cs.getCounsellorName() %> - <%= cs.getSpecialty() %>
                                </option>
                            
                                <% } %>
                        </select>
                    </div>
                    
                    <div class="col-md-6 mb-3">
                        <label for="concernType" class="form-label">Type of Concern</label>
                        <select class="form-select" id="concernType" name="concernType" required>
                            <option value="">Select Concern Type</option>
                            <option value="Anxiety & Stress" <%= editRequest != null && "Anxiety & Stress".equals(editRequest.getConcernType()) ? "selected" : "" %>>
                                Anxiety & Stress
                            </option>
                            <option value="Depression" <%= editRequest != null && "Depression".equals(editRequest.getConcernType()) ? "selected" : "" %>>
                                Depression
                            </option>
                            <option value="Relationship Issues" <%= editRequest != null && "Relationship Issues".equals(editRequest.getConcernType()) ? "selected" : "" %>>
                                Relationship Issues
                            </option>
                            <option value="Career Guidance" <%= editRequest != null && "Career Guidance".equals(editRequest.getConcernType()) ? "selected" : "" %>>
                                Career Guidance
                            </option>
                            <option value="Other" <%= editRequest != null && "Other".equals(editRequest.getConcernType()) ? "selected" : "" %>>
                                Other
                            </option>
                        </select>
                    </div>
                </div>
                
                <div class="mb-3">
                    <label for="description" class="form-label">Brief Description</label>
                    <textarea class="form-control" id="description" name="description" rows="4" 
                              placeholder="Please describe what you'd like to discuss..." required><%= editRequest != null ? editRequest.getDescription() : "" %></textarea>
                </div>
                
                <div class="row">
                    <div class="col-md-6 mb-3">
                        <label for="preferredDate" class="form-label">Preferred Date</label>
                        <input type="date" class="form-control" id="preferredDate" name="preferredDate" 
                               value="<%= editRequest != null ? editRequest.getPreferredDate() : "" %>" required>
                    </div>
                    
                    <div class="col-md-6 mb-3">
                        <label for="preferredTime" class="form-label">Preferred Time</label>
                        <input type="time" class="form-control" id="preferredTime" name="preferredTime" 
                               value="<%= editRequest != null ? editRequest.getPreferredTime() : "" %>" required>
                    </div>
                </div>
                
                <div class="d-flex gap-2">
                    <button type="submit" class="btn btn-custom btn-lg">
                        <%= editRequest != null ? "Update Request" : "Submit Request" %>
                    </button>
                    <% if (editRequest != null) { %>
                        <a href="<%= request.getContextPath() %>/counselling" class="btn btn-outline-custom btn-lg">
                            Cancel
                        </a>
                    <% } %>
                </div>
            </form>
        </div>
    </main>

    <!-- Reschedule Modal -->
    <% if (activeSession != null) { %>
        <div class="modal fade" id="rescheduleModal<%= activeSession.getId() %>" tabindex="-1">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title">Reschedule Session</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                    </div>
                    <form action="<%= request.getContextPath() %>/counselling" method="post">
                        <div class="modal-body">
                            <input type="hidden" name="action" value="reschedule">
                            <input type="hidden" name="requestId" value="<%= activeSession.getId() %>">
                            
                            <div class="mb-3">
                                <label for="newDate" class="form-label">New Date</label>
                                <input type="date" class="form-control" id="newDate" name="preferredDate" required>
                            </div>
                            
                            <div class="mb-3">
                                <label for="newTime" class="form-label">New Time</label>
                                <input type="time" class="form-control" id="newTime" name="preferredTime" required>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                            <button type="submit" class="btn btn-custom">Confirm Reschedule</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    <% } %>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        function attendSession(sessionId) {
            if(confirm('Are you ready to join this counselling session?')) {
                window.location.href = '<%= request.getContextPath() %>/video-session?id=' + sessionId;
            }
        }
        
        // Auto-refresh to update timeline status (in production, use WebSocket)
        // setTimeout(function() {
        //     location.reload();
        // }, 5000);
    </script>
</body>
</html>