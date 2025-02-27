


// import 'package:job_scout_project/features/company/domain/entity/company_entity.dart';

// class CompanyState {
//   final bool isLoading;
//   final String? error;
//   final List<CompanyEntity> companies;

//   CompanyState({required this.isLoading, this.error, required this.companies});

//   factory CompanyState.initial() {
//     return CompanyState(isLoading: false, error: null, companies: []);
//   }

//   CompanyState copyWith({bool? isLoading, String? error, List<CompanyEntity>? companies}) {
//     return CompanyState(
//       isLoading: isLoading ?? this.isLoading,
//       error: error,
//       companies: companies ?? this.companies,
//     );
//   }
// }
import 'package:equatable/equatable.dart';
import 'package:job_scout_project/features/company/domain/entity/company_entity.dart';

class CompanyState extends Equatable {
  final bool isLoading;
  final String? error;
  final List<CompanyEntity> companies;
  final CompanyEntity? selectedCompany; // ✅ Added for Get By ID

  const CompanyState({
    required this.isLoading,
    this.error,
    required this.companies,
    this.selectedCompany, // ✅ Add Selected Company for Company By ID
  });

  /// **Initial State**
  factory CompanyState.initial() {
    return const CompanyState(
      isLoading: false,
      error: null,
      companies: [],
      selectedCompany: null, // ✅ Initially No Company Selected
    );
  }

  /// **CopyWith Method to Update State**
  CompanyState copyWith({
    bool? isLoading,
    String? error,
    List<CompanyEntity>? companies,
    CompanyEntity? selectedCompany, // ✅ Added Selected Company
  }) {
    return CompanyState(
      isLoading: isLoading ?? this.isLoading,
      error: error,
      companies: companies ?? this.companies,
      selectedCompany: selectedCompany ?? this.selectedCompany, // ✅ Updated
    );
  }

  @override
  List<Object?> get props => [isLoading, error, companies, selectedCompany]; // ✅ Updated
}
