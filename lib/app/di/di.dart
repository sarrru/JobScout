// import 'package:dio/dio.dart';
// import 'package:get_it/get_it.dart';
// import 'package:job_scout_project/app/shared_prefs/token_shared_prefs.dart';
// import 'package:job_scout_project/core/network/api_service.dart';
// import 'package:job_scout_project/core/network/hive_service.dart';
// import 'package:job_scout_project/features/auth/data/data_source/local_datasource/auth_local_datasource.dart';
// import 'package:job_scout_project/features/auth/data/data_source/remote_datasource/auth_remote_datasource.dart';
// import 'package:job_scout_project/features/auth/data/repository/auth_local_repository/auth_local_repository.dart';
// import 'package:job_scout_project/features/auth/data/repository/auth_remote_repository.dart/auth_remote_repository.dart';
// import 'package:job_scout_project/features/auth/domain/use_case/login_usecase.dart';
// import 'package:job_scout_project/features/auth/domain/use_case/register_user_usecase.dart';
// import 'package:job_scout_project/features/auth/domain/use_case/upload_image_usecase.dart';
// import 'package:job_scout_project/features/auth/presentation/view_model/login/login_bloc.dart';
// import 'package:job_scout_project/features/auth/presentation/view_model/signup/register_bloc.dart';
// import 'package:job_scout_project/features/home/presentation/view_model/home_cubit.dart';
// import 'package:job_scout_project/features/splash/presentation/view_model/on_boarding/on_boarding_cubit.dart';
// import 'package:job_scout_project/features/splash/presentation/view_model/splash_cubit.dart';

// import 'package:shared_preferences/shared_preferences.dart';

// final getIt = GetIt.instance;

// Future<void> initDependencies() async {
//   await _initHiveService();
//   await _initApiService();
//   await _initSharedPreferences();
//   _initHomeDependencies();
//   _initRegisterDependencies();
//   _initLoginDependencies();
//   _initSplashScreenDependencies();
//   _initOnboardingScreenDependencies();
// }

// Future<void> _initSharedPreferences() async {
//   final sharedPreferences = await SharedPreferences.getInstance();
//   getIt.registerLazySingleton<SharedPreferences>(() => sharedPreferences);
// }

// _initApiService() {
//   //Remote Data Source
//   getIt.registerLazySingleton<Dio>(() => ApiService(Dio()).dio);
// }

// _initHiveService() {
//   getIt.registerLazySingleton<HiveService>(() => HiveService());
// }

// void _initOnboardingScreenDependencies() {
//   getIt.registerFactory<OnboardingCubit>(
//     () => OnboardingCubit(getIt<LoginBloc>()),
//   );
// }

// /// ====================  Register ===================

// _initRegisterDependencies() {
//   //DataSource

//   getIt.registerLazySingleton<AuthLocalDataSource>(
//     () => AuthLocalDataSource(getIt<HiveService>()),
//   );

//   getIt.registerLazySingleton<AuthRemoteDatasource>(
//     () => AuthRemoteDatasource(getIt<Dio>()),
//   );

//   //Repository

//   getIt.registerLazySingleton(
//     () => AuthLocalRepository(getIt<AuthLocalDataSource>()),
//   );
//   getIt.registerLazySingleton<AuthRemoteRepository>(
//     () => AuthRemoteRepository(getIt<AuthRemoteDatasource>()),
//   );

//   //UseCase
//   getIt.registerLazySingleton<RegisterUseCase>(
//     () => RegisterUseCase(
//       getIt<AuthRemoteRepository>(),
//     ),
//   );

//   getIt.registerLazySingleton<UploadImageUsecase>(
//     () => UploadImageUsecase(
//       getIt<AuthRemoteRepository>(),
//     ),
//   );

//   getIt.registerFactory<RegisterBloc>(
//     () => RegisterBloc(
//       registerUseCase: getIt(),
//       uploadImageUsecase: getIt(),
//     ),
//   );
// }

// // ================================ Home ==========================

// void _initHomeDependencies() {
//   getIt.registerFactory<HomeCubit>(
//     () => HomeCubit(),
//   );
// }

// // =============================Login ============================

// _initLoginDependencies() async {
//   //Token Shared Preferences
//   getIt.registerLazySingleton<TokenSharedPrefs>(
//     () => TokenSharedPrefs(getIt<SharedPreferences>()),
//   );

//   //UseCase

//   getIt.registerLazySingleton<LoginUseCase>(() =>
//       LoginUseCase(getIt<TokenSharedPrefs>(), getIt<AuthRemoteRepository>()));

//   getIt.registerFactory<LoginBloc>(
//     () => LoginBloc(
//       registerBloc: getIt<RegisterBloc>(),
//       homeCubit: getIt<HomeCubit>(),
//       loginUseCase: getIt<LoginUseCase>(),
//     ),
//   );
// }

// void _initSplashScreenDependencies() {
//   getIt.registerFactory<SplashCubit>(
//     () => SplashCubit(getIt<LoginBloc>()),
//   );
// }

import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:job_scout_project/app/shared_prefs/token_shared_prefs.dart';
import 'package:job_scout_project/core/network/api_service.dart';
import 'package:job_scout_project/core/network/hive_service.dart';
import 'package:job_scout_project/features/auth/data/data_source/local_datasource/auth_local_datasource.dart';
import 'package:job_scout_project/features/auth/data/data_source/remote_datasource/auth_remote_datasource.dart';
import 'package:job_scout_project/features/auth/data/repository/auth_local_repository/auth_local_repository.dart';
import 'package:job_scout_project/features/auth/data/repository/auth_remote_repository.dart/auth_remote_repository.dart';
import 'package:job_scout_project/features/auth/domain/use_case/login_usecase.dart';
import 'package:job_scout_project/features/auth/domain/use_case/register_user_usecase.dart';
import 'package:job_scout_project/features/auth/domain/use_case/upload_image_usecase.dart';
import 'package:job_scout_project/features/auth/presentation/view_model/login/login_bloc.dart';
import 'package:job_scout_project/features/auth/presentation/view_model/signup/register_bloc.dart';
import 'package:job_scout_project/features/home/presentation/view_model/home_cubit.dart';
import 'package:job_scout_project/features/splash/presentation/view_model/on_boarding/on_boarding_cubit.dart';
import 'package:job_scout_project/features/splash/presentation/view_model/splash_cubit.dart';
import 'package:shared_preferences/shared_preferences.dart';

final getIt = GetIt.instance;

/// **Initialize All Dependencies**
Future<void> initDependencies() async {
  await _initSharedPreferences();
  _initHiveService();
  _initApiService();

  _initAuthDependencies();
  _initHomeDependencies();
  // _initCompanyDependencies();
  _initLoginDependencies();
  _initSplashScreenDependencies();
  _initOnboardingScreenDependencies();
}

/// **Initialize Shared Preferences**
Future<void> _initSharedPreferences() async {
  final sharedPreferences = await SharedPreferences.getInstance();
  getIt.registerLazySingleton<SharedPreferences>(() => sharedPreferences);
  getIt.registerLazySingleton<TokenSharedPrefs>(
      () => TokenSharedPrefs(sharedPreferences));
}

/// **Initialize API Service**
void _initApiService() {
  getIt.registerLazySingleton<Dio>(() => ApiService(Dio()).dio);
}

/// **Initialize Hive Service for Local Storage**
void _initHiveService() {
  getIt.registerLazySingleton<HiveService>(() => HiveService());
}

/// **Initialize Authentication Dependencies**
void _initAuthDependencies() {
  // Data Sources
  getIt.registerLazySingleton<AuthLocalDataSource>(
      () => AuthLocalDataSource(getIt<HiveService>()));
  getIt.registerLazySingleton<AuthRemoteDatasource>(
      () => AuthRemoteDatasource(getIt<Dio>()));

  // Repositories
  getIt.registerLazySingleton<AuthLocalRepository>(
      () => AuthLocalRepository(getIt<AuthLocalDataSource>()));
  getIt.registerLazySingleton<AuthRemoteRepository>(
      () => AuthRemoteRepository(getIt<AuthRemoteDatasource>()));

  // Use Cases
  getIt.registerLazySingleton<RegisterUseCase>(
      () => RegisterUseCase(getIt<AuthRemoteRepository>()));
  getIt.registerLazySingleton<UploadImageUsecase>(
      () => UploadImageUsecase(getIt<AuthRemoteRepository>()));

  // Blocs
  getIt.registerFactory<RegisterBloc>(() => RegisterBloc(
        registerUseCase: getIt(),
        uploadImageUsecase: getIt(),
      ));
}

/// **Initialize Home Dependencies**
void _initHomeDependencies() {
  getIt.registerFactory<HomeCubit>(() => HomeCubit());
}

/// **Initialize Login Dependencies**
void _initLoginDependencies() {
  getIt.registerLazySingleton<LoginUseCase>(() =>
      LoginUseCase(getIt<TokenSharedPrefs>(), getIt<AuthRemoteRepository>()));

  getIt.registerFactory<LoginBloc>(() => LoginBloc(
        registerBloc: getIt<RegisterBloc>(),
        homeCubit: getIt<HomeCubit>(),
        loginUseCase: getIt<LoginUseCase>(),
      ));
}

// /// **Initialize Company Dependencies**
// void _initCompanyDependencies() {
//   // ✅ Register Data Sources
//   getIt.registerLazySingleton<CompanyRemoteDataSource>(
//       () => CompanyRemoteDataSource(getIt<Dio>()));

//   // ✅ Register Repository as ICompanyRepository
//   getIt.registerLazySingleton<ICompanyRepository>(
//       () => CompanyRemoteRepository(getIt<CompanyRemoteDataSource>()));

//   // ✅ Register Use Cases
//   getIt.registerLazySingleton<CreateCompanyUseCase>(() => CreateCompanyUseCase(
//         companyRepository: getIt<ICompanyRepository>(), // Correct Dependency
//         tokenSharedPrefs: getIt<TokenSharedPrefs>(),
//       ));

//   // getIt.registerLazySingleton<GetAllCompaniesUseCase>(
//   //     () => GetAllCompaniesUseCase(getIt<ICompanyRepository>()));

//   // ✅ Register Company Bloc
//   getIt.registerFactory<CompanyBloc>(() => CompanyBloc(
//         createCompanyUseCase: getIt<CreateCompanyUseCase>(),
//         // getAllCompaniesUseCase: getIt<GetAllCompaniesUseCase>(),
//       ));
// }

/// **Initialize Splash Screen Dependencies**
void _initSplashScreenDependencies() {
  getIt.registerFactory<SplashCubit>(() => SplashCubit(getIt<LoginBloc>()));
}

/// **Initialize Onboarding Screen Dependencies**
void _initOnboardingScreenDependencies() {
  getIt.registerFactory<OnboardingCubit>(
      () => OnboardingCubit(getIt<LoginBloc>()));
}
