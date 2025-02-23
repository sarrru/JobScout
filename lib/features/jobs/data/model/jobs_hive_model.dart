// import 'package:equatable/equatable.dart';
// import 'package:hive_flutter/adapters.dart';
// import 'package:job_scout_project/app/constants/hive_table_constant.dart';
// import 'package:job_scout_project/features/jobs/domain/entity/jobs_entity';
// import 'package:uuid/uuid.dart';

// part 'jobs_hive_model.g.dart';

// @HiveType(
//     typeId: HiveTableConstant
//         .jobTableId) // ✅ Ensure `HiveTableConstant` has `jobTableId`
// class JobHiveModel extends Equatable {
//   @HiveField(0)
//   final String jobId;
//   @HiveField(1)
//   final String title;
//   @HiveField(2)
//   final String companyId;
//   @HiveField(3)
//   final String location;
//   @HiveField(4)
//   final String description;
//   @HiveField(5)
//   final List<String> requirements;
//   @HiveField(6)
//   final double salary;
//   @HiveField(7)
//   final int experienceLevel;
//   @HiveField(8)
//   final String jobType;
//   @HiveField(9)
//   final int position;
//   @HiveField(10)
//   final String createdBy;
//   @HiveField(11)
//   final List<String> applications;

//   JobHiveModel({
//     String? jobId,
//     required this.title,
//     required this.companyId,
//     required this.location,
//     required this.description,
//     required this.requirements,
//     required this.salary,
//     required this.experienceLevel,
//     required this.jobType,
//     required this.position,
//     required this.createdBy,
//     required this.applications,
//   }) : jobId = jobId ?? const Uuid().v4();

//   /// ✅ **Initial Constructor**
//   const JobHiveModel.initial()
//       : jobId = '',
//         title = '',
//         companyId = '',
//         location = '',
//         description = '',
//         requirements = const [],
//         salary = 0.0,
//         experienceLevel = 0,
//         jobType = '',
//         position = 0,
//         createdBy = '',
//         applications = const [];

//   /// ✅ **Convert from `JobEntity`**
//   factory JobHiveModel.fromEntity(JobEntity entity) {
//     return JobHiveModel(
//       jobId: entity.jobId,
//       title: entity.title,
//       companyId: entity.company,
//       location: entity.location,
//       description: entity.description,
//       requirements: entity.requirements,
//       salary: entity.salary,
//       experienceLevel: entity.experienceLevel,
//       jobType: entity.jobType,
//       position: entity.position,
//       createdBy: entity.createdBy,
//       applications: entity.applications,
//     );
//   }

//   /// ✅ **Convert to `JobEntity`**
//   JobEntity toEntity() {
//     return JobEntity(
//       jobId: jobId,
//       title: title,
//       company: companyId,
//       location: location,
//       description: description,
//       requirements: requirements,
//       salary: salary,
//       experienceLevel: experienceLevel,
//       jobType: jobType,
//       position: position,
//       createdBy: createdBy,
//       applications: applications,
//     );
//   }

//   /// ✅ **Convert a list of `JobHiveModel` to a list of `JobEntity`**
//   static List<JobEntity> toEntityList(List<JobHiveModel> entityList) {
//     return entityList.map((data) => data.toEntity()).toList();
//   }

//   /// ✅ **Convert a list of `JobEntity` to a list of `JobHiveModel`**
//   static List<JobHiveModel> fromEntityList(List<JobEntity> entityList) {
//     return entityList.map((entity) => JobHiveModel.fromEntity(entity)).toList();
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
