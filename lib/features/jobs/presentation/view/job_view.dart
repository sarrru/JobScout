// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:job_scout_project/features/company/domain/entity/company_entity.dart';
// import 'package:job_scout_project/features/company/presentation/view_model/company_bloc.dart';
// import 'package:job_scout_project/features/company/presentation/view_model/company_event.dart';
// import 'package:job_scout_project/features/company/presentation/view_model/company_state.dart';
// import 'package:job_scout_project/features/jobs/presentation/view/job_details.dart';

// class JobViewPage extends StatefulWidget {
//   const JobViewPage({super.key});

//   @override
//   _JobViewPageState createState() => _JobViewPageState();
// }

// class _JobViewPageState extends State<JobViewPage> {
//   @override
//   void initState() {
//     super.initState();
//     Future.microtask(() {
//       context.read<CompanyBloc>().add(const FetchAllCompanies());
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.grey[100],
//       appBar: AppBar(
//         title: const Text(
//           " Good Morning Saru  ",
//           style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//         ),
//         centerTitle: false,
//         backgroundColor: Colors.deepPurple,
//         actions: [
//           CircleAvatar(
//             backgroundImage: AssetImage("assets/images/off.jpg"),
//           ),
//           const SizedBox(width: 12),
//         ],
//       ),
//       body: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
//         child: BlocBuilder<CompanyBloc, CompanyState>(
//           builder: (context, state) {
//             if (state.isLoading) {
//               return const Center(child: CircularProgressIndicator());
//             } else if (state.error != null) {
//               return Center(
//                 child: Text(
//                   state.error!,
//                   style: const TextStyle(color: Colors.red, fontSize: 16),
//                 ),
//               );
//             } else if (state.companies.isEmpty) {
//               return const Center(
//                 child: Text(
//                   "No jobs available",
//                   style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//                 ),
//               );
//             }
//             const SizedBox(width: 34);
//             return SingleChildScrollView(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   // Search Bar
//                   const SizedBox(width: 34),
//                   Container(
//                     padding: const EdgeInsets.symmetric(horizontal: 16),
//                     margin: const EdgeInsets.only(bottom: 16),
//                     decoration: BoxDecoration(
//                       color: Colors.white,
//                       borderRadius: BorderRadius.circular(12),
//                       boxShadow: [
//                         BoxShadow(
//                           color: Colors.black12,
//                           blurRadius: 5,
//                           spreadRadius: 2,
//                         ),
//                       ],
//                     ),
//                     child: TextField(
//                       decoration: InputDecoration(
//                         hintText: "Search job here...",
//                         border: InputBorder.none,
//                         icon: Icon(Icons.search, color: Colors.deepPurple),
//                       ),
//                     ),
//                   ),

//                   // Categories Section
//                   const Text(
//                     "Categories",
//                     style: TextStyle(
//                       fontSize: 18,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   const SizedBox(height: 10),
//                   Wrap(
//                     spacing: 12,
//                     children: [
//                       _buildCategoryIcon(Icons.code, "IT"),
//                       _buildCategoryIcon(Icons.business, "Finance"),
//                       _buildCategoryIcon(Icons.health_and_safety, "Health"),
//                       _buildCategoryIcon(Icons.engineering, "Engineering"),
//                     ],
//                   ),
//                   const SizedBox(height: 20),

//                   // Recommended Jobs Section
//                   const Text(
//                     "Recommended Jobs",
//                     style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//                   ),
//                   const SizedBox(height: 10),
//                   SizedBox(
//                     height: 140,
//                     child: ListView.builder(
//                       scrollDirection: Axis.horizontal,
//                       itemCount: state.companies.length,
//                       itemBuilder: (context, index) {
//                         final CompanyEntity company = state.companies[index];
//                         return _buildRecommendedJobCard(company);
//                       },
//                     ),
//                   ),
//                   const SizedBox(height: 20),

//                   // Recent Jobs Section
//                   const Text(
//                     "Recent Jobs",
//                     style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//                   ),
//                   const SizedBox(height: 10),
//                   ListView.builder(
//                     shrinkWrap: true,
//                     physics: NeverScrollableScrollPhysics(),
//                     itemCount: state.companies.length,
//                     itemBuilder: (context, index) {
//                       final CompanyEntity company = state.companies[index];
//                       return _buildRecentJobCard(company);
//                     },
//                   ),
//                 ],
//               ),
//             );
//           },
//         ),
//       ),
//     );
//   }

//   // Category Icon Widget
//   Widget _buildCategoryIcon(IconData icon, String label) {
//     return Column(
//       children: [
//         CircleAvatar(
//           radius: 30,
//           backgroundColor: Colors.deepPurple.shade100,
//           child: Icon(icon, color: Colors.deepPurple, size: 28),
//         ),
//         const SizedBox(height: 5),
//         Text(label),
//       ],
//     );
//   }

//   // Recommended Job Card
//   Widget _buildRecommendedJobCard(CompanyEntity company) {
//     return Container(
//       width: 180,
//       margin: const EdgeInsets.only(right: 12),
//       padding: const EdgeInsets.all(10),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(12),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black12,
//             blurRadius: 5,
//             spreadRadius: 2,
//           ),
//         ],
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Image.asset(
//             "assets/images/job.jpg",
//             height: 40,
//             width: 40,
//           ),
//           const SizedBox(height: 5),
//           Text(
//             (company.jobPosition != null && company.jobPosition!.isNotEmpty)
//                 ? company.jobPosition!
//                 : "Position",
//             style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
//           ),
//           Text(company.name, style: TextStyle(color: Colors.grey)),
//           const SizedBox(height: 5),
//           Text(
//             "\$${company.jobSalary ?? 'Not Disclosed'}",
//             style: const TextStyle(color: Colors.green, fontSize: 14),
//           ),
//         ],
//       ),
//     );
//   }

// // Recent Job Card
//   Widget _buildRecentJobCard(CompanyEntity company) {
//     return Card(
//       elevation: 3,
//       margin: const EdgeInsets.symmetric(vertical: 8),
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//       child: ListTile(
//         onTap: () {
//           // Navigate to CompanyDetailsPage with selected company ID
//           Navigator.push(
//             context,
//             MaterialPageRoute(
//               builder: (context) => CompanyDetailsPage(companyId: company.id),
//             ),
//           );
//         },
//         leading: Image.asset(
//           "assets/images/image.png",
//           height: 40,
//           width: 40,
//         ),
//         title: Text(
//           (company.jobPosition != null && company.jobPosition!.isNotEmpty)
//               ? company.jobPosition!
//               : "Position",
//           style: const TextStyle(fontWeight: FontWeight.bold),
//         ),
//         subtitle: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(company.name, style: TextStyle(color: Colors.grey)),
//             Text(
//               "\$${company.jobSalary ?? 'Not Disclosed'}",
//               style: const TextStyle(color: Colors.green),
//             ),
//           ],
//         ),
//         trailing: ElevatedButton(
//           onPressed: () {},
//           style: ElevatedButton.styleFrom(
//             backgroundColor: Colors.deepPurple,
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(8),
//             ),
//           ),
//           child: const Text("Apply"),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:job_scout_project/features/company/domain/entity/company_entity.dart';
import 'package:job_scout_project/features/company/presentation/view_model/company_bloc.dart';
import 'package:job_scout_project/features/company/presentation/view_model/company_event.dart';
import 'package:job_scout_project/features/company/presentation/view_model/company_state.dart';
import 'package:job_scout_project/features/jobs/presentation/view/job_details.dart';

class JobViewPage extends StatefulWidget {
  const JobViewPage({super.key});

  @override
  _JobViewPageState createState() => _JobViewPageState();
}

class _JobViewPageState extends State<JobViewPage> {
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
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text(
          " Good Morning Saru  ",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        centerTitle: false,
        backgroundColor: Colors.deepPurple,
        actions: [
          CircleAvatar(
            backgroundImage: AssetImage("assets/images/off.jpg"),
          ),
          const SizedBox(width: 12),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
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
                  "No jobs available",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              );
            }
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Recommended Jobs",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    height: 140,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: state.companies.length,
                      itemBuilder: (context, index) {
                        final CompanyEntity company = state.companies[index];
                        return _buildRecommendedJobCard(company);
                      },
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "Recent Jobs",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: state.companies.length,
                    itemBuilder: (context, index) {
                      final CompanyEntity company = state.companies[index];
                      return _buildRecentJobCard(company);
                    },
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  // Recommended Job Card
  Widget _buildRecommendedJobCard(CompanyEntity company) {
    return GestureDetector(
      onTap: () {
        context.read<CompanyBloc>().add(FetchCompanyById(company.id));
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CompanyDetailsPage(companyId: company.id),
          ),
        );
      },
      child: Container(
        width: 180,
        margin: const EdgeInsets.only(right: 12),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 5,
              spreadRadius: 2,
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset("assets/images/job.jpg", height: 40, width: 40),
            const SizedBox(height: 5),
            Text(company.jobPosition ?? "Position",
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            Text(company.name, style: TextStyle(color: Colors.grey)),
            const SizedBox(height: 5),
            Text("\$${company.jobSalary ?? 'Not Disclosed'}",
                style: const TextStyle(color: Colors.green, fontSize: 14)),
          ],
        ),
      ),
    );
  }

  // Recent Job Card
  Widget _buildRecentJobCard(CompanyEntity company) {
    return Card(
      elevation: 3,
      margin: const EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        onTap: () {
          context.read<CompanyBloc>().add(FetchCompanyById(company.id));
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CompanyDetailsPage(companyId: company.id),
            ),
          );
        },
        leading: Image.asset("assets/images/image.png", height: 40, width: 40),
        title: Text(company.jobPosition ?? "Position",
            style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(company.name, style: TextStyle(color: Colors.grey)),
            Text("\$${company.jobSalary ?? 'Not Disclosed'}",
                style: const TextStyle(color: Colors.green)),
          ],
        ),
      ),
    );
  }
}
