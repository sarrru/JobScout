import 'package:dio/dio.dart';
import 'package:job_scout_project/app/constants/api_endpoints.dart';
import 'package:job_scout_project/features/company/data/model/company_api_model.dart';
import 'package:job_scout_project/features/company/domain/entity/company_entity.dart';

class CompanyRemoteDataSource {
  final Dio _dio;
  CompanyRemoteDataSource(this._dio);

  Future<List<CompanyEntity>> getAllCompany() async {
    try {
      var response = await _dio.get(ApiEndpoints.getAllCompany);

      if (response.statusCode == 200) {
        if (response.data is Map<String, dynamic> &&
            response.data['companies'] is List) {
          return (response.data['companies'] as List)
              .map<CompanyEntity>(
                  (json) => CompanyApiModel.fromJson(json).toEntity())
              .toList();
        } else {
          throw Exception("Invalid API response format.");
        }
      } else {
        throw Exception("Failed to fetch companies: ${response.statusMessage}");
      }
    } on DioException catch (e) {
      throw Exception("Dio Error: ${e.response?.statusMessage ?? e.message}");
    } catch (e) {
      throw Exception("Unexpected Error: $e");
    }
  }

  /// *Get Company By ID*
  Future<CompanyApiModel> getCompanyById(String companyId) async {
    try {
      final response = await _dio.get("${ApiEndpoints.getCompanyById}/$companyId");

      if (response.statusCode == 200) {
        return CompanyApiModel.fromJson(response.data['company']);
      } else {
        throw Exception("Failed to fetch company: ${response.statusMessage}");
      }
    } on DioException catch (e) {
      throw Exception("Dio Error: ${e.response?.statusMessage ?? e.message}");
    }
  }
}