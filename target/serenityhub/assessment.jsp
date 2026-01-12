<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>SerenityHub | Self-Assessment</title>
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
            <a href="assessment.jsp" class="nav-item active">
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
          <h3>DASS-21 Assessment</h3>
        </div>

        <div class="emergency-banner">
          <div class="emergency-icon">&#128227;</div>
          <div>
            <h4>Instruction Box</h4>
            <div class="emergency-contacts">
              <p>
                Please read each statement and choose a number 0, 1, 2 or 3
                which indicates how much the statement applied to you over the
                past week. There are no right or wrong answers. Do not spend too
                much time on any statement.
              </p>
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

        <div class="emergency-banner">
          <div>
            <h4>Answer All 21 Questions</h4>
            <br />
            <div class="dass-contents">
              <form id="dass21Form">
                <div class="question">
                  <p>1. I found it hard to wind down.</p>
                  <div class="options">
                    <label><input type="radio" name="q1" value="0" />0</label>
                    <label><input type="radio" name="q1" value="1" />1</label>
                    <label><input type="radio" name="q1" value="2" />2</label>
                    <label><input type="radio" name="q1" value="3" />3</label>
                  </div>
                </div>
                <div class="question">
                  <p>2. I was aware of dryness of my mouth.</p>
                  <div class="options">
                    <label><input type="radio" name="q2" value="0" />0</label>
                    <label><input type="radio" name="q2" value="1" />1</label>
                    <label><input type="radio" name="q2" value="2" />2</label>
                    <label><input type="radio" name="q2" value="3" />3</label>
                  </div>
                </div>
                <div class="question">
                  <p>
                    3. I couldn't seem to experience any positive feeling at
                    all.
                  </p>
                  <div class="options">
                    <label><input type="radio" name="q3" value="0" />0</label>
                    <label><input type="radio" name="q3" value="1" />1</label>
                    <label><input type="radio" name="q3" value="2" />2</label>
                    <label><input type="radio" name="q3" value="3" />3</label>
                  </div>
                </div>
                <div class="question">
                  <p>
                    4. I experienced breating difficulty (eg, excessively rapid
                    breathing, breathlessness absenced of physical exertion).
                  </p>
                  <div class="options">
                    <label><input type="radio" name="q4" value="0" />0</label>
                    <label><input type="radio" name="q4" value="1" />1</label>
                    <label><input type="radio" name="q4" value="2" />2</label>
                    <label><input type="radio" name="q4" value="3" />3</label>
                  </div>
                </div>
                <div class="question">
                  <p>
                    5. I found it difficult to work up the initiative to do
                    things.
                  </p>
                  <div class="options">
                    <label><input type="radio" name="q5" value="0" />0</label>
                    <label><input type="radio" name="q5" value="1" />1</label>
                    <label><input type="radio" name="q5" value="2" />2</label>
                    <label><input type="radio" name="q5" value="3" />3</label>
                  </div>
                </div>
                <div class="question">
                  <p>6. I tended to over-react to situations.</p>
                  <div class="options">
                    <label><input type="radio" name="q6" value="0" />0</label>
                    <label><input type="radio" name="q6" value="1" />1</label>
                    <label><input type="radio" name="q6" value="2" />2</label>
                    <label><input type="radio" name="q6" value="3" />3</label>
                  </div>
                </div>
                <div class="question">
                  <p>7. I experienced trembling (eg, In the hands).</p>
                  <div class="options">
                    <label><input type="radio" name="q7" value="0" />0</label>
                    <label><input type="radio" name="q7" value="1" />1</label>
                    <label><input type="radio" name="q7" value="2" />2</label>
                    <label><input type="radio" name="q7" value="3" />3</label>
                  </div>
                </div>
                <div class="question">
                  <p>8. I felt that I was using a lot of nervous energy.</p>
                  <div class="options">
                    <label><input type="radio" name="q8" value="0" />0</label>
                    <label><input type="radio" name="q8" value="1" />1</label>
                    <label><input type="radio" name="q8" value="2" />2</label>
                    <label><input type="radio" name="q8" value="3" />3</label>
                  </div>
                </div>
                <div class="question">
                  <p>
                    9. I was worried about situations in which might panic and
                    make a fool of myself.
                  </p>
                  <div class="options">
                    <label><input type="radio" name="q9" value="0" />0</label>
                    <label><input type="radio" name="q9" value="1" />1</label>
                    <label><input type="radio" name="q9" value="2" />2</label>
                    <label><input type="radio" name="q9" value="3" />3</label>
                  </div>
                </div>
                <div class="question">
                  <p>10. I felt that I had nothing to look forward to.</p>
                  <div class="options">
                    <label><input type="radio" name="q10" value="0" />0</label>
                    <label><input type="radio" name="q10" value="1" />1</label>
                    <label><input type="radio" name="q10" value="2" />2</label>
                    <label><input type="radio" name="q10" value="3" />3</label>
                  </div>
                </div>
                <div class="question">
                  <p>11. I found myself getting agitated.</p>
                  <div class="options">
                    <label><input type="radio" name="q11" value="0" />0</label>
                    <label><input type="radio" name="q11" value="1" />1</label>
                    <label><input type="radio" name="q11" value="2" />2</label>
                    <label><input type="radio" name="q11" value="3" />3</label>
                  </div>
                </div>
                <div class="question">
                  <p>12. I found difficult to relax.</p>
                  <div class="options">
                    <label><input type="radio" name="q12" value="0" />0</label>
                    <label><input type="radio" name="q12" value="1" />1</label>
                    <label><input type="radio" name="q12" value="2" />2</label>
                    <label><input type="radio" name="q12" value="3" />3</label>
                  </div>
                </div>
                <div class="question">
                  <p>13. I felt down-hearted and blue.</p>
                  <div class="options">
                    <label><input type="radio" name="q13" value="0" />0</label>
                    <label><input type="radio" name="q13" value="1" />1</label>
                    <label><input type="radio" name="q13" value="2" />2</label>
                    <label><input type="radio" name="q13" value="3" />3</label>
                  </div>
                </div>
                <div class="question">
                  <p>
                    14. I was intolerant of anything that kept me from getting
                    on with what I was doing.
                  </p>
                  <div class="options">
                    <label><input type="radio" name="q14" value="0" />0</label>
                    <label><input type="radio" name="q14" value="1" />1</label>
                    <label><input type="radio" name="q14" value="2" />2</label>
                    <label><input type="radio" name="q14" value="3" />3</label>
                  </div>
                </div>
                <div class="question">
                  <p>15. I felt I was close to panic.</p>
                  <div class="options">
                    <label><input type="radio" name="q15" value="0" />0</label>
                    <label><input type="radio" name="q15" value="1" />1</label>
                    <label><input type="radio" name="q15" value="2" />2</label>
                    <label><input type="radio" name="q15" value="3" />3</label>
                  </div>
                </div>
                <div class="question">
                  <p>16. I was unable to become enthusiastic about anything</p>
                  <div class="options">
                    <label><input type="radio" name="q16" value="0" />0</label>
                    <label><input type="radio" name="q16" value="1" />1</label>
                    <label><input type="radio" name="q16" value="2" />2</label>
                    <label><input type="radio" name="q16" value="3" />3</label>
                  </div>
                </div>
                <div class="question">
                  <p>17. I felt I wasn't worth much as a person.</p>
                  <div class="options">
                    <label><input type="radio" name="q17" value="0" />0</label>
                    <label><input type="radio" name="q17" value="1" />1</label>
                    <label><input type="radio" name="q17" value="2" />2</label>
                    <label><input type="radio" name="q17" value="3" />3</label>
                  </div>
                </div>
                <div class="question">
                  <p>18. I felt that I was rather touchy.</p>
                  <div class="options">
                    <label><input type="radio" name="q18" value="0" />0</label>
                    <label><input type="radio" name="q18" value="1" />1</label>
                    <label><input type="radio" name="q18" value="2" />2</label>
                    <label><input type="radio" name="q18" value="3" />3</label>
                  </div>
                </div>
                <div class="question">
                  <p>
                    19. I was aware of the action of my heart in the absence of
                    physical exertion (eg, sense of heart rate increase, heart
                    missing a beat).
                  </p>
                  <div class="options">
                    <label><input type="radio" name="q19" value="0" />0</label>
                    <label><input type="radio" name="q19" value="1" />1</label>
                    <label><input type="radio" name="q19" value="2" />2</label>
                    <label><input type="radio" name="q19" value="3" />3</label>
                  </div>
                </div>
                <div class="question">
                  <p>20. I felt scared without any good reason.</p>
                  <div class="options">
                    <label><input type="radio" name="q20" value="0" />0</label>
                    <label><input type="radio" name="q20" value="1" />1</label>
                    <label><input type="radio" name="q20" value="2" />2</label>
                    <label><input type="radio" name="q20" value="3" />3</label>
                  </div>
                </div>
                <div class="question">
                  <p>21. I felt that life was meaningless.</p>
                  <div class="options">
                    <label><input type="radio" name="q21" value="0" />0</label>
                    <label><input type="radio" name="q21" value="1" />1</label>
                    <label><input type="radio" name="q21" value="2" />2</label>
                    <label><input type="radio" name="q21" value="3" />3</label>
                  </div>
                </div>
                <br />
                <button type="submit" class="btn btn-primary btn-block">
                  Submit
                </button>
              </form>
            </div>
          </div>
        </div>
      </div>
    </main>
  </body>
</html>
