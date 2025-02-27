

import 'package:equatable/equatable.dart';

/// **Abstract Parent Class for All Application Events**
abstract class ApplicationEvent extends Equatable {
  const ApplicationEvent();

  @override
  List<Object?> get props => [];
}

/// **Event to Add a New Job Application**
class AddApplication extends ApplicationEvent {
  final String jobId;
  final String applicantId;
  final String status;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  const AddApplication({
    required this.jobId,
    required this.applicantId,
    this.status = 'pending',
    this.createdAt,
    this.updatedAt,
  });

  @override
  List<Object?> get props => [jobId, applicantId, status, createdAt, updatedAt];
}

/// **Event to Fetch All Applications**
class FetchApplications extends ApplicationEvent {}

/// **Event to Delete a Job Application**
class DeleteApplication extends ApplicationEvent {
  final String applicationId;

  const DeleteApplication({required this.applicationId});

  @override
  List<Object?> get props => [applicationId];
}
