import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:job_scout_project/features/company/domain/entity/company_entity.dart';
import 'package:job_scout_project/features/company/presentation/view_model/company_bloc.dart';
import 'package:job_scout_project/features/company/presentation/view_model/company_event.dart';
import 'package:job_scout_project/features/company/presentation/view_model/company_state.dart';
import 'package:sensors_plus/sensors_plus.dart';

class CompanyListView extends StatefulWidget {
  const CompanyListView({super.key});

  @override
  State<CompanyListView> createState() => _CompanyListViewState();
}

class _CompanyListViewState extends State<CompanyListView> {
  bool _isDarkMode = false;
  bool _isShakeDetected = false;
  double _previousX = 0, _previousY = 0, _previousZ = 0;
  Timer? _debounceTimer;

  @override
  void initState() {
    super.initState();

    // Fetch Companies
    Future.microtask(() {
      context.read<CompanyBloc>().add(const FetchAllCompanies());
    });

    // Start Listening for Shake Gesture
    accelerometerEvents.listen(_handleShake);
  }

  void _handleShake(AccelerometerEvent event) {
    double deltaX = (_previousX - event.x).abs();
    double deltaY = (_previousY - event.y).abs();
    double deltaZ = (_previousZ - event.z).abs();

    _previousX = event.x;
    _previousY = event.y;
    _previousZ = event.z;

    // print(
    //     "Shake Detection Values -> ΔX: $deltaX, ΔY: $deltaY, ΔZ: $deltaZ"); // Debugging

    // Lowered threshold for better sensitivity
    if ((deltaX > 20 || deltaY > 20 || deltaZ > 20) && !_isShakeDetected) {
      _isShakeDetected = true;

      setState(() {
        _isDarkMode = !_isDarkMode;
      });

      print("🚀 SHAKE DETECTED! Dark Mode: $_isDarkMode");

      // Show snackbar for confirmation
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content:
              Text(_isDarkMode ? "Dark Mode Enabled" : "Light Mode Enabled"),
          duration: const Duration(seconds: 1),
        ),
      );

      // Reset shake detection after 1.5 seconds to avoid multiple triggers
      _debounceTimer?.cancel();
      _debounceTimer = Timer(const Duration(seconds: 1), () {
        _isShakeDetected = false;
      });
    }
  }

  @override
  void dispose() {
    _debounceTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: _isDarkMode ? ThemeData.dark() : ThemeData.light(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Available Jobs"),
          centerTitle: true,
          backgroundColor: Colors.deepPurple,
        ),
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: BlocBuilder<CompanyBloc, CompanyState>(
            builder: (context, state) {
              if (state.isLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state.error != null) {
                return Center(
                  child: Text(
                    state.error!,
                    style: const TextStyle(color: Colors.red, fontSize: 16),
                  ),
                );
              } else if (state.companies.isEmpty) {
                return const Center(
                  child: Text(
                    "No companies available",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                );
              }

              return ListView.builder(
                itemCount: state.companies.length,
                itemBuilder: (context, index) {
                  final CompanyEntity company = state.companies[index];

                  return Card(
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    margin:
                        const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Logo or Dummy Image
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset(
                              'assets/images/off.jpg', // Local Image from Assets
                              height: 60,
                              width: 60,
                              fit: BoxFit.cover,
                            ),
                          ),

                          const SizedBox(width: 12), // Spacing

                          // Job Details
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  (company.jobPosition != null &&
                                          company.jobPosition
                                              .toString()
                                              .isNotEmpty)
                                      ? company.jobPosition.toString()
                                      : "Position Not Specified",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: _isDarkMode
                                        ? Colors.white
                                        : Colors.deepPurple,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  company.name,
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: _isDarkMode
                                        ? Colors.grey[300]
                                        : Colors.grey,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  company.jobSalary != null
                                      ? "\$${company.jobSalary.toString()}/year"
                                      : "Salary Not Disclosed",
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: _isDarkMode
                                        ? Colors.green
                                        : Colors.green,
                                  ),
                                ),
                              ],
                            ),
                          ),

                          // Apply Button
                          // ElevatedButton(
                          //   onPressed: () {
                          //     // Handle Job Apply Click
                          //   },
                          //   style: ElevatedButton.styleFrom(
                          //     backgroundColor: Colors.deepPurple,
                          //     shape: RoundedRectangleBorder(
                          //       borderRadius: BorderRadius.circular(8),
                          //     ),
                          //   ),
                          //   child: const Text("Apply"),
                          // ),
                        ],
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
