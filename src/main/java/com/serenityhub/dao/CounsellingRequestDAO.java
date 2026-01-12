package com.serenityhub.dao;

import com.serenityhub.model.CounsellingRequest;
import com.serenityhub.util.DatabaseConnection;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class CounsellingRequestDAO {

    public List<CounsellingRequest> getAllRequests() {
        List<CounsellingRequest> requests = new ArrayList<>();
        String sql = "SELECT * FROM counselling_requests ORDER BY submitted_date DESC";

        try (Connection conn = DatabaseConnection.getConnection();
                Statement stmt = conn.createStatement();
                ResultSet rs = stmt.executeQuery(sql)) {

            while (rs.next()) {
                requests.add(extractRequestFromResultSet(rs));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return requests;
    }

    public List<CounsellingRequest> getRequestsByUserId(int userId) {
        List<CounsellingRequest> requests = new ArrayList<>();
        String sql = "SELECT * FROM counselling_requests WHERE user_id = ? ORDER BY submitted_date DESC";

        try (Connection conn = DatabaseConnection.getConnection();
                PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setInt(1, userId);
            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {
                requests.add(extractRequestFromResultSet(rs));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return requests;
    }

    public List<CounsellingRequest> getRequestsByStatus(String status) {
        List<CounsellingRequest> requests = new ArrayList<>();
        String sql = "SELECT * FROM counselling_requests WHERE status = ? ORDER BY submitted_date DESC";

        try (Connection conn = DatabaseConnection.getConnection();
                PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, status);
            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {
                requests.add(extractRequestFromResultSet(rs));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return requests;
    }

    public CounsellingRequest getRequestById(int id) {
        String sql = "SELECT * FROM counselling_requests WHERE id = ?";
        CounsellingRequest request = null;

        try (Connection conn = DatabaseConnection.getConnection();
                PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setInt(1, id);
            ResultSet rs = pstmt.executeQuery();

            if (rs.next()) {
                request = extractRequestFromResultSet(rs);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return request;
    }

    public boolean addRequest(CounsellingRequest request) {
        String sql = "INSERT INTO counselling_requests (user_id, user_name, counsellor_preference, concern_type, description, preferred_date, preferred_time, status) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";

        try (Connection conn = DatabaseConnection.getConnection();
                PreparedStatement pstmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {

            pstmt.setInt(1, request.getUserId());
            pstmt.setString(2, request.getUserName());
            pstmt.setString(3, request.getCounsellorPreference());
            pstmt.setString(4, request.getConcernType());
            pstmt.setString(5, request.getDescription());
            pstmt.setDate(6, Date.valueOf(request.getPreferredDate()));
            pstmt.setTime(7, Time.valueOf(request.getPreferredTime()));
            pstmt.setString(8, request.getStatus());

            int affectedRows = pstmt.executeUpdate();

            if (affectedRows > 0) {
                ResultSet rs = pstmt.getGeneratedKeys();
                if (rs.next()) {
                    request.setId(rs.getInt(1));
                }
                return true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean updateRequest(CounsellingRequest request) {
        String sql = "UPDATE counselling_requests SET counsellor_preference = ?, concern_type = ?, description = ?, preferred_date = ?, preferred_time = ? WHERE id = ?";

        try (Connection conn = DatabaseConnection.getConnection();
                PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, request.getCounsellorPreference());
            pstmt.setString(2, request.getConcernType());
            pstmt.setString(3, request.getDescription());
            pstmt.setDate(4, Date.valueOf(request.getPreferredDate()));
            pstmt.setTime(5, Time.valueOf(request.getPreferredTime()));
            pstmt.setInt(6, request.getId());

            return pstmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean updateRequestStatus(int id, String status) {
        String sql = "UPDATE counselling_requests SET status = ? WHERE id = ?";

        try (Connection conn = DatabaseConnection.getConnection();
                PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, status);
            pstmt.setInt(2, id);

            return pstmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean assignCounsellor(int requestId, String counsellor, String counsellorImage,
            int sessionId, String meetLink, String confirmedDate,
            String confirmedTime, String adminNotes) {
        String sql = "UPDATE counselling_requests SET status = 'confirmed', assigned_counsellor = ?, assigned_counsellor_image = ?, assigned_session_id = ?, google_meet_link = ?, confirmed_date = ?, confirmed_time = ?, admin_notes = ? WHERE id = ?";

        try (Connection conn = DatabaseConnection.getConnection();
                PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, counsellor);
            pstmt.setString(2, counsellorImage);
            pstmt.setInt(3, sessionId);
            pstmt.setString(4, meetLink);
            pstmt.setDate(5, Date.valueOf(confirmedDate));
            pstmt.setTime(6, Time.valueOf(confirmedTime));
            pstmt.setString(7, adminNotes);
            pstmt.setInt(8, requestId);

            return pstmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    private CounsellingRequest extractRequestFromResultSet(ResultSet rs) throws SQLException {
        CounsellingRequest request = new CounsellingRequest();
        request.setId(rs.getInt("id"));
        request.setUserId(rs.getInt("user_id"));
        request.setUserName(rs.getString("user_name"));
        request.setCounsellorPreference(rs.getString("counsellor_preference"));
        request.setConcernType(rs.getString("concern_type"));
        request.setDescription(rs.getString("description"));

        Date preferredDate = rs.getDate("preferred_date");
        if (preferredDate != null) {
            request.setPreferredDate(preferredDate.toString());
        }

        Time preferredTime = rs.getTime("preferred_time");
        if (preferredTime != null) {
            request.setPreferredTime(preferredTime.toString());
        }

        request.setStatus(rs.getString("status"));

        Timestamp submittedDate = rs.getTimestamp("submitted_date");
        if (submittedDate != null) {
            request.setSubmittedDate(submittedDate.toString());
        }

        request.setAssignedCounsellor(rs.getString("assigned_counsellor"));
        request.setAssignedCounsellorImage(rs.getString("assigned_counsellor_image"));

        Date confirmedDate = rs.getDate("confirmed_date");
        if (confirmedDate != null) {
            request.setConfirmedDate(confirmedDate.toString());
        }

        Time confirmedTime = rs.getTime("confirmed_time");
        if (confirmedTime != null) {
            request.setConfirmedTime(confirmedTime.toString());
        }

        request.setGoogleMeetLink(rs.getString("google_meet_link"));
        request.setAdminNotes(rs.getString("admin_notes"));

        return request;
    }
}