// import 'package:dartz/dartz.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:job_scout_project/core/error/failure.dart'; // Import Failure definitions
// import 'package:job_scout_project/features/jobs/domain/entity/jobs_entity';
// import 'package:job_scout_project/features/jobs/domain/repository/jobs_repository.dart';
// import 'package:job_scout_project/features/jobs/domain/use_case/get_job_by_id_usecase.dart';
// import 'package:mocktail/mocktail.dart';

// // Create a mock for IJobRepository using Mocktail
// class MockJobRepository extends Mock implements IJobRepository {}

// void main() {
//   late MockJobRepository repository;
//   late GetJobByIdUseCase useCase;

//   setUp(() {
//     repository = MockJobRepository();
//     useCase = GetJobByIdUseCase(repository);

//     // Register fallback values for mocked objects
//     registerFallbackValue(JobEntity(
//       jobId: '123',
//       title: 'Test Job',
//       companyId: 'testCompanyId',
//       description: 'Description of the job',
//       requirements: ['Requirement 1', 'Requirement 2'],
//       salary: 50000.0,
//       experienceLevel: 'Mid-level',
//       location: 'Test Location',
//       jobType: 'Full-Time',
//       position: 'Backend Developer',
//       createdBy: 'admin',
//       applications: const [],
//     ));
//     registerFallbackValue(''); // For the jobId argument
//   });

//   final tJob = JobEntity(
//     jobId: '1',
//     title: 'Software Engineer',
//     companyId: 'CompanyA',
//     description: 'Develop awesome software',
//     requirements: ['Flutter', 'Dart'],
//     salary: 120000.0,
//     experienceLevel: 'Senior',
//     location: 'Remote',
//     jobType: 'Full-time',
//     position: 'Lead Developer',
//     createdBy: 'user123',
//     applications: const [],
//   );

//   test('should return a JobEntity when fetching a job by ID is successful',
//       () async {
//     // Arrange
//     const jobId = '1';
//     when(() => repository.getJobById(jobId))
//         .thenAnswer((_) async => Right(tJob));

//     // Act
//     final result = await useCase(jobId);

//     // Assert
//     expect(result, Right(tJob));
//     verify(() => repository.getJobById(jobId)).called(1);
//     verifyNoMoreInteractions(repository);
//   });

//   test('should return an ApiFailure when fetching a job by ID fails', () async {
//     // Arrange
//     const jobId = '999';
//     const errorMessage = 'Job not found';
//     final failure = ApiFailure(message: errorMessage); // Use ApiFailure here
//     when(() => repository.getJobById(jobId))
//         .thenAnswer((_) async => Left(failure));

//     // Act
//     final result = await useCase(jobId);

//     // Assert
//     expect(result, Left(failure));
//     verify(() => repository.getJobById(jobId)).called(1);
//     verifyNoMoreInteractions(repository);
//   });

//   tearDown(() {
//     reset(repository);
//   });
// }
