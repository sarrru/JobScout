import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:job_scout_project/app/di/di.dart';
import 'package:job_scout_project/core/theme/app_theme.dart';
import 'package:job_scout_project/features/auth/presentation/view_model/login/login_bloc.dart';
import 'package:job_scout_project/features/auth/presentation/view_model/signup/register_bloc.dart';
import 'package:job_scout_project/features/splash/presentation/view/splash_view.dart';
import 'package:job_scout_project/features/splash/presentation/view_model/onboarding_cubit.dart';
import 'package:job_scout_project/features/splash/presentation/view_model/splash_cubit.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<SplashCubit>(
          create: (_) => getIt<SplashCubit>(),
        ),
        BlocProvider<OnboardingCubit>(
          create: (_) => getIt<OnboardingCubit>(),
        ),
        BlocProvider<LoginBloc>(
          create: (_) => getIt<LoginBloc>(),
        ),
        BlocProvider<RegisterBloc>(
          create: (_) => getIt<RegisterBloc>(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Student Management',
        theme: AppTheme.getApplicationTheme(isDarkMode: false),
        home: const SplashView(),
      ),
    );
  }
}
