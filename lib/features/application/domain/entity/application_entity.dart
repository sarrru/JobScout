import 'package:equatable/equatable.dart';

class ApplicationEntity extends Equatable {
  final String applicationId;
  final String jobId;
  final String applicantId;
  final String status;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  /// **Constructor**
  const ApplicationEntity({
    required this.applicationId,
    required this.jobId,
    required this.applicantId,
    required this.status,
    this.createdAt,
    this.updatedAt,
  });

  /// **Empty Constructor with Default Values**
  const ApplicationEntity.empty()
      : applicationId = 'empty_applicationId',
        jobId = 'empty_jobId',
        applicantId = 'empty_applicantId',
        status = 'pending',
        createdAt = null,
        updatedAt = null;

  /// **Factory Constructor to Convert JSON to `ApplicationEntity`**
  factory ApplicationEntity.fromJson(Map<String, dynamic> json) {
    return ApplicationEntity(
      applicationId: json['_id'] as String,
      jobId: json['job'] as String,
      applicantId: json['applicant'] as String,
      status: json['status'] as String,
      createdAt:
          json['createdAt'] != null ? DateTime.parse(json['createdAt']) : null,
      updatedAt:
          json['updatedAt'] != null ? DateTime.parse(json['updatedAt']) : null,
    );
  }

  /// **Method to Convert `ApplicationEntity` to JSON**
  Map<String, dynamic> toJson() {
    return {
      '_id': applicationId,
      'job': jobId,
      'applicant': applicantId,
      'status': status,
      'createdAt': createdAt?.toIso8601String(),
      'updatedAt': updatedAt?.toIso8601String(),
    };
  }

  /// **CopyWith Method for Immutability**
  ApplicationEntity copyWith({
    String? applicationId,
    String? jobId,
    String? applicantId,
    String? status,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return ApplicationEntity(
      applicationId: applicationId ?? this.applicationId,
      jobId: jobId ?? this.jobId,
      applicantId: applicantId ?? this.applicantId,
      status: status ?? this.status,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  List<Object?> get props =>
      [applicationId, jobId, applicantId, status, createdAt, updatedAt];

  get jobTitle => null;
}
