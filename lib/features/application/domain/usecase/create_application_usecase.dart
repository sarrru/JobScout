import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:job_scout_project/app/shared_prefs/token_shared_prefs.dart';
import 'package:job_scout_project/app/usecase/usecase.dart';
import 'package:job_scout_project/core/error/failure.dart';
import 'package:job_scout_project/features/application/domain/entity/application_entity.dart';
import 'package:job_scout_project/features/application/domain/repository/application_repository.dart';

/// **Data Transfer Object (DTO) for Creating an Application**
class CreateApplicationParams extends Equatable {
  final String jobId;
  final String applicantId;
  final String status;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  /// **Constructor**
  const CreateApplicationParams({
    required this.jobId,
    required this.applicantId,
    this.status = 'pending',
    this.createdAt,
    this.updatedAt,
  });

  /// **Empty Constructor with Default Values**
  const CreateApplicationParams.empty()
      : jobId = '',
        applicantId = '',
        status = 'pending',
        createdAt = null,
        updatedAt = null;

  @override
  List<Object?> get props => [jobId, applicantId, status, createdAt, updatedAt];
}

/// **Use Case: Create Application**
class CreateApplicationUseCase
    implements UsecaseWithParams<void, CreateApplicationParams> {
  final IApplicationRepository applicationRepository;
  final TokenSharedPrefs tokenSharedPrefs; // ✅ Inject Token Shared Prefs

  /// **Constructor**
  CreateApplicationUseCase({
    required this.applicationRepository,
    required this.tokenSharedPrefs,
  });

  @override
  Future<Either<Failure, void>> call(CreateApplicationParams params) async {
    // ✅ Get token from Shared Preferences
    final tokenResult = await tokenSharedPrefs.getToken();

    return tokenResult.fold(
      (failure) => Left(failure), // ✅ Handle token retrieval failure
      (token) async {
        if (token.isEmpty) {
          return Left(ApiFailure(message: "Authentication token is missing"));
        }

        return await applicationRepository.createApplication(
          ApplicationEntity(
            applicationId: '', // ✅ ID will be assigned by the backend
            jobId: params.jobId,
            applicantId: params.applicantId,
            status: params.status,
            createdAt: params.createdAt ?? DateTime.now(),
            updatedAt: params.updatedAt,
          ),
          token, // ✅ Pass token to repository
        );
      },
    );
  }
}
