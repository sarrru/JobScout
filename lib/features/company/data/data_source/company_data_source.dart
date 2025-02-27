


import 'package:job_scout_project/features/company/domain/entity/company_entity.dart';

abstract interface class ICompanyDataSource {
  Future<List<CompanyEntity>> getCompanies();
  Future<void> createCompany(CompanyEntity company, String token);
  Future<void> deleteCompany(String id, String? token);
}
