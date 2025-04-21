import 'package:client/routes/app_routes.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Feature-based App',
      theme: ThemeData(primarySwatch: Colors.blue),
      initialRoute: AppRoute.subject,
      onGenerateRoute: AppRoute.generateRoute,
    );
  }
}
