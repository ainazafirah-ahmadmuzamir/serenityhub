package com.serenityhub.repo;

import com.serenityhub.model.User;
import java.util.*;

public class UserRepo {
    private static final List<User> users = new ArrayList<>();

    public static boolean register(User user) {
        for (User u : users) {
            if (u.getEmail().equalsIgnoreCase(user.getEmail()))
                return false; // duplicate email
        }
        users.add(user);
        return true;
    }

    public static User login(String email, String password) {
        for (User u : users)
            if (u.getEmail().equalsIgnoreCase(email) && u.getPassword().equals(password))
                return u;
        return null;
    }
}

