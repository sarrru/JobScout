import 'package:dartz/dartz.dart';
import 'package:job_scout_project/core/error/failure.dart';
import 'package:job_scout_project/features/jobs/data/data_source/remote_datasource/jobs_remote_datasource.dart';

import 'package:job_scout_project/features/jobs/domain/entity/jobs_entity.dart';
import 'package:job_scout_project/features/jobs/domain/repository/jobs_repository.dart';

class JobRemoteRepository implements IJobRepository {
  final JobsRemoteDataSource _jobRemoteDataSource;

  JobRemoteRepository(this._jobRemoteDataSource);

  @override
  Future<Either<Failure, List<JobEntity>>> getAllJobs() async {
    try {
      final jobs = await _jobRemoteDataSource.getAllJobs();
      return Right(jobs);
    } catch (e) {
      return Left(ApiFailure(message: e.toString()));
    }
  }

  /// *Fetch a specific job by its ID (Remote Call)*
  @override
  Future<Either<Failure, JobEntity>> getJobById(String jobId) async {
    try {
      final job = await _jobRemoteDataSource.getJobById(jobId);
      return Right(job);
    } catch (e) {
      return Left(ApiFailure(
        message: "Failed to fetch job details. Please try again.",
      ));
    }
  }
}