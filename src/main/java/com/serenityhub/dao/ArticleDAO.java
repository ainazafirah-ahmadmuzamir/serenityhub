package com.serenityhub.dao;

import com.serenityhub.model.Article;
import com.serenityhub.util.DatabaseConnection;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ArticleDAO {

    public List<Article> getAllArticles() {
        List<Article> articles = new ArrayList<>();
        String sql = "SELECT * FROM articles WHERE is_active = TRUE ORDER BY created_at DESC";

        try (Connection conn = DatabaseConnection.getConnection();
                Statement stmt = conn.createStatement();
                ResultSet rs = stmt.executeQuery(sql)) {

            while (rs.next()) {
                articles.add(extractArticleFromResultSet(rs));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return articles;
    }

    public Article getArticleById(int id) {
        String sql = "SELECT * FROM articles WHERE id = ? AND is_active = TRUE";
        Article article = null;

        try (Connection conn = DatabaseConnection.getConnection();
                PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setInt(1, id);
            ResultSet rs = pstmt.executeQuery();

            if (rs.next()) {
                article = extractArticleFromResultSet(rs);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return article;
    }

    public List<Article> getArticlesByCategory(String category) {
        List<Article> articles = new ArrayList<>();
        String sql = "SELECT * FROM articles WHERE category = ? AND is_active = TRUE ORDER BY created_at DESC";

        try (Connection conn = DatabaseConnection.getConnection();
                PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, category);
            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {
                articles.add(extractArticleFromResultSet(rs));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return articles;
    }

    public List<Article> searchArticles(String keyword) {
        List<Article> articles = new ArrayList<>();
        String sql = "SELECT * FROM articles WHERE (title LIKE ? OR description LIKE ? OR category LIKE ?) AND is_active = TRUE ORDER BY created_at DESC";

        try (Connection conn = DatabaseConnection.getConnection();
                PreparedStatement pstmt = conn.prepareStatement(sql)) {

            String searchPattern = "%" + keyword + "%";
            pstmt.setString(1, searchPattern);
            pstmt.setString(2, searchPattern);
            pstmt.setString(3, searchPattern);
            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {
                articles.add(extractArticleFromResultSet(rs));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return articles;
    }

    public boolean addArticle(Article article) {
        String sql = "INSERT INTO articles (title, description, full_content, icon_path, category, author, read_time) VALUES (?, ?, ?, ?, ?, ?, ?)";

        try (Connection conn = DatabaseConnection.getConnection();
                PreparedStatement pstmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {

            pstmt.setString(1, article.getTitle());
            pstmt.setString(2, article.getDescription());
            pstmt.setString(3, article.getFullContent());
            pstmt.setString(4, article.getIconPath());
            pstmt.setString(5, article.getCategory());
            pstmt.setString(6, article.getAuthor());
            pstmt.setString(7, article.getReadTime());

            int affectedRows = pstmt.executeUpdate();

            if (affectedRows > 0) {
                ResultSet rs = pstmt.getGeneratedKeys();
                if (rs.next()) {
                    article.setId(rs.getInt(1));
                }
                return true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean updateArticle(Article article) {
        String sql = "UPDATE articles SET title = ?, description = ?, full_content = ?, icon_path = ?, category = ?, author = ?, read_time = ? WHERE id = ?";

        try (Connection conn = DatabaseConnection.getConnection();
                PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, article.getTitle());
            pstmt.setString(2, article.getDescription());
            pstmt.setString(3, article.getFullContent());
            pstmt.setString(4, article.getIconPath());
            pstmt.setString(5, article.getCategory());
            pstmt.setString(6, article.getAuthor());
            pstmt.setString(7, article.getReadTime());
            pstmt.setInt(8, article.getId());

            return pstmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean deleteArticle(int id) {
        String sql = "UPDATE articles SET is_active = FALSE WHERE id = ?";

        try (Connection conn = DatabaseConnection.getConnection();
                PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setInt(1, id);
            return pstmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    private Article extractArticleFromResultSet(ResultSet rs) throws SQLException {
        Article article = new Article();
        article.setId(rs.getInt("id"));
        article.setTitle(rs.getString("title"));
        article.setDescription(rs.getString("description"));
        article.setFullContent(rs.getString("full_content"));
        article.setIconPath(rs.getString("icon_path"));
        article.setCategory(rs.getString("category"));
        article.setAuthor(rs.getString("author"));
        article.setReadTime(rs.getString("read_time"));
        return article;
    }
}