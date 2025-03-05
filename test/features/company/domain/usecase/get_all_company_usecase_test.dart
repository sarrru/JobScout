import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:job_scout_project/core/error/failure.dart';
import 'package:job_scout_project/features/company/domain/entity/company_entity.dart';
import 'package:job_scout_project/features/company/domain/repository/company_repository.dart';
import 'package:job_scout_project/features/company/domain/usecase/get_all_company_usecase.dart';
import 'package:mocktail/mocktail.dart';

class MockCompanyRepository extends Mock implements ICompanyRepository {}

void main() {
  late GetAllCompany getAllCompany;
  late MockCompanyRepository mockCompanyRepository;

  setUp(() {
    mockCompanyRepository = MockCompanyRepository();
    getAllCompany = GetAllCompany(mockCompanyRepository);
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

  group('GetAllCompany UseCase', () {
    test('should return Right(companies) when fetching companies is successful', () async {
      // Arrange
      when(() => mockCompanyRepository.getAllCompany())
          .thenAnswer((_) async => Right(tCompanies));

      // Act
      final result = await getAllCompany();

      // Assert
      expect(result, Right(tCompanies));
      verify(() => mockCompanyRepository.getAllCompany()).called(1);
      verifyNoMoreInteractions(mockCompanyRepository);
    });

    test('should return Left(ApiFailure) when repository fails due to an API error', () async {
      // Arrange
      const failure = ApiFailure(message: 'API error');
      when(() => mockCompanyRepository.getAllCompany())
          .thenAnswer((_) async => Left(failure));

      // Act
      final result = await getAllCompany();

      // Assert
      expect(result, Left(failure));
      verify(() => mockCompanyRepository.getAllCompany()).called(1);
      verifyNoMoreInteractions(mockCompanyRepository);
    });

    test('should return Left(ServerFailure) when repository fails due to a server error', () async {
      // Arrange
      const failure = ApiFailure(message: 'Server error');
      when(() => mockCompanyRepository.getAllCompany())
          .thenAnswer((_) async => Left(failure));

      // Act
      final result = await getAllCompany();

      // Assert
      expect(result, Left(failure));
      verify(() => mockCompanyRepository.getAllCompany()).called(1);
    });

    
    test('should return Left(ApiFailure) when repository returns null', () async {
      // Arrange
      when(() => mockCompanyRepository.getAllCompany())
          .thenAnswer((_) async => Left(ApiFailure(message: 'Null data received')));

      // Act
      final result = await getAllCompany();

      // Assert
      expect(result, Left(ApiFailure(message: 'Null data received')));
      verify(() => mockCompanyRepository.getAllCompany()).called(1);
    });

    

    test('should handle very large datasets correctly', () async {
      // Arrange
      final largeCompanyList = List.generate(
          1000,
          (index) => CompanyEntity(
                id: 'comp$index',
                name: 'Company $index',
                description: 'Description $index',
                location: 'City $index',
                jobPosition: 'Position $index',
                jobSalary: 50000 + index,
                createdAt: DateTime.now(),
                updatedAt: DateTime.now(),
              ));

      when(() => mockCompanyRepository.getAllCompany())
          .thenAnswer((_) async => Right(largeCompanyList));

      // Act
      final result = await getAllCompany();

      // Assert
      expect(result, Right(largeCompanyList));
      verify(() => mockCompanyRepository.getAllCompany()).called(1);
    });

    
    test('should ensure repository method is only called once', () async {
      // Arrange
      when(() => mockCompanyRepository.getAllCompany())
          .thenAnswer((_) async => Right(tCompanies));

      // Act
      await getAllCompany();
      await getAllCompany();

      // Assert
      verify(() => mockCompanyRepository.getAllCompany()).called(2);
      verifyNoMoreInteractions(mockCompanyRepository);
    });
  });
}
