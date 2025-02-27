import 'package:job_scout_project/features/company/domain/entity/company_entity.dart';
import 'package:job_scout_project/features/company/domain/usecase/get_all_company_usecase.dart';

abstract interface class ICompanyDataSource {
  Future<List<CompanyEntity>> getAllCompany();
  Future<void> createCompany(CompanyEntity company, String token);
  Future<void> deleteCompany(String id, String? token);
}
