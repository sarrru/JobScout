// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'company_api_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CompanyApiModel _$CompanyApiModelFromJson(Map<String, dynamic> json) =>
    CompanyApiModel(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String?,
      website: json['website'] as String?,
      location: json['location'] as String?,
      logo: json['logo'] as String?,
      jobDescription: json['jobDescription'] as String?,
      jobSalary: (json['jobSalary'] as num?)?.toInt(),
      jobPosition: json['jobPosition'] as String?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$CompanyApiModelToJson(CompanyApiModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'website': instance.website,
      'location': instance.location,
      'logo': instance.logo,
      'jobDescription': instance.jobDescription,
      'jobSalary': instance.jobSalary,
      'jobPosition': instance.jobPosition,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
    };
