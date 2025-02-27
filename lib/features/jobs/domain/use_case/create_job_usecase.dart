// import 'package:dartz/dartz.dart';
// import 'package:equatable/equatable.dart';
// import 'package:job_scout_project/app/shared_prefs/token_shared_prefs.dart';
// import 'package:job_scout_project/app/usecase/usecase.dart';
// import 'package:job_scout_project/core/error/failure.dart';
// import 'package:job_scout_project/features/jobs/domain/entity/jobs_entity';
// import 'package:job_scout_project/features/jobs/domain/repository/jobs_repository.dart';


// /// **Data Transfer Object (DTO) for Creating a Job**
// class CreateJobParams extends Equatable {
//   final String title;
//   final String description;
//   final List<String> requirements;
//   final double salary;
//   final int experienceLevel;
//   final String location;
//   final String jobType;
//   final int position;
//   final String companyId;
//   final String createdBy;

//   /// **Constructor**
//   const CreateJobParams({
//     required this.title,
//     required this.description,
//     required this.requirements,
//     required this.salary,
//     required this.experienceLevel,
//     required this.location,
//     required this.jobType,
//     required this.position,
//     required this.companyId,
//     required this.createdBy,
//   });

//   /// **Empty Constructor with Default Values**
//   const CreateJobParams.empty()
//       : title = '',
//         description = '',
//         requirements = const [],
//         salary = 0.0,
//         experienceLevel = 0,
//         location = '',
//         jobType = '',
//         position = 0,
//         companyId = '',
//         createdBy = '';

//   @override
//   List<Object?> get props => [
//         title,
//         description,
//         requirements,
//         salary,
//         experienceLevel,
//         location,
//         jobType,
//         position,
//         companyId,
//         createdBy,
//       ];
// }

// /// **Use Case: Create Job**
// class CreateJobUseCase implements UsecaseWithParams<void, CreateJobParams> {
//   final IJobRepository jobRepository;
//   final TokenSharedPrefs tokenSharedPrefs; // ✅ Inject Token Shared Prefs

//   /// **Constructor**
//   CreateJobUseCase({
//     required this.jobRepository,
//     required this.tokenSharedPrefs,
//   });

//   @override
//   Future<Either<Failure, void>> call(CreateJobParams params) async {
//     // ✅ Get token from Shared Preferences
//     final tokenResult = await tokenSharedPrefs.getToken();

//     return tokenResult.fold(
//       (failure) => Left(failure), // ✅ Handle token retrieval failure
//       (token) async {
//         if (token.isEmpty) {
//           return Left(ApiFailure(message: "Authentication token is missing"));
//         }

//         return await jobRepository.postJob(
//           JobEntity(
//             title: params.title,
//             description: params.description,
//             requirements: params.requirements,
//             salary: params.salary,
//             experienceLevel: params.experienceLevel,
//             location: params.location,
//             jobType: params.jobType,
//             position: params.position,
//             companyId: params.companyId,
//             createdBy: params.createdBy,
//           ),
//           token, // ✅ Pass token to repository
//         );
//       },
//     );
//   }
// }
