// import 'package:equatable/equatable.dart';

// abstract class CompanyEvent extends Equatable {
//   const CompanyEvent();

//   @override
//   List<Object?> get props => [];
// }

// class FetchAllCompanies extends CompanyEvent {
//   const FetchAllCompanies();
// }
import 'package:equatable/equatable.dart';

abstract class CompanyEvent extends Equatable {
  const CompanyEvent();
  @override
  List<Object?> get props => [];
}

class FetchAllCompanies extends CompanyEvent {
  const FetchAllCompanies();
}

class FetchCompanyById extends CompanyEvent {
  final String companyId;
  const FetchCompanyById(this.companyId);
  @override
  List<Object?> get props => [companyId];
}
