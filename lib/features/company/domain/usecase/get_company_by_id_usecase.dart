import 'package:dartz/dartz.dart';
import 'package:job_scout_project/core/error/failure.dart';
import 'package:job_scout_project/features/company/domain/entity/company_entity.dart';
import 'package:job_scout_project/features/company/domain/repository/company_repository.dart';

class GetCompanyById {
  final ICompanyRepository repository;

  GetCompanyById(this.repository);

  Future<Either<Failure, CompanyEntity>> call(String companyId) async {
    return await repository.getCompanyById(companyId);
  }
}