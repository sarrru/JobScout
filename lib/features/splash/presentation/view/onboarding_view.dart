import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:job_scout_project/features/splash/presentation/view_model/on_boarding/on_boarding_cubit.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<OnboardingContent> _pages = [
    OnboardingContent(
      image: 'assets/images/company.png',
      title: 'Welcome to Our App',
      description:
          'Discover a new way to find your dream job. We connect you with top companies and exciting opportunities.',
      features: [
        FeatureItem(Icons.search, 'Find Jobs'),
        FeatureItem(Icons.bookmark, 'Save Favorites'),
        FeatureItem(Icons.notifications, 'Get Alerts'),
      ],
    ),
    OnboardingContent(
      image: 'assets/images/image.png',
      title: 'Powerful Features',
      description:
          'Explore our intuitive platform and unleash a range of tools designed to streamline your job search process.',
      features: [
        FeatureItem(Icons.filter_list, ' Filters'),
        FeatureItem(Icons.analytics, 'Applications'),
        FeatureItem(Icons.assessment, 'Assessments'),
      ],
    ),
    OnboardingContent(
      image: 'assets/images/onboarding.png',
      title: 'Join Our Community',
      description:
          'Become part of a thriving community of professionals, share insights, and advance your career together.',
      features: [
        FeatureItem(Icons.group, 'Network'),
        FeatureItem(Icons.chat, 'Discussion '),
        FeatureItem(Icons.person_add, 'Connect'),
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return BlocListener<OnboardingCubit, int>(
      listener: (context, state) {
        if (state == -1) {
          context.read<OnboardingCubit>().openLoginView(context);
        } else {
          _pageController.animateToPage(
            state,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
          );
        }
      },
      child: Scaffold(
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: PageView.builder(
                  controller: _pageController,
                  onPageChanged: (int page) {
                    setState(() {
                      _currentPage = page;
                    });
                  },
                  itemCount: _pages.length,
                  itemBuilder: (context, index) {
                    return _buildPage(_pages[index], theme);
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: _buildPageIndicator(),
                    ),
                    const SizedBox(height: 24),
                    _buildButton(context, theme),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPage(OnboardingContent content, ThemeData theme) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            content.image,
            height: 240,
            fit: BoxFit.contain,
          ),
          const SizedBox(height: 12),
          Text(
            content.title,
            style: theme.textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.bold,
              color: theme.primaryColor,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          Text(
            content.description,
            style: TextStyle(
              fontSize: 16,
              color: Colors.purple[600],
              height: 1.5,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 40),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: content.features.map((feature) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: _buildFeatureItem(feature.icon, feature.label, theme),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  List<Widget> _buildPageIndicator() {
    List<Widget> indicators = [];
    for (int i = 0; i < _pages.length; i++) {
      indicators.add(
        Container(
          width: 8,
          height: 8,
          margin: const EdgeInsets.symmetric(horizontal: 4),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: i == _currentPage
                ? Theme.of(context).primaryColor
                : Colors.black,
          ),
        ),
      );
    }
    return indicators;
  }

  Widget _buildFeatureItem(IconData icon, String label, ThemeData theme) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Theme.of(context).primaryColor.withOpacity(0.5),
                blurRadius: 8,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Icon(
            icon,
            color: Theme.of(context).primaryColor,
            size: 28,
          ),
        ),
        const SizedBox(height: 12),
        Text(
          label,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: Colors.grey[700],
            height: 1.2,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _buildButton(BuildContext context, ThemeData theme) {
    return SizedBox(
      width: double.infinity,
      height: 56,
      child: ElevatedButton(
        onPressed: () {
          if (_currentPage == _pages.length - 1) {
            context.read<OnboardingCubit>().openLoginView(context);
          } else {
            _pageController.nextPage(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
            );
          }
        },
        style: ElevatedButton.styleFrom(
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          backgroundColor: Colors.purple, // Set purple for all buttons
        ),
        child: Text(
          _currentPage == _pages.length - 1 ? 'Get Started' : 'Next',
          style: theme.textTheme.titleLarge?.copyWith(
            color: Colors.white, // Set white text for all buttons
            fontSize: 18,
            letterSpacing: 1,
          ),
        ),
      ),
    );
  }
}

class OnboardingContent {
  final String image;
  final String title;
  final String description;
  final List<FeatureItem> features;

  OnboardingContent({
    required this.image,
    required this.title,
    required this.description,
    required this.features,
  });
}

class FeatureItem {
  final IconData icon;
  final String label;

  FeatureItem(this.icon, this.label);
}
