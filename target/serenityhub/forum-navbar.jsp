<%-- forum-navbar.jsp --%>
<div class="forum-nav">
    <div class="forum-nav-left">
        <a href="forum.jsp" class="forum-tab <%= request.getParameter("page") == null || request.getParameter("page").equals("feed") ? "active" : "" %>">
            <i class="fas fa-stream"></i> FORM FEED
        </a>
        <a href="forum-category.jsp?page=create&cat=<%= request.getParameter("cat") %>" 
           class="forum-tab <%= "create".equals(request.getParameter("page")) ? "active" : "" %>">
            <i class="fas fa-plus-circle"></i> CREATE
        </a>
        <a href="forum-category.jsp?page=my-posts&cat=<%= request.getParameter("cat") %>" 
           class="forum-tab <%= "my-posts".equals(request.getParameter("page")) ? "active" : "" %>">
            <i class="fas fa-user-circle"></i> MY POSTS
        </a>
    </div>
    <div class="forum-nav-right">
        <a href="forum-category.jsp?page=create&cat=<%= request.getParameter("cat") %>" 
           class="create-post-btn">
            <i class="fas fa-plus"></i> Create Post
        </a>
    </div>
</div>

<style>
.forum-nav {
    background: white;
    padding: 0.75rem 1.5rem;
    border-radius: 12px;
    margin: 1.5rem 0;
    box-shadow: 0 2px 8px rgba(0, 0, 0, 0.08);
    display: flex;
    justify-content: space-between;
    align-items: center;
    border: 1px solid #eaeaea;
}

.forum-nav-left {
    display: flex;
    align-items: center;
    gap: 1.5rem;
}

.forum-nav-right {
    display: flex;
    align-items: center;
    gap: 0.75rem;
}

.forum-tab {
    padding: 0.75rem 1.5rem;
    border: none;
    background: none;
    font-size: 1rem;
    font-weight: 600;
    color: #666;
    cursor: pointer;
    border-radius: 8px;
    transition: all 0.3s ease;
    display: flex;
    align-items: center;
    gap: 0.5rem;
    text-decoration: none;
}

.forum-tab:hover {
    background: #f8f9fa;
    color: #333;
}

.forum-tab.active {
    background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
    color: white;
    box-shadow: 0 4px 12px rgba(102, 126, 234, 0.25);
}

.create-post-btn {
    background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
    color: white;
    border: none;
    padding: 0.75rem 1.5rem;
    border-radius: 8px;
    font-weight: 600;
    cursor: pointer;
    display: flex;
    align-items: center;
    gap: 0.5rem;
    transition: all 0.3s ease;
    text-decoration: none;
}

.create-post-btn:hover {
    transform: translateY(-2px);
    box-shadow: 0 6px 16px rgba(102, 126, 234, 0.3);
}
</style>