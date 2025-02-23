import 'package:dartz/dartz.dart';
import 'package:job_scout_project/core/error/failure.dart';
import 'package:job_scout_project/features/profile/domain/entity/profile_entity';

abstract interface class IProfileRepository {
  // Future<Either<Failure, ProfileEntity>> getProfileByUserId(String userId);

  Future<Either<Failure, void>> updateProfile(ProfileEntity profile);
}
