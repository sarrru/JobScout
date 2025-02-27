part of 'job_bloc.dart';

abstract class JobEvent extends Equatable {
  const JobEvent();

  @override
  List<Object?> get props => [];
}

class LoadJobs extends JobEvent {}

class LoadJobDetails extends JobEvent {
  final String jobId;

  const LoadJobDetails({required this.jobId});

  @override
  List<Object?> get props => [jobId];
}

class SelectJob extends JobEvent {
  final JobEntity job;

  const SelectJob({required this.job});

  @override
  List<Object?> get props => [job];
}