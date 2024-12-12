import 'package:flutter/material.dart';
import 'package:job_scout_project/view/onboarding_view.dart';
import 'package:job_scout_project/view/splash_view.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashView(),
    );
  }
}
