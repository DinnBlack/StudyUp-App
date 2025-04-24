import 'dart:async';
import 'package:flutter/material.dart';

class AnimatedGradientBackground extends StatefulWidget {
  const AnimatedGradientBackground({super.key});

  @override
  State<AnimatedGradientBackground> createState() => _AnimatedGradientBackgroundState();
}

class _AnimatedGradientBackgroundState extends State<AnimatedGradientBackground> {
  List<List<Color>> gradientColors = [
    [Colors.blue.shade700, Colors.purple.shade600],
    [Colors.deepPurple, Colors.teal],
    [Colors.pink.shade300, Colors.indigo],
    [Colors.orange, Colors.deepPurpleAccent],
  ];

  int index = 0;
  Timer? timer;

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(const Duration(seconds: 5), (timer) {
      setState(() {
        index = (index + 1) % gradientColors.length;
      });
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(seconds: 4),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: gradientColors[index],
        ),
      ),
      child: const Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: Text(
            'Welcome to StudyUp',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
