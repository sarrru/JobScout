// import 'package:equatable/equatable.dart';
// import 'package:job_scout_project/features/jobs/domain/entity/jobs_entity';

// abstract class JobState extends Equatable {
//   const JobState();

//   @override
//   List<Object?> get props => [];
// }

// /// **Initial State**
// class JobInitialState extends JobState {}

// /// **Loading State**
// class JobLoadingState extends JobState {}

// /// **Loaded State with List of Jobs**
// class JobLoadedState extends JobState {
//   final List<JobEntity> jobs;

//   const JobLoadedState({required this.jobs});

//   @override
//   List<Object?> get props => [jobs];
// }

// /// **Error State**
// class JobErrorState extends JobState {
//   final String message;

//   const JobErrorState({required this.message});

//   @override
//   List<Object?> get props => [message];
// }
