import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:job_scout_project/app/shared_prefs/token_shared_prefs.dart';
import 'package:job_scout_project/app/usecase/usecase.dart';
import 'package:job_scout_project/core/error/failure.dart';
import 'package:job_scout_project/features/auth/domain/repository/auth_repository.dart';

class LoginParams extends Equatable {
  final String email;
  final String password;

  const LoginParams({
    required this.email,
    required this.password,
  });

  // Initial Constructor
  const LoginParams.initial()
      : email = '',
        password = '';

  @override
  List<Object> get props => [email, password];
}

class LoginUseCase implements UsecaseWithParams<String, LoginParams> {
  final IAuthRepository repository;
  final TokenSharedPrefs tokenSharedPrefs;

  const LoginUseCase(this.tokenSharedPrefs, this.repository);

  @override
  Future<Either<Failure, String>> call(LoginParams params) {
    return repository.loginUser(params.email, params.password).then((value) {
      return value.fold(
        (failure) => Left(failure),
        (token) {
          tokenSharedPrefs.saveToken(token);
          tokenSharedPrefs.getToken().then((value) {
            print(value);
          });
          return Right(token);
        },
      );
    });
  }
}
