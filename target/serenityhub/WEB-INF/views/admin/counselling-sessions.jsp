<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ page import="java.util.*, com.serenityhub.model.*" %>
        <% List<CounsellingSession> sessions = (List<CounsellingSession>) request.getAttribute("sessions");
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
                    <title>Counselling Sessions Management - SerenityHub Admin</title>
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
                                        <circle cx="25" cy="25" r="20" fill="none" stroke="#323962" stroke-width="2" />
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
                            <h2 class="page-title">Counselling Sessions Management</h2>
                            <button class="btn-primary" data-bs-toggle="modal" data-bs-target="#addSessionModal">
                                + Add New Session
                            </button>
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
                                                        <th>Counsellor</th>
                                                        <th>Specialty</th>
                                                        <th>Date & Time</th>
                                                        <th>Time Slot</th>
                                                        <th>Google Meet Link</th>
                                                        <th>Status</th>
                                                        <th>Actions</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <% if (sessions !=null && !sessions.isEmpty()) { for
                                                        (CounsellingSession s : sessions) { %>
                                                        <tr>
                                                            <td>
                                                                <%= s.getId() %>
                                                            </td>
                                                            <td>
                                                                <div class="d-flex align-items-center gap-2">
                                                                    <img src="<%= s.getCounsellorImage() %>"
                                                                        alt="<%= s.getCounsellorName() %>"
                                                                        class="counsellor-image"
                                                                        style="width: 40px; height: 40px;">
                                                                    <strong>
                                                                        <%= s.getCounsellorName() %>
                                                                    </strong>
                                                                </div>
                                                            </td>
                                                            <td>
                                                                <%= s.getSpecialty() %>
                                                            </td>
                                                            <td>
                                                                <%= s.getSessionDate() %><br>
                                                                    <%= s.getSessionTime() %>
                                                            </td>
                                                            <td>
                                                                <%= s.getTimeSlot() %>
                                                            </td>
                                                            <td>
                                                                <% if (s.getGoogleMeetLink() !=null &&
                                                                    !s.getGoogleMeetLink().isEmpty()) { %>
                                                                    <a href="<%= s.getGoogleMeetLink() %>"
                                                                        target="_blank" class="meet-link">
                                                                        View Link
                                                                    </a>
                                                                    <% } else { %>
                                                                        <span class="text-muted">Not set</span>
                                                                        <% } %>
                                                            </td>
                                                            <td>
                                                                <span class="status-badge status-<%= s.getStatus() %>">
                                                                    <%= s.getStatus().toUpperCase() %>
                                                                </span>
                                                            </td>
                                                            <td>
                                                                <div class="action-buttons">
                                                                    <button class="btn-secondary btn-small"
                                                                        data-bs-toggle="modal"
                                                                        data-bs-target="#editModal<%= s.getId() %>">
                                                                        Edit
                                                                    </button>
                                                                    <form method="post" style="display: inline;"
                                                                        onsubmit="return confirm('Are you sure you want to delete this session?');">
                                                                        <input type="hidden" name="action"
                                                                            value="deleteSession">
                                                                        <input type="hidden" name="id"
                                                                            value="<%= s.getId() %>">
                                                                        <button type="submit"
                                                                            class="btn-danger btn-small">Delete</button>
                                                                    </form>
                                                                </div>
                                                            </td>
                                                        </tr>

                                                        <!-- Edit Modal -->
                                                        <div class="modal fade" id="editModal<%= s.getId() %>"
                                                            tabindex="-1">
                                                            <div class="modal-dialog modal-lg">
                                                                <div class="modal-content">
                                                                    <div class="modal-header">
                                                                        <h5 class="modal-title">Edit Session</h5>
                                                                        <button type="button" class="btn-close"
                                                                            data-bs-dismiss="modal"></button>
                                                                    </div>
                                                                    <form
                                                                        action="<%= request.getContextPath() %>/admin/counselling"
                                                                        method="post">
                                                                        <div class="modal-body">
                                                                            <input type="hidden" name="action"
                                                                                value="editSession">
                                                                            <input type="hidden" name="id"
                                                                                value="<%= s.getId() %>">

                                                                            <div class="row">
                                                                                <div class="col-md-6 form-group">
                                                                                    <label>Counsellor Name *</label>
                                                                                    <input type="text"
                                                                                        class="form-control"
                                                                                        name="counsellorName"
                                                                                        value="<%= s.getCounsellorName() %>"
                                                                                        required>
                                                                                </div>
                                                                                <div class="col-md-6 form-group">
                                                                                    <label>Counsellor Image URL</label>
                                                                                    <input type="text"
                                                                                        class="form-control"
                                                                                        name="counsellorImage"
                                                                                        value="<%= s.getCounsellorImage() != null ? s.getCounsellorImage() : "" %>">
                                                                                </div>
                                                                            </div>

                                                                            <div class="form-group">
                                                                                <label>Specialty *</label>
                                                                                <input type="text" class="form-control"
                                                                                    name="specialty"
                                                                                    value="<%= s.getSpecialty() %>"
                                                                                    required>
                                                                            </div>

                                                                            <div class="row">
                                                                                <div class="col-md-4 form-group">
                                                                                    <label>Session Date *</label>
                                                                                    <input type="date"
                                                                                        class="form-control"
                                                                                        name="sessionDate"
                                                                                        value="<%= s.getSessionDate() %>"
                                                                                        required>
                                                                                </div>
                                                                                <div class="col-md-4 form-group">
                                                                                    <label>Session Time *</label>
                                                                                    <input type="time"
                                                                                        class="form-control"
                                                                                        name="sessionTime"
                                                                                        value="<%= s.getSessionTime() %>"
                                                                                        required>
                                                                                </div>
                                                                                <div class="col-md-4 form-group">
                                                                                    <label>Time Slot</label>
                                                                                    <input type="text"
                                                                                        class="form-control"
                                                                                        name="timeSlot"
                                                                                        value="<%= s.getTimeSlot() %>"
                                                                                        placeholder="e.g., 0800 - 1700">
                                                                                </div>
                                                                            </div>

                                                                            <div class="form-group">
                                                                                <label>Google Meet Link</label>
                                                                                <input type="url" class="form-control"
                                                                                    name="googleMeetLink"
                                                                                    value="<%= s.getGoogleMeetLink() != null ? s.getGoogleMeetLink() : "" %>"
                                                                                    placeholder="https://meet.google.com/xxx-xxxx-xxx">
                                                                                <small class="text-muted">Leave empty if
                                                                                    not available yet</small>
                                                                            </div>

                                                                            <div class="form-group">
                                                                                <label>Status *</label>
                                                                                <select class="form-control"
                                                                                    name="status" required>
                                                                                    <option value="available"
                                                                                        <%="available"
                                                                                        .equals(s.getStatus())
                                                                                        ? "selected" : "" %>>Available
                                                                                    </option>
                                                                                    <option value="unavailable"
                                                                                        <%="unavailable"
                                                                                        .equals(s.getStatus())
                                                                                        ? "selected" : "" %>>Unavailable
                                                                                    </option>
                                                                                    <option value="booked" <%="booked"
                                                                                        .equals(s.getStatus())
                                                                                        ? "selected" : "" %>>Booked
                                                                                    </option>
                                                                                </select>
                                                                            </div>
                                                                        </div>
                                                                        <div class="modal-footer">
                                                                            <button type="button" class="btn-secondary"
                                                                                data-bs-dismiss="modal">Cancel</button>
                                                                            <button type="submit"
                                                                                class="btn-primary">Update
                                                                                Session</button>
                                                                        </div>
                                                                    </form>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <% } } else { %>
                                                            <tr>
                                                                <td colspan="8" class="no-results">No sessions found.
                                                                </td>
                                                            </tr>
                                                            <% } %>
                                                </tbody>
                                            </table>
                                        </div>
                    </main>

                    <!-- Add Session Modal -->
                    <div class="modal fade" id="addSessionModal" tabindex="-1">
                        <div class="modal-dialog modal-lg">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title">Add New Counselling Session</h5>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                                </div>
                                <form action="<%= request.getContextPath() %>/admin/counselling" method="post">
                                    <div class="modal-body">
                                        <input type="hidden" name="action" value="addSession">

                                        <div class="row">
                                            <div class="col-md-6 form-group">
                                                <label>Counsellor Name *</label>
                                                <input type="text" class="form-control" name="counsellorName" required>
                                            </div>
                                            <div class="col-md-6 form-group">
                                                <label>Counsellor Image URL</label>
                                                <input type="text" class="form-control" name="counsellorImage"
                                                    placeholder="https://via.placeholder.com/80">
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <label>Specialty *</label>
                                            <input type="text" class="form-control" name="specialty"
                                                placeholder="e.g., Anxiety & Stress Handling" required>
                                        </div>

                                        <div class="row">
                                            <div class="col-md-4 form-group">
                                                <label>Session Date *</label>
                                                <input type="date" class="form-control" name="sessionDate" required>
                                            </div>
                                            <div class="col-md-4 form-group">
                                                <label>Session Time *</label>
                                                <input type="time" class="form-control" name="sessionTime" required>
                                            </div>
                                            <div class="col-md-4 form-group">
                                                <label>Time Slot</label>
                                                <input type="text" class="form-control" name="timeSlot"
                                                    placeholder="e.g., 0800 - 1700">
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <label>Google Meet Link</label>
                                            <input type="url" class="form-control" name="googleMeetLink"
                                                placeholder="https://meet.google.com/xxx-xxxx-xxx">
                                            <small class="text-muted">You can add this later if not available
                                                now</small>
                                        </div>

                                        <div class="form-group">
                                            <label>Status *</label>
                                            <select class="form-control" name="status" required>
                                                <option value="available">Available</option>
                                                <option value="unavailable">Unavailable</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn-secondary"
                                            data-bs-dismiss="modal">Cancel</button>
                                        <button type="submit" class="btn-primary">Create Session</button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>

                    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
                </body>

                </html>