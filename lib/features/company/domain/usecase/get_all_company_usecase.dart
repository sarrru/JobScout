import 'package:dartz/dartz.dart';
import 'package:job_scout_project/app/usecase/usecase.dart';
import 'package:job_scout_project/core/error/failure.dart';
import 'package:job_scout_project/features/company/domain/entity/company_entity.dart';
import 'package:job_scout_project/features/company/domain/repository/company_repository.dart';

class GetAllCompany implements UsecaseWithoutParams<List<CompanyEntity>> {
  final ICompanyRepository repository;

  GetAllCompany(this.repository);

  @override
  Future<Either<Failure, List<CompanyEntity>>> call() async {
    return await repository.getAllCompany();
  }
}
