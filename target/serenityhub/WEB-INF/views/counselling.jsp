<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*, com.serenityhub.model.*" %>
<%
    List<CounsellingSession> availableSessions = (List<CounsellingSession>) request.getAttribute("availableSessions");
    List<CounsellingRequest> myRequests = (List<CounsellingRequest>) request.getAttribute("myRequests");
    CounsellingRequest activeSession = (CounsellingRequest) request.getAttribute("activeSession");
    CounsellingRequest editRequest = (CounsellingRequest) request.getAttribute("editRequest");
    
    String successMessage = (String) session.getAttribute("successMessage");
    String errorMessage = (String) session.getAttribute("errorMessage");
    
    session.removeAttribute("successMessage");
    session.removeAttribute("errorMessage");
%>
                        <!DOCTYPE html>
                        <html lang="en">

                        <head>
                            <meta charset="UTF-8">
                            <meta name="viewport" content="width=device-width, initial-scale=1.0">
                            <title>Counselling & Support Hub - SerenityHub</title>
                            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
                                rel="stylesheet">
                            <link rel="stylesheet" href="<%= request.getContextPath() %>/assets/css/styles.css">
                        </head>

                        <body>
                            <!-- Header -->
                            <header class="serenity-header">
                                <div class="container">
                                    <div class="d-flex justify-content-between align-items-center">
                                        <div class="logo-section">
                                            <svg class="logo-icon" viewBox="0 0 50 50" fill="#323962">
                                                <circle cx="25" cy="25" r="20" fill="none" stroke="#323962"
                                                    stroke-width="2" />
                                                <path d="M25 10 C 30 15, 35 20, 25 30 C 15 20, 20 15, 25 10 Z" />
                                            </svg>
                                            <h1 class="brand-name">SerenityHub</h1>
                                        </div>
                                        <nav class="nav-links">
                                            <a href="<%= request.getContextPath() %>/home">Home</a>
                                            <a href="<%= request.getContextPath() %>/counselling">Counselling</a>
                                            <a
                                                href="<%= request.getContextPath() %>/educational-resources">Resources</a>
                                            <a href="<%= request.getContextPath() %>/profile">Profile</a>
                                        </nav>
                                    </div>
                                </div>
                            </header>

                            <main class="container py-4">
                                <h2 class="page-title">Your Counselling & Support Hub</h2>
                                <p class="page-subtitle">Dedicated, confidential support is here. Take the first step
                                    forward to live the full life you deserve.</p>

                                <!-- Success/Error Messages -->
                                <% if (successMessage !=null) { %>
                                    <div class="alert alert-success">
                                        <%= successMessage %>
                                    </div>
                                    <% } %>
                                        <% if (errorMessage !=null) { %>
                                            <div class="alert alert-danger">
                                                <%= errorMessage %>
                                            </div>
                                            <% } %>

                                                <!-- Timeline for Request Status -->
                                                <% if (myRequests !=null && !myRequests.isEmpty()) { for
                                                    (CounsellingRequest reqItem : myRequests) { %>
                                                    <div class="timeline-container">
                                                        <div class="timeline-header">
                                                            Your Request #<%= reqItem.getId() %>
                                                                <% if (!"completed".equals(reqItem.getStatus()) &&
                                                                    !"cancelled".equals(reqItem.getStatus())) { %>
                                                                    <a href="?action=edit&id=<%= reqItem.getId() %>"
                                                                        class="btn btn-sm btn-outline-custom float-end">
                                                                        Manage Request
                                                                    </a>
                                                                    <% } %>
                                                        </div>

                                                        <div class="position-relative">
                                                            <div class="timeline-line <%= !"submitted".equals(reqItem.getStatus()) ? "completed" : "" %>"></div>
                                                            <div class="timeline">
                                                                <!-- Step 1: Form Submitted -->
                                                                <div class="timeline-step">
                                                                    <div class="timeline-circle completed">✓</div>
                                                                    <div class="timeline-label">FORM SUBMITTED</div>
                                                                </div>

                                                                <!-- Step 2: Viewed Details -->
                                                                <div class="timeline-step">
                                                                    <div class="timeline-circle <%= "viewed".equals(reqItem.getStatus()) || "confirmed" .equals(reqItem.getStatus()) || "ongoing" .equals(reqItem.getStatus())|| "completed" .equals(reqItem.getStatus()) ? "completed" : "" %>">
                                                                        <%= "viewed" .equals(reqItem.getStatus())
                                                                            || "confirmed" .equals(reqItem.getStatus())
                                                                            || "ongoing" .equals(reqItem.getStatus())
                                                                            || "completed" .equals(reqItem.getStatus())
                                                                            ? "✓" : "" %>
                                                                    </div>
                                                                    <div class="timeline-label">VIEWED DETAILS</div>
                                                                </div>

                                                                <!-- Step 3: Session Confirmed -->
                                                                <div class="timeline-step">
                                                                    <div class="timeline-circle <%= "confirmed".equals(reqItem.getStatus()) || "ongoing".equals(reqItem.getStatus()) || "completed".equals(reqItem.getStatus()) ? "completed" : ("viewed".equals(reqItem.getStatus()) ? "active" : "") %>">
                                                                        <%= "confirmed" .equals(reqItem.getStatus())
                                                                            || "ongoing" .equals(reqItem.getStatus())
                                                                            || "completed" .equals(reqItem.getStatus())
                                                                            ? "✓" : "" %>
                                                                    </div>
                                                                    <div class="timeline-label">SESSION CONFIRMED</div>
                                                                </div>

                                                                <!-- Step 4: Ongoing -->
                                                                <div class="timeline-step">
                                                                    <div class="timeline-circle <%= "ongoing".equals(reqItem.getStatus()) ? "active" : ("completed".equals(reqItem.getStatus()) ? "completed" : "") %>">
                                                                        <%= "completed" .equals(reqItem.getStatus())
                                                                            ? "✓" : "" %>
                                                                    </div>
                                                                    <div class="timeline-label">ONGOING</div>
                                                                </div>

                                                                <!-- Step 5: Achieved Support -->
                                                                <div class="timeline-step">
                                                                    <div class="timeline-circle <%= "completed".equals(reqItem.getStatus()) ? "completed" : "" %>">
                                                                        <%= "completed" .equals(reqItem.getStatus())
                                                                            ? "✓" : "" %>
                                                                    </div>
                                                                    <div class="timeline-label">ACHIEVED SUPPORT</div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <% } } %>

                                                        <!-- My Active Counselling Session -->
                                                        <% if (activeSession !=null) { %>
                                                            <div class="active-session-card">
                                                                <h3 class="mb-3">🚀 My Active Counselling Session</h3>
                                                                <div class="row align-items-center">
                                                                    <div class="col-md-2">
                                                                        <img src="<%= activeSession.getAssignedCounsellorImage() != null ? activeSession.getAssignedCounsellorImage() : "https://via.placeholder.com/80" %>"
                                                                        alt="<%= activeSession.getAssignedCounsellor() %>"
                                                                        class="counsellor-image">
                                                                    </div>
                                                                    <div class="col-md-6">
                                                                        <h4 class="mb-1">
                                                                            <%= activeSession.getAssignedCounsellor() %>
                                                                        </h4>
                                                                        <p class="mb-1">
                                                                            <%= activeSession.getConcernType() %>
                                                                        </p>
                                                                        <p class="mb-0">
                                                                            <%= activeSession.getConfirmedDate() %> @
                                                                                <%= activeSession.getConfirmedTime() %>
                                                                        </p>
                                                                        <% if (activeSession.getAdminNotes() !=null &&
                                                                            !activeSession.getAdminNotes().isEmpty()) {
                                                                            %>
                                                                            <p class="mb-0 mt-2">
                                                                                <small><strong>Note:</strong>
                                                                                    <%= activeSession.getAdminNotes() %>
                                                                                </small></p>
                                                                            <% } %>
                                                                    </div>
                                                                    <div class="col-md-4 text-end">
                                                                        <% if (activeSession.getGoogleMeetLink() !=null
                                                                            &&
                                                                            !activeSession.getGoogleMeetLink().isEmpty())
                                                                            { %>
                                                                            <form
                                                                                action="<%= request.getContextPath() %>/counselling"
                                                                                method="post" class="d-inline">
                                                                                <input type="hidden" name="action"
                                                                                    value="joinSession">
                                                                                <input type="hidden" name="sessionId"
                                                                                    value="<%= activeSession.getId() %>">
                                                                                <button type="submit"
                                                                                    class="btn btn-light btn-lg mb-2">Join
                                                                                    Session</button>
                                                                            </form>
                                                                            <% } else { %>
                                                                                <button
                                                                                    class="btn btn-light btn-lg mb-2"
                                                                                    disabled>Waiting for Meet
                                                                                    Link</button>
                                                                                <% } %>
                                                                                    <button
                                                                                        class="btn btn-outline-light"
                                                                                        data-bs-toggle="modal"
                                                                                        data-bs-target="#rescheduleModal<%= activeSession.getId() %>">
                                                                                        Reschedule
                                                                                    </button>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <% } %>

                                                                <!-- Online Session Access -->
                                                                <h3 class="mt-5 mb-3">🚀 Online Session Access</h3>
                                                                <% if (availableSessions !=null &&
                                                                    !availableSessions.isEmpty()) { %>
                                                                    <div class="row">
                                                                        <% for (CounsellingSession cs :
                                                                            availableSessions) { %>
                                                                            <div class="col-md-3 mb-4">
                                                                                <div class="session-card">
                                                                                    <div
                                                                                        class="d-flex align-items-center mb-3">
                                                                                        <img src="<%= cs.getCounsellorImage() != null ? cs.getCounsellorImage() : "https://via.placeholder.com/80" %>"
                                                                                        alt="<%= cs.getCounsellorName() %>"
                                                                                        class="counsellor-image me-3">
                                                                                            <div>
                                                                                                <h5 class="mb-1">
                                                                                                    <%= cs.getCounsellorName()
                                                                                                        %>
                                                                                                </h5>
                                                                                                <p
                                                                                                    class="mb-0 text-muted small">
                                                                                                    <%= cs.getTimeSlot()
                                                                                                        %>
                                                                                                </p>
                                                                                                <span
                                                                                                    class="status-badge status-<%= cs.getStatus() %>">
                                                                                                    <%= cs.getStatus().toUpperCase()
                                                                                                        %>
                                                                                                </span>
                                                                                            </div>
                                                                                    </div>
                                                                                    <p class="mb-3">
                                                                                        <%= cs.getSpecialty() %>
                                                                                    </p>
                                                                                    <% if
                                                                                        ("available".equals(cs.getStatus()))
                                                                                        { %>
                                                                                        <% if (cs.getGoogleMeetLink()
                                                                                            !=null &&
                                                                                            !cs.getGoogleMeetLink().isEmpty())
                                                                                            { %>
                                                                                            <a href="<%= cs.getGoogleMeetLink() %>"
                                                                                                target="_blank"
                                                                                                class="btn btn-custom w-100">Join
                                                                                                Now</a>
                                                                                            <% } else { %>
                                                                                                <button
                                                                                                    class="btn btn-custom w-100"
                                                                                                    disabled>Link Coming
                                                                                                    Soon</button>
                                                                                                <% } %>
                                                                                                    <% } else { %>
                                                                                                        <button
                                                                                                            class="btn btn-custom w-100"
                                                                                                            disabled>Unavailable</button>
                                                                                                        <% } %>
                                                                                </div>
                                                                            </div>
                                                                            <% } %>
                                                                    </div>
                                                                    <% } else { %>
                                                                        <div class="alert alert-info">No sessions
                                                                            available at the moment. Please check back
                                                                            later.</div>
                                                                        <% } %>

                                                                            <!-- Request Form Section -->
                                                                            <div class="form-section" id="requestForm">
                                                                                <h3 class="mb-4">
                                                                                    <%= editRequest !=null
                                                                                        ? "Edit Your Request"
                                                                                        : "Schedule a Counselling Session"
                                                                                        %>
                                                                                </h3>
                                                                                <form action="<%= request.getContextPath() %>/counselling" method="post">
                                                                                    <input type="hidden" name="action" value="<%= editRequest != null ? "updateRequest" : "submitRequest" %>">
                                                                                    <% if (editRequest !=null) { %>
                                                                                        <input type="hidden"
                                                                                            name="requestId"
                                                                                            value="<%= editRequest.getId() %>">
                                                                                        <% } %>

                                                                                            <div class="row">
                                                                                                <div
                                                                                                    class="col-md-6 mb-3">
                                                                                                    <label
                                                                                                        for="counsellor"
                                                                                                        class="form-label">Preferred
                                                                                                        Counsellor</label>
                                                                                                    <select
                                                                                                        class="form-select"
                                                                                                        id="counsellor"
                                                                                                        name="counsellor"
                                                                                                        required>
                                                                                                        <option
                                                                                                            value="">
                                                                                                            Select
                                                                                                            Counsellor
                                                                                                        </option>
                                                                                                        <% if
                                                                                                            (availableSessions
                                                                                                            !=null) {
                                                                                                            for
                                                                                                            (CounsellingSession
                                                                                                            cs :
                                                                                                            availableSessions)
                                                                                                            { %>
                                                                                                            <option
                                                                                                                value="<%= cs.getCounsellorName() %>"
                                                                                                                <%=(editRequest
                                                                                                                !=null
                                                                                                                &&
                                                                                                                editRequest.getCounsellorPreference().equals(cs.getCounsellorName()))
                                                                                                                ? "selected"
                                                                                                                : "" %>>
                                                                                                                <%= cs.getCounsellorName()
                                                                                                                    %> -
                                                                                                                    <%= cs.getSpecialty()
                                                                                                                        %>
                                                                                                            </option>
                                                                                                            <% } } %>
                                                                                                    </select>
                                                                                                </div>

                                                                                                <div
                                                                                                    class="col-md-6 mb-3">
                                                                                                    <label
                                                                                                        for="concernType"
                                                                                                        class="form-label">Type
                                                                                                        of
                                                                                                        Concern</label>
                                                                                                    <select
                                                                                                        class="form-select"
                                                                                                        id="concernType"
                                                                                                        name="concernType"
                                                                                                        required>
                                                                                                        <option
                                                                                                            value="">
                                                                                                            Select
                                                                                                            Concern Type
                                                                                                        </option>
                                                                                                        <option
                                                                                                            value="Anxiety & Stress"
                                                                                                            <%=editRequest
                                                                                                            !=null
                                                                                                            && "Anxiety & Stress"
                                                                                                            .equals(editRequest.getConcernType())
                                                                                                            ? "selected"
                                                                                                            : "" %>>
                                                                                                            Anxiety &
                                                                                                            Stress
                                                                                                        </option>
                                                                                                        <option
                                                                                                            value="Depression"
                                                                                                            <%=editRequest
                                                                                                            !=null
                                                                                                            && "Depression"
                                                                                                            .equals(editRequest.getConcernType())
                                                                                                            ? "selected"
                                                                                                            : "" %>>
                                                                                                            Depression
                                                                                                        </option>
                                                                                                        <option
                                                                                                            value="Relationship Issues"
                                                                                                            <%=editRequest
                                                                                                            !=null
                                                                                                            && "Relationship Issues"
                                                                                                            .equals(editRequest.getConcernType())
                                                                                                            ? "selected"
                                                                                                            : "" %>>
                                                                                                            Relationship
                                                                                                            Issues
                                                                                                        </option>
                                                                                                        <option
                                                                                                            value="Career Guidance"
                                                                                                            <%=editRequest
                                                                                                            !=null
                                                                                                            && "Career Guidance"
                                                                                                            .equals(editRequest.getConcernType())
                                                                                                            ? "selected"
                                                                                                            : "" %>>
                                                                                                            Career
                                                                                                            Guidance
                                                                                                        </option>
                                                                                                        <option
                                                                                                            value="Other"
                                                                                                            <%=editRequest
                                                                                                            !=null
                                                                                                            && "Other"
                                                                                                            .equals(editRequest.getConcernType())
                                                                                                            ? "selected"
                                                                                                            : "" %>>
                                                                                                            Other
                                                                                                        </option>
                                                                                                    </select>
                                                                                                </div>
                                                                                            </div>

                                                                                            <div class="mb-3">
                                                                                                <label for="description"
                                                                                                    class="form-label">Brief
                                                                                                    Description</label>
                                                                                                <textarea
                                                                                                    class="form-control"
                                                                                                    id="description"
                                                                                                    name="description"
                                                                                                    rows="4"
                                                                                                    placeholder="Please describe what you'd like to discuss..."
                                                                                                    required><%= editRequest != null ? editRequest.getDescription() : "" %></textarea>
                                                                                            </div>

                                                                                            <div class="row">
                                                                                                <div
                                                                                                    class="col-md-6 mb-3">
                                                                                                    <label
                                                                                                        for="preferredDate"
                                                                                                        class="form-label">Preferred
                                                                                                        Date</label>
                                                                                                    <input type="date"
                                                                                                        class="form-control"
                                                                                                        id="preferredDate"
                                                                                                        name="preferredDate"
                                                                                                        value="<%= editRequest != null ? editRequest.getPreferredDate() : "" %>"
                                                                                                        required>
                                                                                                </div>

                                                                                                <div
                                                                                                    class="col-md-6 mb-3">
                                                                                                    <label
                                                                                                        for="preferredTime"
                                                                                                        class="form-label">Preferred
                                                                                                        Time</label>
                                                                                                    <input type="time"
                                                                                                        class="form-control"
                                                                                                        id="preferredTime"
                                                                                                        name="preferredTime"
                                                                                                        value="<%= editRequest != null ? editRequest.getPreferredTime().substring(0, 5) : "" %>"
                                                                                                        required>
                                                                                                </div>
                                                                                            </div>

                                                                                            <div class="d-flex gap-2">
                                                                                                <button type="submit"
                                                                                                    class="btn btn-custom btn-lg">
                                                                                                    <%= editRequest
                                                                                                        !=null
                                                                                                        ? "Update Request"
                                                                                                        : "Submit Request"
                                                                                                        %>
                                                                                                </button>
                                                                                                <% if (editRequest
                                                                                                    !=null) { %>
                                                                                                    <a href="<%= request.getContextPath() %>/counselling"
                                                                                                        class="btn btn-outline-custom btn-lg">
                                                                                                        Cancel
                                                                                                    </a>
                                                                                                    <% } %>
                                                                                            </div>
                                                                                </form>
                                                                            </div>
                            </main>

                            <!-- Reschedule Modal -->
                            <% if (activeSession !=null) { %>
                                <div class="modal fade" id="rescheduleModal<%= activeSession.getId() %>" tabindex="-1">
                                    <div class="modal-dialog">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h5 class="modal-title">Reschedule Session</h5>
                                                <button type="button" class="btn-close"
                                                    data-bs-dismiss="modal"></button>
                                            </div>
                                            <form action="<%= request.getContextPath() %>/counselling" method="post">
                                                <div class="modal-body">
                                                    <input type="hidden" name="action" value="reschedule">
                                                    <input type="hidden" name="requestId"
                                                        value="<%= activeSession.getId() %>">

                                                    <div class="mb-3">
                                                        <label for="newDate" class="form-label">New Date</label>
                                                        <input type="date" class="form-control" id="newDate"
                                                            name="preferredDate" required>
                                                    </div>

                                                    <div class="mb-3">
                                                        <label for="newTime" class="form-label">New Time</label>
                                                        <input type="time" class="form-control" id="newTime"
                                                            name="preferredTime" required>
                                                    </div>
                                                </div>
                                                <div class="modal-footer">
                                                    <button type="button" class="btn btn-secondary"
                                                        data-bs-dismiss="modal">Cancel</button>
                                                    <button type="submit" class="btn btn-custom">Confirm
                                                        Reschedule</button>
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                                <% } %>

                                    <script
                                        src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
                        </body>

                        </html>