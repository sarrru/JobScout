// import 'package:flutter/material.dart';

// class ProfileScreen extends StatelessWidget {
//   const ProfileScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     // Mock Data (Replace with real API or Bloc state)
//     final List<JobApplication> appliedJobs = [
//       JobApplication(
//           jobTitle: "Software Engineer",
//           companyName: "Stable",
//           status: "Pending"),
//     ];

//     return Scaffold(
//       backgroundColor: Theme.of(context).colorScheme.surface,
//       appBar: AppBar(
//         title: const Text('Account', style: TextStyle(fontSize: 22)),
//         backgroundColor: Theme.of(context).colorScheme.surface,
//         elevation: 0,
//         actions: [
//           IconButton(
//             icon: const Icon(Icons.more_vert),
//             onPressed: () {},
//           ),
//         ],
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             // ✅ Existing Profile UI
//             _buildProfileHeader(),

//             // ✅ New Section: Applied Jobs at "Stable Cluster"
//             Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   const Text(
//                     'Jobs Applied at Stable Cluster',
//                     style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//                   ),
//                   const SizedBox(height: 10),
//                   // ✅ Display Applied Jobs
//                   appliedJobs.isNotEmpty
//                       ? Column(
//                           children: appliedJobs
//                               .map((job) => _buildJobApplicationTile(job))
//                               .toList(),
//                         )
//                       : const Text(
//                           "No applications yet",
//                           style: TextStyle(color: Colors.grey),
//                         ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   // Profile Header UI
//   Widget _buildProfileHeader() {
//     return Padding(
//       padding: const EdgeInsets.all(16.0),
//       child: Column(
//         children: [
//           Container(
//             width: 100,
//             height: 100,
//             decoration: BoxDecoration(
//               shape: BoxShape.circle,
//               border: Border.all(color: Colors.deepPurple, width: 2),
//             ),
//             child: ClipRRect(
//               borderRadius: BorderRadius.circular(50),
//               child: Image.asset(
//                 'assets/images/img.jpg', // ✅ Updated to Asset Image
//                 fit: BoxFit.cover,
//               ),
//             ),
//           ),
//           const SizedBox(height: 16),
//           const Text(
//             'Saru Maharjan',
//             style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
//           ),
//           const SizedBox(height: 4),
//           const Text(
//             'Programmer',
//             style: TextStyle(fontSize: 16, color: Colors.grey),
//           ),
//         ],
//       ),
//     );
//   }

//   // Job Application Tile
//   Widget _buildJobApplicationTile(JobApplication job) {
//     return Card(
//       elevation: 2,
//       margin: const EdgeInsets.symmetric(vertical: 5),
//       child: ListTile(
//         leading: Icon(Icons.work, color: Colors.purple),
//         title: Text(job.jobTitle),
//         subtitle: Text(job.companyName),
//         trailing: Chip(
//           label: Text(job.status),
//           backgroundColor: Colors.orange.shade100,
//         ),
//       ),
//     );
//   }
// }

// // ✅ Step 2: Job Application Model
// class JobApplication {
//   final String jobTitle;
//   final String companyName;
//   final String status;

//   JobApplication({
//     required this.jobTitle,
//     required this.companyName,
//     required this.status,
//   });
// }

import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Mock Data (Replace with real API or Bloc state)
    final List<JobApplication> appliedJobs = [
      JobApplication(
          jobTitle: "Software Engineer",
          companyName: "Stable",
          status: "Pending"),
    ];

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        title: const Text(
          'Account',
          style: TextStyle(fontSize: 22),
        ),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.surface,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.logout, color: Colors.deepPurple),
            onPressed: () {
              _showLogoutDialog(context);
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // ✅ Profile Header
            _buildProfileHeader(),

            // ✅ Resume Section
            _buildResumeSection(),

            // ✅ Skills Section
            // _buildSkillsSection(),

            // ✅ Applied Jobs Section
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Jobs Applied at Stable Cluster',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  appliedJobs.isNotEmpty
                      ? Column(
                          children: appliedJobs
                              .map((job) => _buildJobApplicationTile(job))
                              .toList(),
                        )
                      : const Text(
                          "No applications yet",
                          style: TextStyle(color: Colors.grey),
                        ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ✅ Resume Section
  Widget _buildResumeSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.purple.shade700,
          borderRadius: BorderRadius.circular(12),
        ),
        padding: const EdgeInsets.all(12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "My Resume",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                const Text(
                  "saru_resume.pdf",
                  style: TextStyle(color: Colors.white70, fontSize: 14),
                ),
              ],
            ),
            const Icon(Icons.more_vert, color: Colors.white),
          ],
        ),
      ),
    );
  }

  // // ✅ Skills Section
  // Widget _buildSkillsSection() {
  //   final skills = [
  //     Skill(name: "PHP", percentage: 86, color: Colors.orange),
  //     Skill(name: "Java", percentage: 48, color: Colors.green),
  //     Skill(name: "MySQL", percentage: 56, color: Colors.blue),
  //     Skill(name: "React N", percentage: 34, color: Colors.pink),
  //     Skill(name: "CSS", percentage: 86, color: Colors.purple),
  //   ];

  //   return Padding(
  //     padding: const EdgeInsets.all(16.0),
  //     child: Column(
  //       crossAxisAlignment: CrossAxisAlignment.start,
  //       children: [
  //         const Text(
  //           "Skill",
  //           style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
  //         ),
  //         const SizedBox(height: 10),
  //         Wrap(
  //           spacing: 10,
  //           runSpacing: 10,
  //           children: skills.map((skill) => _buildSkillCard(skill)).toList(),
  //         ),
  //       ],
  //     ),
  //   );
  // }

  // // ✅ Skill Card with Circular Progress Indicator
  // Widget _buildSkillCard(Skill skill) {
  //   return Container(
  //     width: 100,
  //     height: 100,
  //     decoration: BoxDecoration(
  //       color: Colors.white,
  //       borderRadius: BorderRadius.circular(12),
  //       boxShadow: [
  //         BoxShadow(
  //           color: Colors.black.withOpacity(0.1),
  //           blurRadius: 5,
  //           spreadRadius: 2,
  //         )
  //       ],
  //     ),
  //     child: Column(
  //       mainAxisAlignment: MainAxisAlignment.center,
  //       children: [
  //         Stack(
  //           alignment: Alignment.center,
  //           children: [
  //             SizedBox(
  //               width: 50,
  //               height: 50,
  //               child: CircularProgressIndicator(
  //                 value: skill.percentage / 100,
  //                 backgroundColor: Colors.grey.shade300,
  //                 color: skill.color,
  //                 strokeWidth: 6,
  //               ),
  //             ),
  //             Text(
  //               "${skill.percentage}%",
  //               style: const TextStyle(fontWeight: FontWeight.bold),
  //             ),
  //           ],
  //         ),
  //         const SizedBox(height: 5),
  //         Text(skill.name, style: const TextStyle(fontSize: 14)),
  //       ],
  //     ),
  //   );
  // }

  // ✅ Logout Function with Confirmation Dialog
  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          title: const Text("Logout"),
          content: const Text("Are you sure you want to logout?"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(dialogContext);
              },
              child: const Text("Cancel"),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pushNamedAndRemoveUntil(
                  '/login',
                  (route) => false,
                );
              },
              child: const Text("Logout",
                  style: TextStyle(color: Colors.deepPurple)),
            ),
          ],
        );
      },
    );
  }

  // ✅ Profile Header
  Widget _buildProfileHeader() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.deepPurple, width: 2),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: Image.asset(
                'assets/images/img.jpg',
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 16),
          const Text(
            'Saru Maharjan',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 4),
          const Text(
            'Programmer',
            style: TextStyle(fontSize: 16, color: Colors.grey),
          ),
        ],
      ),
    );
  }

  // ✅ Job Application Tile
  Widget _buildJobApplicationTile(JobApplication job) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.symmetric(vertical: 5),
      child: ListTile(
        leading: const Icon(Icons.work, color: Colors.purple),
        title: Text(job.jobTitle),
        subtitle: Text(job.companyName),
        trailing: Chip(
          label: Text(job.status),
          backgroundColor: Colors.orange.shade100,
        ),
      ),
    );
  }
}

// ✅ Job Application Model
class JobApplication {
  final String jobTitle;
  final String companyName;
  final String status;

  JobApplication({
    required this.jobTitle,
    required this.companyName,
    required this.status,
  });
}

// ✅ Skill Model
class Skill {
  final String name;
  final int percentage;
  final Color color;

  Skill({required this.name, required this.percentage, required this.color});
}
