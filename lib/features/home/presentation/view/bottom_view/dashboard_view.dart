import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:job_scout_project/features/company/domain/entity/company_entity.dart';
import 'package:job_scout_project/features/company/presentation/view_model/company_bloc.dart';
import 'package:job_scout_project/features/company/presentation/view_model/company_event.dart';
import 'package:job_scout_project/features/company/presentation/view_model/company_state.dart';

class CompanyListView extends StatefulWidget {
  const CompanyListView({super.key});

  @override
  State<CompanyListView> createState() => _CompanyListViewState();
}

class _CompanyListViewState extends State<CompanyListView> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      context.read<CompanyBloc>().add(const FetchAllCompanies());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.deepPurple,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                company.name,
                                style: const TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                company.jobSalary != null
                                    ? "\$${company.jobSalary.toString()}/year"
                                    : "Salary Not Disclosed",
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.green,
                                ),
                              ),
                            ],
                          ),
                        ),

                        // Apply Button
                        ElevatedButton(
                          onPressed: () {
                            // Handle Job Apply Click
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.deepPurple,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: const Text("Apply"),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}