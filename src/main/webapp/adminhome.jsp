<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>SerenityHub | Admin Portal</title>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/assets/css/admin.css">
  
</head>
<body>
    <div class="dashboard-layout">
        <!-- Sidebar -->
        <aside class="sidebar">
            <div class="sidebar-header">
                <div class="logo">
                    <div class="logo-icon">
                        <!-- Make sure this image exists or use text fallback -->
                        <img src="images/welcome.png" width="40" height="40" />
                        
                    </div>
                    <div class="logo-text">
                        <h2>SerenityHub</h2>
                        <p class="logo-subtitle">Admin Portal</p>
                    </div>
                </div>
            </div>

            <nav class="sidebar-nav">
                <a href="<%= request.getContextPath() %>/adminhome" class="nav-item active">
                    <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                        <path d="M3 9l9-7 9 7v11a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2z"></path>
                        <polyline points="9 22 9 12 15 12 15 22"></polyline>
                    </svg>
                    <span>Analytics</span>
                </a>
                <a href="<%= request.getContextPath() %>/adminFeedback.jsp" class="nav-item">
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
        <div class="main-content">
            <!-- Top Bar -->
            <header class="dashboard-header">
                <div class="dashboard-header-content">
                    <div class="header-left">
                        <div>
                            <h3>Analytics Dashboard</h3>
                            <p class="header-subtitle">Real-time platform insights</p>
                        </div>
                    </div>
                </div>
            </header>
            
            <!-- Dashboard Container -->
            <div class="dashboard-container">
                <div class="top-actions">
                    <button class="btn-generate" onclick="generateReport()">Generate Report</button>
                </div>

                <!-- METRIC CARDS IN BOXES -->
                <div class="metrics-grid">
                    <!-- Card 1: Active Users -->
                    <div class="metric-card">
                        <div class="metric-top">
                            <div class="metric-icon">👥</div>
                            <div>
                                <div class="metric-label">Active Users</div>
                                <div class="metric-number" id="activeUsers">167</div>
                            </div>
                        </div>
                        <div class="metric-delta"><span class="arrow">▲</span> 10.5% from last week</div>
                    </div>

                    <!-- Card 2: Module Completion -->
                    <div class="metric-card">
                        <div class="metric-top">
                            <div class="metric-icon">✅</div>
                            <div>
                                <div class="metric-label">Module Completion Rate</div>
                                <div class="metric-number" id="completionRate">71%</div>
                            </div>
                        </div>
                        <div class="metric-delta"><span class="arrow">▲</span> 6.5% from last week</div>
                    </div>

                    <!-- Card 3: Session Duration -->
                    <div class="metric-card">
                        <div class="metric-top">
                            <div class="metric-icon">⏱️</div>
                            <div>
                                <div class="metric-label">Avg. Session Duration</div>
                                <div class="metric-number" id="avgSession">25 m</div>
                            </div>
                        </div>
                        <div class="metric-delta down"><span class="arrow">▼</span> 1.5% from last week</div>
                    </div>

                    <!-- Card 4: Support Requests -->
                    <div class="metric-card">
                        <div class="metric-top">
                            <div class="metric-icon">💬</div>
                            <div>
                                <div class="metric-label">Support Requests</div>
                                <div class="metric-number" id="supportReq">100</div>
                            </div>
                        </div>
                        <div class="metric-delta"><span class="arrow">▲</span> 2.7% from last week</div>
                    </div>
                </div>

                <!-- Charts -->
                <div class="cards-row">
                    <div class="chart-card">
                        <h4>User Engagement</h4>
                        <div class="chart-container">
                            <canvas id="userEngagementChart"></canvas>
                        </div>
                    </div>

                    <div class="chart-card">
                        <h4>Module Completion</h4>
                        <div class="chart-container">
                            <canvas id="moduleCompletionChart"></canvas>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Chart.js Library -->
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <script>
        // Initialize charts with demo data
        function initializeCharts() {
            const userEngagementCtx = document.getElementById('userEngagementChart').getContext('2d');
            const moduleCompletionCtx = document.getElementById('moduleCompletionChart').getContext('2d');
            
            // User Engagement Chart
            new Chart(userEngagementCtx, {
                type: 'bar',
                data: {
                    labels: ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'],
                    datasets: [{
                        label: 'Active Sessions',
                        data: [12, 15, 20, 13, 18, 22, 24],
                        backgroundColor: '#7be0d6',
                        borderRadius: 6,
                        barThickness: 18
                    }]
                },
                options: {
                    responsive: true,
                    maintainAspectRatio: false,
                    scales: {
                        y: {
                            beginAtZero: true,
                            grid: { color: 'rgba(255, 255, 255, 0.06)' },
                            ticks: { color: '#cfd6ff' }
                        },
                        x: {
                            ticks: { color: '#cfd6ff' }
                        }
                    },
                    plugins: {
                        legend: { display: false }
                    }
                }
            });
            
            // Module Completion Chart
            new Chart(moduleCompletionCtx, {
                type: 'bar',
                data: {
                    labels: ['Module 1', 'Module 2', 'Module 3', 'Module 4', 'Module 5'],
                    datasets: [{
                        label: 'Completions',
                        data: [5, 20, 15, 18, 23],
                        backgroundColor: '#7be0d6',
                        borderRadius: 6,
                        barThickness: 18
                    }]
                },
                options: {
                    responsive: true,
                    maintainAspectRatio: false,
                    scales: {
                        y: {
                            beginAtZero: true,
                            grid: { color: 'rgba(255, 255, 255, 0.06)' },
                            ticks: { color: '#cfd6ff' }
                        },
                        x: {
                            ticks: { color: '#cfd6ff' }
                        }
                    },
                    plugins: {
                        legend: { display: false }
                    }
                }
            });
        }
        
        function generateReport() {
            alert('Report generation would be implemented here. This could send a request to your server to generate a PDF/Excel report.');
        }
        
        // Initialize everything when page loads
        document.addEventListener('DOMContentLoaded', initializeCharts);
    </script>
</body>
</html>