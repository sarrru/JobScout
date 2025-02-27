// import 'package:dartz/dartz.dart';
// import 'package:equatable/equatable.dart';
// import 'package:job_scout_project/app/shared_prefs/token_shared_prefs.dart';
// import 'package:job_scout_project/app/usecase/usecase.dart';
// import 'package:job_scout_project/core/error/failure.dart';
// import 'package:job_scout_project/features/jobs/domain/entity/jobs_entity';
// import 'package:job_scout_project/features/jobs/domain/entity/jobs_entity.dart';
// import 'package:job_scout_project/features/jobs/domain/repository/jobs_repository.dart';


// /// **DTO for Getting a Job by ID**
// class GetJobByIdParams extends Equatable {
//   final String jobId;

//   const GetJobByIdParams({required this.jobId});

//   @override
//   List<Object> get props => [jobId];
// }

// /// **Use Case: Get Job By ID**
// class GetJobByIdUseCase implements UsecaseWithParams<JobEntity, GetJobByIdParams> {
//   final IJobRepository jobRepository;
//   final TokenSharedPrefs tokenSharedPrefs;

//   GetJobByIdUseCase({
//     required this.jobRepository,
//     required this.tokenSharedPrefs,
//   });

//   @override
//   Future<Either<Failure, JobEntity>> call(GetJobByIdParams params) async {
//     final tokenResult = await tokenSharedPrefs.getToken();

//     return tokenResult.fold(
//       (failure) => Left(failure),
//       (token) async {
//         if (token.isEmpty) {
//           return Left(ApiFailure(message: "Authentication token is missing"));
//         }
//         return await jobRepository.getJobById(params.jobId, token);
//       },
//     );
//   }
// }
import 'package:dartz/dartz.dart';
import 'package:job_scout_project/core/error/failure.dart';
import 'package:job_scout_project/features/jobs/domain/entity/jobs_entity.dart';
import 'package:job_scout_project/features/jobs/domain/repository/jobs_repository.dart';

class GetJobById  {
  final IJobRepository repository;

  GetJobById(this.repository);

  Future<Either<Failure, JobEntity>> call(String jobId) async {
    return await repository.getJobById(jobId);
  }
}
