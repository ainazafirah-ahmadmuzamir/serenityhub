package com.serenityhub.model;

public class FeaturedTopic {
    private String title;
    private String description;
    private String highlightText;
    private String link;
    private String iconPath;

    public FeaturedTopic() {}

    public FeaturedTopic(String title, String description, String highlightText, 
                        String link, String iconPath) {
        this.title = title;
        this.description = description;
        this.highlightText = highlightText;
        this.link = link;
        this.iconPath = iconPath;
    }

    // Getters and Setters
    public String getTitle() { return title; }
    public void setTitle(String title) { this.title = title; }

    public String getDescription() { return description; }
    public void setDescription(String description) { this.description = description; }

    public String getHighlightText() { return highlightText; }
    public void setHighlightText(String highlightText) { this.highlightText = highlightText; }

    public String getLink() { return link; }
    public void setLink(String link) { this.link = link; }

    public String getIconPath() { return iconPath; }
    public void setIconPath(String iconPath) { this.iconPath = iconPath; }
}