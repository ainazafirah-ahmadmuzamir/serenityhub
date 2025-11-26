<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>SerenityHub | Mood Tracker</title>
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
            <a href="home.jsp" class="nav-item">
              <span>Home</span>
            </a>
            <a href="assessment.jsp" class="nav-item">
              <span>Self-Assessment</span>
            </a>
            <a href="" class="nav-item">
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

    <main class="content">
      <div id="page-mood" class="page-content active">
        <div class="welcome-card">
          <h3>Daily Mood Tracker</h3>
        </div>

        <div class="mood-tracker-card">
          <div class="mood-header">
            <div>
              <h4>How are you feeling today?</h4>
              <p>Tuesday, November 25, 2025</p>
            </div>
          </div>

          <form id="moodForm" class="mood-form">
            <label>Select your mood:</label>
            <div class="mood-options">
              <button
                type="button"
                class="mood-button mood-great"
                data-mood="great"
              >
                <span class="mood-emoji"></span>
                <span class="mood-label">Great</span>
              </button>
              <button
                type="button"
                class="mood-button mood-good"
                data-mood="good"
              >
                <span class="mood-emoji"></span>
                <span class="mood-label">Good</span>
              </button>
              <button
                type="button"
                class="mood-button mood-okay"
                data-mood="okay"
              >
                <span class="mood-emoji"></span>
                <span class="mood-label">Okay</span>
              </button>
              <button
                type="button"
                class="mood-button mood-bad"
                data-mood="bad"
              >
                <span class="mood-emoji"></span>
                <span class="mood-label">Bad</span>
              </button>
              <button
                type="button"
                class="mood-button mood-terrible"
                data-mood="terrible"
              >
                <span class="mood-emoji"></span>
                <span class="mood-label">Terrible</span>
              </button>
            </div>

            <div class="form-group">
              <label for="moodNote">What's on your mind? (optional)</label>
              <textarea
                id="moodNote"
                rows="4"
                placeholder="Share how you're feeling or what influenced your mood today..."
              ></textarea>
            </div>

            <button type="submit" class="btn btn-primary btn-block">
              Save Today's Mood
            </button>
          </form>
        </div>

        <div class="emergency-banner">
          <div class="emergency-icon"></div>
          <div>
            <h4>Insights & Recommendations</h4>
            <div class="emergency-contacts">
              <p>
                You tend to feel better on days when you get enough sleep. Try
                maintaining a consistent sleep schedule.
              </p>
              <p>
                Your mood improves after social activities. Consider scheduling
                regular time with friends.
              </p>
              <p>
                Regular monitoring helps identify patterns. Keep consistent
                tracking everyday!
              </p>
            </div>
          </div>
        </div>
      </div>
    </main>
  </body>
</html>
