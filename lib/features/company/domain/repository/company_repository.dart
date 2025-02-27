import 'package:dartz/dartz.dart';
import 'package:job_scout_project/core/error/failure.dart';
import 'package:job_scout_project/features/company/domain/entity/company_entity.dart';

abstract interface class ICompanyRepository {
  Future<Either<Failure, List<CompanyEntity>>>
      getAllCompany(); //getallcompanies
  // Future<Either<Failure, void>> createCompany(CompanyEntity company);
  // Future<Either<Failure, void>> deleteCompany(String id);
  Future<Either<Failure, CompanyEntity>> getCompanyById(String companyId);
}