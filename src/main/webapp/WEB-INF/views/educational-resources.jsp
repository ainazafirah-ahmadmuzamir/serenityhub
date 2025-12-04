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
                    <style>
                        * {
                            margin: 0;
                            padding: 0;
                            box-sizing: border-box;
                        }

                        body {
                            font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, 'Helvetica Neue', Arial, sans-serif;
                            background: linear-gradient(135deg, #e6e6fa 0%, #f0e6ff 100%);
                            min-height: 100vh;
                        }

                        .serenity-header {
                            background: rgba(255, 255, 255, 0.9);
                            padding: 1rem 0;
                            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
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

                        .page-title {
                            color: #323962;
                            font-size: 2.5rem;
                            font-weight: 700;
                            margin: 2rem 0;
                        }

                        .featured-section {
                            background: linear-gradient(135deg, #c8c8e8 0%, #ddd6f0 100%);
                            border-radius: 20px;
                            padding: 2rem;
                            margin: 2rem 0;
                            display: flex;
                            gap: 2rem;
                            align-items: center;
                        }

                        .featured-icon img {
                            width: 150px;
                            height: 150px;
                            border-radius: 15px;
                            background: white;
                            padding: 1rem;
                        }

                        .featured-content h3 {
                            color: #323962;
                            font-size: 1.5rem;
                            margin-bottom: 1rem;
                        }

                        .featured-content p {
                            color: #4B5563;
                            margin-bottom: 1rem;
                        }

                        .highlight {
                            display: block;
                            font-weight: 600;
                            color: #323962;
                            margin-top: 0.5rem;
                        }

                        .btn-primary {
                            background: #323962;
                            color: white;
                            padding: 0.75rem 2rem;
                            border-radius: 8px;
                            border: none;
                            font-weight: 600;
                            text-decoration: none;
                            display: inline-block;
                        }

                        .btn-primary:hover {
                            background: #8B5CF6;
                            color: white;
                        }

                        .filter-section {
                            display: flex;
                            gap: 1rem;
                            align-items: center;
                            margin: 2rem 0;
                            flex-wrap: wrap;
                        }

                        .tag {
                            padding: 0.5rem 1.5rem;
                            border: 2px solid #323962;
                            background: white;
                            color: #323962;
                            border-radius: 25px;
                            cursor: pointer;
                            font-weight: 500;
                            transition: all 0.3s;
                        }

                        .tag:hover {
                            background: #e8e8f5;
                        }

                        .tag.active {
                            background: #323962;
                            color: white;
                        }

                        .search-container {
                            margin-left: auto;
                            display: flex;
                            gap: 0.5rem;
                        }

                        .search-input {
                            padding: 0.5rem 1rem;
                            border: 2px solid #323962;
                            border-radius: 25px;
                            width: 250px;
                        }

                        .search-btn {
                            padding: 0.5rem 1rem;
                            border: 2px solid #323962;
                            background: white;
                            border-radius: 25px;
                            cursor: pointer;
                        }

                        .search-btn:hover {
                            background: #323962;
                            color: white;
                        }

                        .articles-grid {
                            display: grid;
                            grid-template-columns: repeat(auto-fill, minmax(300px, 1fr));
                            gap: 2rem;
                            margin: 2rem 0;
                        }

                        .article-card {
                            background: white;
                            border: 3px solid #323962;
                            border-radius: 15px;
                            padding: 2rem;
                            transition: transform 0.3s, box-shadow 0.3s;
                            cursor: pointer;
                        }

                        .article-card:hover {
                            transform: translateY(-5px);
                            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.15);
                        }

                        .article-icon {
                            margin-bottom: 1rem;
                        }

                        .article-icon img {
                            width: 80px;
                            height: 80px;
                            border-radius: 10px;
                        }

                        .article-card h4 {
                            color: #323962;
                            font-size: 1.25rem;
                            margin-bottom: 0.5rem;
                            font-weight: 600;
                        }

                        .article-card p {
                            color: #6B7280;
                            margin-bottom: 1rem;
                            line-height: 1.5;
                        }

                        .article-meta {
                            display: flex;
                            justify-content: space-between;
                            align-items: center;
                            color: #9CA3AF;
                            font-size: 0.875rem;
                            margin-top: 1rem;
                        }

                        .article-link {
                            color: #323962;
                            font-weight: 600;
                            text-decoration: none;
                        }

                        .article-link:hover {
                            color: #8B5CF6;
                        }

                        .no-results {
                            text-align: center;
                            color: #6B7280;
                            padding: 3rem;
                            font-size: 1.2rem;
                        }

                        @media (max-width: 768px) {
                            .featured-section {
                                flex-direction: column;
                            }

                            .search-container {
                                margin-left: 0;
                                width: 100%;
                            }

                            .search-input {
                                flex: 1;
                            }
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
                                \
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
                                    <button type="button" class="tag <%= currentFilter.equals("Meditation") ? "active"
                                        : "" %>"
                                        onclick="filterArticles('Meditation')">#Meditation</button>
                                    <button type="button" class="tag <%= currentFilter.equals("AvoidOverstimulation")
                                        ? "active" : "" %>"
                                        onclick="filterArticles('AvoidOverstimulation')">#AvoidOverstimulation</button>
                                    <button type="button" class="tag <%= currentFilter.equals("BadHabits") ? "active"
                                        : "" %>"
                                        onclick="filterArticles('BadHabits')">#BadHabits</button>
                                    <button type="button" class="tag <%= currentFilter.equals("DepressionSymptoms")
                                        ? "active" : "" %>"
                                        onclick="filterArticles('DepressionSymptoms')">#DepressionSymptoms</button>

                                    <div class="search-container">
                                        <form action="<%= request.getContextPath() %>/educational-resources"  method="get" class="d-flex gap-2">
                                            <input type="hidden" name="filter" value="<%= currentFilter %>">
                                            <input type="text" name="search" class="search-input"
                                                placeholder="Search articles..." value="<%= searchQuery %>">
                                            <button type="submit" class="search-btn">🔍</button>
                                        </form>
                                    </div>
                                </div>

                                <!-- Articles Grid -->
                                <div class="articles-grid">
                                    <% if (articles !=null && !articles.isEmpty()) { for (Article article : articles) {%>
                                        
                                        <div class="article-card" onclick="viewArticle('<%=article.getId() %>')">

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