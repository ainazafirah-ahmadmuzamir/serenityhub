<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>SerenityHub | Self-Assessment</title>
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
            <a href="assessment.jsp" class="nav-item active">
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
          <h3>DASS-21 Assessment</h3>
        </div>

        <div class="emergency-banner">
          <div class="emergency-icon"></div>
          <div>
            <h4>Instruction Box</h4>
            <div class="emergency-contacts">
              <p>
                Please read each statement and choose a number 0, 1, 2 or 3
                which indicates how much the statement applied to you over the
                past week. There are no right or wrong answers. Do not spend too
                much time on any statement.
              </p>
              <br />
              <p>The rating scale is as follows:</p>
              <p>0 - Did not apply to me at all</p>
              <p>1 - Applied to me to some degree, or some of the time</p>
              <p>
                2 - Applied to me to a considerable degree or a good part of
                time
              </p>
              <p>3 - Applied to me very much or most of the time</p>
            </div>
          </div>
        </div>
      </div>
    </main>
  </body>
</html>
