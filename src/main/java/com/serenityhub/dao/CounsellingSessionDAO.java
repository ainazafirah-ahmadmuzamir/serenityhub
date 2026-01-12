package com.serenityhub.dao;

import com.serenityhub.model.CounsellingSession;
import com.serenityhub.util.DatabaseConnection;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class CounsellingSessionDAO {

    public List<CounsellingSession> getAllSessions() {
        List<CounsellingSession> sessions = new ArrayList<>();
        String sql = "SELECT * FROM counselling_sessions WHERE is_active = TRUE ORDER BY session_date, session_time";

        try (Connection conn = DatabaseConnection.getConnection();
                Statement stmt = conn.createStatement();
                ResultSet rs = stmt.executeQuery(sql)) {

            while (rs.next()) {
                sessions.add(extractSessionFromResultSet(rs));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return sessions;
    }

    public List<CounsellingSession> getAvailableSessions() {
        List<CounsellingSession> sessions = new ArrayList<>();
        String sql = "SELECT * FROM counselling_sessions WHERE status = 'available' AND is_active = TRUE ORDER BY session_date, session_time";

        try (Connection conn = DatabaseConnection.getConnection();
                Statement stmt = conn.createStatement();
                ResultSet rs = stmt.executeQuery(sql)) {

            while (rs.next()) {
                sessions.add(extractSessionFromResultSet(rs));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return sessions;
    }

    public CounsellingSession getSessionById(int id) {
        String sql = "SELECT * FROM counselling_sessions WHERE id = ?";
        CounsellingSession session = null;

        try (Connection conn = DatabaseConnection.getConnection();
                PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setInt(1, id);
            ResultSet rs = pstmt.executeQuery();

            if (rs.next()) {
                session = extractSessionFromResultSet(rs);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return session;
    }

    public boolean addSession(CounsellingSession session) {
        String sql = "INSERT INTO counselling_sessions (counsellor_name, counsellor_image, specialty, time_slot, session_date, session_time, google_meet_link, status) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";

        try (Connection conn = DatabaseConnection.getConnection();
                PreparedStatement pstmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {

            pstmt.setString(1, session.getCounsellorName());
            pstmt.setString(2, session.getCounsellorImage());
            pstmt.setString(3, session.getSpecialty());
            pstmt.setString(4, session.getTimeSlot());
            pstmt.setDate(5, Date.valueOf(session.getSessionDate()));
            pstmt.setTime(6, Time.valueOf(session.getSessionTime()));
            pstmt.setString(7, session.getGoogleMeetLink());
            pstmt.setString(8, session.getStatus());

            int affectedRows = pstmt.executeUpdate();

            if (affectedRows > 0) {
                ResultSet rs = pstmt.getGeneratedKeys();
                if (rs.next()) {
                    session.setId(rs.getInt(1));
                }
                return true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean updateSession(CounsellingSession session) {
        String sql = "UPDATE counselling_sessions SET counsellor_name = ?, counsellor_image = ?, specialty = ?, time_slot = ?, session_date = ?, session_time = ?, google_meet_link = ?, status = ? WHERE id = ?";

        try (Connection conn = DatabaseConnection.getConnection();
                PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, session.getCounsellorName());
            pstmt.setString(2, session.getCounsellorImage());
            pstmt.setString(3, session.getSpecialty());
            pstmt.setString(4, session.getTimeSlot());
            pstmt.setDate(5, Date.valueOf(session.getSessionDate()));
            pstmt.setTime(6, Time.valueOf(session.getSessionTime()));
            pstmt.setString(7, session.getGoogleMeetLink());
            pstmt.setString(8, session.getStatus());
            pstmt.setInt(9, session.getId());

            return pstmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean deleteSession(int id) {
        String sql = "UPDATE counselling_sessions SET is_active = FALSE WHERE id = ?";

        try (Connection conn = DatabaseConnection.getConnection();
                PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setInt(1, id);
            return pstmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    private CounsellingSession extractSessionFromResultSet(ResultSet rs) throws SQLException {
        CounsellingSession session = new CounsellingSession();
        session.setId(rs.getInt("id"));
        session.setCounsellorName(rs.getString("counsellor_name"));
        session.setCounsellorImage(rs.getString("counsellor_image"));
        session.setSpecialty(rs.getString("specialty"));
        session.setTimeSlot(rs.getString("time_slot"));

        Date sessionDate = rs.getDate("session_date");
        if (sessionDate != null) {
            session.setSessionDate(sessionDate.toString());
        }

        Time sessionTime = rs.getTime("session_time");
        if (sessionTime != null) {
            session.setSessionTime(sessionTime.toString());
        }

        session.setGoogleMeetLink(rs.getString("google_meet_link"));
        session.setStatus(rs.getString("status"));
        session.setActive(rs.getBoolean("is_active"));

        return session;
    }
}