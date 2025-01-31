import 'dart:async';

import 'package:flutter/material.dart';
import 'package:job_scout_project/features/splash/presentation/view/onboarding_view.dart';


class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    //Timer to navigate to the next screen after 3 seconds.
    Timer(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => OnboardingView()),
      );
    });
  }

// Timer(const Duration(seconds: 3), () {
//   Navigator.pushReplacementNamed(context, '/login');
// });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: const Color.fromARGB(255, 239, 241, 227),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 300,
              width: 300,
              child: Image.asset('assets/images/logo.png'),
            ),
            const SizedBox(height: 10),
            const CircularProgressIndicator(),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
