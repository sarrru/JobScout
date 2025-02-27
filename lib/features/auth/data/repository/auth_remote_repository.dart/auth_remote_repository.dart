import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:job_scout_project/core/error/failure.dart';
import 'package:job_scout_project/features/auth/data/data_source/remote_datasource/auth_remote_datasource.dart';
import 'package:job_scout_project/features/auth/domain/entity/auth_entity';
import 'package:job_scout_project/features/auth/domain/repository/auth_repository.dart';

class AuthRemoteRepository implements IAuthRepository {
  final AuthRemoteDatasource _authRemoteDatasource;

  AuthRemoteRepository(this._authRemoteDatasource);

  @override
  Future<Either<Failure, void>> registerUser(AuthEntity authEntity) async {
    try {
      await _authRemoteDatasource.registerUser(authEntity);
      return Right(null);
    } catch (e) {
      return Left(ApiFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, AuthEntity>> getCurrentUser() {
    // TODO: implement getCurrentUser
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, String>> loginUser(
      String username, String password) async {
    try {
      final token = await _authRemoteDatasource.loginUser(username, password);
      return Right(token);
    } catch (e) {
      return Left(ApiFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> uploadProfilePicture(File file) async {
    try {
      final imageName = await _authRemoteDatasource.uploadProfilePicture(file);
      return Right(imageName);
    } catch (e) {
      return Left(ApiFailure(message: e.toString()));
    }
  }
}
