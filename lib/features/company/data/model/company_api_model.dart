import 'package:json_annotation/json_annotation.dart';
import 'package:job_scout_project/features/company/domain/entity/company_entity.dart';

part 'company_api_model.g.dart';

@JsonSerializable()
class CompanyApiModel {
  final String id;
  final String name;
  final String? description;
  final String? website;
  final String? location;
  final String? logo;
  final String? jobDescription;
  final int? jobSalary;
  final String? jobPosition;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  /// *Constructor*
  const CompanyApiModel({
    required this.id,
    required this.name,
    this.description,
    this.website,
    this.location,
    this.logo,
    this.jobDescription,
    this.jobSalary,
    this.jobPosition,
    this.createdAt,
    this.updatedAt, 
  });

  /// *Factory Constructor from JSON*
  factory CompanyApiModel.fromJson(Map<String, dynamic> json) => _$CompanyApiModelFromJson(json);

  /// *Convert to JSON*
  Map<String, dynamic> toJson() => _$CompanyApiModelToJson(this);

  /// *Convert API Model to Entity*
  CompanyEntity toEntity() => CompanyEntity(
        id: id,
        name: name,
        description: description,
        website: website,
        location: location,
        logo: logo,
        jobDescription: jobDescription,
        jobSalary: jobSalary,
        jobPosition: jobPosition,
        createdAt: createdAt,
        updatedAt: updatedAt,
      );

  /// *Convert List of API Models to Entities*
  static List<CompanyEntity> toEntityList(List<CompanyApiModel> models) => models.map((model) => model.toEntity()).toList();
}
