import 'package:dio/dio.dart';
import 'package:job_scout_project/app/constants/api_endpoints.dart';
import 'package:job_scout_project/features/application/data/data_source/application_datasource.dart';
import 'package:job_scout_project/features/application/data/model/application_api_model.dart';
import 'package:job_scout_project/features/application/domain/entity/application_entity.dart';

class ApplicationRemoteDataSource implements IApplicationDataSource {
  final Dio _dio;
  ApplicationRemoteDataSource(this._dio);

  @override
  Future<void> createApplication(
      ApplicationEntity application, String token) async {
    try {
      var applicationApiModel = ApplicationApiModel.fromEntity(application);
      var response = await _dio.post(
        ApiEndpoints.createApplication,
        data: applicationApiModel.toJson(),
        options: Options(
            headers: {'Authorization': 'Bearer $token'}), // Passing auth token
      );

      if (response.statusCode == 201) {
        return;
      } else {
        throw Exception(response.statusMessage);
      }
    } on DioException catch (e) {
      throw Exception(e);
    } catch (e) {
      throw Exception(e);
    }
  }
  
  @override
  Future<void> deleteApplication(String id, String? token) {
    // TODO: implement deleteApplication
    throw UnimplementedError();
  }
  
  @override
  Future<List<ApplicationEntity>> getApplications() {
    // TODO: implement getApplications
    throw UnimplementedError();
  }

  // @override
  // Future<void> deleteApplication(String id, String? token) async {
  //   try {
  //     var response = await _dio.delete(
  //       '${ApiEndpoints.deleteApplication}/$id',
  //       options: Options(headers: {'Authorization': 'Bearer $token'}),
  //     );

  //     if (response.statusCode == 200) {
  //       return;
  //     } else {
  //       throw Exception(response.statusMessage);
  //     }
  //   } on DioException catch (e) {
  //     throw Exception(e);
  //   } catch (e) {
  //     throw Exception(e);
  //   }
  // }

  // @override
  // Future<List<ApplicationEntity>> getApplications() async {
  //   try {
  //     var response = await _dio.get(ApiEndpoints.getApplications);

  //     if (response.statusCode == 200) {
  //       List<dynamic> data = response.data;
  //       return data
  //           .map((json) => ApplicationApiModel.fromJson(json).toEntity())
  //           .toList();
  //     } else {
  //       throw Exception(response.statusMessage);
  //     }
  //   } on DioException catch (e) {
  //     throw Exception(e);
  //   } catch (e) {
  //     throw Exception(e);
  //   }
  // }
}