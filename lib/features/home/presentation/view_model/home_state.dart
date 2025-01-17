import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:job_scout_project/features/home/presentation/view/bottom_view/browse.dart';
import 'package:job_scout_project/features/home/presentation/view/bottom_view/dashboard_view.dart';
import 'package:job_scout_project/features/home/presentation/view/bottom_view/jobs.dart';

class HomeState extends Equatable {
  final int selectedIndex;
  final List<Widget> views;
  final int currentCarouselIndex;
  final List<String> carouselImages;
  final List<Map<String, String?>> categories;

  const HomeState({
    required this.selectedIndex,
    required this.views,
    this.currentCarouselIndex = 0,
    required this.carouselImages,
    required this.categories,
  });

  // Initial state
  static HomeState initial() {
    return HomeState(
      selectedIndex: 0,
      views: [
        const DashboardView(),
        const Browse(),
        Center(child: Text('Admission')), // Placeholder for "Admission"
        const Jobs(),
      ],
      carouselImages: [
        'assets/images/cr1.png',
        'assets/images/cr2.png',
        'assets/images/cr3.png',
      ],
      categories: [
        {
          "icon": Icons.flash_on.toString(),
          "color": Colors.orange.toString(),
        },
        {
          "icon": Icons.edit.toString(),
          "color": Colors.blue.toString(),
        },
        {
          "icon": Icons.grid_view.toString(),
          "color": Colors.green.toString(),
        },
        {
          "icon": Icons.language.toString(),
          "color": Colors.purple.toString(),
        },
      ],
    );
  }

  HomeState copyWith({
    int? selectedIndex,
    List<Widget>? views,
    int? currentCarouselIndex,
    List<String>? carouselImages,
    List<Map<String, String?>>? categories,
  }) {
    return HomeState(
      selectedIndex: selectedIndex ?? this.selectedIndex,
      views: views ?? this.views,
      currentCarouselIndex: currentCarouselIndex ?? this.currentCarouselIndex,
      carouselImages: carouselImages ?? this.carouselImages,
      categories: categories ?? this.categories,
    );
  }

  @override
  List<Object?> get props =>
      [selectedIndex, views, currentCarouselIndex, carouselImages, categories];
}
