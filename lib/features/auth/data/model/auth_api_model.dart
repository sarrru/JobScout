import 'package:equatable/equatable.dart';
import 'package:job_scout_project/features/auth/domain/entity/auth_entity';
import 'package:json_annotation/json_annotation.dart';

part 'auth_api_model.g.dart';
// dart run build_runner build -d

@JsonSerializable()
class AuthApiModel extends Equatable {
  @JsonKey(name: '_id')
  final String? authId;
  @JsonKey(name: 'fullname')
  final String username;
  final String email;
  @JsonKey(name: 'phoneNumber')
  final String contactNo;
  final String password;
  final String? image;

  const AuthApiModel({
    this.authId,
    required this.email,
    this.image,
    required this.contactNo,
    required this.username,
    required this.password,
  });

  factory AuthApiModel.fromJson(Map<String, dynamic> json) =>
      _$AuthApiModelFromJson(json);

  Map<String, dynamic> toJson() => _$AuthApiModelToJson(this);

  //To Entity
  AuthEntity toEntity() {
    return AuthEntity(
        email: email,
        contactNo: contactNo,
        username: username,
        password: password,
        image: image);
  }

  factory AuthApiModel.fromEntity(AuthEntity entity) {
    return AuthApiModel(
        username: entity.username,
        password: entity.password,
        email: entity.email,
        contactNo: entity.contactNo,
        image: entity.image);
  }

  @override
  List<Object?> get props =>
      [authId, email, image, contactNo, username, password];
}
