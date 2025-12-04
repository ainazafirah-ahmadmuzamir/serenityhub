<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> <%@ page
isELIgnored="false" %>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <title>SerenityHub | Sign Up</title>

    <style>
      :root {
        --card-width: 980px;
        --card-height: 640px;
        --radius: 14px;
        --gap: 0;
        --accent: #323962;
        --muted: #6b7280;
        --bg: #f3f4f6;
        --panel-light: #ffffff;
      }

      * {
        box-sizing: border-box;
      }
      html,
      body {
        height: 100%;
      }
      body {
        margin: 0;
        font-family: Inter, system-ui, -apple-system, "Segoe UI", Roboto,
          "Helvetica Neue", Arial;
        background: linear-gradient(180deg, #eef2ff 0%, #f8fafc 100%);
        display: flex;
        align-items: center;
        justify-content: center;
        padding: 24px;
        color: #111827;
      }

      /* centered card, two columns */
      .card {
        width: min(var(--card-width), 100%);
        height: var(--card-height);
        background: linear-gradient(
          180deg,
          rgba(255, 255, 255, 0.95),
          rgba(255, 255, 255, 0.9)
        );
        border-radius: var(--radius);
        box-shadow: 0 10px 30px rgba(2, 6, 23, 0.12);
        display: flex;
        overflow: hidden;
      }

      .left,
      .right {
        flex: 1 1 50%;
        padding: 48px;
        display: flex;
        flex-direction: column;
        justify-content: center; /* vertically center contents */
      }

      /* left panel styles (form) */
      .left {
        background: var(--panel-light);
        gap: 16px;
      }

      .brand {
        font-weight: 700;
        font-size: 20px;
        color: var(--accent);
        margin-bottom: 10px;
      }

      h2 {
        margin: 0 0 8px 0;
        font-size: 28px;
      }
      p.lead {
        margin: 0 0 22px 0;
        color: var(--muted);
      }

      form {
        width: 100%;
        max-width: 420px;
      }

      .field {
        margin-bottom: 14px;
      }
      label {
        display: block;
        font-size: 15px;
        margin-bottom: 6px;
        color: #374151;
      }
      input[type="text"],
      input[type="email"],
      input[type="password"] {
        width: 100%;
        padding: 12px 14px;
        border-radius: 10px;
        border: 1px solid #e6e7eb;
        font-size: 14px;
        outline: none;
      }
      input:focus {
        box-shadow: 0 0 0 4px rgba(108, 92, 231, 0.08);
        border-color: var(--accent);
      }

      .actions {
        display: flex;
        gap: 12px;
        align-items: center;
        margin-top: 8px;
      }
      .btn {
        padding: 12px 16px;
        border-radius: 20px;
        border: 0;
        font-weight: 600;
        cursor: pointer;
        font-size: 15px;
        text-decoration: none;
      }
      .btn-primary {
        background: var(--accent);
        color: white;
        flex: 1;
      }
      .btn-ghost {
        background: transparent;
        border: 1px solid #e6e7eb;
        color: #374151;
      }

      .small {
        font-size: 13px;
        color: var(--muted);
        margin-top: 12px;
      }

      /* right panel styles (welcome) */
      .right {
        background: linear-gradient(
          135deg,
          rgba(108, 92, 231, 0.06),
          rgba(34, 197, 94, 0.03)
        );
        align-items: center; /* horizontally center */
        text-align: center;
        padding: 48px;
      }

      .welcome-title {
        font-size: 28px;
        margin-bottom: 10px;
      }
      .welcome-sub {
        color: var(--muted);
        max-width: 360px;
        margin: 0 auto 18px;
      }

      .hero-image {
        width: 200px;
        height: 200px;
        border-radius: 12px;
        display: block;
        margin: 14px auto 0;
        object-fit: cover;
        box-shadow: 0 8px 30px rgba(99, 102, 241, 0.12);
      }

      .landingimage {
        width: 450px;
        height: 450px;
        display: block;
        margin: 14px auto 0;
        object-fit: cover;
      }

      /* Responsive: stack vertically on smaller screens */
      @media (max-width: 900px) {
        .card {
          flex-direction: column;
          height: auto;
        }
        .left,
        .right {
          padding: 28px;
        }
        .hero-image {
          width: 160px;
          height: 160px;
        }
      }

      @media (max-width: 480px) {
        body {
          padding: 12px;
        }
        .card {
          border-radius: 12px;
        }
        h2 {
          font-size: 22px;
        }
      }

      .alert {
        padding: 10px;
        border-radius: 6px;
        margin-bottom: 10px;
        text-align: center;
      }

      .alert.error {
        background: #ffe6e6;
        color: #b10000;
      }

      .alert.success {
        background: #e6ffed;
        color: #256029;
      }

      .navbar {
        display: flex;
        justify-content: space-between;
        background: #5a7cff;
        color: white;
        padding: 10px 20px;
        border-radius: 8px;
        max-width: 800px;
        margin: auto;
        margin-bottom: 20px;
      }

      .navbar a {
        color: white;
        text-decoration: none;
        margin-left: 10px;
      }

      .navbar a:hover {
        text-decoration: underline;
      }

      .home .actions {
        display: flex;
        flex-wrap: wrap;
        justify-content: center;
        gap: 10px;
        margin-top: 20px;
      }

      .home .btn {
        width: auto;
        background: #5a7cff;
        padding: 10px 18px;
      }
    </style>
  </head>

  <body>
    <main class="card" role="main">
      <section class="left" aria-labelledby="signup-title">
        <div>
          <div class="brand">SerenityHub</div>
          <h2 id="signup-title">Create Your Account</h2>
          <p class="lead">
            Join us! It takes less than a minute. Keep your personal data safe
            and private.
          </p>
        </div>

        <c:if test="${not empty error}">
          <div class="alert error">${error}</div>
        </c:if>

        <form action="signup" method="post">
          <div class="field">
            <label for="name">Name</label>
            <input
              id="name"
              name="fullname"
              type="text"
              placeholder="Jane"
              required
            />
          </div>

          <div class="field">
            <label for="email">Email Address</label>
            <input
              id="email"
              name="email"
              type="email"
              placeholder="you@example.com"
              required
            />
          </div>

          <div class="field">
            <label for="password">Password</label>
            <input
              id="password"
              name="password"
              type="password"
              placeholder="Create a password"
              required
            />
          </div>

          <div class="field">
            <label for="confirm">Confirm Password</label>
            <input
              id="confirm"
              name="confirm"
              type="password"
              placeholder="Confirm password"
              required
            />
          </div>

          <div class="actions">
            <button class="btn btn-primary" type="submit">Sign up</button>
          </div>
        </form>
      </section>

      <!-- RIGHT SIDE -->
      <aside class="right" aria-hidden="false">
        <div>
          <!-- image -->
          <img
            class="hero-image"
            src="images/welcome.png"
            alt="Welcome illustration"
          />

          <div class="welcome-title">Welcome to SerenityHub!</div>
          <div class="welcome-sub">
            Start by creating an account and we'll guide you through the rest.
          </div>
          <p class="footer">
            Already have an account? <a href="login.jsp">Login</a>
          </p>
          <p class="footer">
            <a href="index.jsp">Go back to landing page</a>
          </p>
        </div>
      </aside>
    </main>
  </body>
</html>
