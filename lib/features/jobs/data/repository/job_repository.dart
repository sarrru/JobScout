// import 'package:dartz/dartz.dart';
// import 'package:job_scout_project/core/error/failure.dart';
// import 'package:job_scout_project/features/jobs/data/data_source/remote_datasource/jobs_remote_datasource.dart';
// import 'package:job_scout_project/features/jobs/domain/entity/jobs_entity';
// import 'package:job_scout_project/features/jobs/domain/repository/jobs_repository.dart';

// class JobRepositoryImpl implements IJobRepository {
//   final JobRemoteDataSourceImpl remoteDataSource;

//   JobRepositoryImpl({required this.remoteDataSource});

//   @override
//   Future<Either<Failure, List<JobEntity>>> getAllJobs() async {
//     try {
//       final jobs = await remoteDataSource.getAllJobs();
//       return Right(jobs.map((job) => job.toEntity()).toList());
//     } catch (e) {
//       return Left(ApiFailure(message: ''));
//     }
//   }

//   @override
//   Future<Either<Failure, JobEntity>> getJobById(String jobId) async {
//     try {
//       final job = await remoteDataSource.getJobById(jobId);
//       return Right(job.toEntity());
//     } catch (e) {
//       return Left(ApiFailure(message: ''));
//     }
//   }
// }
