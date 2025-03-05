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
