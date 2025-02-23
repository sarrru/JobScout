// import 'package:dartz/dartz.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:job_scout_project/core/error/failure.dart';
// import 'package:job_scout_project/features/jobs/domain/entity/jobs_entity';
// import 'package:job_scout_project/features/jobs/domain/repository/jobs_repository.dart';
// import 'package:job_scout_project/features/jobs/domain/use_case/get_all_jobs_usecase.dart';
// import 'package:mocktail/mocktail.dart';

// // Create a mock for IJobRepository using Mocktail
// class MockJobRepository extends Mock implements IJobRepository {}

// void main() {
//   late MockJobRepository repository;
//   late GetAllJobUseCase useCase;

//   setUp(() {
//     repository = MockJobRepository();
//     useCase = GetAllJobUseCase(jobRepository: repository);

//     // Register fallback values (for List<JobEntity> and JobEntity arguments, if needed)
//     registerFallbackValue(JobEntity(
//       jobId: 'fallbackJobId',
//       title: 'Fallback Job Title',
//       companyId: 'fallbackCompanyId',
//       description: 'Fallback Description',
//       requirements: [],
//       salary: 0.0,
//       experienceLevel: 'Entry-level',
//       location: 'Fallback Location',
//       jobType: 'Full-time',
//       position: 'Fallback Position',
//       createdBy: 'fallbackUser',
//       applications: const [],
//     ));
//   });

//   final tJobs = [
//     JobEntity(
//       jobId: '1',
//       title: 'Software Engineer',
//       companyId: 'CompanyA',
//       description: 'Develop awesome software',
//       requirements: ['Flutter', 'Dart'],
//       salary: 120000.0,
//       experienceLevel: 'Senior',
//       location: 'Remote',
//       jobType: 'Full-time',
//       position: 'Lead Developer',
//       createdBy: 'user123',
//       applications: const [],
//     ),
//     JobEntity(
//       jobId: '2',
//       title: 'Data Scientist',
//       companyId: 'CompanyB',
//       description: 'Analyze data',
//       requirements: ['Python', 'ML'],
//       salary: 100000.0,
//       experienceLevel: 'Mid-level',
//       location: 'New York',
//       jobType: 'Full-time',
//       position: 'Data Analyst',
//       createdBy: 'user456',
//       applications: const [],
//     ),
//   ];

//   group('GetAllJobUseCase', () {
//     test(
//         'should return a list of JobEntities when fetching all jobs is successful',
//         () async {
//       // Arrange
//       when(() => repository.getAllJobs()).thenAnswer((_) async => Right(tJobs));

//       // Act
//       final result = await useCase();

//       // Assert
//       expect(result, Right(tJobs));
//       verify(() => repository.getAllJobs()).called(1);
//       verifyNoMoreInteractions(repository);
//     });

//     test(
//         'should return an ApiFailure when fetching all jobs fails due to an API error',
//         () async {
//       // Arrange
//       const errorMessage = 'Failed to fetch jobs from the API';
//       final failure = ApiFailure(message: errorMessage);
//       when(() => repository.getAllJobs())
//           .thenAnswer((_) async => Left(failure));

//       // Act
//       final result = await useCase();

//       // Assert
//       expect(result, Left(failure));
//       verify(() => repository.getAllJobs()).called(1);
//       verifyNoMoreInteractions(repository);
//     });

//     test(
//         'should return a LocalDatabaseFailure when fetching all jobs fails due to a database error',
//         () async {
//       // Arrange
//       const errorMessage = 'Failed to retrieve jobs from the local database';
//       final failure = LocalDatabaseFailure(message: errorMessage);
//       when(() => repository.getAllJobs())
//           .thenAnswer((_) async => Left(failure));

//       // Act
//       final result = await useCase();

//       // Assert
//       expect(result, Left(failure));
//       verify(() => repository.getAllJobs()).called(1);
//       verifyNoMoreInteractions(repository);
//     });
//   });
// }
