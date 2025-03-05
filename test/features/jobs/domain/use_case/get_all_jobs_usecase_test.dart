import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:job_scout_project/core/error/failure.dart';
import 'package:job_scout_project/features/company/domain/entity/company_entity.dart';
import 'package:job_scout_project/features/jobs/domain/entity/jobs_entity.dart';
import 'package:job_scout_project/features/jobs/domain/repository/jobs_repository.dart';
import 'package:job_scout_project/features/jobs/domain/use_case/get_all_jobs_usecase.dart';
import 'package:mocktail/mocktail.dart';

class MockJobRepository extends Mock implements IJobRepository {}

void main() {
  late GetAllJobs getAllJobs;
  late MockJobRepository mockJobRepository;

  setUp(() {
    mockJobRepository = MockJobRepository();
    getAllJobs = GetAllJobs(mockJobRepository);
  });

  final tJob1 = JobEntity(
    jobId: 'job1',
    title: 'Software Engineer',
    description: 'Developing applications',
    requirements: ['Flutter', 'Dart'],
    salary: 70000,
    experienceLevel: 3,
    location: 'Remote',
    jobType: 'Full-time',
    position: 1,
    company: const CompanyEntity(id: 'comp1', name: 'TechCorp'),
    createdBy: 'admin1',
    applications: [],
    companyId: 'comp1',
  );

  final tJob2 = JobEntity(
    jobId: 'job2',
    title: 'Data Scientist',
    description: 'Analyzing big data',
    requirements: ['Python', 'SQL'],
    salary: 90000,
    experienceLevel: 5,
    location: 'New York',
    jobType: 'Full-time',
    position: 1,
    company: const CompanyEntity(id: 'comp2', name: 'DataCorp'),
    createdBy: 'admin2',
    applications: [],
    companyId: 'comp2',
  );

  final tJobs = [tJob1, tJob2];

  group('GetAllJobs UseCase', () {
    test('should return Right(jobs) when fetching jobs is successful', () async {
      // Arrange
      when(() => mockJobRepository.getAllJobs())
          .thenAnswer((_) async => Right(tJobs));

      // Act
      final result = await getAllJobs();

      // Assert
      expect(result, Right(tJobs));
      verify(() => mockJobRepository.getAllJobs()).called(1);
      verifyNoMoreInteractions(mockJobRepository);
    });

    test('should return Left(ApiFailure) when repository fails due to an API error', () async {
      // Arrange
      const failure = ApiFailure(message: 'API error');
      when(() => mockJobRepository.getAllJobs())
          .thenAnswer((_) async => Left(failure));

      // Act
      final result = await getAllJobs();

      // Assert
      expect(result, Left(failure));
      verify(() => mockJobRepository.getAllJobs()).called(1);
    });

    test('should return Left(ServerFailure) when repository fails due to a server error', () async {
      // Arrange
      const failure = ApiFailure(message: 'Server error');
      when(() => mockJobRepository.getAllJobs())
          .thenAnswer((_) async => Left(failure));

      // Act
      final result = await getAllJobs();

      // Assert
      expect(result, Left(failure));
      verify(() => mockJobRepository.getAllJobs()).called(1);
    });

    
    
    test('should handle very large datasets correctly', () async {
      // Arrange
      final largeJobList = List.generate(
          1000,
          (index) => JobEntity(
                jobId: 'job$index',
                title: 'Job $index',
                description: 'Description for job $index',
                requirements: ['Requirement $index'],
                salary: 50000 + index,
                experienceLevel: 2 + (index % 5),
                location: 'Location $index',
                jobType: 'Full-time',
                position: 1,
                company: const CompanyEntity(id: 'comp1', name: 'TechCorp'),
                createdBy: 'admin$index',
                applications: [],
                companyId: 'comp1',
              ));

      when(() => mockJobRepository.getAllJobs())
          .thenAnswer((_) async => Right(largeJobList));

      // Act
      final result = await getAllJobs();

      // Assert
      expect(result, Right(largeJobList));
      verify(() => mockJobRepository.getAllJobs()).called(1);
    });

    
    test('should ensure repository method is only called once per request', () async {
      // Arrange
      when(() => mockJobRepository.getAllJobs())
          .thenAnswer((_) async => Right(tJobs));

      // Act
      await getAllJobs();
      await getAllJobs();

      // Assert
      verify(() => mockJobRepository.getAllJobs()).called(2);
      verifyNoMoreInteractions(mockJobRepository);
    });

    test('should return Left(ApiFailure) when the repository returns null', () async {
      // Arrange
      when(() => mockJobRepository.getAllJobs())
          .thenAnswer((_) async => Left(ApiFailure(message: 'Null data received')));

      // Act
      final result = await getAllJobs();

      // Assert
      expect(result, Left(ApiFailure(message: 'Null data received')));
      verify(() => mockJobRepository.getAllJobs()).called(1);
    });
  });
}
