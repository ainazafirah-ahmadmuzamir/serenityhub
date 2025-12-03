<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>SerenityHub | Feedback</title>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/assets/css/feedback.css">
</head>
<body>
    <!-- Navigation -->
    <nav class="main-nav">
        <div class="nav-container">
            <a href="home.jsp" class="logo">SerenityHub</a>
            <button class="menu-toggle" onclick="toggleMenu()">☰</button>
            <div class="nav-links" id="navLinks">
                <a href="home.jsp">Home</a>
                <a href="counselling.jsp">Counselling</a>
                <a href="feedback" class="active">Feedback</a>
                <a href="profile.jsp">Profile</a>
            </div>
        </div>
    </nav>

    <!-- Success Message (if any) -->
    <% if (request.getAttribute("success") != null) { %>
        <div class="alert alert-success">
            <%= request.getAttribute("success") %>
        </div>
    <% } %>

    <main class="feedback-container">
        <div class="feedback-header">
            <h1>Share Your Feedback!</h1>
            <p>Help us improve the Digital Literacy Mental Health Hub by sharing your thoughts, suggestions, or reporting any issues you've encountered.</p>
        </div>

        <div class="feedback-card">
            <form id="feedbackForm" action="<%= request.getContextPath() %>/feedback" method="POST" onsubmit="return validateForm()">
                <!-- Subject -->
                <div class="form-group">
                    <label for="subject" class="form-label required">Subject</label>
                    <input type="text" 
                           id="subject" 
                           name="subject" 
                           class="form-control" 
                           placeholder="Brief summary of your feedback"
                           required>
                </div>

                <!-- Category -->
                <div class="form-group">
                    <label for="category" class="form-label required">Category</label>
                    <select id="category" name="category" class="form-control" required>
                        <option value="" disabled selected>Please select a category</option>
                        <option value="BUG">Bug Report</option>
                        <option value="FEATURE">Feature Request</option>
                        <option value="IMPROVEMENT">Improvement Suggestion</option>
                        <option value="CONTENT">Content Feedback</option>
                        <option value="GENERAL">General Feedback</option>
                        <option value="OTHER">Other</option>
                    </select>
                </div>

                <!-- Feedback Message -->
                <div class="form-group">
                    <label for="message" class="form-label required">Your Feedback</label>
                    <textarea id="message" 
                              name="message" 
                              class="form-control" 
                              placeholder="Please share your detailed feedback..."
                              required></textarea>
                </div>

                <div class="divider"></div>

                <!-- Submit Button -->
                <button type="submit" class="btn-submit">
                    Submit Feedback
                </button>
            </form>
        </div>
    </main>

    <!-- Success Popup Modal -->
    <div class="modal" id="successModal">
        <div class="modal-content">
            <div class="modal-icon">✅</div>
            <h2 class="modal-title">Thank You!</h2>
            <p class="modal-message">Your feedback has been submitted successfully.</p>
            <button class="modal-btn" onclick="closeModal()">OK</button>
        </div>
    </div>

    <script>
        // Toggle mobile menu
        function toggleMenu() {
            const navLinks = document.getElementById('navLinks');
            navLinks.classList.toggle('show');
        }

        // Form validation
        function validateForm() {
            const subject = document.getElementById('subject').value.trim();
            const category = document.getElementById('category').value;
            const message = document.getElementById('message').value.trim();
            
            // Check required fields
            if (!subject || !category || !message) {
                alert('Please fill in all required fields marked with *');
                return false;
            }
            
            // Check message length
            if (message.length < 10) {
                alert('Please provide more detailed feedback (at least 10 characters)');
                return false;
            }
            
            // Optional: Show popup instead of server submission
            // showSuccessModal();
            // return false; // Prevent form submission
            
            return true; // Allow form submission to servlet
        }
        
        // Show success modal (for client-side only demo)
        function showSuccessModal() {
            // Clear form
            document.getElementById('feedbackForm').reset();
            
            // Show modal
            document.getElementById('successModal').classList.add('show');
            
            // Hide after 3 seconds
            setTimeout(closeModal, 3000);
        }
        
        // Close modal
        function closeModal() {
            document.getElementById('successModal').classList.remove('show');
        }
        
        // Close modal on ESC key
        document.addEventListener('keydown', function(e) {
            if (e.key === 'Escape') closeModal();
        });
        
        // Close modal when clicking outside
        document.getElementById('successModal').addEventListener('click', function(e) {
            if (e.target === this) closeModal();
        });
        
        <!-- server state for JS (avoid scriptlets inside JS) -->
        <div id="serverState" style="display:none" data-success="${not empty requestScope.success}"></div>

        // Show success message if it exists in request
        window.addEventListener('load', function() {
            var hasSuccess = document.getElementById('serverState').dataset.success === 'true';
            if (hasSuccess) {
                // Scroll to top to show the success message
                window.scrollTo(0, 0);
            }
        });
    </script>
</body>
</html>