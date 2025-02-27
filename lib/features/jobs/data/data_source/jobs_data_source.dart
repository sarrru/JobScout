import 'package:job_scout_project/features/jobs/domain/entity/jobs_entity.dart';

abstract interface class IJobDataSource {
  /// *Fetch all jobs from the remote API*
  Future<List<JobEntity>> getAllJobs();

  /// *Fetch a single job by ID*
  Future<JobEntity> getJobById(String jobId);
}