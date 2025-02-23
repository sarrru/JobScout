import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:job_scout_project/app/di/di.dart';
import 'package:job_scout_project/features/auth/presentation/view/login_view.dart';
import 'package:job_scout_project/features/auth/presentation/view_model/login/login_bloc.dart';

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
        const Center(
          child: Text('Dashboard'),
        ),

        // const JobView(),

        // BlocProvider(
        //   create: (context) => getIt<DashboardBloc>(),
        //   child: const DashbaordView(),

        // ),

        BlocProvider(
          create: (context) => getIt<LoginBloc>(),
          child: LoginView(),
        ),
        const Center(
          child: Text('Account'),
        ),
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
