import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:job_scout_project/core/error/failure.dart';
import 'package:job_scout_project/features/company/domain/entity/company_entity.dart';
import 'package:job_scout_project/features/jobs/domain/entity/jobs_entity.dart';
import 'package:job_scout_project/features/jobs/domain/use_case/get_all_jobs_usecase.dart';
import 'package:job_scout_project/features/jobs/domain/use_case/get_job_by_id_usecase.dart';
import 'package:job_scout_project/features/jobs/presentation/view_model/job_bloc.dart';
import 'package:mocktail/mocktail.dart';

class MockGetAllJobs extends Mock implements GetAllJobs {}

class MockGetJobById extends Mock implements GetJobById {}

void main() {
  late MockGetAllJobs mockGetAllJobs;
  late MockGetJobById mockGetJobById;
  late JobBloc jobBloc;

  setUp(() {
    mockGetAllJobs = MockGetAllJobs();
    mockGetJobById = MockGetJobById();
    jobBloc = JobBloc(getAllJobs: mockGetAllJobs, getJobById: mockGetJobById);
  });

  tearDown(() {
    jobBloc.close();
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

  group('JobBloc', () {
    test('initial state should be JobState.initial()', () {
      expect(jobBloc.state, JobState.initial());
    });

    blocTest<JobBloc, JobState>(
      'emits [isLoading: true, jobs: fetched list, isLoading: false] when LoadJobs is successful',
      build: () {
        when(() => mockGetAllJobs()).thenAnswer((_) async => Right(tJobs));
        return jobBloc;
      },
      act: (bloc) => bloc.add(LoadJobs()),
      expect: () => [
        JobState.initial().copyWith(isLoading: true),
        JobState.initial().copyWith(isLoading: false, jobs: tJobs),
      ],
      verify: (_) {
        verify(() => mockGetAllJobs()).called(1);
      },
    );

    blocTest<JobBloc, JobState>(
      'emits [isLoading: true, error: error message, isLoading: false] when LoadJobs fails',
      build: () {
        when(() => mockGetAllJobs()).thenAnswer(
            (_) async => Left(ApiFailure(message: 'Failed to load jobs')));
        return jobBloc;
      },
      act: (bloc) => bloc.add(LoadJobs()),
      expect: () => [
        JobState.initial().copyWith(isLoading: true),
        JobState.initial().copyWith(isLoading: false, error: 'Failed to load jobs'),
      ],
      verify: (_) {
        verify(() => mockGetAllJobs()).called(1);
      },
    );

    blocTest<JobBloc, JobState>(
      'emits [isLoading: true, selectedJob: job, isLoading: false] when LoadJobDetails is successful',
      build: () {
        when(() => mockGetJobById('job1'))
            .thenAnswer((_) async => Right(tJob1));
        return jobBloc;
      },
      act: (bloc) => bloc.add(const LoadJobDetails(jobId: 'job1')),
      expect: () => [
        JobState.initial().copyWith(isLoading: true),
        JobState.initial().copyWith(isLoading: false, selectedJob: tJob1),
      ],
      verify: (_) {
        verify(() => mockGetJobById('job1')).called(1);
      },
    );

    blocTest<JobBloc, JobState>(
      'emits [isLoading: true, error: error message, isLoading: false] when LoadJobDetails fails',
      build: () {
        when(() => mockGetJobById('job1')).thenAnswer(
            (_) async => Left(ApiFailure(message: 'Failed to load job')));
        return jobBloc;
      },
      act: (bloc) => bloc.add(const LoadJobDetails(jobId: 'job1')),
      expect: () => [
        JobState.initial().copyWith(isLoading: true),
        JobState.initial().copyWith(isLoading: false, error: 'Failed to load job'),
      ],
      verify: (_) {
        verify(() => mockGetJobById('job1')).called(1);
      },
    );

    blocTest<JobBloc, JobState>(
      'emits [isLoading: true, isLoading: false, jobs: []] when LoadJobs returns an empty list',
      build: () {
        when(() => mockGetAllJobs())
            .thenAnswer((_) async => const Right([])); // Return an empty list
        return jobBloc;
      },
      act: (bloc) => bloc.add(LoadJobs()),
      expect: () => [
        JobState.initial().copyWith(isLoading: true),
        JobState.initial().copyWith(isLoading: false, jobs: []),
      ],
      verify: (_) {
        verify(() => mockGetAllJobs()).called(1);
      },
    );

    
  });
}
