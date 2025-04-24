import 'package:flutter/material.dart';

/// App Colors used throughout the app.
class AppColors {
  static const Color primary = Color(0xFFE57697);
  static const Color secondary = Color(0xFF90CAF9);
  static const Color grey = Color(0xFFBDBDBD);
  static const Color lightGrey = Color(0xFFF5F5F5);
  static const Color darkGrey = Color(0xFF616161);
  static const Color white = Colors.white;
  static const Color black = Colors.black;
  static const Color error = Colors.red;
  static const Color success = Color(0xFF4CAF50);

  // Dark Theme Colors
  static const Color dartThemeBackground = Color(0xFF181818);

  // Light Theme Colors
  static const Color lightThemeBackground = Color(0xFFFFFFFF);

  // Text Colors (Optional)
  static const Color lightTextColor = Color(0xFF000000);
  static const Color darkTextColor = Color(0xFFFFFFFF);

  // Additional Colors (Optional)
  static const Color accent = Color(0xFFFF4081);
}

/// Common text styles used in the app.
class AppTextStyles {
  static const TextStyle heading = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: AppColors.black,
  );

  static const TextStyle subheading = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w600,
    color: AppColors.darkGrey,
  );

  static const TextStyle body = TextStyle(
    fontSize: 16,
    color: AppColors.black,
  );

  static const TextStyle hint = TextStyle(
    fontSize: 14,
    color: AppColors.grey,
  );

  static const TextStyle error = TextStyle(
    fontSize: 14,
    color: AppColors.error,
  );
}

/// Padding constants for consistent spacing
class AppPadding {
  static const double small = 8.0;
  static const double normal = 16.0;
  static const double medium = 20.0;
  static const double large = 32.0;

  static const EdgeInsets screenPadding = EdgeInsets.all(normal);
  static const EdgeInsets horizontalPadding = EdgeInsets.symmetric(horizontal: normal);
}

/// Border radius constants for rounding UI elements
class AppRadius {
  static const BorderRadius small = BorderRadius.all(Radius.circular(8));
  static const BorderRadius normal = BorderRadius.all(Radius.circular(16));
  static const BorderRadius medium = BorderRadius.all(Radius.circular(20));
  static const BorderRadius large = BorderRadius.all(Radius.circular(32));
}

/// Border styles for input fields, buttons, etc.
class AppBorders {
  static OutlineInputBorder defaultBorder = OutlineInputBorder(
    borderRadius: AppRadius.normal,
    borderSide: const BorderSide(
      color: AppColors.grey,
      width: 1,
    ),
  );

  static OutlineInputBorder focusedBorder = OutlineInputBorder(
    borderRadius: AppRadius.normal,
    borderSide: const BorderSide(
      color: AppColors.primary,
      width: 1.5,
    ),
  );

  static OutlineInputBorder errorBorder = OutlineInputBorder(
    borderRadius: AppRadius.normal,
    borderSide: const BorderSide(
      color: AppColors.error,
      width: 1.5,
    ),
  );
}

/// Route names for navigation
class AppRoutes {
  static const String root = '/';
  static const String login = '/login';
  static const String register = '/register';
  static const String forgotPassword = '/forgot-password';
  static const String home = '/home';
  static const String subject = '/subject';
  static const String schedule = '/schedule';
}

/// Static strings used in UI
class AppStrings {
  static const String appName = "Study Planner";
  static const String loginTitle = "Welcome Back!";
  static const String registerTitle = "Create Account";
  static const String emailHint = "Enter your email";
  static const String passwordHint = "Enter your password";
  static const String loginButton = "Login";
  static const String registerButton = "Register";
  static const String forgotPassword = "Forgot Password?";
  static const String confirmPasswordHint = "Confirm password";
}
