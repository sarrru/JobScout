import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:job_scout_project/features/splash/presentation/view_model/onboarding_cubit.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  OnboardingPageState createState() => OnboardingPageState();
}

class OnboardingPageState extends State<OnboardingPage> {
  @override
  void initState() {
    super.initState();
    // Using the cubit to navigate to WelcomeView after 3 seconds
    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) {
        context.read<OnboardingCubit>().openLoginView(context);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 242, 235, 244),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/onboarding.png',
              width: 300,
              height: 300,
            ),
            const SizedBox(height: 20),
            const Text(
              'Find your dream job now!',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
