import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:job_scout_project/app/di/di.dart';
import 'package:job_scout_project/features/auth/presentation/view/login_view.dart';
import 'package:job_scout_project/features/auth/presentation/view_model/login/login_bloc.dart';
import 'package:job_scout_project/features/company/presentation/view_model/company_bloc.dart';
import 'package:job_scout_project/features/home/presentation/view/bottom_view/dashboard_view.dart';
import 'package:job_scout_project/features/home/presentation/view/bottom_view/profile.dart';
import 'package:job_scout_project/features/jobs/presentation/view/job_view.dart';
import 'package:job_scout_project/features/jobs/presentation/view_model/job_bloc.dart';

class HomeState extends Equatable {
  final int selectedIndex;
  final List<Widget> views;

  const HomeState({
    required this.selectedIndex,
    required this.views,
  });

  // Initial state
  static HomeState initial() {
    return HomeState(
      selectedIndex: 0,
      views: [
        BlocProvider(
          create: (context) => getIt<JobBloc>(),
          // child: const CompanyListView(),
          child: JobViewPage(),
        ),
        BlocProvider(
          create: (context) => getIt<CompanyBloc>(),
          child: const CompanyListView(),
        ),
        BlocProvider(
          create: (context) => getIt<LoginBloc>(),
          child: const LoginView(),
        ),
        // const Center(
        //   child: Text('Jobs'),
        // ),
        const ProfileScreen(),
      ],
    );
  }

  HomeState copyWith({
    int? selectedIndex,
    List<Widget>? views,
  }) {
    return HomeState(
      selectedIndex: selectedIndex ?? this.selectedIndex,
      views: views ?? this.views,
    );
  }

  @override
  List<Object?> get props => [selectedIndex, views];
}
