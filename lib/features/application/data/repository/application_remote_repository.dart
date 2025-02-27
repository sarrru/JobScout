import 'package:dartz/dartz.dart';
import 'package:job_scout_project/core/error/failure.dart';
import 'package:job_scout_project/features/application/data/data_source/remote_datasource/application_remote_datasource.dart';

import 'package:job_scout_project/features/application/domain/entity/application_entity.dart';
import 'package:job_scout_project/features/application/domain/repository/application_repository.dart';

/// *Remote Repository Implementation for Job Applications*
class ApplicationRemoteRepository implements IApplicationRepository {
  final ApplicationRemoteDataSource _applicationRemoteDataSource;

  ApplicationRemoteRepository(this._applicationRemoteDataSource);

  /// *Create a new job application (Remote Call)*
  @override
  Future<Either<Failure, void>> createApplication(
      ApplicationEntity application, String token) async {
    try {
      await _applicationRemoteDataSource.createApplication(application, token);
      return const Right(null);
    } catch (e) {
      return Left(ApiFailure(
        message: "Failed to submit job application. Please try again.",
      ));
    }
  }
  
  @override
  Future<Either<Failure, void>> deleteApplication(String id, String? token) {
    // TODO: implement deleteApplication
    throw UnimplementedError();
  }
  
  @override
  Future<Either<Failure, List<ApplicationEntity>>> getApplications() {
    // TODO: implement getApplications
    throw UnimplementedError();
  }

  // // / *Fetch all job applications*
  // @override
  // Future<Either<Failure, List<ApplicationEntity>>> getApplications() async {
  //   try {
  //     final applications = await _applicationRemoteDataSource.getApplications();
  //     return Right(applications);
  //   } catch (e) {
  //     return Left(ApiFailure(
  //       message: "Failed to fetch job applications.",
  //     ));
  //   }
  // }

  /// *Delete a job application by ID*
  // @override
  // Future<Either<Failure, void>> deleteApplication(String id, String? token) async {
  //   try {
  //     await _applicationRemoteDataSource.deleteApplication(id, token);
  //     return const Right(null);
  //   } catch (e) {
  //     return Left(ApiFailure(
  //       message: "Failed to delete job application. Please try again.",
  //     ));
  //   }
  // }
}