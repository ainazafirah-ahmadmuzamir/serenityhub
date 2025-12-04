<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*, com.serenityhub.model.*" %>
<%
    Article article = (Article) request.getAttribute("article");
    List<Article> allArticles = (List<Article>) request.getAttribute("allArticles");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><%= article != null ? article.getTitle() : "Article" %> - SerenityHub</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, 'Helvetica Neue', Arial, sans-serif;
            background: linear-gradient(135deg, #e6e6fa 0%, #f0e6ff 100%);
            min-height: 100vh;
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

        .article-container {
            max-width: 800px;
            margin: 2rem auto;
            background: white;
            border-radius: 20px;
            padding: 3rem;
            box-shadow: 0 4px 12px rgba(0,0,0,0.1);
        }

        .back-btn {
            display: inline-flex;
            align-items: center;
            gap: 0.5rem;
            color: #323962;
            text-decoration: none;
            margin-bottom: 2rem;
            font-weight: 500;
        }

        .back-btn:hover {
            color: #8B5CF6;
        }

        .article-header {
            text-align: center;
            margin-bottom: 2rem;
            padding-bottom: 2rem;
            border-bottom: 2px solid #e6e6fa;
        }

        .article-icon-large {
            width: 120px;
            height: 120px;
            border-radius: 15px;
            margin: 0 auto 1.5rem;
        }

        .article-title {
            color: #323962;
            font-size: 2.5rem;
            font-weight: 700;
            margin-bottom: 1rem;
        }

        .article-meta {
            display: flex;
            justify-content: center;
            gap: 2rem;
            color: #6B7280;
            font-size: 0.9rem;
        }

        .article-content {
            color: #374151;
            line-height: 1.8;
            font-size: 1.1rem;
        }

        .article-content h2 {
            color: #323962;
            font-size: 1.8rem;
            margin-top: 2rem;
            margin-bottom: 1rem;
        }

        .article-content h3 {
            color: #323962;
            font-size: 1.4rem;
            margin-top: 1.5rem;
            margin-bottom: 0.75rem;
        }

        .article-content p {
            margin-bottom: 1.5rem;
        }

        .article-content ul, .article-content ol {
            margin-left: 2rem;
            margin-bottom: 1.5rem;
        }

        .article-content li {
            margin-bottom: 0.5rem;
        }

        .related-articles {
            margin-top: 3rem;
            padding-top: 2rem;
            border-top: 2px solid #e6e6fa;
        }

        .related-title {
            color: #323962;
            font-size: 1.5rem;
            font-weight: 600;
            margin-bottom: 1.5rem;
        }

        .related-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(200px, 1fr));
            gap: 1rem;
        }

        .related-card {
            background: #f9fafb;
            border-radius: 10px;
            padding: 1rem;
            text-decoration: none;
            transition: transform 0.3s;
        }

        .related-card:hover {
            transform: translateY(-3px);
            box-shadow: 0 4px 12px rgba(0,0,0,0.1);
        }

        .related-card h5 {
            color: #323962;
            font-size: 1rem;
            margin: 0.5rem 0;
        }

        .related-card p {
            color: #6B7280;
            font-size: 0.875rem;
            margin: 0;
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
                    <a href="<%= request.getContextPath() %>/home">Home</a>
                    <a href="<%= request.getContextPath() %>/counselling">Counselling</a>
                    <a href="<%= request.getContextPath() %>/educational-resources">Resources</a>
                    <a href="<%= request.getContextPath() %>/profile">Profile</a>
                </nav>
            </div>
        </div>
    </header>

    <main class="container">
        <% if (article != null) { %>
        <div class="article-container">
            <a href="<%= request.getContextPath() %>/educational-resources" class="back-btn">
                ← Back to Articles
            </a>

            <div class="article-header">
                <img src="<%= article.getIconPath() %>" alt="<%= article.getTitle() %>" class="article-icon-large">
                <h1 class="article-title"><%= article.getTitle() %></h1>
                <div class="article-meta">
                    <span>By <%= article.getAuthor() %></span>
                    <span>•</span>
                    <span><%= article.getReadTime() %> read</span>
                    <span>•</span>
                    <span><%= article.getCategory() %></span>
                </div>
            </div>

            <div class="article-content">
                <%= article.getFullContent() %>
            </div>

            <!-- Related Articles -->
            <% if (allArticles != null && allArticles.size() > 1) { %>
            <div class="related-articles">
                <h3 class="related-title">Related Articles</h3>
                <div class="related-grid">
                    <% 
                    int count = 0;
                    for (Article relatedArticle : allArticles) {
                        if (relatedArticle.getId() != article.getId() && count < 3) {
                            count++;
                    %>
                        <a href="<%= request.getContextPath() %>/educational-resources?action=view&id=<%= relatedArticle.getId() %>" 
                           class="related-card">
                            <img src="<%= relatedArticle.getIconPath() %>" alt="<%= relatedArticle.getTitle() %>" 
                                 style="width: 60px; height: 60px; border-radius: 8px;">
                            <h5><%= relatedArticle.getTitle() %></h5>
                            <p><%= relatedArticle.getReadTime() %> read</p>
                        </a>
                    <% 
                        }
                    } 
                    %>
                </div>
            </div>
            <% } %>
        </div>
        <% } else { %>
        <div class="article-container">
            <h1 class="article-title">Article Not Found</h1>
            <p>Sorry, the article you're looking for doesn't exist.</p>
            <a href="<%= request.getContextPath() %>/educational-resources" class="btn btn-primary">
                Back to Articles
            </a>
        </div>
        <% } %>
    </main>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>