import 'package:flutter/material.dart';

// Định nghĩa tất cả các route
class AppRoute {
  static const String subject = '/subject';
  static const String schedule = '/schedule';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case subject:
        return MaterialPageRoute(
          builder: (_) => Placeholder(),
        );
      case schedule:
        return MaterialPageRoute(
          builder: (_) => Placeholder(),
        );
      default:
        return _errorRoute();
    }
  }

  // Route mặc định khi không tìm thấy route phù hợp
  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: Text('Error'),
        ),
        body: Center(
          child: Text('Page not found'),
        ),
      ),
    );
  }
}
