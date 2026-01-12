<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ page import="java.util.*, com.serenityhub.model.*" %>
        <% List<CounsellingRequest> requests = (List<CounsellingRequest>) request.getAttribute("requests");
                List<CounsellingSession> sessions = (List<CounsellingSession>) request.getAttribute("sessions");
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
                            <title>Counselling Requests Management - SerenityHub Admin</title>
                            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
                                rel="stylesheet">
                            <link rel="stylesheet" href="<%= request.getContextPath() %>/assets/css/styles.css">
                        </head>

                        <body>
                            <header class="serenity-header">
                                <div class="container">
                                    <div class="d-flex justify-content-between align-items-center">
                                        <div class="logo-section">
                                            <svg class="logo-icon" viewBox="0 0 50 50" fill="#323962">
                                                <circle cx="25" cy="25" r="20" fill="none" stroke="#323962"
                                                    stroke-width="2" />
                                                <path d="M25 10 C 30 15, 35 20, 25 30 C 15 20, 20 15, 25 10 Z" />
                                            </svg>
                                            <h1 class="brand-name">SerenityHub Admin</h1>
                                        </div>
                                        <nav class="nav-links">
                                            <a href="<%= request.getContextPath() %>/admin/home">Dashboard</a>
                                            <a href="<%= request.getContextPath() %>/admin/counselling">Requests</a>
                                            <a
                                                href="<%= request.getContextPath() %>/admin/counselling?action=sessions">Sessions</a>
                                            <a href="<%= request.getContextPath() %>/">Logout</a>
                                        </nav>
                                    </div>
                                </div>
                            </header>

                            <main class="admin-container">
                                <div class="admin-header">
                                    <h2 class="page-title">Counselling Requests Management</h2>
                                    <a href="<%= request.getContextPath() %>/admin/counselling?action=sessions"
                                        class="btn-primary">
                                        Manage Sessions
                                    </a>
                                </div>

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

                                                <div class="counselling-table">
                                                    <table class="table">
                                                        <thead>
                                                            <tr>
                                                                <th>ID</th>
                                                                <th>User</th>
                                                                <th>Concern Type</th>
                                                                <th>Preferred Counsellor</th>
                                                                <th>Preferred Date/Time</th>
                                                                <th>Status</th>
                                                                <th>Submitted</th>
                                                                <th>Actions</th>
                                                            </tr>
                                                        </thead>
                                                        <tbody>
                                                            <% if (requests !=null && !requests.isEmpty()) { for
                                                                (CounsellingRequest req : requests) { %>
                                                                <tr>
                                                                    <td>
                                                                        <%= req.getId() %>
                                                                    </td>
                                                                    <td><strong>
                                                                            <%= req.getUserName() %>
                                                                        </strong></td>
                                                                    <td>
                                                                        <%= req.getConcernType() %>
                                                                    </td>
                                                                    <td>
                                                                        <%= req.getCounsellorPreference() %>
                                                                    </td>
                                                                    <td>
                                                                        <%= req.getPreferredDate() %> @ <%=
                                                                                req.getPreferredTime() %>
                                                                    </td>
                                                                    <td>
                                                                        <span
                                                                            class="status-badge status-<%= req.getStatus() %>">
                                                                            <%= req.getStatus().toUpperCase() %>
                                                                        </span>
                                                                    </td>
                                                                    <td>
                                                                        <%= req.getSubmittedDate() %>
                                                                    </td>
                                                                    <td>
                                                                        <div class="action-buttons">
                                                                            <button class="btn-secondary btn-small"
                                                                                data-bs-toggle="modal"
                                                                                data-bs-target="#viewModal<%= req.getId() %>">
                                                                                View Details
                                                                            </button>
                                                                            <% if ("submitted".equals(req.getStatus())
                                                                                || "viewed" .equals(req.getStatus())) {
                                                                                %>
                                                                                <button class="btn-primary btn-small"
                                                                                    data-bs-toggle="modal"
                                                                                    data-bs-target="#assignModal<%= req.getId() %>">
                                                                                    Assign Counsellor
                                                                                </button>
                                                                                <% } %>
                                                                        </div>
                                                                    </td>
                                                                </tr>

                                                                <!-- View Details Modal -->
                                                                <div class="modal fade" id="viewModal<%= req.getId() %>"
                                                                    tabindex="-1">
                                                                    <div class="modal-dialog modal-lg">
                                                                        <div class="modal-content">
                                                                            <div class="modal-header">
                                                                                <h5 class="modal-title">Request Details
                                                                                    - #<%= req.getId() %>
                                                                                </h5>
                                                                                <button type="button" class="btn-close"
                                                                                    data-bs-dismiss="modal"></button>
                                                                            </div>
                                                                            <div class="modal-body">
                                                                                <div class="request-details">
                                                                                    <p><strong>User:</strong>
                                                                                        <%= req.getUserName() %>
                                                                                    </p>
                                                                                    <p><strong>Concern Type:</strong>
                                                                                        <%= req.getConcernType() %>
                                                                                    </p>
                                                                                    <p><strong>Preferred
                                                                                            Counsellor:</strong>
                                                                                        <%= req.getCounsellorPreference()
                                                                                            %>
                                                                                    </p>
                                                                                    <p><strong>Description:</strong></p>
                                                                                    <p>
                                                                                        <%= req.getDescription() %>
                                                                                    </p>
                                                                                    <p><strong>Preferred
                                                                                            Date/Time:</strong>
                                                                                        <%= req.getPreferredDate() %> @
                                                                                            <%= req.getPreferredTime()
                                                                                                %>
                                                                                    </p>
                                                                                    <p><strong>Status:</strong> <span
                                                                                            class="status-badge status-<%= req.getStatus() %>">
                                                                                            <%= req.getStatus().toUpperCase()
                                                                                                %>
                                                                                        </span></p>
                                                                                    <% if (req.getAssignedCounsellor()
                                                                                        !=null) { %>
                                                                                        <hr>
                                                                                        <p><strong>Assigned
                                                                                                Counsellor:</strong>
                                                                                            <%= req.getAssignedCounsellor()
                                                                                                %>
                                                                                        </p>
                                                                                        <p><strong>Confirmed
                                                                                                Date/Time:</strong>
                                                                                            <%= req.getConfirmedDate()
                                                                                                %> @ <%=
                                                                                                    req.getConfirmedTime()
                                                                                                    %>
                                                                                        </p>
                                                                                        <% if (req.getGoogleMeetLink()
                                                                                            !=null) { %>
                                                                                            <p><strong>Google Meet
                                                                                                    Link:</strong>
                                                                                                <a href="<%= req.getGoogleMeetLink() %>"
                                                                                                    target="_blank"
                                                                                                    class="meet-link">
                                                                                                    <%= req.getGoogleMeetLink()
                                                                                                        %>
                                                                                                </a>
                                                                                            </p>
                                                                                            <% } %>
                                                                                                <% if
                                                                                                    (req.getAdminNotes()
                                                                                                    !=null) { %>
                                                                                                    <p><strong>Admin
                                                                                                            Notes:</strong>
                                                                                                        <%= req.getAdminNotes()
                                                                                                            %>
                                                                                                    </p>
                                                                                                    <% } %>
                                                                                                        <% } %>
                                                                                </div>
                                                                            </div>
                                                                            <div class="modal-footer">
                                                                                <button type="button"
                                                                                    class="btn-secondary"
                                                                                    data-bs-dismiss="modal">Close</button>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>

                                                                <!-- Assign Counsellor Modal -->
                                                                <div class="modal fade"
                                                                    id="assignModal<%= req.getId() %>" tabindex="-1">
                                                                    <div class="modal-dialog">
                                                                        <div class="modal-content">
                                                                            <div class="modal-header">
                                                                                <h5 class="modal-title">Assign
                                                                                    Counsellor - Request #<%=
                                                                                        req.getId() %>
                                                                                </h5>
                                                                                <button type="button" class="btn-close"
                                                                                    data-bs-dismiss="modal"></button>
                                                                            </div>
                                                                            <form
                                                                                action="<%= request.getContextPath() %>/admin/counselling"
                                                                                method="post">
                                                                                <div class="modal-body">
                                                                                    <input type="hidden" name="action"
                                                                                        value="assignCounsellor">
                                                                                    <input type="hidden"
                                                                                        name="requestId"
                                                                                        value="<%= req.getId() %>">

                                                                                    <div class="form-group">
                                                                                        <label>Select Available
                                                                                            Session</label>
                                                                                        <select class="form-control"
                                                                                            name="sessionId" required>
                                                                                            <option value="">Choose a
                                                                                                session...</option>
                                                                                            <% for (CounsellingSession s
                                                                                                : sessions) { if
                                                                                                ("available".equals(s.getStatus()))
                                                                                                { %>
                                                                                                <option
                                                                                                    value="<%= s.getId() %>">
                                                                                                    <%= s.getCounsellorName()
                                                                                                        %> - <%=
                                                                                                            s.getSpecialty()
                                                                                                            %>
                                                                                                            (<%= s.getSessionDate()
                                                                                                                %> @ <%=
                                                                                                                    s.getSessionTime()
                                                                                                                    %>)
                                                                                                </option>
                                                                                                <% } } %>
                                                                                        </select>
                                                                                    </div>

                                                                                    <div class="form-group">
                                                                                        <label>Confirmed Date</label>
                                                                                        <input type="date"
                                                                                            class="form-control"
                                                                                            name="confirmedDate"
                                                                                            value="<%= req.getPreferredDate() %>"
                                                                                            required>
                                                                                    </div>

                                                                                    <div class="form-group">
                                                                                        <label>Confirmed Time</label>
                                                                                        <input type="time"
                                                                                            class="form-control"
                                                                                            name="confirmedTime"
                                                                                            value="<%= req.getPreferredTime() %>"
                                                                                            required>
                                                                                    </div>

                                                                                    <div class="form-group">
                                                                                        <label>Admin Notes
                                                                                            (Optional)</label>
                                                                                        <textarea class="form-control"
                                                                                            name="adminNotes"
                                                                                            rows="3"></textarea>
                                                                                    </div>
                                                                                </div>
                                                                                <div class="modal-footer">
                                                                                    <button type="button"
                                                                                        class="btn-secondary"
                                                                                        data-bs-dismiss="modal">Cancel</button>
                                                                                    <button type="submit"
                                                                                        class="btn-primary">Assign &
                                                                                        Confirm</button>
                                                                                </div>
                                                                            </form>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <% } } else { %>
                                                                    <tr>
                                                                        <td colspan="8" class="no-results">No requests
                                                                            found.</td>
                                                                    </tr>
                                                                    <% } %>
                                                        </tbody>
                                                    </table>
                                                </div>
                            </main>

                            <script
                                src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
                        </body>

                        </html>