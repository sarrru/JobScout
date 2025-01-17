import 'dart:io';

import 'package:job_scout_project/core/network/hive_service.dart';
import 'package:job_scout_project/features/auth/data/data_source/auth_data_source.dart';
import 'package:job_scout_project/features/auth/data/model/auth_hive_model.dart';
import 'package:job_scout_project/features/auth/domain/entity/auth_entity.dart';

class AuthLocalDataSource implements IAuthDataSource {
  final HiveService _hiveService;

  AuthLocalDataSource(this._hiveService);

  @override
  Future<AuthEntity> getCurrentUser() {
    // Return Empty AuthEntity
    return Future.value(AuthEntity(
      userId: "1",
      fName: "",
      lName: "",
      image: null,
      phone: "",
      // courses: [],
      username: "",
      password: "", email: '',
    ));
  }

  @override
  Future<String> loginStudent(String username, String password) async {
    try {
      await _hiveService.login(username, password);
      return Future.value("Success");
    } catch (e) {
      return Future.error(e);
    }
  }

  @override
  Future<void> registerStudent(AuthEntity student) async {
    try {
      // Convert AuthEntity to AuthHiveModel
      final authHiveModel = AuthHiveModel.fromEntity(student);

      await _hiveService.register(authHiveModel);
      return Future.value();
    } catch (e) {
      return Future.error(e);
    }
  }

  @override
  Future<String> uploadProfilePicture(File file) {
    throw UnimplementedError();
  }
}
