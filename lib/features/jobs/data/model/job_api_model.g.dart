// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'job_api_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

JobApiModel _$JobApiModelFromJson(Map<String, dynamic> json) => JobApiModel(
      jobId: json['_id'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      requirements: (json['requirements'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      salary: (json['salary'] as num).toInt(),
      experienceLevel: (json['experienceLevel'] as num).toInt(),
      location: json['location'] as String,
      jobType: json['jobType'] as String,
      position: (json['position'] as num).toInt(),
      company: CompanyEntity.fromJson(json['company'] as Map<String, dynamic>),
      createdBy: json['created_by'] as String,
      applications: (json['applications'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$JobApiModelToJson(JobApiModel instance) =>
    <String, dynamic>{
      '_id': instance.jobId,
      'title': instance.title,
      'description': instance.description,
      'requirements': instance.requirements,
      'salary': instance.salary,
      'experienceLevel': instance.experienceLevel,
      'location': instance.location,
      'jobType': instance.jobType,
      'position': instance.position,
      'company': instance.company,
      'created_by': instance.createdBy,
      'applications': instance.applications,
    };
