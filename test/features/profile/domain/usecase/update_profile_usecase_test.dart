// import 'package:dartz/dartz.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:job_scout_project/core/error/failure.dart';
// import 'package:job_scout_project/features/profile/domain/entity/profile_entity';
// import 'package:job_scout_project/features/profile/domain/repository/profile_repository.dart';
// import 'package:job_scout_project/features/profile/domain/usecase/update_profile_usecase.dart';
// import 'package:mocktail/mocktail.dart';

// class MockProfileRepository extends Mock implements IProfileRepository {}

// void main() {
//   late UpdateProfileUseCase useCase;
//   late MockProfileRepository repository;

//   setUp(() {
//     repository = MockProfileRepository();
//     useCase = UpdateProfileUseCase(repository);

//     // Register fallback value for ProfileEntity
//     registerFallbackValue(const ProfileEntity(
//       bio: 'Fallback Bio',
//       skills: [],
//       resume: 'fallback_resume.pdf',
//       resumeOriginalName: 'fallback_resume.pdf',
//       companyId: 'fallbackCompanyId',
//       profilePhoto: 'fallback_url',
//     ));
//   });

//   const tProfile = ProfileEntity(
//     bio: 'Test Bio',
//     skills: ['Flutter', 'Dart'], // Changed to const list
//     resume: 'test_resume.pdf',
//     resumeOriginalName: 'test_resume.pdf',
//     companyId: 'testCompanyId',
//     profilePhoto: 'http://example.com/profile.jpg',
//   );

//   test('should call the profile repository to update profile', () async {
//     // Arrange
//     when(() => repository.updateProfile(tProfile))
//         .thenAnswer((_) async => const Right(null));

//     // Act
//     final result = await useCase(tProfile);

//     // Assert
//     expect(result, const Right(null));
//     verify(() => repository.updateProfile(tProfile)).called(1);
//     verifyNoMoreInteractions(repository);
//   });

//   test(
//       'should return a failure when the call to the profile repository is unsuccessful',
//       () async {
//     // Arrange
//     when(() => repository.updateProfile(tProfile)).thenAnswer(
//         (_) async => Left(ApiFailure(message: 'Failed to update profile')));

//     // Act
//     final result = await useCase(tProfile);

//     // Assert
//     expect(result, Left(ApiFailure(message: 'Failed to update profile')));
//     verify(() => repository.updateProfile(tProfile)).called(1);
//     verifyNoMoreInteractions(repository);
//   });
// }
