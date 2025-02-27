part of 'job_bloc.dart';


class JobState extends Equatable {
  final List<JobEntity> jobs;
  final bool isLoading;
  final String? error;
  final JobEntity? selectedJob;

  const JobState({
    required this.jobs,
    required this.isLoading,
    this.error,
    this.selectedJob,
  });

  factory JobState.initial() {
    return const JobState(
      jobs: [],
      isLoading: false,
      error: null,
      selectedJob: null,
    );
  }

  JobState copyWith({
    List<JobEntity>? jobs,
    bool? isLoading,
    String? error,
    JobEntity? selectedJob,
  }) {
    return JobState(
      jobs: jobs ?? this.jobs,
      isLoading: isLoading ?? this.isLoading,
      error: error,
      selectedJob: selectedJob ?? this.selectedJob,
    );
  }

  @override
  List<Object?> get props => [jobs, isLoading, error];
}