<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ page import="java.util.*, com.serenityhub.model.*" %>
        <% FeaturedTopic featuredTopic=(FeaturedTopic) request.getAttribute("featuredTopic"); List<Article> articles =
            (List<Article>) request.getAttribute("articles");
                String currentFilter = (String) request.getAttribute("currentFilter");
                String searchQuery = (String) request.getAttribute("searchQuery");

                if (currentFilter == null) currentFilter = "";
                if (searchQuery == null) searchQuery = "";
                %>
                <!DOCTYPE html>
                <html lang="en">

                <head>
                    <meta charset="UTF-8">
                    <meta name="viewport" content="width=device-width, initial-scale=1.0">
                    <title>Educational Resources & Articles - SerenityHub</title>
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
                        <h2 class="page-title">Educational Resources & Articles</h2>

                        <!-- Featured Topic Section -->
                        <% if (featuredTopic !=null) { %>
                            <div class="featured-section">
                                <div class="featured-icon">
                                    <img src="<%= featuredTopic.getIconPath() %>" alt="Featured">
                                </div>
                                <div class="featured-content">
                                    <h3>Featured Topic Of The Week: <%= featuredTopic.getTitle() %>
                                    </h3>
                                    <p>
                                        <strong>
                                            <%= featuredTopic.getDescription() %>
                                        </strong>
                                        <span class="highlight">
                                            <%= featuredTopic.getHighlightText() %>
                                        </span>
                                    </p>
                                    <a href="<%= request.getContextPath() %>/<%= featuredTopic.getLink() %>"
                                        class="btn-primary">
                                        [ Go To Procrastination Guide ]
                                    </a>
                                </div>
                            </div>
                            <% } %>

                                <!-- Filter Tags & Search -->
                                <div class="filter-section">
                                    <button type="button" class="tag <%= currentFilter.equals("") ? " active" : "" %>"
                                        onclick="filterArticles('')">#All</button>
                                    <button type="button" class="tag <%= currentFilter.equals(" Meditation") ? "active"
                                        : "" %>"
                                        onclick="filterArticles('Meditation')">#Meditation</button>
                                    <button type="button" class="tag <%= currentFilter.equals(" AvoidOverstimulation")
                                        ? "active" : "" %>"
                                        onclick="filterArticles('AvoidOverstimulation')">#AvoidOverstimulation</button>
                                    <button type="button" class="tag <%= currentFilter.equals(" BadHabits") ? "active"
                                        : "" %>"
                                        onclick="filterArticles('BadHabits')">#BadHabits</button>
                                    <button type="button" class="tag <%= currentFilter.equals(" DepressionSymptoms")
                                        ? "active" : "" %>"
                                        onclick="filterArticles('DepressionSymptoms')">#DepressionSymptoms</button>

                                    <div class="search-container">
                                        <form action="<%= request.getContextPath() %>/educational-resources"
                                            method="get" class="d-flex gap-2">
                                            <input type="hidden" name="filter" value="<%= currentFilter %>">
                                            <input type="text" name="search" class="search-input"
                                                placeholder="Search articles..." value="<%= searchQuery %>">
                                            <button type="submit" class="search-btn">🔍</button>
                                        </form>
                                    </div>
                                </div>

                                <!-- Articles Grid -->
                                <div class="articles-grid">
                                    <% if (articles !=null && !articles.isEmpty()) { for (Article article : articles) {
                                        %>
                                        <div class="article-card" onclick="viewArticle('<%= article.getId() %>')">
                                            <h4>
                                                <%= article.getTitle() %>
                                            </h4>
                                            <p>
                                                <%= article.getDescription() %>
                                            </p>
                                            <div class="article-meta">
                                                <span>
                                                    <%= article.getReadTime() %> read
                                                </span>
                                                <a href="#" class="article-link"
                                                    onclick="event.stopPropagation(); viewArticle('<%= article.getId() %>')">
                                                    Read More →
                                                </a>
                                            </div>
                                        </div>
                                        <% } } else { %>
                                            <div class="no-results">
                                                <p>No articles found. Try a different search or filter.</p>
                                            </div>
                                            <% } %>
                                </div>
                    </main>

                    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
                    <script>
                        function filterArticles(category) {
                            window.location.href = '<%= request.getContextPath() %>/educational-resources?filter=' + category;
                        }

                        function viewArticle(articleId) {
                            window.location.href = '<%= request.getContextPath() %>/educational-resources?action=view&id=' + articleId;
                        }
                    </script>
                </body>

                </html>