<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>SerenityHub | Admin Portal</title>
    <style>
        /* ===== RESET & BASE ===== */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, 'Helvetica Neue', Arial, sans-serif;
            line-height: 1.6;
            color: #374151;
            background: linear-gradient(135deg, #EFF6FF 0%, #F3E8FF 50%, #ECFDF5 100%);
            min-height: 100vh;
        }

        /* ===== DASHBOARD LAYOUT ===== */
        .dashboard-layout {
            display: flex;
            min-height: 100vh;
        }

        /* ===== SIDEBAR ===== */
        .sidebar {
            width: 260px;
            background: white;
            border-right: 1px solid #E5E7EB;
            display: flex;
            flex-direction: column;
            position: fixed;
            height: 100vh;
            z-index: 40;
            box-shadow: 2px 0 10px rgba(0, 0, 0, 0.05);
        }

        .sidebar-header {
            padding: 24px;
            border-bottom: 1px solid #E5E7EB;
        }

        .logo {
            display: flex;
            align-items: center;
            gap: 12px;
        }

        .logo-icon img {
            border-radius: 8px;
        }

        .logo-text h2 {
            font-size: 20px;
            margin: 0;
            color: #323962;
            font-weight: 700;
        }

        .logo-subtitle {
            font-size: 12px;
            color: #6B7280;
            margin: 4px 0 0;
        }

        .sidebar-nav {
            flex: 1;
            padding: 16px;
        }

        .nav-item {
            display: flex;
            align-items: center;
            gap: 12px;
            padding: 12px 16px;
            border-radius: 8px;
            color: #4B5563;
            margin-bottom: 8px;
            transition: all 0.2s;
            text-decoration: none;
            font-weight: 500;
        }

        .nav-item:hover {
            background: #F3F4F6;
        }

        .nav-item.active {
            background: linear-gradient(135deg, #323962, #8B5CF6);
            color: white;
        }

        .sidebar-footer {
            padding: 16px;
            border-top: 1px solid #E5E7EB;
        }

        /* ===== MAIN CONTENT ===== */
        .main-content {
            flex: 1;
            margin-left: 260px;
            display: flex;
            flex-direction: column;
            min-height: 100vh;
        }

        .dashboard-header {
            padding: 28px 32px;
            background: white;
            border-bottom: 1px solid #E5E7EB;
        }

        .header-left h3 {
            margin: 0;
            font-size: 34px;
            color: #24243a;
            letter-spacing: -0.5px;
            font-weight: 700;
        }

        .header-subtitle {
            margin: 6px 0 0;
            color: #71718a;
            font-size: 14px;
            font-weight: 400;
        }

        /* ===== DASHBOARD CONTAINER ===== */
        .dashboard-container {
            padding: 32px;
            flex: 1;
        }

        /* ===== METRIC CARDS ===== */
        .top-actions {
            display: flex;
            justify-content: flex-end;
            margin-bottom: 32px;
        }

        .btn-generate {
            background: #6bd16b;
            color: white;
            padding: 12px 24px;
            border-radius: 28px;
            font-weight: 700;
            border: 0;
            cursor: pointer;
            box-shadow: 0 6px 18px rgba(107, 209, 107, 0.18);
            font-size: 14px;
            transition: all 0.3s;
        }

        .btn-generate:hover {
            background: #5bc75b;
            transform: translateY(-2px);
        }

        /* METRICS GRID - THIS IS WHAT CREATES THE BOXES */
        .metrics-grid {
            display: grid;
            grid-template-columns: repeat(4, 1fr);
            gap: 20px;
            margin-bottom: 32px;
        }

        /* INDIVIDUAL METRIC CARD - EACH BOX */
        .metric-card {
            background: #2f3354;
            color: white;
            padding: 24px;
            border-radius: 16px;
            display: flex;
            flex-direction: column;
            justify-content: space-between;
            min-height: 140px;
            box-shadow: 0 8px 30px rgba(47, 51, 84, 0.12);
            border: 1px solid rgba(255, 255, 255, 0.1);
        }

        .metric-top {
            display: flex;
            align-items: center;
            gap: 16px;
        }

        .metric-icon {
            width: 56px;
            height: 56px;
            border-radius: 14px;
            background: rgba(255, 255, 255, 0.06);
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 24px;
            flex-shrink: 0;
        }

        .metric-number {
            font-size: 32px;
            font-weight: 800;
            margin-top: 8px;
            color: white;
            line-height: 1;
        }

        .metric-label {
            color: #c8cbe8;
            font-size: 13px;
            font-weight: 500;
            text-transform: uppercase;
            letter-spacing: 0.5px;
        }

        .metric-delta {
            font-size: 13px;
            margin-top: 10px;
            color: #9fe5a6;
            display: flex;
            align-items: center;
            gap: 6px;
            font-weight: 500;
        }

        .metric-delta.down {
            color: #ff9b9b;
        }

        .metric-delta .arrow {
            font-size: 12px;
        }

        /* ===== CHARTS ===== */
        .cards-row {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 20px;
        }

        .chart-card {
            background: #2f3354;
            color: white;
            padding: 24px;
            border-radius: 16px;
            min-height: 320px;
            box-shadow: 0 8px 30px rgba(47, 51, 84, 0.12);
            border: 1px solid rgba(255, 255, 255, 0.1);
        }

        .chart-card h4 {
            margin: 0 0 20px 0;
            font-size: 18px;
            color: #e9ecff;
            font-weight: 600;
        }

        .chart-container {
            height: 250px;
            position: relative;
        }

        /* ===== RESPONSIVE ===== */
        @media (max-width: 1200px) {
            .metrics-grid {
                grid-template-columns: repeat(2, 1fr);
            }
            .cards-row {
                grid-template-columns: 1fr;
            }
        }

        @media (max-width: 768px) {
            .sidebar {
                width: 240px;
                transform: translateX(-100%);
                position: fixed;
            }
            .main-content {
                margin-left: 0;
            }
            .metrics-grid {
                grid-template-columns: 1fr;
            }
            .dashboard-container {
                padding: 20px;
            }
        }
    </style>
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