import 'package:flutter/material.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeader(),
              _buildSearchBar(),
              _buildStats(),
              _buildCategories(),
              _buildRecommendedJobs(),
              _buildRecentJobs(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
        color: Color(0xFF5C3BFF),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Good Morning',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    'Saru Maharjan',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              CircleAvatar(
                radius: 25,
                backgroundColor: Colors.white24,
                child: CircleAvatar(
                  radius: 23,
                  backgroundColor: Colors.grey[300],
                  backgroundImage: const AssetImage('assets/images/img.jpg'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSearchBar() {
    return Container(
      margin: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            // ignore: deprecated_member_use
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
          ),
        ],
      ),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Search job here...',
          prefixIcon: const Icon(Icons.search, color: Colors.grey),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide.none,
          ),
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        ),
      ),
    );
  }

  Widget _buildStats() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Expanded(
            child: _buildStatCard(
              '29',
              'Jobs Applied',
              const Color(0xFF5C3BFF),
            ),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: _buildStatCard(
              '3',
              'Interviews',
              const Color(0xFF2196F3),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatCard(String number, String label, Color color) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            number,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            label,
            style: const TextStyle(
              color: Colors.white70,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategories() {
    final categories = [
      {'icon': Icons.flash_on, 'color': Colors.orange},
      {'icon': Icons.edit, 'color': Colors.blue},
      {'icon': Icons.grid_view, 'color': Colors.green},
      {'icon': Icons.language, 'color': Colors.purple},
      {'icon': Icons.code, 'color': Colors.red},
      {'icon': Icons.storage, 'color': Colors.indigo},
      {'icon': Icons.build, 'color': Colors.brown},
      {'icon': Icons.more_horiz, 'color': Colors.grey},
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.all(20),
          child: Text(
            'Categories',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        GridView.count(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          crossAxisCount: 4,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          children: categories.map((category) {
            return Container(
              margin: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    // ignore: deprecated_member_use
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 10,
                  ),
                ],
              ),
              child: Icon(
                category['icon'] as IconData,
                color: category['color'] as Color,
                size: 30,
              ),
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildRecommendedJobs() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Recommended Jobs',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Row(
                children: [
                  Container(
                    height: 8,
                    width: 8,
                    margin: const EdgeInsets.symmetric(horizontal: 2),
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      shape: BoxShape.circle,
                    ),
                  ),
                  Container(
                    height: 8,
                    width: 8,
                    margin: const EdgeInsets.symmetric(horizontal: 2),
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      shape: BoxShape.circle,
                    ),
                  ),
                  Container(
                    height: 8,
                    width: 8,
                    margin: const EdgeInsets.symmetric(horizontal: 2),
                    decoration: const BoxDecoration(
                      color: Color(0xFF5C3BFF),
                      shape: BoxShape.circle,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        _buildJobCard(
          'Software Engineer',
          'Maharajgunj,Kathmandu',
          '\$500 - \$1,000',
        ),
      ],
    );
  }

  Widget _buildRecentJobs() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Recent Jobs',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextButton(
                onPressed: () {},
                child: const Text(
                  'More',
                  style: TextStyle(color: Color(0xFF5C3BFF)),
                ),
              ),
            ],
          ),
        ),
        _buildDetailedJobCard(
          'Junior Software Engineer',
          'Highspeed Studios',
          'Birgunj,Nepal',
          '\$500 - \$1,000',
        ),
        _buildDetailedJobCard(
          'Database Engineer',
          'Lunar Djaja Corp.',
          'Dhapakhel,lalitpur',
          '\$500 - \$1,000',
        ),
        _buildDetailedJobCard(
          'Senior Software Engineer',
          'Darkseer Studios',
          'kupandole, Lalitpur',
          '\$500 - \$1,000',
        ),
      ],
    );
  }

  Widget _buildJobCard(String title, String location, String salary) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            // ignore: deprecated_member_use
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            location,
            style: TextStyle(
              color: Colors.grey[600],
            ),
          ),
          const SizedBox(height: 10),
          Text(
            salary,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Color(0xFF5C3BFF),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDetailedJobCard(
      String title, String company, String location, String salary) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            // ignore: deprecated_member_use
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
          ),
        ],
      ),
      child: Row(
        children: [
          const CircleAvatar(
            radius: 30,
            backgroundImage: NetworkImage(
                'https://via.placeholder.com/150/0000FF/808080?Text=CompanyLogo'),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  company,
                  style: TextStyle(
                    color: Colors.grey[600],
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  location,
                  style: TextStyle(
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
          ),
          Text(
            salary,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Color(0xFF5C3BFF),
            ),
          ),
        ],
      ),
    );
  }
}
