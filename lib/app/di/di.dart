import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:job_scout_project/app/shared_prefs/token_shared_prefs.dart';
import 'package:job_scout_project/core/network/api_service.dart';
import 'package:job_scout_project/core/network/hive_service.dart';
// Authentication
import 'package:job_scout_project/features/auth/data/data_source/local_datasource/auth_local_datasource.dart';
import 'package:job_scout_project/features/auth/data/data_source/remote_datasource/auth_remote_datasource.dart';
import 'package:job_scout_project/features/auth/data/repository/auth_local_repository/auth_local_repository.dart';
import 'package:job_scout_project/features/auth/data/repository/auth_remote_repository.dart/auth_remote_repository.dart';
import 'package:job_scout_project/features/auth/domain/use_case/login_usecase.dart';
import 'package:job_scout_project/features/auth/domain/use_case/register_user_usecase.dart';
import 'package:job_scout_project/features/auth/domain/use_case/upload_image_usecase.dart';
import 'package:job_scout_project/features/auth/presentation/view_model/login/login_bloc.dart';
import 'package:job_scout_project/features/auth/presentation/view_model/signup/register_bloc.dart';
// Company
import 'package:job_scout_project/features/company/data/data_source/remote_datasource/company_remote_datasource.dart';
import 'package:job_scout_project/features/company/data/repository/company_remote_repository.dart';
import 'package:job_scout_project/features/company/domain/repository/company_repository.dart';
import 'package:job_scout_project/features/company/domain/usecase/get_all_company_usecase.dart';
import 'package:job_scout_project/features/company/domain/usecase/get_company_by_id_usecase.dart';
import 'package:job_scout_project/features/company/presentation/view_model/company_bloc.dart';
// Home & Splash
import 'package:job_scout_project/features/home/presentation/view_model/home_cubit.dart';
// Jobs
import 'package:job_scout_project/features/jobs/data/data_source/remote_datasource/jobs_remote_datasource.dart';
import 'package:job_scout_project/features/jobs/data/repository/jobs_remote_repository.dart';
import 'package:job_scout_project/features/jobs/domain/use_case/get_all_jobs_usecase.dart';
import 'package:job_scout_project/features/jobs/domain/use_case/get_job_by_id_usecase.dart';
import 'package:job_scout_project/features/jobs/presentation/view_model/job_bloc.dart';
import 'package:job_scout_project/features/splash/presentation/view_model/on_boarding/on_boarding_cubit.dart';
import 'package:job_scout_project/features/splash/presentation/view_model/splash_cubit.dart';
import 'package:shared_preferences/shared_preferences.dart';

final getIt = GetIt.instance;

/// **Initialize All Dependencies**
Future<void> initDependencies() async {
  await _initSharedPreferences();
  _initHiveService();
  _initApiService();

  _initJobDependencies();
  _initAuthDependencies();
  _initHomeDependencies();
  _initCompanyDependencies();
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

/// **Initialize API Service (Dio)**
void _initApiService() {
  if (!getIt.isRegistered<Dio>()) {
    getIt.registerLazySingleton<Dio>(() => ApiService(Dio()).dio);
  }
}

/// **Initialize Hive Service for Local Storage**
void _initHiveService() {
  getIt.registerLazySingleton<HiveService>(() => HiveService());
}

/// **Initialize Authentication Dependencies**
void _initAuthDependencies() {
  getIt.registerLazySingleton<AuthLocalDataSource>(
      () => AuthLocalDataSource(getIt<HiveService>()));
  getIt.registerLazySingleton<AuthRemoteDatasource>(
      () => AuthRemoteDatasource(getIt<Dio>()));

  getIt.registerLazySingleton<AuthLocalRepository>(
      () => AuthLocalRepository(getIt<AuthLocalDataSource>()));
  getIt.registerLazySingleton<AuthRemoteRepository>(
      () => AuthRemoteRepository(getIt<AuthRemoteDatasource>()));

  getIt.registerLazySingleton<RegisterUseCase>(
      () => RegisterUseCase(getIt<AuthRemoteRepository>()));
  getIt.registerLazySingleton<UploadImageUsecase>(
      () => UploadImageUsecase(getIt<AuthRemoteRepository>()));

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

/// **Initialize Company Dependencies**
void _initCompanyDependencies() {
  // ✅ Ensure that Dio is already registered before using it
  if (!getIt.isRegistered<Dio>()) {
    throw Exception(
        "Dio must be registered before calling _initCompanyDependencies()");
  }

  // Data Source
  getIt.registerLazySingleton<CompanyRemoteDataSource>(
    () => CompanyRemoteDataSource(getIt<Dio>()),
  );

  // Repository
  getIt.registerLazySingleton<ICompanyRepository>(
    () => CompanyRemoteRepository(getIt<CompanyRemoteDataSource>()),
  );

  // UseCases
  getIt.registerLazySingleton<GetAllCompany>(
    () => GetAllCompany(getIt<ICompanyRepository>()),
  );

  getIt.registerLazySingleton<GetCompanyById>(
    () => GetCompanyById(getIt<ICompanyRepository>()),
  );

  // Bloc
  getIt.registerFactory<CompanyBloc>(
    () => CompanyBloc(
      getAllCompany: getIt<GetAllCompany>(),
      getCompanyById: getIt<GetCompanyById>(),
    ),
  );
}

/// **Initialize Job Dependencies**
void _initJobDependencies() {
  getIt.registerLazySingleton<JobsRemoteDataSource>(
    () => JobsRemoteDataSource(getIt<Dio>()),
  );

  getIt.registerLazySingleton<JobRemoteRepository>(
    () => JobRemoteRepository(getIt<JobsRemoteDataSource>()),
  );

  getIt.registerLazySingleton<GetAllJobs>(
    () => GetAllJobs(getIt<JobRemoteRepository>()),
  );
  getIt.registerLazySingleton<GetJobById>(
    () => GetJobById(getIt<JobRemoteRepository>()),
  );

  getIt.registerFactory<JobBloc>(
    () => JobBloc(
      getAllJobs: getIt<GetAllJobs>(),
      getJobById: getIt<GetJobById>(),
    ),
  );
}

/// **Initialize Splash Screen Dependencies**
void _initSplashScreenDependencies() {
  getIt.registerFactory<SplashCubit>(() => SplashCubit(getIt<LoginBloc>()));
}

/// **Initialize Onboarding Screen Dependencies**
void _initOnboardingScreenDependencies() {
  getIt.registerFactory<OnboardingCubit>(
      () => OnboardingCubit(getIt<LoginBloc>()));
}
