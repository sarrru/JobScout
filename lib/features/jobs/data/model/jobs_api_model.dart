// import 'package:equatable/equatable.dart';
// import 'package:job_scout_project/features/company/domain/entity/company_entity';
// import 'package:job_scout_project/features/jobs/domain/entity/jobs_entity';

// class JobApiModel extends Equatable {
//   final String? jobId;
//   final String title;
//   final CompanyEntity company; // Changed from String to BatchEntity (company reference)
//   final String location;
//   final String description;
//   final List<String> requirements; // Changed from String to List<String>
//   final num salary;
//   final num experienceLevel;
//   final String jobType;
//   final num position;
//   final String createdBy;
//   final List<String> applications; // Changed from String to List<String>

//   const JobApiModel({
//     this.jobId,
//     required this.title,
//     required this.company,
//     required this.location,
//     required this.description,
//     required this.requirements,
//     required this.salary,
//     required this.experienceLevel,
//     required this.jobType,
//     required this.position,
//     required this.createdBy,
//     required this.applications,
//   });

//   /// ✅ **Convert from JSON**
//   factory JobApiModel.fromJson(Map<String, dynamic> json) {
//     return JobApiModel(
//       jobId: json['_id'] as String?,
//       title: json['title'] as String,
//       company: CompanyEntity.fromJson(json['company']), // Convert company reference
//       location: json['location'] as String,
//       description: json['description'] as String,
//       requirements: (json['requirements'] as List<dynamic>).map((req) => req as String).toList(),
//       salary: json['salary'] as num,
//       experienceLevel: json['experienceLevel'] as num,
//       jobType: json['jobType'] as String,
//       position: json['position'] as num,
//       createdBy: json['created_by'] as String,
//       applications: (json['applications'] as List<dynamic>).map((app) => app as String).toList(),
//     );
//   }

//   /// ✅ **Convert to JSON**
//   Map<String, dynamic> toJson() {
//     return {
//       '_id': jobId,
//       'title': title,
//       'company': company.toJson(), // Convert company reference
//       'location': location,
//       'description': description,
//       'requirements': requirements, // List<String> remains as is
//       'salary': salary,
//       'experienceLevel': experienceLevel,
//       'jobType': jobType,
//       'position': position,
//       'created_by': createdBy,
//       'applications': applications, // List<String> remains as is
//     };
//   }

//   /// ✅ **Convert to `JobEntity`**
//   JobEntity toEntity() {
//     return JobEntity(
//       jobId: jobId ?? '',
//       title: title,
//       description: description,
//       requirements: requirements,
//       salary: salary,
//       experienceLevel: experienceLevel,
//       location: location,
//       jobType: jobType,
//       position: position,
//       company: company,
//       createdBy: createdBy,
//       applications: applications,
//     );
//   }

//   /// ✅ **Convert from `JobEntity`**
//   factory JobApiModel.fromEntity(JobEntity entity) {
//     return JobApiModel(
//       jobId: entity.jobId,
//       title: entity.title,
//       description: entity.description,
//       requirements: entity.requirements,
//       salary: entity.salary,
//       experienceLevel: entity.experienceLevel,
//       location: entity.location,
//       jobType: entity.jobType,
//       position: entity.position,
//       company: entity.company,
//       createdBy: entity.createdBy,
//       applications: entity.applications,
//     );
//   }

//   /// ✅ **Convert a list of `JobApiModel` to a list of `JobEntity`**
//   static List<JobEntity> toEntityList(List<JobApiModel> models) {
//     return models.map((model) => model.toEntity()).toList();
//   }

//   /// ✅ **Convert a list of `JobEntity` to a list of `JobApiModel`**
//   static List<JobApiModel> fromEntityList(List<JobEntity> entities) {
//     return entities.map((entity) => JobApiModel.fromEntity(entity)).toList();
//   }

//   @override
//   List<Object?> get props => [
//         jobId,
//         title,
//         company,
//         location,
//         description,
//         requirements,
//         salary,
//         experienceLevel,
//         jobType,
//         position,
//         createdBy,
//         applications,
//       ];
// }
