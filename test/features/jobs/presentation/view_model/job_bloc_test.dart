// import 'package:bloc_test/bloc_test.dart';
// import 'package:dartz/dartz.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:job_scout_project/core/error/failure.dart';
// import 'package:job_scout_project/features/jobs/domain/entity/jobs_entity';
// import 'package:job_scout_project/features/jobs/domain/use_case/get_all_jobs_usecase.dart';
// import 'package:job_scout_project/features/jobs/domain/use_case/get_job_by_id_usecase.dart';
// import 'package:job_scout_project/features/jobs/presentation/view_model/job_bloc.dart';
// import 'package:mocktail/mocktail.dart';

// class MockGetAllJobUseCase extends Mock implements GetAllJobUseCase {}

// class MockGetJobByIdUseCase extends Mock implements GetJobByIdUseCase {}

// void main() {
//   late MockGetAllJobUseCase mockGetAllJobsUseCase;
//   late MockGetJobByIdUseCase mockGetJobByIdUseCase;
//   late JobBloc jobBloc;

//   setUp(() {
//     mockGetAllJobsUseCase = MockGetAllJobUseCase();
//     mockGetJobByIdUseCase = MockGetJobByIdUseCase();
//     jobBloc = JobBloc(
//       getAllJobsUseCase: mockGetAllJobsUseCase,
//       getJobByIdUseCase: mockGetJobByIdUseCase,
//     );

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

//     registerFallbackValue(''); // Fallback value for String
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

//   final tJobs = [tJob];

//   tearDown(() {
//     jobBloc.close();
//   });

//   group('LoadAllJobsEvent', () {
//     blocTest<JobBloc, JobState>(
//       'emits [JobState(isLoading: true), JobState(jobs: jobs, isLoading: false)] when GetAllJobsUseCase returns Right(jobs)',
//       build: () {
//         when(() => mockGetAllJobsUseCase())
//             .thenAnswer((_) async => Right(tJobs));
//         return jobBloc;
//       },
//       act: (bloc) => bloc.add(const LoadAllJobsEvent()),
//       expect: () => [
//         JobState.initial().copyWith(isLoading: true),
//         JobState.initial().copyWith(jobs: tJobs, isLoading: false),
//       ],
//     );

//     blocTest<JobBloc, JobState>(
//       'emits [JobState(isLoading: true), JobState(error: failure.message, isLoading: false)] when GetAllJobsUseCase returns Left(failure)',
//       build: () {
//         const failure = ApiFailure(message: 'Failed to load jobs');
//         when(() => mockGetAllJobsUseCase())
//             .thenAnswer((_) async => Left(failure));
//         return jobBloc;
//       },
//       act: (bloc) => bloc.add(const LoadAllJobsEvent()),
//       expect: () => [
//         JobState.initial().copyWith(isLoading: true),
//         JobState.initial()
//             .copyWith(error: 'Failed to load jobs', isLoading: false),
//       ],
//     );
//   });

//   group('LoadJobByIdEvent', () {
//     blocTest<JobBloc, JobState>(
//       'emits [JobState(isLoading: true), JobState(job: job, isLoading: false)] when GetJobByIdUseCase returns Right(job)',
//       build: () {
//         when(() => mockGetJobByIdUseCase('1'))
//             .thenAnswer((_) async => Right(tJob));
//         return jobBloc;
//       },
//       act: (bloc) => bloc.add(const LoadJobByIdEvent(jobId: '1')),
//       expect: () => [
//         JobState.initial().copyWith(isLoading: true),
//         JobState.initial().copyWith(job: tJob, isLoading: false),
//       ],
//     );

//     blocTest<JobBloc, JobState>(
//       'emits [JobState(isLoading: true), JobState(error: failure.message, isLoading: false)] when GetJobByIdUseCase returns Left(failure)',
//       build: () {
//         const failure = ApiFailure(message: 'Job not found');
//         when(() => mockGetJobByIdUseCase('1'))
//             .thenAnswer((_) async => Left(failure));
//         return jobBloc;
//       },
//       act: (bloc) => bloc.add(const LoadJobByIdEvent(jobId: '1')),
//       expect: () => [
//         JobState.initial().copyWith(isLoading: true),
//         JobState.initial().copyWith(error: 'Job not found', isLoading: false),
//       ],
//     );

//     test(
//         'emits [JobState(isLoading: true), JobState(isLoading: false, error: failure.message)] when GetJobByIdUseCase throws an exception',
//         () async {
//       // Arrange
//       const jobId = '1';
//       const errorMessage = 'An unexpected error occurred';
//       final failure = ApiFailure(message: errorMessage);

//       when(() => mockGetJobByIdUseCase(jobId))
//           .thenAnswer((_) async => Left(failure));

//       // Act
//       jobBloc.add(const LoadJobByIdEvent(jobId: jobId));

//       // Assert
//       final expectedStates = [
//         JobState.initial().copyWith(isLoading: true),
//         JobState.initial().copyWith(isLoading: false, error: errorMessage),
//       ];

//       await expectLater(jobBloc.stream.skip(0), emitsInOrder(expectedStates));
//     });
//   });
// }
