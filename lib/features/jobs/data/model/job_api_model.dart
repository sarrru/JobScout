

import 'package:job_scout_project/features/company/domain/entity/company_entity.dart';
import 'package:job_scout_project/features/jobs/domain/entity/jobs_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'job_api_model.g.dart';

@JsonSerializable()
class JobApiModel {
  @JsonKey(name: '_id')
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
  @JsonKey(name: 'created_by')
  final String createdBy;
  final List<String>? applications; // Allow nullable applications

  JobApiModel({
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
    this.applications, // Nullable applications
  });

  /// *Factory Constructor to Create from JSON*
  factory JobApiModel.fromJson(Map<String, dynamic> json) {
    return JobApiModel(
      jobId: json['_id'] as String? ?? '', // Handle null safely
      title: json['title'] as String? ?? 'Untitled',
      description: json['description'] as String? ?? 'No description available',
      requirements: (json['requirements'] as List<dynamic>?)
              ?.map((e) => e.toString())
              .toList() ??
          [],
      salary: json['salary'] as int? ?? 0,
      experienceLevel: json['experienceLevel'] as int? ?? 0,
      location: json['location'] as String? ?? 'Unknown location',
      jobType: json['jobType'] as String? ?? 'Unknown',
      position: json['position'] as int? ?? 0,
      company: json['company'] != null
          ? CompanyEntity.fromJson(json['company'] as Map<String, dynamic>)
          : const CompanyEntity(id: '', name: ''), // Handle null company data
      createdBy: json['created_by'] as String? ?? 'Unknown',
      applications: (json['applications'] as List<dynamic>?)
              ?.map((e) => e.toString())
              .toList() ??
          [],
    );
  }

  /// *Convert API Model to Domain Entity*
  JobEntity toEntity() => JobEntity(
        jobId: jobId,
        title: title,
        description: description,
        requirements: requirements,
        salary: salary,
        experienceLevel: experienceLevel,
        location: location,
        jobType: jobType,
        position: position,
        company: company,
        createdBy: createdBy,
        applications: applications ?? [],
      );
  Map<String, dynamic> toJson() => _$JobApiModelToJson(this);

  /// *Convert JSON List to List of JobEntity*
  static List<JobEntity> toEntityList(List<JobApiModel> jobs) =>
      jobs.map((job) => job.toEntity()).toList();
}