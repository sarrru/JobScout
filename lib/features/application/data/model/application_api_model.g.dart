// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'application_api_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApplicationApiModel _$ApplicationApiModelFromJson(Map<String, dynamic> json) =>
    ApplicationApiModel(
      applicationId: json['_id'] as String?,
      jobId: json['jobId'] as String,
      applicantId: json['applicantId'] as String,
      status: json['status'] as String,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$ApplicationApiModelToJson(
        ApplicationApiModel instance) =>
    <String, dynamic>{
      '_id': instance.applicationId,
      'jobId': instance.jobId,
      'applicantId': instance.applicantId,
      'status': instance.status,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
    };
