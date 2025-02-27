import 'package:job_scout_project/features/company/domain/entity/company_entity.dart';

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

  /// **Constructor**
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

  /// **Factory Constructor from JSON**
  factory CompanyApiModel.fromJson(Map<String, dynamic> json) {
    return CompanyApiModel(
      id: json['_id'] ?? "",
      name: json['name'] ?? "No Name",
      description: json['description'],
      website: json['website'],
      location: json['location'],
      logo: json['logo'],
      jobDescription: json['jobDescription'],
      jobSalary: json['jobSalary'] != null ? int.parse(json['jobSalary'].toString()) : null,
      jobPosition: json['jobPosition'],
      createdAt: json['createdAt'] != null ? DateTime.parse(json['createdAt']) : null,
      updatedAt: json['updatedAt'] != null ? DateTime.parse(json['updatedAt']) : null,
    );
  }

  /// **Convert API Model to Entity**
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

  /// **Convert List of API Models to Entities**
  static List<CompanyEntity> toEntityList(List<CompanyApiModel> models) => models.map((model) => model.toEntity()).toList();
}
