import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:job_scout_project/features/auth/domain/use_case/login_usecase.dart';
import 'package:job_scout_project/features/auth/presentation/view_model/login/login_bloc.dart';
import 'package:job_scout_project/features/auth/presentation/view_model/signup/register_bloc.dart';
import 'package:job_scout_project/features/home/presentation/view_model/home_cubit.dart';
import 'package:mocktail/mocktail.dart';

// Mock classes
class MockLoginUseCase extends Mock implements LoginUseCase {}

class MockHomeCubit extends Mock implements HomeCubit {}

class MockRegisterBloc extends Mock implements RegisterBloc {}

void main() {
  setUpAll(() {
    registerFallbackValue(const LoginParams(email: '', password: ''));
  });

  late LoginBloc loginBloc;
  late MockLoginUseCase mockLoginUseCase;
  late MockHomeCubit mockHomeCubit;
  late MockRegisterBloc mockRegisterBloc;

  setUp(() {
    mockLoginUseCase = MockLoginUseCase();
    mockHomeCubit = MockHomeCubit();
    mockRegisterBloc = MockRegisterBloc();
    loginBloc = LoginBloc(
      homeCubit: mockHomeCubit,
      loginUseCase: mockLoginUseCase,
      registerBloc: mockRegisterBloc,
    );
  });

  tearDown(() {
    loginBloc.close();
  });
}

class MockBuildContext extends Mock implements BuildContext {}
