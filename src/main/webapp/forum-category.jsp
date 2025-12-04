<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String categoryId = request.getParameter("cat");
    String pageType = request.getParameter("page"); // "feed", "create", or "my-posts"
    
    // Get category details from database
    // Category category = CategoryDAO.getCategoryById(categoryId);
    // List<Post> posts = PostDAO.getPostsByCategory(categoryId);
    
    // For demo purposes:
    String categoryName = "";
    String categoryIcon = "";
    String categoryDescription = "";
    
    if ("anxiety".equals(categoryId)) {
        categoryName = "Anxiety Support";
        categoryIcon = "fas fa-brain";
        categoryDescription = "Share experiences and coping strategies for anxiety management";
    } else if ("depression".equals(categoryId)) {
        categoryName = "Depression Discussion";
        categoryIcon = "fas fa-cloud-rain";
        categoryDescription = "A safe space to talk about depression and recovery";
    } else if ("stress".equals(categoryId)) {
        categoryName = "Stress Management";
        categoryIcon = "fas fa-weight";
        categoryDescription = "Techniques for managing academic and personal stress";
    } else if ("success".equals(categoryId)) {
        categoryName = "Success Stories";
        categoryIcon = "fas fa-star";
        categoryDescription = "Share your mental health journey and inspire others";
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title><%= categoryName %> | SerenityHub</title>
    <link rel="stylesheet" href="assets/css/styles.css" />
    <link rel="stylesheet" href="assets/css/forum.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" />
    <style>
        /* Content area styles */
        .forum-content-area {
            display: none;
        }
        
        .forum-content-area.active {
            display: block;
            animation: fadeIn 0.3s ease;
        }
        
        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(10px); }
            to { opacity: 1; transform: translateY(0); }
        }
        
        /* Category Header */
        .category-header {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            padding: 2rem;
            border-radius: 15px;
            margin-bottom: 2rem;
            display: flex;
            align-items: center;
            gap: 1.5rem;
        }
        
        .category-header-icon {
            font-size: 3rem;
            background: rgba(255, 255, 255, 0.2);
            width: 80px;
            height: 80px;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
        }
        
        .category-header-info h1 {
            font-size: 2rem;
            margin-bottom: 0.5rem;
        }
        
        .category-header-info p {
            opacity: 0.9;
            font-size: 1.1rem;
        }
        
        /* Feed Content (Default) */
        .posts-list {
            display: flex;
            flex-direction: column;
            gap: 1.5rem;
        }
        
        .post-card {
            background: white;
            border-radius: 12px;
            padding: 1.5rem;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.08);
            border: 1px solid #eaeaea;
            transition: all 0.3s ease;
        }
        
        .post-card:hover {
            transform: translateY(-2px);
            box-shadow: 0 6px 20px rgba(0, 0, 0, 0.12);
        }
        
        .post-header {
            display: flex;
            justify-content: space-between;
            align-items: flex-start;
            margin-bottom: 1rem;
        }
        
        .post-title {
            font-size: 1.25rem;
            font-weight: 600;
            color: #333;
            margin-bottom: 0.5rem;
        }
        
        .post-author {
            color: #666;
            font-size: 0.9rem;
        }
        
        .post-content {
            color: #555;
            line-height: 1.6;
            margin-bottom: 1rem;
        }
        
        .post-footer {
            display: flex;
            justify-content: space-between;
            align-items: center;
            color: #888;
            font-size: 0.9rem;
            border-top: 1px solid #eee;
            padding-top: 1rem;
        }
        
        .post-actions {
            display: flex;
            gap: 1rem;
        }
        
        .post-action-btn {
            background: none;
            border: none;
            color: #666;
            cursor: pointer;
            font-size: 0.9rem;
            padding: 0.25rem 0.5rem;
            border-radius: 4px;
            transition: all 0.2s ease;
        }
        
        .post-action-btn:hover {
            background: #f0f0f0;
        }
        
        /* CREATE Page Styles */
        .create-post-container {
            background: white;
            border-radius: 12px;
            padding: 2rem;
            box-shadow: 0 4px 16px rgba(0, 0, 0, 0.08);
            margin: 1rem 0;
        }
        
        .create-post-title {
            font-size: 1.5rem;
            color: #333;
            margin-bottom: 0.5rem;
        }
        
        .create-post-subtitle {
            color: #666;
            margin-bottom: 2rem;
        }
        
        .post-form {
            display: flex;
            flex-direction: column;
            gap: 1.5rem;
        }
        
        .form-group {
            display: flex;
            flex-direction: column;
            gap: 0.5rem;
        }
        
        .form-group label {
            font-weight: 600;
            color: #333;
            font-size: 0.95rem;
        }
        
        .form-control {
            padding: 0.875rem 1rem;
            border: 2px solid #e0e0e0;
            border-radius: 8px;
            font-size: 1rem;
            transition: border-color 0.3s ease;
            font-family: inherit;
        }
        
        .form-control:focus {
            outline: none;
            border-color: #667eea;
            box-shadow: 0 0 0 3px rgba(102, 126, 234, 0.1);
        }
        
        textarea.form-control {
            min-height: 200px;
            resize: vertical;
            line-height: 1.5;
        }
        
        .submit-post-btn {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            border: none;
            padding: 1rem 2rem;
            border-radius: 8px;
            font-size: 1rem;
            font-weight: 600;
            cursor: pointer;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 0.5rem;
            transition: all 0.3s ease;
            margin-top: 1rem;
        }
        
        .submit-post-btn:hover {
            transform: translateY(-2px);
            box-shadow: 0 6px 16px rgba(102, 126, 234, 0.3);
        }
        
        /* MY POSTS Page Styles */
        .my-posts-container {
            background: white;
            border-radius: 12px;
            padding: 2rem;
            box-shadow: 0 4px 16px rgba(0, 0, 0, 0.08);
            margin: 1rem 0;
        }
        
        .no-posts-message {
            text-align: center;
            padding: 3rem 1rem;
        }
        
        .no-posts-icon {
            font-size: 3rem;
            color: #cbd5e0;
            margin-bottom: 1rem;
        }
        
        .no-posts-title {
            font-size: 1.5rem;
            color: #333;
            margin-bottom: 0.5rem;
        }
        
        .no-posts-text {
            color: #666;
            margin-bottom: 2rem;
        }
        
        .create-first-btn {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            border: none;
            padding: 1rem 2rem;
            border-radius: 8px;
            font-size: 1rem;
            font-weight: 600;
            cursor: pointer;
            display: inline-flex;
            align-items: center;
            gap: 0.5rem;
            transition: all 0.3s ease;
        }
        
        .create-first-btn:hover {
            transform: translateY(-2px);
            box-shadow: 0 6px 16px rgba(102, 126, 234, 0.3);
        }
        
        /* User posts list */
        .user-posts-list {
            display: flex;
            flex-direction: column;
            gap: 1rem;
        }
    </style>
</head>
<body>
    <!-- Header -->
    <header class="header">
        <div class="container">
            <div class="header-content">
                <div class="logo">
                    <div class="logo-icon">
                        <img src="images/welcome.png" width="40" height="40" />
                    </div>
                    <div class="logo-text">
                        <h1>SerenityHub</h1>
                        <p class="logo-subtitle">UTM Mental Health Literacy Hub</p>
                    </div>
                </div>
                <div class="header-buttons">
                    <a href="home.jsp" class="nav-item">
                        <span>Home</span>
                    </a>
                    <a href="assessment.jsp" class="nav-item">
                        <span>Self-Assessment</span>
                    </a>
                    <a href="chatbot.jsp" class="nav-item">
                        <span>ChatBot</span>
                    </a>
                    <a href="" class="nav-item">
                        <span>Feedback</span>
                    </a>
                    <a href="index.jsp" class="nav-item">
                        <span>Logout</span>
                    </a>
                </div>
            </div>
        </div>
    </header>

    <!-- Main Content -->
    <main class="content">
        <div class="forum-wrapper">
            <!-- Category Header -->
            <div class="category-header">
                <div class="category-header-icon">
                    <i class="<%= categoryIcon %>"></i>
                </div>
                <div class="category-header-info">
                    <h1><%= categoryName %></h1>
                    <p><%= categoryDescription %></p>
                </div>
            </div>
            
            <!-- Include Forum Navigation Bar -->
            <jsp:include page="forum-navbar.jsp">
                <jsp:param name="cat" value="<%= categoryId %>" />
                <jsp:param name="page" value="<%= pageType != null ? pageType : \"feed\" %>" />
            </jsp:include>
            
            <!-- Feed Content (Default when page=feed or no page specified) -->
            <div id="feed-content" class="forum-content-area <%= (pageType == null || "feed".equals(pageType)) ? "active" : "" %>">
                <div class="section-header" style="display: flex; justify-content: space-between; align-items: center; margin: 2rem 0 1rem 0;">
                    <h2>Recent Discussions</h2>
                    <a href="forum-category.jsp?page=create&cat=<%= categoryId %>" class="create-post-btn" style="text-decoration: none;">
                        <i class="fas fa-plus"></i> Start New Discussion
                    </a>
                </div>
                
                <div class="posts-list">
                    <!-- Posts will be loaded from database -->
                    <% 
                    // Sample posts - replace with database query
                    String[][] samplePosts = {
                        {"How do you cope with morning anxiety?", "Sarah M", "2 hours ago", "24"},
                        {"My journey with therapy - 6 month update", "Alex J", "5 hours ago", "42"},
                        {"Breathing techniques that actually work", "Maria K", "1 day ago", "18"}
                    };
                    
                    for (String[] post : samplePosts) {
                    %>
                    <div class="post-card">
                        <div class="post-header">
                            <div>
                                <h3 class="post-title"><%= post[0] %></h3>
                                <div class="post-author">By <%= post[1] %></div>
                            </div>
                            <div class="post-actions">
                                <button class="post-action-btn">
                                    <i class="fas fa-heart"></i> Like
                                </button>
                                <button class="post-action-btn">
                                    <i class="fas fa-comment"></i> Reply
                                </button>
                            </div>
                        </div>
                        <p class="post-content">This is a sample post content about <%= categoryName.toLowerCase() %>. In a real application, this would come from the database.</p>
                        <div class="post-footer">
                            <span><i class="fas fa-clock"></i> <%= post[2] %></span>
                            <span><i class="fas fa-comment"></i> <%= post[3] %> replies</span>
                        </div>
                    </div>
                    <% } %>
                </div>
            </div>
            
            <!-- CREATE Content (when page=create) -->
            <div id="create-content" class="forum-content-area <%= "create".equals(pageType) ? "active" : "" %>">
                <div class="create-post-container">
                    <h1 class="create-post-title">Share what you feel</h1>
                    <p class="create-post-subtitle">Create a new post in <strong><%= categoryName %></strong></p>
                    
                    <form id="createPostForm" class="post-form" onsubmit="submitPost(event)">
                        <input type="hidden" id="postCategory" value="<%= categoryId %>">
                        
                        <div class="form-group">
                            <label for="postTitle">Title</label>
                            <input type="text" id="postTitle" class="form-control" 
                                   placeholder="What would you like to discuss?" required>
                        </div>
                        
                        <div class="form-group">
                            <label for="postContent">Your Story</label>
                            <textarea id="postContent" class="form-control" rows="8"
                                      placeholder="Share what you feel and what story you want to tell today..." required></textarea>
                        </div>
                        
                       <div class="form-group" style="display: flex; align-items: center; gap: 10px;">
                        <input type="checkbox" id="anonymous" name="anonymous" style="margin: 0;">
                        <label for="anonymous" style="margin: 0; font-weight: normal; cursor: pointer;">
                            Post anonymously
                        </label>
                        </div>
                        
                        <button type="submit" class="submit-post-btn">
                            <i class="fas fa-paper-plane"></i> Post to <%= categoryName %>
                        </button>
                    </form>
                </div>
            </div>
            
            <!-- MY POSTS Content (when page=my-posts) -->
            <div id="my-posts-content" class="forum-content-area <%= "my-posts".equals(pageType) ? "active" : "" %>">
                <div class="my-posts-container">
                    <h1 class="create-post-title">My Posts in <%= categoryName %></h1>
                    <p class="create-post-subtitle">Manage and view all your discussions in this category</p>
                    
                    <div id="userPostsList">
                        <!-- Check if user has posts in this category -->
                        <div class="no-posts-message">
                            <div class="no-posts-icon">
                                <i class="fas fa-edit"></i>
                            </div>
                            <h2 class="no-posts-title">No Posts in <%= categoryName %> Yet</h2>
                            <p class="no-posts-text">Start sharing your thoughts and experiences in this category!</p>
                            <a href="forum-category.jsp?page=create&cat=<%= categoryId %>" class="create-first-btn">
                                <i class="fas fa-plus"></i> Create One Now!
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </main>

    <script>
        // Submit new post
        function submitPost(event) {
            event.preventDefault();
            
            const title = document.getElementById('postTitle').value;
            const content = document.getElementById('postContent').value;
            const category = document.getElementById('postCategory').value;
            const anonymous = document.getElementById('anonymous').checked;
            
            if (!title || !content) {
                alert('Please fill in all fields');
                return;
            }
            
            // In a real application, submit to server via AJAX
            console.log('Submitting post:', {
                title: title,
                content: content,
                category: category,
                anonymous: anonymous
            });
            
            // Simulate server request
            setTimeout(() => {
                alert('Post created successfully in ' + getCategoryName(category) + '!');
                // Redirect to feed page
                window.location.href = 'forum-category.jsp?cat=' + category + '&page=feed';
            }, 500);
        }
        
        // Helper function to get category name
        function getCategoryName(categoryId) {
            const categories = {
                'anxiety': 'Anxiety Support',
                'depression': 'Depression Discussion',
                'stress': 'Stress Management',
                'success': 'Success Stories'
            };
            return categories[categoryId] || 'Category';
        }
        
        // Load user's posts for this category
        function loadUserPosts(categoryId) {
            // In a real app, fetch via AJAX
            // Example: fetch('/api/posts?category=' + categoryId + '&user=current')
        }
        
        // Check URL parameters on load
        document.addEventListener('DOMContentLoaded', function() {
            const urlParams = new URLSearchParams(window.location.search);
            const page = urlParams.get('page');
            const category = urlParams.get('cat');
            
            // If on create page, focus the title field
            if (page === 'create') {
                document.getElementById('postTitle').focus();
            }
            
            // If on my-posts page, load user's posts
            if (page === 'my-posts' && category) {
                loadUserPosts(category);
            }
        });
    </script>
</body>
</html>