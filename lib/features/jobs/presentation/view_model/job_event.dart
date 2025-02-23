// import 'package:equatable/equatable.dart';
// import 'package:job_scout_project/features/jobs/domain/entity/jobs_entity';

// abstract class JobEvent extends Equatable {
//   const JobEvent();

//   @override
//   List<Object?> get props => [];
// }

// /// **Load All Jobs**
// class LoadJobsEvent extends JobEvent {}

// /// **Create a New Job**
// class CreateJobEvent extends JobEvent {
//   final JobEntity job;

//   const CreateJobEvent({required this.job});

//   @override
//   List<Object?> get props => [job];
// }

// /// **Update Existing Job**
// class UpdateJobEvent extends JobEvent {
//   final JobEntity job;

//   const UpdateJobEvent({required this.job});

//   @override
//   List<Object?> get props => [job];
// }

// /// **Delete a Job**
// class DeleteJobEvent extends JobEvent {
//   final String jobId;

//   const DeleteJobEvent({required this.jobId});

//   @override
//   List<Object?> get props => [jobId];
// }
