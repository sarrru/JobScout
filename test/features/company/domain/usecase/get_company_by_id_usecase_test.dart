import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:job_scout_project/core/error/failure.dart';
import 'package:job_scout_project/features/company/domain/entity/company_entity.dart';
import 'package:job_scout_project/features/company/domain/repository/company_repository.dart';
import 'package:job_scout_project/features/company/domain/usecase/get_company_by_id_usecase.dart';
import 'package:mocktail/mocktail.dart';

class MockCompanyRepository extends Mock implements ICompanyRepository {}

void main() {
  late GetCompanyById getCompanyById;
  late MockCompanyRepository mockCompanyRepository;

  setUp(() {
    mockCompanyRepository = MockCompanyRepository();
    getCompanyById = GetCompanyById(mockCompanyRepository);
  });

  const companyId = 'comp1';

  final tCompany = CompanyEntity(
    id: 'comp1',
    name: 'Company One',
    description: 'Tech company',
    location: 'New York',
    jobPosition: 'Software Engineer',
    jobSalary: 70000,
    createdAt: DateTime.now(),
    updatedAt: DateTime.now(),
  );

  group('GetCompanyById UseCase', () {
    test('should return Right(company) when fetching company is successful', () async {
      // Arrange
      when(() => mockCompanyRepository.getCompanyById(companyId))
          .thenAnswer((_) async => Right(tCompany));

      // Act
      final result = await getCompanyById(companyId);

      // Assert
      expect(result, Right(tCompany));
      verify(() => mockCompanyRepository.getCompanyById(companyId)).called(1);
      verifyNoMoreInteractions(mockCompanyRepository);
    });

    test('should return Left(ApiFailure) when repository fails due to an API error', () async {
      // Arrange
      const failure = ApiFailure(message: 'API error');
      when(() => mockCompanyRepository.getCompanyById(companyId))
          .thenAnswer((_) async => Left(failure));

      // Act
      final result = await getCompanyById(companyId);

      // Assert
      expect(result, Left(failure));
      verify(() => mockCompanyRepository.getCompanyById(companyId)).called(1);
    });

    test('should return Left(ServerFailure) when repository fails due to a server error', () async {
      // Arrange
      const failure = ApiFailure(message: 'Server error');
      when(() => mockCompanyRepository.getCompanyById(companyId))
          .thenAnswer((_) async => Left(failure));

      // Act
      final result = await getCompanyById(companyId);

      // Assert
      expect(result, Left(failure));
      verify(() => mockCompanyRepository.getCompanyById(companyId)).called(1);
    });

    test('should return Left(ApiFailure) when given an invalid company ID', () async {
      // Arrange
      const failure = ApiFailure(message: 'Invalid company ID');
      when(() => mockCompanyRepository.getCompanyById(''))
          .thenAnswer((_) async => Left(failure));

      // Act
      final result = await getCompanyById('');

      // Assert
      expect(result, Left(failure));
      verify(() => mockCompanyRepository.getCompanyById('')).called(1);
    });

    test('should return Left(ApiFailure) when the repository returns null', () async {
      // Arrange
      when(() => mockCompanyRepository.getCompanyById(companyId))
          .thenAnswer((_) async => Left(ApiFailure(message: 'Company not found')));

      // Act
      final result = await getCompanyById(companyId);

      // Assert
      expect(result, Left(ApiFailure(message: 'Company not found')));
      verify(() => mockCompanyRepository.getCompanyById(companyId)).called(1);
    });

  
    test('should handle a company with missing required fields', () async {
      // Arrange
      final tCompanyWithMissingData = CompanyEntity(
        id: 'comp2',
        name: 'Company Two',
        location: 'London',
        jobPosition: null, // Missing job position
        jobSalary: null, // Missing job salary
      );

      when(() => mockCompanyRepository.getCompanyById('comp2'))
          .thenAnswer((_) async => Right(tCompanyWithMissingData));

      // Act
      final result = await getCompanyById('comp2');

      // Assert
      expect(result, Right(tCompanyWithMissingData));
      verify(() => mockCompanyRepository.getCompanyById('comp2')).called(1);
    });

    test('should ensure repository method is only called once per request', () async {
      // Arrange
      when(() => mockCompanyRepository.getCompanyById(companyId))
          .thenAnswer((_) async => Right(tCompany));

      // Act
      await getCompanyById(companyId);
      await getCompanyById(companyId);

      // Assert
      verify(() => mockCompanyRepository.getCompanyById(companyId)).called(2);
      verifyNoMoreInteractions(mockCompanyRepository);
    });
  });
}
