<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>SerenityHub | Student Portal</title>
    <link rel="stylesheet" href="assets/css/styles.css" />
  </head>
  <body>
    <!-- header -->
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
            <a href="home.jsp" class="nav-item active">
              <span>Home</span>
            </a>
            <a href="assessment.jsp" class="nav-item">
              <span>Self-Assessment</span>
            </a>
            <a href="" class="nav-item">
              <span>ChatBot</span>
            </a>
            <a href="feedback.jsp" class="nav-item">
              <span>Feedback</span>
            </a>
            <a href="index.jsp" class="nav-item">
              <span>Logout</span>
            </a>
          </div>
        </div>
      </div>
    </header>

    <!-- MAIN CONTENT -->
    <main class="content">
      <div id="page-overview" class="page-content active">
        <div class="welcome-card">
          <h3>Welcome back! What do you wanna do today?</h3>
        </div>
        <div class="section-content">
          <div class="quick-actions-grid">
            <div class="quick-action-card">
              <a href="mood.jsp">
                <div class="action-icon icon-pink"></div>
                <p>Daily Mood Tracker</p>
              </a>
            </div>
            <div class="quick-action-card">
              <a href="">
                <div class="action-icon icon-blue"></div>
                <p>Browse Educational Resources</p>
              </a>
            </div>
            <div class="quick-action-card">
              <a href="">
                <div class="action-icon icon-purple"></div>
                <p>Join Peer Support Forum</p>
              </a>
            </div>
            <div class="quick-action-card">
              <a href="">
                <div class="action-icon icon-green"></div>
                <p>Book Counselling</p>
              </a>
            </div>
          </div>
        </div>

        <div class="emergency-banner">
          <div class="emergency-icon">&#128227;</div>
          <div>
            <h4>Need Immediate Help?</h4>
            <p>
              If you're in crisis or need immediate support, please reach out to
              these resources:
            </p>
            <div class="emergency-contacts">
              <p>
                <strong>Pusat Perkhidmatan Psikologi & Kaunseling UTM:</strong>
                12345
              </p>
              <p><strong>National Crisis Line:</strong> 12345</p>
            </div>
          </div>
        </div>
      </div>
    </main>
  </body>
</html>
