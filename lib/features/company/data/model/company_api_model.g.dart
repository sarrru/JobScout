// GENERATED CODE - DO NOT MODIFY BY HAND


// ************************************************************************** 
// JsonSerializableGenerator
// **************************************************************************


import 'package:job_scout_project/features/company/data/model/company_api_model.dart';

CompanyApiModel _$CompanyApiModelFromJson(Map<String, dynamic> json) =>
    CompanyApiModel(
      id: json['_id'] as String,
      name: json['name'] as String,
      description: json['description'] as String?,
      logo: json['logo'] as String?,
      location: json['location'] as String?,
      website: json['website'] as String?,
      jobDescription: json['jobDescription'] as String?,
      jobSalary: json['jobSalary'] as int?,
      jobPosition: json['jobPosition'] as String?,
      createdAt: json['createdAt'] == null ? null : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null ? null : DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$CompanyApiModelToJson(CompanyApiModel instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'logo': instance.logo,
      'location': instance.location,
      'website': instance.website,
      'jobDescription': instance.jobDescription,
      'jobSalary': instance.jobSalary,
      'jobPosition': instance.jobPosition,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
    };
