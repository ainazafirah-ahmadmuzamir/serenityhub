<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>SerenityHub | Peer Support Forum</title>
    <link rel="stylesheet" href="assets/css/styles.css" />
    <link rel="stylesheet" href="assets/css/forum.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" />
</head>
<body>
    <!-- Header (Same as home page) -->
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
            <div class="forum-header">
                <div class="forum-title">
                    <h1>Welcome to Peer Support Forum</h1>
                    <p>Connect with fellow students, share experiences, and find support in a safe space</p>
                </div>
                <div class="forum-actions">
                    <div class="forum-search">
                        <i class="fas fa-search"></i>
                        <input type="text" placeholder="Search discussions...">
                    </div>
                    <button class="create-topic-btn" onclick="showNewTopicModal()">
                        <i class="fas fa-plus"></i> New Discussion
                    </button>
                </div>
            </div>
            
            <!-- Forum Stats -->
            <div class="forum-stats">
                <div class="stat-card">
                    <div class="stat-number">1,245</div>
                    <div class="stat-label">Total Discussions</div>
                </div>
                <div class="stat-card">
                    <div class="stat-number">5,892</div>
                    <div class="stat-label">Total Replies</div>
                </div>
                <div class="stat-card">
                    <div class="stat-number">843</div>
                    <div class="stat-label">Active Members</div>
                </div>
            </div>
            
            <!-- Categories -->
            <div class="section-header">
                <h2>Support Categories</h2>
                <a href="#" class="view-all-btn">
                    View All Categories <i class="fas fa-arrow-right"></i>
                </a>
            </div>
            
            <div class="categories-grid">
                <a href="forum-category.jsp?cat=anxiety" class="category-card">
                    <div class="category-header">
                        <div class="category-icon category-1">
                            <i class="fas fa-brain"></i>
                        </div>
                        <div class="category-info">
                            <h3>Anxiety Support</h3>
                            <p class="category-stats">245 discussions • 1.2k replies</p>
                        </div>
                    </div>
                    <p class="category-description">Share experiences and coping strategies for anxiety management. A safe space for those dealing with anxiety disorders.</p>
                    <div class="category-topics">
                        <span class="topic-tag">Panic attacks</span>
                        <span class="topic-tag">Social anxiety</span>
                        <span class="topic-tag">Breathing techniques</span>
                    </div>
                </a>
                
                <a href="forum-category.jsp?cat=depression" class="category-card">
                    <div class="category-header">
                        <div class="category-icon category-2">
                            <i class="fas fa-cloud-rain"></i>
                        </div>
                        <div class="category-info">
                            <h3>Depression Discussion</h3>
                            <p class="category-stats">189 discussions • 890 replies</p>
                        </div>
                    </div>
                    <p class="category-description">A safe space to talk about depression, share recovery journeys, and find hope in shared experiences.</p>
                    <div class="category-topics">
                        <span class="topic-tag">Low motivation</span>
                        <span class="topic-tag">Therapy experiences</span>
                        <span class="topic-tag">Daily routine tips</span>
                    </div>
                </a>
                
                <a href="forum-category.jsp?cat=stress" class="category-card">
                    <div class="category-header">
                        <div class="category-icon category-3">
                            <i class="fas fa-weight"></i>
                        </div>
                        <div class="category-info">
                            <h3>Stress Management</h3>
                            <p class="category-stats">312 discussions • 1.5k replies</p>
                        </div>
                    </div>
                    <p class="category-description">Techniques and tips for managing academic, social, and personal stress in student life.</p>
                    <div class="category-topics">
                        <span class="topic-tag">Academic stress</span>
                        <span class="topic-tag">Time management</span>
                        <span class="topic-tag">Mindfulness</span>
                    </div>
                </a>
                
                <a href="forum-category.jsp?cat=success" class="category-card">
                    <div class="category-header">
                        <div class="category-icon category-4">
                            <i class="fas fa-star"></i>
                        </div>
                        <div class="category-info">
                            <h3>Success Stories</h3>
                            <p class="category-stats">156 discussions • 720 replies</p>
                        </div>
                    </div>
                    <p class="category-description">Share your mental health journey, recovery milestones, and inspire others with your progress.</p>
                    <div class="category-topics">
                        <span class="topic-tag">Recovery stories</span>
                        <span class="topic-tag">Breakthrough moments</span>
                        <span class="topic-tag">Progress updates</span>
                    </div>
                </a>
            </div>
            
            <!-- Recent Discussions -->
            <div class="recent-discussions">
                <div class="section-header">
                    <h2>Recent Discussions</h2>
                    <a href="forum-all-topics.jsp" class="view-all-btn">
                        View All Discussions <i class="fas fa-arrow-right"></i>
                    </a>
                </div>
                
                <div class="topics-table">
                    <div class="table-header">
                        <span>Topic</span>
                        <span>Author</span>
                        <span>Replies/Views</span>
                        <span>Last Activity</span>
                    </div>
                    
                    <a href="forum-topic.jsp?id=1" class="table-row">
                        <div class="topic-title">
                            <div class="topic-icon-small category-1">
                                <i class="fas fa-brain"></i>
                            </div>
                            <div class="topic-text">
                                <h4>How do you cope with morning anxiety before classes?</h4>
                                <p class="topic-excerpt">Looking for tips to manage anxiety that peaks in the morning...</p>
                            </div>
                        </div>
                        <div class="topic-author">
                            <div class="author-avatar">JS</div>
                            <span>Jane Smith</span>
                        </div>
                        <div class="topic-stats">
                            <i class="fas fa-comment"></i> 24
                            <i class="fas fa-eye"></i> 156
                        </div>
                        <div class="topic-latest">
                            <span class="topic-indicator"></span> 2 hours ago
                        </div>
                    </a>
                    
                    <a href="forum-topic.jsp?id=2" class="table-row">
                        <div class="topic-title">
                            <div class="topic-icon-small category-2">
                                <i class="fas fa-cloud-rain"></i>
                            </div>
                            <div class="topic-text">
                                <h4>My journey with therapy - 6 month update</h4>
                                <p class="topic-excerpt">Sharing my progress after 6 months of consistent therapy sessions...</p>
                            </div>
                        </div>
                        <div class="topic-author">
                            <div class="author-avatar">AJ</div>
                            <span>Alex Johnson</span>
                        </div>
                        <div class="topic-stats">
                            <i class="fas fa-comment"></i> 42
                            <i class="fas fa-eye"></i> 289
                        </div>
                        <div class="topic-latest">
                            <span class="topic-indicator"></span> 5 hours ago
                        </div>
                    </a>
                    
                    <a href="forum-topic.jsp?id=3" class="table-row">
                        <div class="topic-title">
                            <div class="topic-icon-small category-3">
                                <i class="fas fa-weight"></i>
                            </div>
                            <div class="topic-text">
                                <h4>Managing final exam stress - tips that work</h4>
                                <p class="topic-excerpt">Share your best study breaks and stress relief techniques...</p>
                            </div>
                        </div>
                        <div class="topic-author">
                            <div class="author-avatar">RS</div>
                            <span>Rohit Singh</span>
                        </div>
                        <div class="topic-stats">
                            <i class="fas fa-comment"></i> 18
                            <i class="fas fa-eye"></i> 124
                        </div>
                        <div class="topic-latest">
                            <span class="topic-indicator"></span> 1 day ago
                        </div>
                    </a>
                </div>
            </div>

    <!-- New Topic Modal -->
    <div class="modal-overlay" id="newTopicModal">
        <div class="modal-content">
            <div class="modal-header">
                <h3>Start New Discussion</h3>
                <button class="modal-close" onclick="hideNewTopicModal()">&times;</button>
            </div>
            <div class="modal-body">
                <form id="newTopicForm">
                    <div class="form-group">
                        <label for="topicCategory">Category</label>
                        <select id="topicCategory" class="form-control">
                            <option value="anxiety">Anxiety Support</option>
                            <option value="depression">Depression Discussion</option>
                            <option value="stress">Stress Management</option>
                            <option value="success">Success Stories</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="topicTitle">Title</label>
                        <input type="text" id="topicTitle" class="form-control" 
                               placeholder="What would you like to discuss?">
                    </div>
                    <div class="form-group">
                        <label for="topicContent">Content</label>
                        <textarea id="topicContent" rows="6" class="form-control"
                                  placeholder="Share your thoughts, experiences, or questions..."></textarea>
                    </div>
                    <button type="submit" class="btn btn-primary btn-block">
                        <i class="fas fa-paper-plane"></i> Post Discussion
                    </button>
                </form>
            </div>
        </div>
    </div>

    <script>
        // Modal functionality
        function showNewTopicModal() {
            document.getElementById('newTopicModal').style.display = 'flex';
        }
        
        function hideNewTopicModal() {
            document.getElementById('newTopicModal').style.display = 'none';
        }
        
        // Close modal when clicking outside
        document.getElementById('newTopicModal').addEventListener('click', function(e) {
            if (e.target === this) hideNewTopicModal();
        });
        
        document.getElementById('newTopicForm').addEventListener('submit', function(e) {
            e.preventDefault();
            // Here you would submit to your backend
            alert('Discussion posted! (Backend integration needed)');
            hideNewTopicModal();
        });
        
        // Add modal styles inline since we don't have modal CSS yet
        const modalStyles = `
            .modal-overlay {
                position: fixed;
                top: 0;
                left: 0;
                right: 0;
                bottom: 0;
                background: rgba(0, 0, 0, 0.5);
                display: none;
                align-items: center;
                justify-content: center;
                z-index: 1000;
                padding: 1rem;
            }
            
            .modal-content {
                background: white;
                border-radius: 1rem;
                width: 100%;
                max-width: 600px;
                max-height: 90vh;
                overflow-y: auto;
                box-shadow: 0 20px 25px -5px rgba(0, 0, 0, 0.1);
            }
            
            .modal-header {
                padding: 1.5rem;
                border-bottom: 1px solid #E5E7EB;
                display: flex;
                justify-content: space-between;
                align-items: center;
            }
            
            .modal-close {
                background: none;
                border: none;
                font-size: 1.5rem;
                cursor: pointer;
                color: #6B7280;
                padding: 0.25rem;
                border-radius: 0.25rem;
                line-height: 1;
            }
            
            .modal-close:hover {
                background: #F3F4F6;
                color: #374151;
            }
            
            .modal-body {
                padding: 1.5rem;
            }
        `;
        
        // Add modal styles to page
        const styleSheet = document.createElement("style");
        styleSheet.textContent = modalStyles;
        document.head.appendChild(styleSheet);
    </script>
</body>
</html>