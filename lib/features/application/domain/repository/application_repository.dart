import 'package:dartz/dartz.dart';
import 'package:job_scout_project/core/error/failure.dart';
import 'package:job_scout_project/features/application/domain/entity/application_entity.dart';

/// *Repository Interface for Application Domain*
abstract interface class IApplicationRepository {
  /// *Get all applications*
  Future<Either<Failure, List<ApplicationEntity>>> getApplications();

  /// *Create a new job application*
  Future<Either<Failure, void>> createApplication(
      ApplicationEntity application, String token);

  /// *Delete a job application by ID*
  Future<Either<Failure, void>> deleteApplication(String id, String? token);
}