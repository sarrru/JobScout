// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_all_job_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetAllJobsDto _$GetAllJobsDtoFromJson(Map<String, dynamic> json) =>
    GetAllJobsDto(
      jobs: (json['jobs'] as List<dynamic>)
          .map((e) => JobApiModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetAllJobsDtoToJson(GetAllJobsDto instance) =>
    <String, dynamic>{
      'jobs': instance.jobs,
    };
