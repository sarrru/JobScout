import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:job_scout_project/app/usecase/usecase.dart';
import 'package:job_scout_project/core/error/failure.dart';
import 'package:job_scout_project/features/auth/domain/entity/auth_entity.dart';
import 'package:job_scout_project/features/auth/domain/repository/auth_repository.dart';

class RegisterUserParams extends Equatable {
  final String fname;
  final String lname;
  final String email;
  final String phone;
  final String username;
  final String password;

  const RegisterUserParams({
    required this.fname,
    required this.lname,
    required this.email,
    required this.phone,
    required this.username,
    required this.password,
  });

  //intial constructor
  const RegisterUserParams.initial({
    required this.fname,
    required this.lname,
    required this.email,
    required this.phone,
    required this.username,
    required this.password,
  });

  @override
  List<Object?> get props => [fname, lname, phone, username, password];
}

class RegisterUseCase implements UsecaseWithParams<void, RegisterUserParams> {
  final IAuthRepository repository;

  RegisterUseCase(this.repository);

  @override
  Future<Either<Failure, void>> call(RegisterUserParams params) {
    final authEntity = AuthEntity(
      fName: params.fname,
      lName: params.lname,
      phone: params.phone,
      username: params.username,
      password: params.password,
      email: params.email,
    );
    return repository.registerStudent(authEntity);
  }
}
