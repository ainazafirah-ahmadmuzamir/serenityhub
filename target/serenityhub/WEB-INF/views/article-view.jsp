<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.serenityhub.model.Article" %>
<%
    Article article = (Article) request.getAttribute("article");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><%= article != null ? article.getTitle() : "Article" %> - SerenityHub</title>
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
                    <h1 class="brand-name">SerenityHub</h1>
                </div>
                <nav class="nav-links">
                    <a href="<%= request.getContextPath() %>/home">Home</a>
                    <a href="<%= request.getContextPath() %>/counselling">Counselling</a>
                    <a href="<%= request.getContextPath() %>/educational-resources">Resources</a>
                    <a href="<%= request.getContextPath() %>/profile">Profile</a>
                </nav>
            </div>
        </div>
    </header>

    <main class="container py-4">
        <% if (article != null) { %>
            <div class="article-view-container">
                <div class="article-header">
                    <h1 class="article-title"><%= article.getTitle() %></h1>
                    <div class="article-details">
                        <span><strong>Author:</strong> <%= article.getAuthor() %></span>
                        <span><strong>Category:</strong> #<%= article.getCategory() %></span>
                        <span><strong>Read Time:</strong> <%= article.getReadTime() %></span>
                    </div>
                </div>

                <div class="article-content">
                    <%= article.getFullContent() %>
                </div>

                <a href="<%= request.getContextPath() %>/educational-resources" class="back-button">
                    ← Back to Resources
                </a>
            </div>
        <% } else { %>
            <div class="no-results">
                <p>Article not found.</p>
                <a href="<%= request.getContextPath() %>/educational-resources" class="btn-primary">
                    Go to Resources
                </a>
            </div>
        <% } %>
    </main>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>