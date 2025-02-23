// import 'package:dio/dio.dart';
// import 'package:job_scout_project/features/jobs/data/data_source/jobs_data_source.dart';
// import 'package:job_scout_project/features/jobs/data/model/jobs_api_model.dart';

// class JobRemoteDataSourceImpl implements IJobRemoteDataSource {
//   final Dio dio;
//   final String baseUrl;

//   JobRemoteDataSourceImpl({required this.dio, required this.baseUrl});

//   /// **Fetch All Jobs**
//   @override
//   Future<List<JobApiModel>> getAllJobs() async {
//     try {
//       final response = await dio.get('$baseUrl/job/get');

//       if (response.statusCode == 200 && response.data != null) {
//         final List<dynamic> jsonData = response.data;
//         return jsonData.map((e) => JobApiModel.fromJson(e)).toList();
//       } else {
//         throw Exception('Failed to load jobs: ${response.statusCode}');
//       }
//     } on DioException catch (e) {
//       throw Exception(
//           "Dio Error: ${e.response?.statusCode ?? 'Unknown'} - ${e.message}");
//     }
//   }

//   /// **Fetch a Single Job by ID**
//   @override
//   Future<JobApiModel> getJobById(String jobId) async {
//     try {
//       final response = await dio.get('$baseUrl/job/$jobId');

//       if (response.statusCode == 200 && response.data != null) {
//         return JobApiModel.fromJson(response.data);
//       } else {
//         throw Exception('Failed to load job: ${response.statusCode}');
//       }
//     } on DioException catch (e) {
//       throw Exception(
//           "Dio Error: ${e.response?.statusCode ?? 'Unknown'} - ${e.message}");
//     }
//   }

//   /// **Create a New Job**
//   @override
//   Future<void> createJob(JobApiModel job) async {
//     try {
//       final response = await dio.post(
//         '$baseUrl/job/create',
//         data: job.toJson(),
//       );

//       if (response.statusCode != 201) {
//         throw Exception('Failed to create job: ${response.statusCode}');
//       }
//     } on DioException catch (e) {
//       throw Exception(
//           "Dio Error: ${e.response?.statusCode ?? 'Unknown'} - ${e.message}");
//     }
//   }

//   /// **Update an Existing Job**
//   @override
//   Future<void> updateJob(JobApiModel job) async {
//     try {
//       final response = await dio.put(
//         '$baseUrl/job/update/${job.jobId}',
//         data: job.toJson(),
//       );

//       if (response.statusCode != 200) {
//         throw Exception('Failed to update job: ${response.statusCode}');
//       }
//     } on DioException catch (e) {
//       throw Exception(
//           "Dio Error: ${e.response?.statusCode ?? 'Unknown'} - ${e.message}");
//     }
//   }

//   /// **Delete a Job**
//   @override
//   Future<void> deleteJob(String jobId) async {
//     try {
//       final response = await dio.delete('$baseUrl/job/delete/$jobId');

//       if (response.statusCode != 200) {
//         throw Exception('Failed to delete job: ${response.statusCode}');
//       }
//     } on DioException catch (e) {
//       throw Exception(
//           "Dio Error: ${e.response?.statusCode ?? 'Unknown'} - ${e.message}");
//     }
//   }
// }
