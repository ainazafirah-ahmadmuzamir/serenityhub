package com.serenityhub.model;

public class Article {
    private int id;
    private String title;
    private String description;
    private String fullContent;
    private String iconPath;
    private String category;
    private String author;
    private String readTime;

    public Article() {
    }

    public Article(int id, String title, String description, String fullContent,
            String iconPath, String category, String author, String readTime) {
        this.id = id;
        this.title = title;
        this.description = description;
        this.fullContent = fullContent;
        this.iconPath = iconPath;
        this.category = category;
        this.author = author;
        this.readTime = readTime;
    }

    // Getters and Setters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getFullContent() {
        return fullContent;
    }

    public void setFullContent(String fullContent) {
        this.fullContent = fullContent;
    }

    public String getIconPath() {
        return iconPath;
    }

    public void setIconPath(String iconPath) {
        this.iconPath = iconPath;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public String getReadTime() {
        return readTime;
    }

    public void setReadTime(String readTime) {
        this.readTime = readTime;
    }
}