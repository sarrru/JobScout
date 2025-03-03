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
        title: const Text('Account', style: TextStyle(fontSize: 22)),
        backgroundColor: Theme.of(context).colorScheme.surface,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.more_vert),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // ✅ Existing Profile UI
            _buildProfileHeader(),

            // ✅ New Section: Applied Jobs at "Stable Cluster"
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
                  // ✅ Display Applied Jobs
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

  // Profile Header UI
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
                'assets/images/img.jpg', // ✅ Updated to Asset Image
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

  // Job Application Tile
  Widget _buildJobApplicationTile(JobApplication job) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.symmetric(vertical: 5),
      child: ListTile(
        leading: Icon(Icons.work, color: Colors.purple),
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

// ✅ Step 2: Job Application Model
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
