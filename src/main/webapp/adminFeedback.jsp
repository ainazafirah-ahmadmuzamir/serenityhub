<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>SerenityHub | Feedback Management</title>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/assets/css/admin-feedback.css">
</head>
<body>
    <div class="admin-dashboard-layout">
        <!-- Sidebar -->
        <aside class="admin-sidebar">
            <div class="sidebar-header">
                <div class="admin-logo">
                    <div class="logo-icon">S</div>
                    <div class="logo-text">
                        <h2>SerenityHub</h2>
                        <p class="logo-subtitle">Admin Portal</p>
                    </div>
                </div>
            </div>

            <nav class="sidebar-nav">
                <a href="<%= request.getContextPath() %>/adminhome" class="nav-item">
                    <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                        <path d="M3 9l9-7 9 7v11a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2z"></path>
                        <polyline points="9 22 9 12 15 12 15 22"></polyline>
                    </svg>
                    <span>Analytics Dashboard</span>
                </a>
                <a href="<%= request.getContextPath() %>/admin/feedback" class="nav-item active">
                    <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                        <path d="M21 11.5a8.38 8.38 0 0 1-.9 3.8 8.5 8.5 0 0 1-7.6 4.7 8.38 8.38 0 0 1-3.8-.9L3 21l1.9-5.7a8.38 8.38 0 0 1-.9-3.8 8.5 8.5 0 0 1 4.7-7.6 8.38 8.38 0 0 1 3.8-.9h.5a8.48 8.48 0 0 1 8 8v.5z"></path>
                    </svg>
                    <span>Feedback Management</span>
                </a>
            </nav>

            <div class="sidebar-footer">
                <a href="<%= request.getContextPath() %>/logout" class="nav-item">
                    <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                        <path d="M9 21H5a2 2 0 0 1-2-2V5a2 2 0 0 1 2-2h4"></path>
                        <polyline points="16 17 21 12 16 7"></polyline>
                        <line x1="21" y1="12" x2="9" y2="12"></line>
                    </svg>
                    <span>Logout</span>
                </a>
            </div>
        </aside>

        <!-- Main Content -->
        <div class="admin-main-content">
            <!-- Header -->
            <header class="admin-header">
                <div class="admin-header-content">
                    <div class="welcome-message">
                        <h3>Welcome back, Admin!</h3>
                        <p class="welcome-subtitle">Manage all user feedback in one place</p>
                    </div>
                </div>
            </header>

            <!-- Feedback Management Content -->
            <div class="feedback-management-container">
                <!-- Page Header -->
                <div class="page-header">
                    <h1>All Feedback</h1>
                    <div class="page-header-actions">
                        <button class="btn-action btn-view" onclick="exportFeedback()">
                            <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                                <path d="M21 15v4a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2v-4"></path>
                                <polyline points="7 10 12 15 17 10"></polyline>
                                <line x1="12" y1="15" x2="12" y2="3"></line>
                            </svg>
                            Export
                        </button>
                        <button class="btn-action btn-resolve" onclick="refreshFeedback()">
                            <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                                <path d="M23 4v6h-6M1 20v-6h6"></path>
                                <path d="M3.51 9a9 9 0 0 1 14.85-3.36L23 10M1 14l4.64 4.36A9 9 0 0 0 20.49 15"></path>
                            </svg>
                            Refresh
                        </button>
                    </div>
                </div>

                <!-- Stats Cards -->
                <div class="stats-cards">
                    <div class="stat-card">
                        <div class="stat-header">
                            <div class="stat-title">Total Feedback</div>
                            <div class="stat-icon total">📋</div>
                        </div>
                        <div class="stat-value" id="totalCount">24</div>
                        <div class="stat-change">
                            <span>▲</span> 12% from last month
                        </div>
                    </div>
                    <div class="stat-card">
                        <div class="stat-header">
                            <div class="stat-title">Pending</div>
                            <div class="stat-icon pending">⏳</div>
                        </div>
                        <div class="stat-value" id="pendingCount">8</div>
                        <div class="stat-change negative">
                            <span>▼</span> 2 from yesterday
                        </div>
                    </div>
                    <div class="stat-card">
                        <div class="stat-header">
                            <div class="stat-title">Reviewed</div>
                            <div class="stat-icon reviewed">👁️</div>
                        </div>
                        <div class="stat-value" id="reviewedCount">10</div>
                        <div class="stat-change">
                            <span>▲</span> 5 from yesterday
                        </div>
                    </div>
                    <div class="stat-card">
                        <div class="stat-header">
                            <div class="stat-title">Resolved</div>
                            <div class="stat-icon resolved">✅</div>
                        </div>
                        <div class="stat-value" id="resolvedCount">6</div>
                        <div class="stat-change">
                            <span>▲</span> 3 from yesterday
                        </div>
                    </div>
                </div>

                <!-- Filter Controls -->
                <div class="filter-controls">
                    <div class="filter-group">
                        <label class="filter-label">Category</label>
                        <select class="filter-select" id="categoryFilter" onchange="filterFeedback()">
                            <option value="all">All Categories</option>
                            <option value="FEATURE" selected>Feature Request</option>
                            <option value="BUG">Bug Report</option>
                            <option value="IMPROVEMENT">Improvement</option>
                            <option value="CONTENT">Content</option>
                            <option value="GENERAL">General</option>
                            <option value="OTHER">Others</option>
                        </select>
                    </div>
                    <div class="filter-group">
                        <label class="filter-label">Status</label>
                        <select class="filter-select" id="statusFilter" onchange="filterFeedback()">
                            <option value="all">All Status</option>
                            <option value="PENDING">Pending</option>
                            <option value="REVIEWED">Reviewed</option>
                            <option value="RESOLVED">Resolved</option>
                        </select>
                    </div>
                    <div class="filter-group">
                        <label class="filter-label">Priority</label>
                        <select class="filter-select" id="priorityFilter" onchange="filterFeedback()">
                            <option value="all">All Priority</option>
                            <option value="HIGH">High</option>
                            <option value="MEDIUM">Medium</option>
                            <option value="LOW">Low</option>
                        </select>
                    </div>
                    <div class="filter-group">
                        <label class="filter-label">Date Range</label>
                        <select class="filter-select" id="dateFilter" onchange="filterFeedback()">
                            <option value="all">All Time</option>
                            <option value="today">Today</option>
                            <option value="week">This Week</option>
                            <option value="month">This Month</option>
                        </select>
                    </div>
                </div>

                <!-- Feedback Table -->
                <div class="feedback-table-container">
                    <table class="feedback-table">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>User</th>
                                <th>Subject</th>
                                <th>Category</th>
                                <th>Status</th>
                                <th>Priority</th>
                                <th>Date</th>
                                <th>Actions</th>
                            </tr>
                        </thead>
                        <tbody id="feedbackTableBody">
                            <!-- Feedback items will be populated here -->
                        </tbody>
                    </table>
                    
                    <!-- Empty State -->
                    <div class="empty-state" id="emptyState" style="display: none;">
                        <div class="empty-icon">📭</div>
                        <h3>No feedback found</h3>
                        <p>There are no feedback items matching your current filters.</p>
                        <button class="btn-refresh" onclick="clearFilters()">Clear Filters</button>
                    </div>
                </div>

                <!-- Pagination -->
                <div class="pagination">
                    <button class="pagination-btn" onclick="changePage(-1)" id="prevBtn">Previous</button>
                    <button class="pagination-btn active">1</button>
                    <button class="pagination-btn" onclick="changePage(1)" id="nextBtn">Next</button>
                </div>
            </div>
        </div>
    </div>

    <script>
        // Sample feedback data
        const feedbackData = [
            {
                id: 1,
                user: "John Doe",
                email: "john@example.com",
                subject: "Add dark mode feature",
                message: "Please add dark mode to reduce eye strain during night usage.",
                category: "FEATURE",
                status: "PENDING",
                priority: "HIGH",
                date: "2024-01-15",
                adminResponse: ""
            },
            {
                id: 2,
                user: "Jane Smith",
                email: "jane@example.com",
                subject: "Login button not working",
                message: "The login button on mobile devices doesn't respond to clicks.",
                category: "BUG",
                status: "REVIEWED",
                priority: "HIGH",
                date: "2024-01-14",
                adminResponse: "Investigating the issue"
            },
            {
                id: 3,
                user: "Bob Wilson",
                email: "bob@example.com",
                subject: "Improve loading speed",
                message: "The dashboard takes too long to load initial data.",
                category: "IMPROVEMENT",
                status: "RESOLVED",
                priority: "MEDIUM",
                date: "2024-01-13",
                adminResponse: "Optimized database queries"
            },
            {
                id: 4,
                user: "Alice Johnson",
                email: "alice@example.com",
                subject: "Add more meditation sessions",
                message: "Can you add more guided meditation sessions?",
                category: "FEATURE",
                status: "PENDING",
                priority: "MEDIUM",
                date: "2024-01-12",
                adminResponse: ""
            },
            {
                id: 5,
                user: "Charlie Brown",
                email: "charlie@example.com",
                subject: "Typo on homepage",
                message: "There's a typo in the welcome message.",
                category: "CONTENT",
                status: "RESOLVED",
                priority: "LOW",
                date: "2024-01-11",
                adminResponse: "Fixed the typo"
            },
            {
                id: 6,
                user: "David Lee",
                email: "david@example.com",
                subject: "Great platform!",
                message: "Just wanted to say this platform is amazing!",
                category: "GENERAL",
                status: "REVIEWED",
                priority: "LOW",
                date: "2024-01-10",
                adminResponse: "Thank you for your feedback!"
            }
        ];

        let currentPage = 1;
        const itemsPerPage = 5;
        let filteredData = [...feedbackData];

        // Initialize the page
        document.addEventListener('DOMContentLoaded', function() {
            renderFeedbackTable();
            updateStats();
        });

        // Render feedback table
        function renderFeedbackTable() {
            const tableBody = document.getElementById('feedbackTableBody');
            const emptyState = document.getElementById('emptyState');
            
            if (filteredData.length === 0) {
                tableBody.innerHTML = '';
                emptyState.style.display = 'block';
                return;
            }
            
            emptyState.style.display = 'none';
            
            // Calculate pagination
            const startIndex = (currentPage - 1) * itemsPerPage;
            const endIndex = startIndex + itemsPerPage;
            const pageData = filteredData.slice(startIndex, endIndex);
            
            let tableHTML = '';
            
            pageData.forEach(feedback => {
                tableHTML += `
                    <tr>
                        <td>#${feedback.id}</td>
                        <td>
                            <div><strong>${feedback.user}</strong></div>
                            <div style="font-size: 12px; color: #6B7280;">${feedback.email}</div>
                        </td>
                        <td>${feedback.subject}</td>
                        <td><span class="category-badge">${getCategoryDisplay(feedback.category)}</span></td>
                        <td><span class="status-badge status-${feedback.status.toLowerCase()}">${feedback.status}</span></td>
                        <td><span class="priority-badge priority-${feedback.priority.toLowerCase()}">${feedback.priority}</span></td>
                        <td>${formatDate(feedback.date)}</td>
                        <td>
                            <div class="action-buttons">
                                <button class="btn-action btn-view" onclick="viewFeedback(${feedback.id})">View</button>
                                <button class="btn-action btn-resolve" onclick="resolveFeedback(${feedback.id})">Resolve</button>
                                <button class="btn-action btn-delete" onclick="deleteFeedback(${feedback.id})">Delete</button>
                            </div>
                        </td>
                    </tr>
                `;
            });
            
            tableBody.innerHTML = tableHTML;
            updatePagination();
        }

        // Filter feedback based on selections
        function filterFeedback() {
            const category = document.getElementById('categoryFilter').value;
            const status = document.getElementById('statusFilter').value;
            const priority = document.getElementById('priorityFilter').value;
            
            filteredData = feedbackData.filter(feedback => {
                const categoryMatch = category === 'all' || feedback.category === category;
                const statusMatch = status === 'all' || feedback.status === status;
                const priorityMatch = priority === 'all' || feedback.priority === priority;
                
                return categoryMatch && statusMatch && priorityMatch;
            });
            
            currentPage = 1;
            renderFeedbackTable();
            updateStats();
        }

        // Update stats cards
        function updateStats() {
            const total = feedbackData.length;
            const pending = feedbackData.filter(f => f.status === 'PENDING').length;
            const reviewed = feedbackData.filter(f => f.status === 'REVIEWED').length;
            const resolved = feedbackData.filter(f => f.status === 'RESOLVED').length;
            
            document.getElementById('totalCount').textContent = total;
            document.getElementById('pendingCount').textContent = pending;
            document.getElementById('reviewedCount').textContent = reviewed;
            document.getElementById('resolvedCount').textContent = resolved;
        }

        // Update pagination buttons
        function updatePagination() {
            const prevBtn = document.getElementById('prevBtn');
            const nextBtn = document.getElementById('nextBtn');
            const totalPages = Math.ceil(filteredData.length / itemsPerPage);
            
            prevBtn.disabled = currentPage === 1;
            nextBtn.disabled = currentPage === totalPages || totalPages === 0;
        }

        // Change page
        function changePage(direction) {
            const totalPages = Math.ceil(filteredData.length / itemsPerPage);
            currentPage += direction;
            
            if (currentPage < 1) currentPage = 1;
            if (currentPage > totalPages) currentPage = totalPages;
            
            renderFeedbackTable();
        }

        // Helper functions
        function getCategoryDisplay(category) {
            const categories = {
                'FEATURE': 'Feature Request',
                'BUG': 'Bug Report',
                'IMPROVEMENT': 'Improvement',
                'CONTENT': 'Content',
                'GENERAL': 'General',
                'OTHER': 'Other'
            };
            return categories[category] || category;
        }

        function formatDate(dateString) {
            const options = { year: 'numeric', month: 'short', day: 'numeric' };
            return new Date(dateString).toLocaleDateString('en-US', options);
        }

        // Action functions
        function viewFeedback(id) {
            const feedback = feedbackData.find(f => f.id === id);
            if (feedback) {
                alert(`Viewing Feedback #${id}\n\nUser: ${feedback.user} (${feedback.email})\nSubject: ${feedback.subject}\nMessage: ${feedback.message}\nCategory: ${feedback.category}\nStatus: ${feedback.status}\nAdmin Response: ${feedback.adminResponse || 'None'}`);
            }
        }

        function resolveFeedback(id) {
            if (confirm(`Mark feedback #${id} as resolved?`)) {
                const feedback = feedbackData.find(f => f.id === id);
                if (feedback) {
                    feedback.status = 'RESOLVED';
                    feedback.adminResponse = 'Resolved on ' + new Date().toLocaleDateString();
                    renderFeedbackTable();
                    updateStats();
                    alert('Feedback marked as resolved!');
                }
            }
        }

        function deleteFeedback(id) {
            if (confirm(`Delete feedback #${id}? This action cannot be undone.`)) {
                const index = feedbackData.findIndex(f => f.id === id);
                if (index !== -1) {
                    feedbackData.splice(index, 1);
                    filterFeedback(); // Re-filter to update display
                    alert('Feedback deleted successfully!');
                }
            }
        }

        function exportFeedback() {
            alert('Export functionality would generate a CSV/Excel file with all feedback data.');
        }

        function refreshFeedback() {
            // In a real app, this would fetch fresh data from server
            alert('Refreshing feedback data...');
            renderFeedbackTable();
        }

        function clearFilters() {
            document.getElementById('categoryFilter').value = 'all';
            document.getElementById('statusFilter').value = 'all';
            document.getElementById('priorityFilter').value = 'all';
            document.getElementById('dateFilter').value = 'all';
            filterFeedback();
        }
    </script>
</body>
</html>