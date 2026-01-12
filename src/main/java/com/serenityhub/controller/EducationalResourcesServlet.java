package com.serenityhub.controller;

import com.serenityhub.dao.ArticleDAO;
import com.serenityhub.dao.FeaturedTopicDAO;
import com.serenityhub.model.Article;
import com.serenityhub.model.FeaturedTopic;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/educational-resources")
public class EducationalResourcesServlet extends HttpServlet {

        private ArticleDAO articleDAO;
        private FeaturedTopicDAO featuredTopicDAO;

        @Override
        public void init() throws ServletException {
                articleDAO = new ArticleDAO();
                featuredTopicDAO = new FeaturedTopicDAO();
        }

        @Override
        protected void doGet(HttpServletRequest req, HttpServletResponse resp)
                        throws ServletException, IOException {

                String action = req.getParameter("action");

                if ("view".equals(action)) {
                        handleArticleView(req, resp);
                        return;
                }

                FeaturedTopic featured = featuredTopicDAO.getActiveFeaturedTopic();
                String filter = req.getParameter("filter");
                String search = req.getParameter("search");

                List<Article> articles;

                if (search != null && !search.trim().isEmpty()) {
                        articles = articleDAO.searchArticles(search.trim());
                } else if (filter != null && !filter.isEmpty()) {
                        articles = articleDAO.getArticlesByCategory(filter);
                } else {
                        articles = articleDAO.getAllArticles();
                }

                req.setAttribute("featuredTopic", featured);
                req.setAttribute("articles", articles);
                req.setAttribute("currentFilter", filter != null ? filter : "");
                req.setAttribute("searchQuery", search != null ? search : "");

                req.getRequestDispatcher("/WEB-INF/views/educational-resources.jsp").forward(req, resp);
        }

        private void handleArticleView(HttpServletRequest req, HttpServletResponse resp)
                        throws ServletException, IOException {

                String idParam = req.getParameter("id");
                if (idParam != null) {
                        int articleId = Integer.parseInt(idParam);
                        Article article = articleDAO.getArticleById(articleId);
                        req.setAttribute("article", article);
                }

                req.getRequestDispatcher("/WEB-INF/views/article-view.jsp").forward(req, resp);
        }
}