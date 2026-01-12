<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Add Article - SerenityHub Admin</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
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
                        <a href="<%= request.getContextPath() %>/admin/articles">Articles</a>
                        <a href="<%= request.getContextPath() %>/">Logout</a>
                    </nav>
                </div>
            </div>
        </header>

        <main class="container py-4">
            <h2 class="page-title">Add New Article</h2>

            <div class="form-container">
                <form method="post" action="<%= request.getContextPath() %>/admin/articles">
                    <input type="hidden" name="action" value="add">

                    <div class="form-group">
                        <label for="title">Title *</label>
                        <input type="text" class="form-control" id="title" name="title" required>
                    </div>

                    <div class="form-group">
                        <label for="description">Description *</label>
                        <textarea class="form-control" id="description" name="description" rows="3" required></textarea>
                    </div>

                    <div class="form-group">
                        <label for="category">Category *</label>
                        <select class="form-control" id="category" name="category" required>
                            <option value="">Select Category</option>
                            <option value="Meditation">Meditation</option>
                            <option value="AvoidOverstimulation">Avoid Overstimulation</option>
                            <option value="BadHabits">Bad Habits</option>
                            <option value="DepressionSymptoms">Depression Symptoms</option>
                            <option value="Anxiety">Anxiety</option>
                            <option value="StressManagement">Stress Management</option>
                        </select>
                    </div>

                    <div class="form-group">
                        <label for="author">Author *</label>
                        <input type="text" class="form-control" id="author" name="author" required>
                    </div>

                    <div class="form-group">
                        <label for="readTime">Read Time *</label>
                        <input type="text" class="form-control" id="readTime" name="readTime" placeholder="e.g., 5 mins"
                            required>
                    </div>

                    <div class="form-group">
                        <label for="iconPath">Icon URL</label>
                        <input type="text" class="form-control" id="iconPath" name="iconPath"
                            placeholder="https://via.placeholder.com/80/6366F1/FFFFFF?text=📚">
                    </div>

                    <div class="form-group">
                        <label for="fullContent">Full Content (HTML) *</label>
                        <textarea class="form-control" id="fullContent" name="fullContent" rows="15"
                            required></textarea>
                        <small class="text-muted">You can use HTML tags like &lt;h2&gt;, &lt;h3&gt;, &lt;p&gt;,
                            &lt;ul&gt;, &lt;li&gt;, &lt;br&gt;</small>
                    </div>

                    <div class="form-actions">
                        <a href="<%= request.getContextPath() %>/admin/articles" class="btn-secondary">Cancel</a>
                        <button type="submit" class="btn-primary">Add Article</button>
                    </div>
                </form>
            </div>
        </main>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    </body>

    </html>