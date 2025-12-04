<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>SerenityHub | Mood Tracker</title>
    <link
      rel="stylesheet"
      href="<%= request.getContextPath() %>/assets/css/styles.css"
    />
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

    <main class="content">
      <div id="page-mood" class="page-content active">
        <div class="welcome-card">
          <h3>Daily Mood Tracker</h3>
        </div>

        <div class="mood-tracker-card">
          <div class="mood-header">
            <div>
              <h4>How are you feeling today?</h4>
              <p id="currentDate">Loading date...</p>
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
                <span class="mood-emoji">&#128522;</span>
                <span class="mood-label">Great</span>
              </button>
              <button
                type="button"
                class="mood-button mood-good"
                data-mood="good"
              >
                <span class="mood-emoji">&#128578;</span>
                <span class="mood-label">Good</span>
              </button>
              <button
                type="button"
                class="mood-button mood-okay"
                data-mood="okay"
              >
                <span class="mood-emoji">&#128528;</span>
                <span class="mood-label">Okay</span>
              </button>
              <button
                type="button"
                class="mood-button mood-bad"
                data-mood="bad"
              >
                <span class="mood-emoji">&#128543;</span>
                <span class="mood-label">Bad</span>
              </button>
              <button
                type="button"
                class="mood-button mood-terrible"
                data-mood="terrible"
              >
                <span class="mood-emoji">&#128546;</span>
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
          <!-- result area: populated after user submits their mood -->
          <div
            id="moodResult"
            class="mood-result"
            style="display: none; margin-top: 16px"
          >
            <h4>Recent Mood History</h4>
            <hr />
            <p><strong>Date & Time:</strong> <span id="resultDate"></span></p>
            <p><strong>Mood:</strong> <span id="resultMood"></span></p>
            <p><strong>Notes:</strong> <span id="resultNote"></span></p>
          </div>
        </div>

        <div class="emergency-banner">
          <div class="emergency-icon">&#128161;</div>
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
    <script>
      (function () {
        const el = document.getElementById("currentDate");
        if (!el) return;
        const now = new Date();
        const options = {
          weekday: "long",
          year: "numeric",
          month: "long",
          day: "numeric",
        };
        // Use user's locale for formatting; fallback to en-US if unavailable
        try {
          el.textContent = now.toLocaleDateString(undefined, options);
        } catch (e) {
          el.textContent = now.toLocaleDateString("en-US", options);
        }
      })();
    </script>
    <script>
      (function () {
        const moodButtons = document.querySelectorAll(".mood-button");
        const form = document.getElementById("moodForm");
        const noteEl = document.getElementById("moodNote");
        const resultWrapper = document.getElementById("moodResult");
        const resultMood = document.getElementById("resultMood");
        const resultNote = document.getElementById("resultNote");

        if (!form || moodButtons.length === 0) return;

        // Toggle selection on mood buttons
        moodButtons.forEach((btn) => {
          btn.addEventListener("click", function () {
            moodButtons.forEach((b) => b.classList.remove("selected"));
            this.classList.add("selected");
          });
        });

        // Handle submit: prevent actual navigation and show the chosen mood + note
        form.addEventListener("submit", function (ev) {
          ev.preventDefault();
          const selected = document.querySelector(".mood-button.selected");
          const mood = selected ? selected.getAttribute("data-mood") : null;
          const note = noteEl ? noteEl.value.trim() : "";

          if (!mood) {
            alert("Please select a mood before submitting.");
            return;
          }

          // Populate result area
          resultMood.textContent = mood.charAt(0).toUpperCase() + mood.slice(1);
          resultNote.textContent = note || "—";

          const now = new Date();
          resultDate.textContent = now.toLocaleString();
          resultWrapper.style.display = "block";

          // Optionally: keep the form visible or hide it
          form.style.display = 'none';
        });
      })();
    </script>
  </body>
</html>
