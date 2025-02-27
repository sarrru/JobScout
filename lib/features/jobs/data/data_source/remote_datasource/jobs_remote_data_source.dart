import 'package:dio/dio.dart';
import 'package:job_scout_project/app/constants/api_endpoints.dart';
import 'package:job_scout_project/features/jobs/data/data_source/jobs_data_source.dart';
import 'package:job_scout_project/features/jobs/data/dto/get_all_job_dto.dart';
import 'package:job_scout_project/features/jobs/data/model/job_api_model.dart';
import 'package:job_scout_project/features/jobs/domain/entity/jobs_entity.dart';
import 'package:job_scout_project/features/jobs/domain/use_case/get_all_jobs_usecase.dart';

class JobsRemoteDataSource implements IJobDataSource {
  final Dio _dio;

  JobsRemoteDataSource(
    Dio dio,
  ) : _dio = dio;

  @override
  Future<List<JobEntity>> getAllJobs() async {
    try {
      var response = await _dio.get(ApiEndpoints.getAllJobs);
      if (response.statusCode == 200) {
        GetAllJobs job = GetAllJobsDto.fromJson(response.data) as GetAllJobs;
        return JobApiModel.toEntityList(job.data);
      } else {
        throw Exception("Failed to fetch movies: ${response.statusMessage}");
      }
    } on DioException catch (e) {
      throw Exception(
          e.response?.statusMessage ?? e.message ?? "Unknown Dio error");
    } catch (e) {
      throw Exception("Unexpected error: ${e.toString()}");
    }
  }

  @override
  Future<JobEntity> getJobById(String jobId) async {
    try {
      var response = await _dio.get("${ApiEndpoints.getJobById}/$jobId");
      if (response.statusCode == 200) {
        JobApiModel movieApiModel = JobApiModel.fromJson(response.data);
        return movieApiModel.toEntity();
      } else {
        throw Exception(
            "Failed to fetch movie details: ${response.statusMessage}");
      }
    } on DioException catch (e) {
      throw Exception(
          e.response?.statusMessage ?? e.message ?? "Unknown Dio error");
    } catch (e) {
      throw Exception("Unexpected error: ${e.toString()}");
    }
  }
}
