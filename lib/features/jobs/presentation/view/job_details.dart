// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:job_scout_project/features/company/presentation/view_model/company_bloc.dart';
// import 'package:job_scout_project/features/company/presentation/view_model/company_event.dart';
// import 'package:job_scout_project/features/company/presentation/view_model/company_state.dart';

// class CompanyDetailsPage extends StatefulWidget {
//   final String companyId;

//   const CompanyDetailsPage({super.key, required this.companyId});

//   @override
//   _CompanyDetailsPageState createState() => _CompanyDetailsPageState();
// }

// class _CompanyDetailsPageState extends State<CompanyDetailsPage> {
//   @override
//   void initState() {
//     super.initState();
//     Future.microtask(() {
//       context.read<CompanyBloc>().add(FetchCompanyById(widget.companyId));
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Company Details"),
//         backgroundColor: Colors.deepPurple,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: BlocBuilder<CompanyBloc, CompanyState>(
//           builder: (context, state) {
//             if (state.isLoading) {
//               return const Center(child: CircularProgressIndicator());
//             } else if (state.error != null) {
//               return Center(
//                 child: Text(state.error!,
//                     style: const TextStyle(color: Colors.red, fontSize: 16)),
//               );
//             } else if (state.selectedCompany == null) {
//               return const Center(
//                 child: Text("Company details not available."),
//               );
//             }

//             final company = state.selectedCompany!;

//             return Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(company.name,
//                     style: const TextStyle(
//                         fontSize: 22, fontWeight: FontWeight.bold)),
//                 const SizedBox(height: 8),
//                 Text(company.description ?? "No description available"),
//                 const SizedBox(height: 8),
//                 Text("Location: ${company.location ?? 'Not provided'}"),
//                 const SizedBox(height: 8),
//                 Text("Salary: \$${company.jobSalary ?? 'Not Disclosed'}"),
//                 Text(
//                     "Job Description: ${company.description ?? 'Not Disclosed'}"),
//                 Text("Job Position: ${company.jobPosition ?? 'Not Disclosed'}"),
//                 Text("Job logo: ${company.logo ?? 'Not Disclosed'}"),
//                 Text("Job Website: ${company.website ?? 'Not Disclosed'}"),
//                 Text(
//                     "Job Website: ${company.jobDescription ?? 'Not Disclosed'}"),
//               ],
//             );
//           },
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:job_scout_project/features/company/presentation/view_model/company_bloc.dart';
import 'package:job_scout_project/features/company/presentation/view_model/company_event.dart';
import 'package:job_scout_project/features/company/presentation/view_model/company_state.dart';

class CompanyDetailsPage extends StatefulWidget {
  final String companyId;

  const CompanyDetailsPage({super.key, required this.companyId});

  @override
  _CompanyDetailsPageState createState() => _CompanyDetailsPageState();
}

class _CompanyDetailsPageState extends State<CompanyDetailsPage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      context.read<CompanyBloc>().add(FetchCompanyById(widget.companyId));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Job Details"),
        backgroundColor: Colors.deepPurple,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
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
            } else if (state.selectedCompany == null) {
              return const Center(
                child: Text(
                  "Company details not available.",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              );
            }

            final company = state.selectedCompany!;

            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Job Image (Dummy)
                  Center(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset(
                        "assets/images/job.jpg", // Make sure you add this image in your assets folder
                        height: 200,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Company Name
                  Text(
                    company.name,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.deepPurple,
                    ),
                  ),
                  const SizedBox(height: 10),

                  // Job Position
                  Row(
                    children: [
                      const Icon(Icons.work, color: Colors.deepPurple),
                      const SizedBox(width: 5),
                      Text(
                        "Position: ${company.jobPosition ?? 'Frontend'}",
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),

                  // Job Salary
                  Row(
                    children: [
                      const Icon(Icons.monetization_on, color: Colors.green),
                      const SizedBox(width: 5),
                      Text(
                        "Salary: \$${company.jobSalary ?? '50000'}",
                        style:
                            const TextStyle(fontSize: 18, color: Colors.green),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),

                  // Job Description Section
                  const Text(
                    "Job Description",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    company.jobDescription ?? "No description available",
                    style: const TextStyle(fontSize: 16, color: Colors.black87),
                  ),
                  const SizedBox(height: 15),

                  // Location
                  Row(
                    children: [
                      const Icon(Icons.location_on, color: Colors.deepPurple),
                      const SizedBox(width: 5),
                      Text(
                        company.location ?? 'Not provided',
                        style: const TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),

                  // Website
                  Row(
                    children: [
                      const Icon(Icons.link, color: Colors.deepPurple),
                      const SizedBox(width: 5),
                      Text(
                        company.website ?? 'No website provided',
                        style:
                            const TextStyle(fontSize: 16, color: Colors.blue),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),

                  // // Company Logo
                  // if (company.logo != null)
                  //   Center(
                  //     child: ClipRRect(
                  //       borderRadius: BorderRadius.circular(8),
                  //       child: Image.network(
                  //         company.logo!,
                  //         height: 80,
                  //         width: 80,
                  //         fit: BoxFit.cover,
                  //       ),
                  //     ),
                  //   ),
                  const SizedBox(height: 20),

                  // Apply Button with Icon
                  Center(
                    child: ElevatedButton.icon(
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Applied Successfully!"),
                            backgroundColor: Colors.green,
                          ),
                        );
                      },
                      icon: const Icon(Icons.send, color: Colors.white),
                      label: const Text(
                        "Apply Now",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.deepPurple,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 40, vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        elevation: 5,
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
