import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:job_scout_project/core/error/failure.dart';
import 'package:job_scout_project/features/company/domain/entity/company_entity.dart';
import 'package:job_scout_project/features/jobs/domain/entity/jobs_entity.dart';
import 'package:job_scout_project/features/jobs/domain/repository/jobs_repository.dart';
import 'package:job_scout_project/features/jobs/domain/use_case/get_job_by_id_usecase.dart';
import 'package:mocktail/mocktail.dart';

class MockJobRepository extends Mock implements IJobRepository {}

void main() {
  late GetJobById getJobById;
  late MockJobRepository mockJobRepository;

  setUp(() {
    mockJobRepository = MockJobRepository();
    getJobById = GetJobById(mockJobRepository);
  });

  const jobId = 'job1';

  final tJob = JobEntity(
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

  group('GetJobById UseCase', () {
    test('should return Right(job) when fetching job by ID is successful', () async {
      // Arrange
      when(() => mockJobRepository.getJobById(jobId))
          .thenAnswer((_) async => Right(tJob));

      // Act
      final result = await getJobById(jobId);

      // Assert
      expect(result, Right(tJob));
      verify(() => mockJobRepository.getJobById(jobId)).called(1);
      verifyNoMoreInteractions(mockJobRepository);
    });

    test('should return Left(ApiFailure) when repository fails due to an API error', () async {
      // Arrange
      const failure = ApiFailure(message: 'API error');
      when(() => mockJobRepository.getJobById(jobId))
          .thenAnswer((_) async => Left(failure));

      // Act
      final result = await getJobById(jobId);

      // Assert
      expect(result, Left(failure));
      verify(() => mockJobRepository.getJobById(jobId)).called(1);
    });

    test('should return Left(ServerFailure) when repository fails due to a server error', () async {
      // Arrange
      const failure = ApiFailure(message: 'Server error');
      when(() => mockJobRepository.getJobById(jobId))
          .thenAnswer((_) async => Left(failure));

      // Act
      final result = await getJobById(jobId);

      // Assert
      expect(result, Left(failure));
      verify(() => mockJobRepository.getJobById(jobId)).called(1);
    });

    test('should return Left(ApiFailure) when given an invalid job ID', () async {
      // Arrange
      const failure = ApiFailure(message: 'Invalid job ID');
      when(() => mockJobRepository.getJobById(''))
          .thenAnswer((_) async => Left(failure));

      // Act
      final result = await getJobById('');

      // Assert
      expect(result, Left(failure));
      verify(() => mockJobRepository.getJobById('')).called(1);
    });

    test('should return Left(ApiFailure) when the repository returns null', () async {
      // Arrange
      when(() => mockJobRepository.getJobById(jobId))
          .thenAnswer((_) async => Left(ApiFailure(message: 'Job not found')));

      // Act
      final result = await getJobById(jobId);

      // Assert
      expect(result, Left(ApiFailure(message: 'Job not found')));
      verify(() => mockJobRepository.getJobById(jobId)).called(1);
    });

    test('should handle a job with missing required fields', () async {
      // Arrange
      final tJobWithMissingData = JobEntity(
        jobId: 'job2',
        title: 'Marketing Manager',
        description: '',
        requirements: [],
        salary: 0,
        experienceLevel: 0,
        location: 'Unknown',
        jobType: 'Full-time',
        position: 1,
        company: const CompanyEntity(id: 'comp2', name: 'MarketingCorp'),
        createdBy: '',
        applications: [],
        companyId: 'comp2',
      );

      when(() => mockJobRepository.getJobById('job2'))
          .thenAnswer((_) async => Right(tJobWithMissingData));

      // Act
      final result = await getJobById('job2');

      // Assert
      expect(result, Right(tJobWithMissingData));
      verify(() => mockJobRepository.getJobById('job2')).called(1);
    });

    test('should ensure repository method is only called once per request', () async {
      // Arrange
      when(() => mockJobRepository.getJobById(jobId))
          .thenAnswer((_) async => Right(tJob));

      // Act
      await getJobById(jobId);
      await getJobById(jobId);

      // Assert
      verify(() => mockJobRepository.getJobById(jobId)).called(2);
      verifyNoMoreInteractions(mockJobRepository);
    });
  });
}
