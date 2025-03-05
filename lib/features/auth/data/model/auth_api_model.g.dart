// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_api_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthApiModel _$AuthApiModelFromJson(Map<String, dynamic> json) => AuthApiModel(
      authId: json['_id'] as String?,
      email: json['email'] as String,
      image: json['image'] as String?,
      contactNo: json['phoneNumber'] as String,
      username: json['fullname'] as String,
      password: json['password'] as String,
    );

Map<String, dynamic> _$AuthApiModelToJson(AuthApiModel instance) =>
    <String, dynamic>{
      '_id': instance.authId,
      'fullname': instance.username,
      'email': instance.email,
      'phoneNumber': instance.contactNo,
      'password': instance.password,
      'image': instance.image,
    };
