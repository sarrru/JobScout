// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:job_scout_project/features/auth/presentation/view_model/login/login_bloc.dart';
// import 'package:job_scout_project/features/auth/presentation/view_model/signup/register_bloc.dart';
// import 'package:job_scout_project/features/company/domain/usecase/get_all_company_usecase.dart';
// import 'package:job_scout_project/features/company/domain/usecase/get_company_by_id_usecase.dart';
// import 'package:job_scout_project/features/company/presentation/view_model/company_bloc.dart';
// import 'package:job_scout_project/features/jobs/presentation/view_model/job_bloc.dart';
// import 'package:job_scout_project/features/splash/presentation/view/splash_view.dart';
// import 'package:job_scout_project/features/splash/presentation/view_model/on_boarding/on_boarding_cubit.dart';
// import 'package:job_scout_project/features/splash/presentation/view_model/splash_cubit.dart';
// import 'di/di.dart';

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//   @override
//   Widget build(BuildContext context) {
//     return MultiBlocProvider(
//       providers: [
//         BlocProvider<SplashCubit>(
//           create: (_) => getIt<SplashCubit>(),
//         ),
//         BlocProvider<OnboardingCubit>(
//           create: (_) => getIt<OnboardingCubit>(),
//         ),
//         BlocProvider<LoginBloc>(
//           create: (_) => getIt<LoginBloc>(),
//         ),
//         BlocProvider<RegisterBloc>(
//           create: (_) => getIt<RegisterBloc>(),
//         ),
//        BlocProvider<CompanyBloc>(
//   create: (context) => CompanyBloc(
//     getAllCompany: getIt<GetAllCompany>(),
//     getCompanyById: getIt<GetCompanyById>(),
//   ),
// ),

//         BlocProvider<JobBloc>(
//           create: (_) => getIt<JobBloc>(),
//         ),
//       ],
//       child: MaterialApp(
//         debugShowCheckedModeBanner: false,
//         title: 'JobScout',
//         theme: ThemeData(),
//         home: const SplashView(),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:job_scout_project/features/auth/presentation/view/login_view.dart';
import 'package:job_scout_project/features/auth/presentation/view_model/login/login_bloc.dart';
import 'package:job_scout_project/features/auth/presentation/view_model/signup/register_bloc.dart';
import 'package:job_scout_project/features/company/domain/usecase/get_all_company_usecase.dart';
import 'package:job_scout_project/features/company/domain/usecase/get_company_by_id_usecase.dart';
import 'package:job_scout_project/features/company/presentation/view_model/company_bloc.dart';
import 'package:job_scout_project/features/home/presentation/view/bottom_view/profile.dart';
import 'package:job_scout_project/features/home/presentation/view/home_view.dart';
import 'package:job_scout_project/features/jobs/presentation/view_model/job_bloc.dart';
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
        BlocProvider<CompanyBloc>(
          create: (context) => CompanyBloc(
            getAllCompany: getIt<GetAllCompany>(),
            getCompanyById: getIt<GetCompanyById>(),
          ),
        ),
        BlocProvider<JobBloc>(
          create: (_) => getIt<JobBloc>(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'JobScout',
        theme: ThemeData(),
        initialRoute: '/splash', // Set the initial route
        routes: {
          '/splash': (context) => const SplashView(),
          '/login': (context) => const LoginView(), // ✅ Register LoginView
          '/home': (context) => const HomeView(), // ✅ Register HomeView
          '/profile': (context) =>
              const ProfileScreen(), // ✅ Register ProfileView
        },
      ),
    );
  }
}
