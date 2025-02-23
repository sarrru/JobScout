
// import 'package:job_scout_project/core/error/failure.dart';
// import 'package:job_scout_project/core/network/hive_service.dart';
// import 'package:job_scout_project/features/jobs/data/model/jobs_hive_model.dart';
// import 'package:job_scout_project/features/jobs/domain/entity/jobs_entity';


// abstract class IJobLocalDataSource {
//   Future<List<JobEntity>> getAllJobs();
//   Future<JobEntity> getJobById(String jobId);
// }

// class JobLocalDataSource implements IJobLocalDataSource {
//   final HiveService _hiveService;

//   JobLocalDataSource({required HiveService hiveService})
//       : _hiveService = hiveService;

//   @override
//   Future<List<JobEntity>> getAllJobs() async {
//     try {
//       final jobHiveModelList = await _hiveService.getAllJobs();
//       return JobHiveModel.toEntityList(jobHiveModelList);
//     } catch (e) {
//       throw LocalDatabaseFailure(message: e.toString());
//     }
//   }

//   @override
//   Future<JobEntity> getJobById(String jobId) async {
//     try {
//       final jobHiveModel = await _hiveService.getJobById(jobId);
//       if (jobHiveModel == null) {
//         throw LocalDatabaseFailure(message: "Job not found");
//       }
//       return jobHiveModel.toEntity();
//     } catch (e) {
//       throw LocalDatabaseFailure(message: e.toString());
//     }
//   }
// }
