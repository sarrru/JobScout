import 'package:equatable/equatable.dart';
import 'package:job_scout_project/features/application/domain/entity/application_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'application_api_model.g.dart';

@JsonSerializable()
class ApplicationApiModel extends Equatable {
  @JsonKey(name: '_id')
  final String? applicationId;
  final String jobId;
  final String applicantId;
  final String status;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  /// **Constructor**
  const ApplicationApiModel({
    this.applicationId,
    required this.jobId,
    required this.applicantId,
    required this.status,
    this.createdAt,
    this.updatedAt,
  });

  /// **Empty Constructor with Default Values**
  const ApplicationApiModel.empty()
      : applicationId = '',
        jobId = '',
        applicantId = '',
        status = 'pending',
        createdAt = null,
        updatedAt = null;

  /// **Factory Constructor to Create `ApplicationApiModel` from JSON**
  factory ApplicationApiModel.fromJson(Map<String, dynamic> json) {
    return ApplicationApiModel(
      applicationId: json['_id'] as String?,
      jobId: json['job'] as String,
      applicantId: json['applicant'] as String,
      status: json['status'] as String,
      createdAt:
          json['createdAt'] != null ? DateTime.parse(json['createdAt']) : null,
      updatedAt:
          json['updatedAt'] != null ? DateTime.parse(json['updatedAt']) : null,
    );
  }

  /// **Method to Convert `ApplicationApiModel` to JSON**
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

  /// **Convert API Object to Domain Entity**
  ApplicationEntity toEntity() => ApplicationEntity(
        applicationId: applicationId ?? '',
        jobId: jobId,
        applicantId: applicantId,
        status: status,
        createdAt: createdAt,
        updatedAt: updatedAt,
      );

  /// **Convert Domain Entity to API Object**
  static ApplicationApiModel fromEntity(ApplicationEntity entity) =>
      ApplicationApiModel(
        applicationId: entity.applicationId,
        jobId: entity.jobId,
        applicantId: entity.applicantId,
        status: entity.status,
        createdAt: entity.createdAt,
        updatedAt: entity.updatedAt,
      );

  /// **Convert API List to Entity List**
  static List<ApplicationEntity> toEntityList(
          List<ApplicationApiModel> models) =>
      models.map((model) => model.toEntity()).toList();

  @override
  List<Object?> get props => [
        applicationId,
        jobId,
        applicantId,
        status,
        createdAt,
        updatedAt,
      ];
}
