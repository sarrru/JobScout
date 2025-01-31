import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:job_scout_project/features/auth/presentation/view_model/login/login_bloc.dart';
import 'package:job_scout_project/features/auth/presentation/view_model/signup/register_bloc.dart';
import 'package:job_scout_project/features/splash/presentation/view/splash_view.dart';
import 'package:job_scout_project/features/splash/presentation/view_model/on_boarding/on_boarding_cubit.dart';
import 'package:job_scout_project/features/splash/presentation/view_model/splash_cubit.dart';


import 'di/di.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});
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
        title: 'Movie Ticket Booking',
        // theme: get.getApplicationTheme(isDarkMode: false),
        theme:  ThemeData(),
        home: const SplashView(),
      ),
    );
  }
}
