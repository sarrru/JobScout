// import 'package:dartz/dartz.dart';
// import 'package:job_scout_project/app/shared_prefs/token_shared_prefs.dart';
// import 'package:job_scout_project/app/usecase/usecase.dart';
// import 'package:job_scout_project/core/error/failure.dart';
// import 'package:job_scout_project/features/jobs/domain/entity/jobs_entity';
// import 'package:job_scout_project/features/jobs/domain/repository/jobs_repository.dart';


// /// **Use Case: Get Admin Jobs**
// class GetAdminJobsUseCase implements UsecaseWithoutParams<List<JobEntity>> {
//   final IJobRepository jobRepository;
//   final TokenSharedPrefs tokenSharedPrefs;

//   GetAdminJobsUseCase({
//     required this.jobRepository,
//     required this.tokenSharedPrefs,
//   });

//   @override
//   Future<Either<Failure, List<JobEntity>>> call() async {
//     final tokenResult = await tokenSharedPrefs.getToken();

//     return tokenResult.fold(
//       (failure) => Left(failure),
//       (token) async {
//         if (token.isEmpty) {
//           return Left(ApiFailure(message: "Authentication token is missing"));
//         }
//         return await jobRepository.getAdminJobs(token);
//       },
//     );
//   }
// }
