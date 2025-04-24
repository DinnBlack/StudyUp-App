import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../core/constants/constants.dart';
import '../features/authentication/presentation/screens/login_screen.dart';
import '../features/authentication/presentation/screens/register_screen.dart';
import '../features/home/presentation/screens/pages/home_page.dart';
import '../features/schedule/presentation/screens/schedule_screen.dart';
import '../features/subject/presentation/screens/subject_screen.dart';

class AppRoute {
  static final GoRouter router = GoRouter(
    routes: [
      GoRoute(
        path: AppRoutes.root,
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: AppRoutes.login,
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: AppRoutes.register,
        builder: (context, state) => const RegisterScreen(),
      ),
      GoRoute(
        path: AppRoutes.home,
        builder: (context, state) => const HomePage(),
      ),
      GoRoute(
        path: AppRoutes.subject,
        builder: (context, state) => const SubjectScreen(),
      ),
      GoRoute(
        path: AppRoutes.schedule,
        builder: (context, state) => const ScheduleScreen(),
      ),
    ],
    errorBuilder: (context, state) => Scaffold(
      appBar: AppBar(title: const Text('Error')),
      body: const Center(child: Text('Page not found')),
    ),
  );
}
