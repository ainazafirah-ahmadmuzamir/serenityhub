<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ page import="java.util.*, com.serenityhub.model.*" %>
        <% List<Article> articles = (List<Article>) request.getAttribute("articles");
                String successMessage = (String) session.getAttribute("successMessage");
                String errorMessage = (String) session.getAttribute("errorMessage");

                // Clear messages after displaying
                session.removeAttribute("successMessage");
                session.removeAttribute("errorMessage");
                %>
                <!DOCTYPE html>
                <html lang="en">

                <head>
                    <meta charset="UTF-8">
                    <meta name="viewport" content="width=device-width, initial-scale=1.0">
                    <title>Article Management - SerenityHub Admin</title>
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
                                    <a href="<%= request.getContextPath() %>/admin/articles">Articles</a>
                                    <a href="<%= request.getContextPath() %>/">Logout</a>
                                </nav>
                            </div>
                        </div>
                    </header>

                    <main class="admin-container">
                        <div class="admin-header">
                            <h2 class="page-title">Article Management</h2>
                            <a href="<%= request.getContextPath() %>/admin/articles?action=add" class="btn-primary">
                                + Add New Article
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

                                        <div class="admin-table">
                                            <table class="table">
                                                <thead>
                                                    <tr>
                                                        <th>ID</th>
                                                        <th>Title</th>
                                                        <th>Category</th>
                                                        <th>Author</th>
                                                        <th>Read Time</th>
                                                        <th>Actions</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <% if (articles !=null && !articles.isEmpty()) { for (Article
                                                        article : articles) { %>
                                                        <tr>
                                                            <td>
                                                                <%= article.getId() %>
                                                            </td>
                                                            <td>
                                                                <%= article.getTitle() %>
                                                            </td>
                                                            <td>
                                                                <%= article.getCategory() %>
                                                            </td>
                                                            <td>
                                                                <%= article.getAuthor() %>
                                                            </td>
                                                            <td>
                                                                <%= article.getReadTime() %>
                                                            </td>
                                                            <td>
                                                                <div class="action-buttons">
                                                                    <a href="<%= request.getContextPath() %>/educational-resources?action=view&id=<%= article.getId() %>"
                                                                        class="btn-secondary btn-small"
                                                                        target="_blank">View</a>
                                                                    <a href="<%= request.getContextPath() %>/admin/articles?action=edit&id=<%= article.getId() %>"
                                                                        class="btn-primary btn-small">Edit</a>
                                                                    <form method="post" style="display: inline;"
                                                                        onsubmit="return confirm('Are you sure you want to delete this article?');">
                                                                        <input type="hidden" name="action"
                                                                            value="delete">
                                                                        <input type="hidden" name="id"
                                                                            value="<%= article.getId() %>">
                                                                        <button type="submit"
                                                                            class="btn-danger btn-small">Delete</button>
                                                                    </form>
                                                                </div>
                                                            </td>
                                                        </tr>
                                                        <% } } else { %>
                                                            <tr>
                                                                <td colspan="6" class="no-results">No articles found.
                                                                </td>
                                                            </tr>
                                                            <% } %>
                                                </tbody>
                                            </table>
                                        </div>
                    </main>

                    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
                </body>

                </html>