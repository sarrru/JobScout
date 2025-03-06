import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:job_scout_project/features/auth/presentation/view/login_view.dart';
import 'package:job_scout_project/features/home/presentation/view_model/home_cubit.dart';
import 'package:job_scout_project/features/home/presentation/view_model/home_state.dart';
import 'package:sensors_plus/sensors_plus.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  HomeViewState createState() => HomeViewState();
}

class HomeViewState extends State<HomeView> {
  StreamSubscription<AccelerometerEvent>? _accelerometerSubscription;
  DateTime? _lastTapTime;

  @override
  void initState() {
    super.initState();
    _listenToAccelerometer();
  }

  void _listenToAccelerometer() {
    _accelerometerSubscription =
        accelerometerEvents.listen((AccelerometerEvent event) {
      if (_isDoubleTapOnBack(event)) {
        _logout();
      }
    });
  }

  bool _isDoubleTapOnBack(AccelerometerEvent event) {
    const double threshold = 15; // Sensitivity for back tap
    final DateTime now = DateTime.now();

    if (event.z > threshold) {
      // Detects strong tap on back
      if (_lastTapTime != null &&
          now.difference(_lastTapTime!) < const Duration(seconds: 1)) {
        return true; // Double tap detected
      }
      _lastTapTime = now;
    }
    return false;
  }

  void _logout() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const LoginView()),
    );
  }

  @override
  void dispose() {
    _accelerometerSubscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   actions: [
      //     IconButton(
      //       icon: const Icon(Icons.logout),
      //       onPressed: () {
      //         mySnackBar(
      //           context: context,
      //           message: 'Logging out...',
      //           color: Colors.red,
      //         );
      //         context.read<HomeCubit>().logout(context);
      //       },
      //     ),
      //     BlocBuilder<ThemeCubit, bool>(
      //       builder: (context, isDarkMode) {
      //         return Switch(
      //           value: isDarkMode,
      //           onChanged: (value) {
      //             context.read<ThemeCubit>().toggleTheme();
      //           },
      //         );
      //       },
      //     ),
      //   ],
      // ),
      body: BlocBuilder<HomeCubit, HomeState>(builder: (context, state) {
        return state.views.elementAt(state.selectedIndex);
      }),
      bottomNavigationBar: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          return BottomNavigationBar(
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.dashboard),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.group),
                label: 'Jobs',
              ),
              // BottomNavigationBarItem(
              //   icon: Icon(Icons.book),
              //   label: 'login',
              // ),
              BottomNavigationBarItem(
                icon: Icon(Icons.account_circle),
                label: 'Profile',
              ),
            ],
            currentIndex: state.selectedIndex,
            selectedItemColor: Colors.purple,
            unselectedItemColor: Colors.black,
            onTap: (index) {
              context.read<HomeCubit>().onTabTapped(index);
            },
          );
        },
      ),
    );
  }
}
