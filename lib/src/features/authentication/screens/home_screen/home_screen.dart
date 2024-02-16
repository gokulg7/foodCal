import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyanAccent,
      body: Stack(
      children: [
        // Main content of the screen
        // Images on different sides
        Positioned(
          top: 100,
          left: 90,
          child: Image.asset(
            'assets/images/homeIcon1.png',
            width: 60,
            height: 100,
          ),
        ),
        Positioned(
          top: 80,
          right: -80,
          child: Image.asset(
            'assets/images/splash-top-icon.png',
            width: 200,
            height: 100,
          ),
        ),
        Positioned(
          bottom: 20,
          left: 20,
          child: Image.asset(
            'assets/images/food-calorie.png',
            width: 50,
            height: 50,
          ),
        ),
        Positioned(
          bottom: 20,
          right: 20,
          child: Image.asset(
            'assets/images/home-screen-icon.png',
            width: 100,
            height: 100,
          ),
        ),
      ],
    ),);
  }
}
