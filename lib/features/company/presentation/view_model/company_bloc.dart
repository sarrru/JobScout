// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:dartz/dartz.dart';
// import 'package:job_scout_project/core/error/failure.dart';
// import 'package:job_scout_project/features/company/domain/entity/company_entity.dart';
// import 'package:job_scout_project/features/company/domain/usecase/get_all_company_usecase.dart';
// import 'company_event.dart';
// import 'company_state.dart';

// class CompanyBloc extends Bloc<CompanyEvent, CompanyState> {
//   final GetAllCompany _getAllCompany;

//   CompanyBloc({required GetAllCompany getAllCompany})
//       : _getAllCompany = getAllCompany,
//         super(CompanyState.initial()) {
//     on<FetchAllCompanies>(_fetchAllCompanies);
//   }

//   Future<void> _fetchAllCompanies(
//       FetchAllCompanies event, Emitter<CompanyState> emit) async {
//     emit(state.copyWith(isLoading: true, error: null));

//     final Either<Failure, List<CompanyEntity>> result = await _getAllCompany();

//     result.fold(
//       (failure) => emit(
//           state.copyWith(isLoading: false, error: 'Failed to load companies.')),
//       (companies) => emit(
//           state.copyWith(isLoading: false, error: null, companies: companies)),
//     );
//   }
// }
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:job_scout_project/core/error/failure.dart';
import 'package:job_scout_project/features/company/domain/entity/company_entity.dart';
import 'package:job_scout_project/features/company/domain/usecase/get_all_company_usecase.dart';
import 'package:job_scout_project/features/company/domain/usecase/get_company_by_id_usecase.dart';
import 'company_event.dart';
import 'company_state.dart';

class CompanyBloc extends Bloc<CompanyEvent, CompanyState> {
  final GetAllCompany _getAllCompany;
  final GetCompanyById _getCompanyById; // ✅ Added Use Case

  CompanyBloc(
      {required GetAllCompany getAllCompany,
      required GetCompanyById getCompanyById})
      : _getAllCompany = getAllCompany,
        _getCompanyById = getCompanyById,
        super(CompanyState.initial()) {
    on<FetchAllCompanies>(_fetchAllCompanies);
    on<FetchCompanyById>(_fetchCompanyById); // ✅ Added Handler
  }

  Future<void> _fetchAllCompanies(
      FetchAllCompanies event, Emitter<CompanyState> emit) async {
    emit(state.copyWith(isLoading: true, error: null));
    final Either<Failure, List<CompanyEntity>> result = await _getAllCompany();
    result.fold(
      (failure) => emit(
          state.copyWith(isLoading: false, error: 'Failed to load companies.')),
      (companies) => emit(
          state.copyWith(isLoading: false, error: null, companies: companies)),
    );
  }

  Future<void> _fetchCompanyById(
      FetchCompanyById event, Emitter<CompanyState> emit) async {
    emit(state.copyWith(isLoading: true, error: null));
    final Either<Failure, CompanyEntity> result =
        await _getCompanyById(event.companyId);
    result.fold(
      (failure) => emit(
          state.copyWith(isLoading: false, error: 'Failed to load company.')),
      (company) => emit(state.copyWith(
          isLoading: false, error: null, selectedCompany: company)),
    );
  }
}
