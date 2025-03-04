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
    final theme = Theme.of(context);

    return Theme(
      data: _isDarkMode
          ? ThemeData.dark().copyWith(
              cardColor: const Color(0xFF2C2C2E),
              primaryColor: Colors.deepPurple,
            )
          : ThemeData.light().copyWith(
              primaryColor: Colors.deepPurple,
            ),
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Available Jobs",
            style: TextStyle(fontWeight: FontWeight.w600),
          ),
          centerTitle: true,
          backgroundColor: Colors.deepPurple,
          elevation: 0,
          actions: [
            IconButton(
              icon: Icon(_isDarkMode ? Icons.light_mode : Icons.dark_mode),
              onPressed: () {
                // Toggle theme
                setState(() {
                  _isDarkMode = !_isDarkMode;
                });
              },
            ),
            IconButton(
              icon: const Icon(Icons.filter_list),
              onPressed: () {
                // Show filter options
              },
            ),
          ],
        ),
        body: Container(
          decoration: BoxDecoration(
            gradient: _isDarkMode
                ? const LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Color(0xFF2D2D3A), Color(0xFF1A1A27)],
                  )
                : const LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Colors.deepPurple, Color(0xFFF5F5F5)],
                    stops: [0.0, 0.3],
                  ),
          ),
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //

                // Stats Row
                Padding(
                  padding: const EdgeInsets.only(bottom: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _buildStatCard(Icons.work, "New Jobs", "24", context),
                      _buildStatCard(
                          Icons.visibility, "Applied", "12", context),
                      _buildStatCard(Icons.bookmark, "Saved", "8", context),
                    ],
                  ),
                ),

                // Jobs List Title
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Recommended Jobs",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: _isDarkMode ? Colors.white : Colors.black87,
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          "See All",
                          style: TextStyle(
                            color: Colors.deepPurple,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                // BlocBuilder for Jobs List
                Expanded(
                  child: BlocBuilder<CompanyBloc, CompanyState>(
                    builder: (context, state) {
                      if (state.isLoading) {
                        return const Center(
                          child: CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation<Color>(
                                Colors.deepPurple),
                          ),
                        );
                      } else if (state.error != null) {
                        return Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(
                                Icons.error_outline,
                                color: Colors.red,
                                size: 60,
                              ),
                              const SizedBox(height: 16),
                              Text(
                                state.error!,
                                style: const TextStyle(
                                  color: Colors.red,
                                  fontSize: 16,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              const SizedBox(height: 16),
                              ElevatedButton(
                                onPressed: () {
                                  // Reload data
                                  context.read<CompanyBloc>();
                                  // .add(const LoadCompanies());
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.deepPurple,
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 20,
                                    vertical: 12,
                                  ),
                                ),
                                child: const Text("Try Again"),
                              ),
                            ],
                          ),
                        );
                      } else if (state.companies.isEmpty) {
                        return Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.work_off,
                                size: 70,
                                color: _isDarkMode
                                    ? Colors.grey[500]
                                    : Colors.grey[400],
                              ),
                              const SizedBox(height: 16),
                              Text(
                                "No jobs available at the moment",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: _isDarkMode
                                      ? Colors.grey[300]
                                      : Colors.grey[600],
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                "Check back later for new opportunities",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: _isDarkMode
                                      ? Colors.grey[400]
                                      : Colors.grey[500],
                                ),
                              ),
                            ],
                          ),
                        );
                      }

                      return ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        itemCount: state.companies.length,
                        itemBuilder: (context, index) {
                          final CompanyEntity company = state.companies[index];

                          // Determine if this is a featured job (for demo, let's say every 3rd job)
                          final bool isFeatured = index % 3 == 0;

                          return Card(
                            elevation: 4,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                              side: isFeatured
                                  ? BorderSide(
                                      color: Colors.deepPurple, width: 2)
                                  : BorderSide.none,
                            ),
                            margin: const EdgeInsets.symmetric(
                                vertical: 8, horizontal: 2),
                            child: InkWell(
                              onTap: () {
                                // Navigate to job details
                              },
                              borderRadius: BorderRadius.circular(16),
                              child: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        // Company Logo
                                        Container(
                                          padding: const EdgeInsets.all(8),
                                          decoration: BoxDecoration(
                                            color: _isDarkMode
                                                ? const Color(0xFF3D3D4E)
                                                : Colors.grey.shade100,
                                            borderRadius:
                                                BorderRadius.circular(12),
                                          ),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            child: Image.asset(
                                              'assets/images/off.jpg',
                                              height: 50,
                                              width: 50,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                        const SizedBox(width: 16),

                                        // Company Name and Job Position
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              if (isFeatured)
                                                Container(
                                                  padding: const EdgeInsets
                                                      .symmetric(
                                                      horizontal: 8,
                                                      vertical: 3),
                                                  margin: const EdgeInsets.only(
                                                      bottom: 4),
                                                  decoration: BoxDecoration(
                                                    color: Colors.deepPurple
                                                        .withOpacity(0.2),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            4),
                                                  ),
                                                  child: Text(
                                                    "Featured",
                                                    style: TextStyle(
                                                      fontSize: 10,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.deepPurple,
                                                    ),
                                                  ),
                                                ),
                                              Text(
                                                (company.jobPosition != null &&
                                                        company.jobPosition
                                                            .toString()
                                                            .isNotEmpty)
                                                    ? company.jobPosition
                                                        .toString()
                                                    : "Position Not Specified",
                                                style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold,
                                                  color: _isDarkMode
                                                      ? Colors.white
                                                      : Colors
                                                          .deepPurple.shade800,
                                                ),
                                              ),
                                              const SizedBox(height: 4),
                                              Text(
                                                company.name,
                                                style: TextStyle(
                                                  fontSize: 14,
                                                  color: _isDarkMode
                                                      ? Colors.grey[300]
                                                      : Colors.grey[700],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),

                                        // Bookmark Icon
                                        IconButton(
                                          icon: Icon(
                                            Icons.bookmark_border,
                                            color: _isDarkMode
                                                ? Colors.grey[400]
                                                : Colors.grey[600],
                                          ),
                                          onPressed: () {
                                            // Save job
                                          },
                                        ),
                                      ],
                                    ),

                                    const SizedBox(height: 16),

                                    // Job Details Row
                                    Row(
                                      children: [
                                        _buildJobDetail(
                                            Icons.monetization_on,
                                            company.jobSalary != null
                                                ? "\$${company.jobSalary}/year"
                                                : "Salary Not Disclosed",
                                            _isDarkMode),
                                        _buildJobDetail(
                                            Icons.location_on,
                                            company.location ?? "Remote",
                                            _isDarkMode),
                                        _buildJobDetail(Icons.work, "Full-time",
                                            _isDarkMode),
                                      ],
                                    ),

                                    const SizedBox(height: 16),

                                    // Apply Button
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Posted 2 days ago",
                                          style: TextStyle(
                                            fontSize: 12,
                                            color: _isDarkMode
                                                ? Colors.grey[400]
                                                : Colors.grey[600],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

// Helper method to build job details with icons
  Widget _buildJobDetail(IconData icon, String text, bool isDarkMode) {
    return Expanded(
      child: Row(
        children: [
          Icon(
            icon,
            size: 16,
            color: isDarkMode ? Colors.grey[400] : Colors.grey[600],
          ),
          const SizedBox(width: 4),
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                fontSize: 12,
                color: isDarkMode ? Colors.grey[300] : Colors.grey[700],
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }

// Helper method to build stat cards
  Widget _buildStatCard(
      IconData icon, String title, String count, BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: isDark ? const Color(0xFF2D2D3A) : Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          Icon(
            icon,
            color: Colors.deepPurple,
            size: 24,
          ),
          const SizedBox(height: 8),
          Text(
            count,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
              color: isDark ? Colors.white : Colors.deepPurple.shade800,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            title,
            style: TextStyle(
              fontSize: 12,
              color: isDark ? Colors.grey[400] : Colors.grey[600],
            ),
          ),
        ],
      ),
    );
  }
}
