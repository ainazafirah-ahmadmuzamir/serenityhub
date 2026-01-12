package com.serenityhub.dao;

import com.serenityhub.model.FeaturedTopic;
import com.serenityhub.util.DatabaseConnection;
import java.sql.*;

public class FeaturedTopicDAO {

    public FeaturedTopic getActiveFeaturedTopic() {
        String sql = "SELECT * FROM featured_topics WHERE is_active = TRUE ORDER BY created_at DESC LIMIT 1";
        FeaturedTopic topic = null;

        try (Connection conn = DatabaseConnection.getConnection();
                Statement stmt = conn.createStatement();
                ResultSet rs = stmt.executeQuery(sql)) {

            if (rs.next()) {
                topic = extractFeaturedTopicFromResultSet(rs);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return topic;
    }

    private FeaturedTopic extractFeaturedTopicFromResultSet(ResultSet rs) throws SQLException {
        return new FeaturedTopic(
                rs.getString("title"),
                rs.getString("description"),
                rs.getString("highlight_text"),
                rs.getString("link"),
                rs.getString("icon_path"));
    }
}