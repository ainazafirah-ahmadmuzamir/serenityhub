package com.serenityhub.model;

public class CounsellingRequest {
    private int id;
    private int userId;
    private String userName;
    private String counsellorPreference;
    private String concernType;
    private String description;
    private String preferredDate;
    private String preferredTime;
    private String status; // submitted, viewed, confirmed, ongoing, completed, cancelled
    private String submittedDate;
    
    // Assigned counsellor details (after confirmation)
    private String assignedCounsellor;
    private String assignedCounsellorImage;
    private int assignedSessionId;  // Added
    private String confirmedDate;
    private String confirmedTime;
    private String googleMeetLink;  // Added
    private String adminNotes;  // Added

    public CounsellingRequest() {}

    // Getters and Setters
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public int getUserId() { return userId; }
    public void setUserId(int userId) { this.userId = userId; }

    public String getUserName() { return userName; }
    public void setUserName(String userName) { this.userName = userName; }

    public String getCounsellorPreference() { return counsellorPreference; }
    public void setCounsellorPreference(String counsellorPreference) { 
        this.counsellorPreference = counsellorPreference; 
    }

    public String getConcernType() { return concernType; }
    public void setConcernType(String concernType) { this.concernType = concernType; }

    public String getDescription() { return description; }
    public void setDescription(String description) { this.description = description; }

    public String getPreferredDate() { return preferredDate; }
    public void setPreferredDate(String preferredDate) { this.preferredDate = preferredDate; }

    public String getPreferredTime() { return preferredTime; }
    public void setPreferredTime(String preferredTime) { this.preferredTime = preferredTime; }

    public String getStatus() { return status; }
    public void setStatus(String status) { this.status = status; }

    public String getSubmittedDate() { return submittedDate; }
    public void setSubmittedDate(String submittedDate) { this.submittedDate = submittedDate; }

    public String getAssignedCounsellor() { return assignedCounsellor; }
    public void setAssignedCounsellor(String assignedCounsellor) { 
        this.assignedCounsellor = assignedCounsellor; 
    }

    public String getAssignedCounsellorImage() { return assignedCounsellorImage; }
    public void setAssignedCounsellorImage(String assignedCounsellorImage) { 
        this.assignedCounsellorImage = assignedCounsellorImage; }

    public int getAssignedSessionId() { return assignedSessionId; }
    public void setAssignedSessionId(int assignedSessionId) { 
        this.assignedSessionId = assignedSessionId; 
    }

    public String getConfirmedDate() { return confirmedDate; }
    public void setConfirmedDate(String confirmedDate) { this.confirmedDate = confirmedDate; }

    public String getConfirmedTime() { return confirmedTime; }
    public void setConfirmedTime(String confirmedTime) { this.confirmedTime = confirmedTime; }

    public String getGoogleMeetLink() { return googleMeetLink; }
    public void setGoogleMeetLink(String googleMeetLink) { this.googleMeetLink = googleMeetLink; }

    public String getAdminNotes() { return adminNotes; }
    public void setAdminNotes(String adminNotes) { this.adminNotes = adminNotes; }
}