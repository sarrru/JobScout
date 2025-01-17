import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:job_scout_project/features/splash/presentation/view/onboarding_page.dart';
import 'package:job_scout_project/features/splash/presentation/view_model/onboarding_cubit.dart';

class SplashCubit extends Cubit<void> {
  SplashCubit(this._onboardingCubit) : super(null);

  final OnboardingCubit _onboardingCubit;

  Future<void> init(BuildContext context) async {
    await Future.delayed(const Duration(seconds: 2), () {
      if (context.mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => BlocProvider.value(
                value: _onboardingCubit, child: OnboardingPage()),
          ),
        );
      }
    });
  }
}
