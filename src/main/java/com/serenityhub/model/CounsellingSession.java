package com.serenityhub.model;

public class CounsellingSession {
    private int id;
    private String counsellorName;
    private String counsellorImage;
    private String specialty;
    private String timeSlot;
    private String date;
    private String status; // available, booked, completed
    private boolean isActive;

    public CounsellingSession() {}

    public CounsellingSession(int id, String counsellorName, String counsellorImage, 
                            String specialty, String timeSlot, String date, String status, boolean isActive) {
        this.id = id;
        this.counsellorName = counsellorName;
        this.counsellorImage = counsellorImage;
        this.specialty = specialty;
        this.timeSlot = timeSlot;
        this.date = date;
        this.status = status;
        this.isActive = isActive;
    }

    // Getters and Setters
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public String getCounsellorName() { return counsellorName; }
    public void setCounsellorName(String counsellorName) { this.counsellorName = counsellorName; }

    public String getCounsellorImage() { return counsellorImage; }
    public void setCounsellorImage(String counsellorImage) { this.counsellorImage = counsellorImage; }

    public String getSpecialty() { return specialty; }
    public void setSpecialty(String specialty) { this.specialty = specialty; }

    public String getTimeSlot() { return timeSlot; }
    public void setTimeSlot(String timeSlot) { this.timeSlot = timeSlot; }

    public String getDate() { return date; }
    public void setDate(String date) { this.date = date; }

    public String getStatus() { return status; }
    public void setStatus(String status) { this.status = status; }

    public boolean isActive() { return isActive; }
    public void setActive(boolean active) { isActive = active; }
}