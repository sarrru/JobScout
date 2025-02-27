// // import 'package:dartz/dartz.dart';
// // import 'package:job_scout_project/app/usecase/usecase.dart';
// // import 'package:job_scout_project/core/error/failure.dart';
// // import 'package:job_scout_project/features/jobs/domain/entity/jobs_entity';
// // import 'package:job_scout_project/features/jobs/domain/repository/jobs_repository.dart';

// // class GetAllJobUseCase implements UsecaseWithoutParams<List<JobEntity>> {
// //   final IJobRepository jobRepository;

// //   GetAllJobUseCase({required this.jobRepository});

// //   @override
// //   Future<Either<Failure, List<JobEntity>>> call() {
// //     return jobRepository.getAllJobs();
// //   }
// // }

import 'package:dartz/dartz.dart';
import 'package:job_scout_project/app/usecase/usecase.dart';
import 'package:job_scout_project/core/error/failure.dart';
import 'package:job_scout_project/features/jobs/data/model/job_api_model.dart';


import 'package:job_scout_project/features/jobs/domain/entity/jobs_entity.dart';
import 'package:job_scout_project/features/jobs/domain/repository/jobs_repository.dart';

class GetAllJobs implements UsecaseWithoutParams<List<JobEntity>> {
  final IJobRepository repository;

  GetAllJobs(this.repository);

  List<JobApiModel> get data => data;

  @override
  Future<Either<Failure, List<JobEntity>>> call() async {
    return await repository.getAllJobs();
  }
}