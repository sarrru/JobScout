// // import 'package:dartz/dartz.dart';
// // import 'package:job_scout_project/core/error/failure.dart';
// // import 'package:job_scout_project/features/jobs/domain/entity/jobs_entity';
// // import 'package:job_scout_project/features/jobs/domain/entity/jobs_entity.dart';

// // abstract interface class IJobRepository {
// //   /// Get all jobs (accessible by authenticated users)
// //   Future<Either<Failure, List<JobEntity>>> getAllJobs(String token);

// //   /// Get jobs posted by an admin
// //   Future<Either<Failure, List<JobEntity>>> getAdminJobs(String token);

// //   /// Get a specific job by its ID
// //   Future<Either<Failure, JobEntity>> getJobById(String id, String token);

// //   /// Post a new job
// //   Future<Either<Failure, void>> postJob(JobEntity job, String token);
// // }


import 'package:dartz/dartz.dart';
import 'package:job_scout_project/core/error/failure.dart';
import 'package:job_scout_project/features/jobs/domain/entity/jobs_entity.dart';

abstract interface class IJobRepository {
  Future<Either<Failure, List<JobEntity>>> getAllJobs();


  Future<Either<Failure, JobEntity>> getJobById(String jobId);

}