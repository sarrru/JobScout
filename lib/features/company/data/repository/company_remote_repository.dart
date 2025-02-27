import 'package:dartz/dartz.dart';
import 'package:job_scout_project/core/error/failure.dart';
import 'package:job_scout_project/features/company/data/data_source/remote_datasource/company_remote_datasource.dart';
import 'package:job_scout_project/features/company/domain/entity/company_entity.dart';
import 'package:job_scout_project/features/company/domain/repository/company_repository.dart';

class CompanyRemoteRepository implements ICompanyRepository {
  final CompanyRemoteDataSource _companyRemoteDataSource;

  CompanyRemoteRepository(this._companyRemoteDataSource);

  @override
  Future<Either<Failure, List<CompanyEntity>>> getAllCompany() async {
    try {
      final companies = await _companyRemoteDataSource.getAllCompany();
      return Right(companies);
    } catch (e) {
      return Left(ApiFailure(
        message: "Failed to fetch company list.",
      ));
    }
  }

  @override
  Future<Either<Failure, CompanyEntity>> getCompanyById(String id) async {
    try {
      final companyResponse = await _companyRemoteDataSource.getCompanyById(id);

      // Convert CompanyApiModel to CompanyEntity before returning
      final CompanyEntity company = companyResponse.toEntity();

      return Right(company);
    } catch (e) {
      return Left(ApiFailure(message: "Failed to fetch company details."));
    }
  }
}
