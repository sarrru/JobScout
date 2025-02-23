import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:job_scout_project/core/error/failure.dart';
import 'package:job_scout_project/features/application/domain/entity/application_entity';
import 'package:job_scout_project/features/application/domain/repository/application_repository.dart';
import 'package:job_scout_project/features/application/domain/usecase/get_all_applications_usecase.dart';
import 'package:mocktail/mocktail.dart';

class MockApplicationRepository extends Mock
    implements IApplicationRepository {}

void main() {
  late GetAllApplicationsUseCase useCase;
  late MockApplicationRepository repository;

  setUp(() {
    repository = MockApplicationRepository();
    useCase = GetAllApplicationsUseCase(repository);
    registerFallbackValue(
      ApplicationEntity(
        jobId: 'fallbackJobId',
        applicantId: 'fallbackApplicantId',
      ),
    );
  });

  final tApplication1 = ApplicationEntity(
    jobId: '101',
    applicantId: '201',
  );

  final tApplication2 = ApplicationEntity(
    jobId: '102',
    applicantId: '202',
    status: 'interviewing',
  );

  final tApplications = [tApplication1, tApplication2];

  test(
      'should return a list of ApplicationEntities when fetching all applications is successful',
      () async {
    // Arrange
    when(() => repository.getAllApplications())
        .thenAnswer((_) async => Right(tApplications));

    // Act
    final result = await useCase();

    // Assert
    expect(result, Right(tApplications));
    verify(() => repository.getAllApplications()).called(1);
    verifyNoMoreInteractions(repository);
  });

  test('should return a Failure when fetching all applications fails',
      () async {
    // Arrange
    final failure = ApiFailure(message: 'Failed to fetch applications');
    when(() => repository.getAllApplications())
        .thenAnswer((_) async => Left(failure));

    // Act
    final result = await useCase();

    // Assert
    expect(result, Left(failure));
    verify(() => repository.getAllApplications()).called(1);
    verifyNoMoreInteractions(repository);
  });
}
