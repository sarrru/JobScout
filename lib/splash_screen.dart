import 'dart:async';
import 'package:flutter/material.dart';
import 'home_screen.dart'; // Import the HomeScreen if it's in another file.

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(seconds: 50),
      () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomeScreen()),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset("assets/images/splash.png",
            fit: BoxFit.contain, // Adjust as needed for logo scaling.
            alignment: Alignment.center),
      ),
    );
  }
}
