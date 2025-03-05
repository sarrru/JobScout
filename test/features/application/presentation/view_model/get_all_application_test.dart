// import 'package:dartz/dartz.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:job_scout_project/core/error/failure.dart';
// import 'package:job_scout_project/features/application/domain/entity/application_entity.dart';
// import 'package:job_scout_project/features/application/domain/repository/application_repository.dart';

// import 'package:mocktail/mocktail.dart';

// class MockApplicationRepository extends Mock implements IApplicationRepository {}

// void main() {
//   late GetAllApplicationsUseCase getAllApplicationsUseCase;
//   late MockApplicationRepository mockApplicationRepository;

//   setUp(() {
//     mockApplicationRepository = MockApplicationRepository();
//     getAllApplicationsUseCase = GetAllApplicationsUseCase(mockApplicationRepository);
//   });

//   final tApplication1 = ApplicationEntity(
//     applicationId: 'app123',
//     jobId: '101',
//     applicantId: '201',
//     status: 'pending',
//     createdAt: DateTime.now(),
//     updatedAt: DateTime.now(),
//   );

//   final tApplication2 = ApplicationEntity(
//     applicationId: 'app456',
//     jobId: '102',
//     applicantId: '202',
//     status: 'interviewing',
//     createdAt: DateTime.now(),
//     updatedAt: DateTime.now(),
//   );

//   final tApplications = [tApplication1, tApplication2];

//   group('GetAllApplicationsUseCase', () {
//     test('should return Right(applications) when fetching applications is successful', () async {
//       // Arrange
//       when(() => mockApplicationRepository.getApplications())
//           .thenAnswer((_) async => Right(tApplications));

//       // Act
//       final result = await getAllApplicationsUseCase();

//       // Assert
//       expect(result, Right(tApplications));
//       verify(() => mockApplicationRepository.getApplications()).called(1);
//     });

//     test('should return Left(ApiFailure) when repository returns an API failure', () async {
//       // Arrange
//       const failure = ApiFailure(message: 'Failed to fetch applications');
//       when(() => mockApplicationRepository.getApplications())
//           .thenAnswer((_) async => Left(failure));

//       // Act
//       final result = await getAllApplicationsUseCase();

//       // Assert
//       expect(result, Left(failure));
//       verify(() => mockApplicationRepository.getApplications()).called(1);
//     });

//     test('should return Left(ServerFailure) when repository returns a server failure', () async {
//       // Arrange
//       const failure = ApiFailure(message: 'Server error occurred');
//       when(() => mockApplicationRepository.getApplications())
//           .thenAnswer((_) async => Left(failure));

//       // Act
//       final result = await getAllApplicationsUseCase();

//       // Assert
//       expect(result, Left(failure));
//       verify(() => mockApplicationRepository.getApplications()).called(1);
//     });

//     test('should return Right([]) when no applications are available', () async {
//       // Arrange
//       when(() => mockApplicationRepository.getApplications())
//           .thenAnswer((_) async => const Right([]));

//       // Act
//       final result = await getAllApplicationsUseCase;

//       // Assert
//       expect(result, const Right([]));
//       verify(() => mockApplicationRepository.getApplications()).called(1);
//     });
//   });
// }

// class GetAllApplicationsUseCase {
// }
