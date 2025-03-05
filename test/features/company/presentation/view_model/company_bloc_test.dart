import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:job_scout_project/core/error/failure.dart';
import 'package:job_scout_project/features/company/domain/entity/company_entity.dart';
import 'package:job_scout_project/features/company/domain/usecase/get_all_company_usecase.dart';
import 'package:job_scout_project/features/company/domain/usecase/get_company_by_id_usecase.dart';
import 'package:job_scout_project/features/company/presentation/view_model/company_bloc.dart';
import 'package:job_scout_project/features/company/presentation/view_model/company_event.dart';
import 'package:job_scout_project/features/company/presentation/view_model/company_state.dart';
import 'package:mocktail/mocktail.dart';

class MockGetAllCompany extends Mock implements GetAllCompany {}

class MockGetCompanyById extends Mock implements GetCompanyById {}

void main() {
  late MockGetAllCompany mockGetAllCompany;
  late MockGetCompanyById mockGetCompanyById;
  late CompanyBloc companyBloc;

  setUp(() {
    mockGetAllCompany = MockGetAllCompany();
    mockGetCompanyById = MockGetCompanyById();
    companyBloc = CompanyBloc(
      getAllCompany: mockGetAllCompany,
      getCompanyById: mockGetCompanyById,
    );
  });

  tearDown(() {
    companyBloc.close();
  });

  final tCompany1 = CompanyEntity(
    id: 'comp1',
    name: 'Company One',
    description: 'Tech company',
    location: 'New York',
    jobPosition: 'Software Engineer',
    jobSalary: 70000,
    createdAt: DateTime.now(),
    updatedAt: DateTime.now(),
  );

  final tCompany2 = CompanyEntity(
    id: 'comp2',
    name: 'Company Two',
    description: 'Finance company',
    location: 'London',
    jobPosition: 'Financial Analyst',
    jobSalary: 80000,
    createdAt: DateTime.now(),
    updatedAt: DateTime.now(),
  );

  final tCompanies = [tCompany1, tCompany2];

  group('CompanyBloc', () {
    test('initial state should be CompanyState.initial()', () {
      expect(companyBloc.state, CompanyState.initial());
    });

    blocTest<CompanyBloc, CompanyState>(
      'emits [isLoading: true, companies: fetched list, isLoading: false] when FetchAllCompanies is successful',
      build: () {
        when(() => mockGetAllCompany())
            .thenAnswer((_) async => Right(tCompanies));
        return companyBloc;
      },
      act: (bloc) => bloc.add(const FetchAllCompanies()),
      expect: () => [
        CompanyState.initial().copyWith(isLoading: true),
        CompanyState.initial().copyWith(isLoading: false, companies: tCompanies),
      ],
      verify: (_) {
        verify(() => mockGetAllCompany()).called(1);
      },
    );

    blocTest<CompanyBloc, CompanyState>(
      'emits [isLoading: true, error: error message, isLoading: false] when FetchAllCompanies fails',
      build: () {
        when(() => mockGetAllCompany()).thenAnswer(
            (_) async => Left(ApiFailure(message: 'Failed to load companies')));
        return companyBloc;
      },
      act: (bloc) => bloc.add(const FetchAllCompanies()),
      expect: () => [
        CompanyState.initial().copyWith(isLoading: true),
        CompanyState.initial().copyWith(isLoading: false, error: 'Failed to load companies.'),
      ],
      verify: (_) {
        verify(() => mockGetAllCompany()).called(1);
      },
    );

    blocTest<CompanyBloc, CompanyState>(
      'emits [isLoading: true, selectedCompany: company, isLoading: false] when FetchCompanyById is successful',
      build: () {
        when(() => mockGetCompanyById('comp1'))
            .thenAnswer((_) async => Right(tCompany1));
        return companyBloc;
      },
      act: (bloc) => bloc.add(const FetchCompanyById('comp1')),
      expect: () => [
        CompanyState.initial().copyWith(isLoading: true),
        CompanyState.initial().copyWith(isLoading: false, selectedCompany: tCompany1),
      ],
      verify: (_) {
        verify(() => mockGetCompanyById('comp1')).called(1);
      },
    );

    blocTest<CompanyBloc, CompanyState>(
      'emits [isLoading: true, error: error message, isLoading: false] when FetchCompanyById fails',
      build: () {
        when(() => mockGetCompanyById('comp1')).thenAnswer(
            (_) async => Left(ApiFailure(message: 'Failed to load company')));
        return companyBloc;
      },
      act: (bloc) => bloc.add(const FetchCompanyById('comp1')),
      expect: () => [
        CompanyState.initial().copyWith(isLoading: true),
        CompanyState.initial().copyWith(isLoading: false, error: 'Failed to load company.'),
      ],
      verify: (_) {
        verify(() => mockGetCompanyById('comp1')).called(1);
      },
    );

    blocTest<CompanyBloc, CompanyState>(
      'emits [isLoading: true, isLoading: false, companies: []] when FetchAllCompanies returns an empty list',
      build: () {
        when(() => mockGetAllCompany())
            .thenAnswer((_) async => const Right([])); // Return an empty list
        return companyBloc;
      },
      act: (bloc) => bloc.add(const FetchAllCompanies()),
      expect: () => [
        CompanyState.initial().copyWith(isLoading: true),
        CompanyState.initial().copyWith(isLoading: false, companies: []),
      ],
      verify: (_) {
        verify(() => mockGetAllCompany()).called(1);
      },
    );

    blocTest<CompanyBloc, CompanyState>(
      'emits [isLoading: true, error: "Invalid ID", isLoading: false] when FetchCompanyById is called with an invalid ID',
      build: () {
        when(() => mockGetCompanyById(''))
            .thenAnswer((_) async => Left(ApiFailure(message: 'Invalid ID')));
        return companyBloc;
      },
      act: (bloc) => bloc.add(const FetchCompanyById('')),
      expect: () => [
        CompanyState.initial().copyWith(isLoading: true),
        CompanyState.initial().copyWith(isLoading: false, error: 'Failed to load company.'),
      ],
      verify: (_) {
        verify(() => mockGetCompanyById('')).called(1);
      },
    );
  });
}
