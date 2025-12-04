package com.serenityhub.controller;

import com.serenityhub.model.Article;
import com.serenityhub.model.FeaturedTopic;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/educational-resources")
public class EducationalResourcesServlet extends HttpServlet {

    private static List<Article> allArticles = new ArrayList<>();

    @Override
    public void init() throws ServletException {
        // Initialize dummy articles
        allArticles.add(new Article(
                1,
                "The Student Cheat Sheet",
                "Unlocking the Secrets to Focus, Sleep, and Inner Peace.",
                "<h2>Introduction</h2><p>As a student, maintaining focus, getting quality sleep, and finding inner peace can seem impossible. This comprehensive guide will help you unlock these secrets.</p><h3>Focus Techniques</h3><p>1. Pomodoro Technique: Work for 25 minutes, break for 5 minutes.<br>2. Remove distractions: Turn off notifications during study time.<br>3. Create a dedicated study space.</p><h3>Better Sleep</h3><p>Establish a consistent sleep schedule and avoid screens before bedtime.</p>",
                "https://via.placeholder.com/80/6366F1/FFFFFF?text=📚",
                "Meditation",
                "Dr. Sarah Chen",
                "5 mins"));

        allArticles.add(new Article(
                2,
                "Find Your Flow State",
                "The Articles That Make Stress Disappear (Seriously).",
                "<h2>Understanding Flow State</h2><p>Flow state is a mental state where you're fully immersed in an activity with complete focus and enjoyment.</p><h3>How to Achieve Flow</h3><p>1. Choose challenging but achievable tasks<br>2. Eliminate distractions<br>3. Set clear goals<br>4. Get immediate feedback</p><p>Research shows that people in flow state are 5x more productive!</p>",
                "https://via.placeholder.com/80/EC4899/FFFFFF?text=🌊",
                "AvoidOverstimulation",
                "Dr. Michael Rivers",
                "7 mins"));

        allArticles.add(new Article(
                3,
                "Quick Fix or Deep Dive?",
                "Find Your Next Insight in < 5 Minutes or an Hour.",
                "<h2>Two Approaches to Learning</h2><p>Sometimes you need a quick solution, other times you need deep understanding. This guide helps you choose.</p><h3>Quick Fixes (Under 5 minutes)</h3><ul><li>Breathing exercises</li><li>Quick stretches</li><li>Mindfulness moments</li></ul><h3>Deep Dives (1+ hour)</h3><ul><li>Meditation sessions</li><li>Therapy journaling</li><li>Comprehensive courses</li></ul>",
                "https://via.placeholder.com/80/8B5CF6/FFFFFF?text=💡",
                "BadHabits",
                "Dr. Emily Watson",
                "4 mins"));

        allArticles.add(new Article(
                4,
                "Breaking Bad Habits",
                "Practical Strategies to Replace Negative Patterns.",
                "<h2>Understanding Habit Loops</h2><p>Every habit has three components: Cue, Routine, and Reward.</p><h3>Steps to Break Bad Habits</h3><p>1. Identify your triggers<br>2. Replace the routine<br>3. Keep the reward<br>4. Be patient with yourself</p><p>It takes an average of 66 days to form a new habit!</p>",
                "https://via.placeholder.com/80/F59E0B/FFFFFF?text=🔄",
                "BadHabits",
                "Dr. James Parker",
                "8 mins"));

        allArticles.add(new Article(
                5,
                "Recognizing Depression Symptoms",
                "Early Signs and When to Seek Help.",
                "<h2>Common Depression Symptoms</h2><p>Depression affects millions worldwide. Recognizing the signs is the first step to recovery.</p><h3>Key Symptoms</h3><ul><li>Persistent sadness or emptiness</li><li>Loss of interest in activities</li><li>Changes in sleep patterns</li><li>Difficulty concentrating</li><li>Thoughts of self-harm</li></ul><h3>When to Seek Help</h3><p>If symptoms persist for more than 2 weeks, consult a mental health professional.</p>",
                "https://via.placeholder.com/80/EF4444/FFFFFF?text=❤️",
                "DepressionSymptoms",
                "Dr. Lisa Anderson",
                "6 mins"));

        allArticles.add(new Article(
                6,
                "Mindfulness Meditation for Beginners",
                "Start Your Journey to Inner Peace Today.",
                "<h2>What is Mindfulness?</h2><p>Mindfulness is the practice of being present in the moment without judgment.</p><h3>Getting Started</h3><p>1. Find a quiet space<br>2. Sit comfortably<br>3. Focus on your breath<br>4. Observe thoughts without engaging<br>5. Start with 5 minutes daily</p><h3>Benefits</h3><p>Regular practice can reduce stress, improve focus, and enhance emotional well-being.</p>",
                "https://via.placeholder.com/80/10B981/FFFFFF?text=🧘",
                "Meditation",
                "Dr. Zen Master",
                "10 mins"));
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String action = req.getParameter("action");

        // Handle article view
        if ("view".equals(action)) {
            handleArticleView(req, resp);
            return;
        }

        // Create featured topic
        FeaturedTopic featured = new FeaturedTopic(
                "Overcoming Procrastination",
                "Stop battling your to-do list and start winning! This month's guide gives you the ultimate battle plan: proven strategies to crush paralyzing fear, boost motivation, and turn big goals into easy, actionable steps.",
                "Your productivity breakthrough starts here.",
                "educational-resources?action=view&id=1",
                "https://via.placeholder.com/150/6366F1/FFFFFF?text=📦");

        // Get filter and search parameters
        String filter = req.getParameter("filter");
        String search = req.getParameter("search");

        // Filter articles
        List<Article> filteredArticles = filterArticles(allArticles, filter, search);

        // Set attributes for JSP
        req.setAttribute("featuredTopic", featured);
        req.setAttribute("articles", filteredArticles);
        req.setAttribute("currentFilter", filter);
        req.setAttribute("searchQuery", search);
        req.setAttribute("allArticles", allArticles);

        // Forward to JSP
        req.getRequestDispatcher("/WEB-INF/views/educational-resources.jsp").forward(req, resp);
    }

    private void handleArticleView(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String idParam = req.getParameter("id");
        if (idParam != null) {
            int articleId = Integer.parseInt(idParam);
            Article article = allArticles.stream()
                    .filter(a -> a.getId() == articleId)
                    .findFirst()
                    .orElse(null);

            req.setAttribute("article", article);
            req.setAttribute("allArticles", allArticles);
        }

        req.getRequestDispatcher("/WEB-INF/views/article-view.jsp").forward(req, resp);
    }

    private List<Article> filterArticles(List<Article> articles, String filter, String search) {
        List<Article> result = new ArrayList<>(articles);

        // Apply category filter
        if (filter != null && !filter.isEmpty()) {
            result = result.stream()
                    .filter(a -> a.getCategory().equalsIgnoreCase(filter))
                    .collect(Collectors.toList());
        }

        // Apply search filter
        if (search != null && !search.trim().isEmpty()) {
            String searchLower = search.toLowerCase().trim();
            result = result.stream()
                    .filter(a -> a.getTitle().toLowerCase().contains(searchLower) ||
                            a.getDescription().toLowerCase().contains(searchLower) ||
                            a.getCategory().toLowerCase().contains(searchLower))
                    .collect(Collectors.toList());
        }

        return result;
    }
}