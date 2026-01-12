package com.serenityhub.controller;

import com.serenityhub.dao.ArticleDAO;
import com.serenityhub.model.Article;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/admin/articles")
public class AdminArticleServlet extends HttpServlet {

    private ArticleDAO articleDAO;

    @Override
    public void init() throws ServletException {
        articleDAO = new ArticleDAO();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String action = req.getParameter("action");

        if ("add".equals(action)) {
            req.getRequestDispatcher("/WEB-INF/views/admin/add-article.jsp").forward(req, resp);
        } else if ("edit".equals(action)) {
            handleEdit(req, resp);
        } else {
            handleList(req, resp);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String action = req.getParameter("action");

        if ("add".equals(action)) {
            handleAdd(req, resp);
        } else if ("edit".equals(action)) {
            handleUpdate(req, resp);
        } else if ("delete".equals(action)) {
            handleDelete(req, resp);
        }
    }

    private void handleList(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        List<Article> articles = articleDAO.getAllArticles();
        req.setAttribute("articles", articles);
        req.getRequestDispatcher("/WEB-INF/views/admin/article-management.jsp").forward(req, resp);
    }

    private void handleEdit(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        String idParam = req.getParameter("id");
        if (idParam != null) {
            int id = Integer.parseInt(idParam);
            Article article = articleDAO.getArticleById(id);
            req.setAttribute("article", article);
            req.getRequestDispatcher("/WEB-INF/views/admin/edit-article.jsp").forward(req, resp);
        } else {
            resp.sendRedirect(req.getContextPath() + "/admin/articles");
        }
    }

    private void handleAdd(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        
        Article article = new Article();
        article.setTitle(req.getParameter("title"));
        article.setDescription(req.getParameter("description"));
        article.setFullContent(req.getParameter("fullContent"));
        article.setIconPath(req.getParameter("iconPath"));
        article.setCategory(req.getParameter("category"));
        article.setAuthor(req.getParameter("author"));
        article.setReadTime(req.getParameter("readTime"));

        boolean success = articleDAO.addArticle(article);
        
        if (success) {
            req.getSession().setAttribute("successMessage", "Article added successfully!");
        } else {
            req.getSession().setAttribute("errorMessage", "Failed to add article.");
        }
        
        resp.sendRedirect(req.getContextPath() + "/admin/articles");
    }

    private void handleUpdate(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        
        Article article = new Article();
        article.setId(Integer.parseInt(req.getParameter("id")));
        article.setTitle(req.getParameter("title"));
        article.setDescription(req.getParameter("description"));
        article.setFullContent(req.getParameter("fullContent"));
        article.setIconPath(req.getParameter("iconPath"));
        article.setCategory(req.getParameter("category"));
        article.setAuthor(req.getParameter("author"));
        article.setReadTime(req.getParameter("readTime"));

        boolean success = articleDAO.updateArticle(article);
        
        if (success) {
            req.getSession().setAttribute("successMessage", "Article updated successfully!");
        } else {
            req.getSession().setAttribute("errorMessage", "Failed to update article.");
        }
        
        resp.sendRedirect(req.getContextPath() + "/admin/articles");
    }

    private void handleDelete(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        
        String idParam = req.getParameter("id");
        if (idParam != null) {
            int id = Integer.parseInt(idParam);
            boolean success = articleDAO.deleteArticle(id);
            
            if (success) {
                req.getSession().setAttribute("successMessage", "Article deleted successfully!");
            } else {
                req.getSession().setAttribute("errorMessage", "Failed to delete article.");
            }
        }
        
        resp.sendRedirect(req.getContextPath() + "/admin/articles");
    }
}