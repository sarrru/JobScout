import 'package:dartz/dartz.dart';
import 'package:job_scout_project/core/error/failure.dart';
import 'package:job_scout_project/features/profile/domain/entity/profile_entity';
import 'package:job_scout_project/features/profile/domain/repository/profile_repository.dart';

class UpdateProfileUseCase {
  final IProfileRepository profileRepository;

  UpdateProfileUseCase(this.profileRepository);

  Future<Either<Failure, void>> call(ProfileEntity profile) {
    return profileRepository.updateProfile(profile);
  }
}
