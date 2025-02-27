import 'package:equatable/equatable.dart';

class CompanyEntity extends Equatable {
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
  const CompanyEntity({
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

  /// **Factory Constructor to Create CompanyEntity from JSON**
  factory CompanyEntity.fromJson(Map<String, dynamic> json) {
    return CompanyEntity(
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

  /// *Convert Entity to JSON*
  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'name': name,
      'description': description,
      'website': website,
      'location': location,
      'logo': logo,
      'jobDescription': jobDescription,
      'jobSalary': jobSalary,
      'jobPosition': jobPosition,
      'createdAt': createdAt?.toIso8601String(),
      'updatedAt': updatedAt?.toIso8601String(),
    };
  }

  @override
  List<Object?> get props => [id, name, description, website, location, logo, jobDescription, jobSalary, jobPosition, createdAt, updatedAt];
}