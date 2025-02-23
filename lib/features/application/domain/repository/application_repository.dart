import 'package:dartz/dartz.dart';
import 'package:job_scout_project/core/error/failure.dart';
import 'package:job_scout_project/features/application/domain/entity/application_entity';

abstract interface class IApplicationRepository {
  Future<Either<Failure, List<ApplicationEntity>>> getAllApplications();
  Future<Either<Failure, ApplicationEntity>> getApplicationById(
      String applicationId);
}
