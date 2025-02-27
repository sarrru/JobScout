import 'package:equatable/equatable.dart';
import 'package:job_scout_project/features/company/domain/entity/company_entity.dart';


class JobEntity extends Equatable {
  final String jobId;
  final String title;
  final String description;
  final List<String> requirements;
  final int salary;
  final int experienceLevel;
  final String location;
  final String jobType;
  final int position;
  final CompanyEntity company;
  final String createdBy;
  final List<String> applications;

  /// *Constructor*
  const JobEntity({
    required this.jobId,
    required this.title,
    required this.description,
    required this.requirements,
    required this.salary,
    required this.experienceLevel,
    required this.location,
    required this.jobType,
    required this.position,
    required this.company,
    required this.createdBy,
    required this.applications,
  });

  /// *Empty Constructor with Default Values*
  const JobEntity.empty()
      : jobId = '',
        title = '',
        description = '',
        requirements = const [],
        salary = 0,
        experienceLevel = 0,
        location = '',
        jobType = '',
        position = 0,
        company = const CompanyEntity(id: '', name: ''),
        createdBy = '',
        applications = const [];

  /// **Factory Constructor to Create JobEntity from JSON**
  factory JobEntity.fromJson(Map<String, dynamic> json) {
    return JobEntity(
      jobId: json['_id'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      requirements: json['requirements'] != null
          ? List<String>.from(json['requirements'])
          : [],
      salary: json['salary'] as int,
      experienceLevel: json['experienceLevel'] as int,
      location: json['location'] as String,
      jobType: json['jobType'] as String,
      position: json['position'] as int,
      company: json['company'] is Map<String, dynamic>
          ? CompanyEntity.fromJson(json['company'])
          : const CompanyEntity(id: '',name: ''),
      createdBy: json['created_by'] as String,
      applications: json['applications'] != null
          ? List<String>.from(json['applications'])
          : [],
    );
  }

  /// **Method to Convert JobEntity to JSON**
  Map<String, dynamic> toJson() {
    return {
      '_id': jobId,
      'title': title,
      'description': description,
      'requirements': requirements,
      'salary': salary,
      'experienceLevel': experienceLevel,
      'location': location,
      'jobType': jobType,
      'position': position,
      'company': company.toJson(),
      'created_by': createdBy,
      'applications': applications,
    };
  }

  /// *CopyWith Method to Create a Modified Copy of the Entity*
  JobEntity copyWith({
    String? jobId,
    String? title,
    String? description,
    List<String>? requirements,
    int? salary,
    int? experienceLevel,
    String? location,
    String? jobType,
    int? position,
    CompanyEntity? company,
    String? createdBy,
    List<String>? applications,
  }) {
    return JobEntity(
      jobId: jobId ?? this.jobId,
      title: title ?? this.title,
      description: description ?? this.description,
      requirements: requirements ?? this.requirements,
      salary: salary ?? this.salary,
      experienceLevel: experienceLevel ?? this.experienceLevel,
      location: location ?? this.location,
      jobType: jobType ?? this.jobType,
      position: position ?? this.position,
      company: company ?? this.company,
      createdBy: createdBy ?? this.createdBy,
      applications: applications ?? this.applications,
    );
  }

  @override
  List<Object?> get props => [
        jobId,
        title,
        description,
        requirements,
        salary,
        experienceLevel,
        location,
        jobType,
        position,
        company,
        createdBy,
        applications,
      ];
}