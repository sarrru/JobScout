// import 'package:bloc_test/bloc_test.dart';
// import 'package:dartz/dartz.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:job_scout_project/core/error/failure.dart';
// import 'package:job_scout_project/features/application/domain/entity/application_entity';
// import 'package:job_scout_project/features/application/domain/usecase/get_all_applications_usecase.dart';
// import 'package:job_scout_project/features/application/presentation/view_model/application_bloc.dart';
// import 'package:mocktail/mocktail.dart';

// class MockGetAllApplicationsUseCase extends Mock
//     implements GetAllApplicationsUseCase {}

// void main() {
//   late MockGetAllApplicationsUseCase mockGetAllApplicationsUseCase;
//   late ApplicationBloc applicationBloc;

//   setUp(() {
//     mockGetAllApplicationsUseCase = MockGetAllApplicationsUseCase();
//     applicationBloc = ApplicationBloc(
//         getAllApplicationsUseCase: mockGetAllApplicationsUseCase);

//     registerFallbackValue(ApplicationEntity(
//       jobId: 'fallbackJobId',
//       applicantId: 'fallbackApplicantId',
//     ));
//   });

//   final tApplication1 = ApplicationEntity(
//     jobId: '101',
//     applicantId: '201',
//   );

//   final tApplication2 = ApplicationEntity(
//     jobId: '102',
//     applicantId: '202',
//     status: 'interviewing',
//   );

//   final tApplications = [tApplication1, tApplication2];

//   tearDown(() {
//     applicationBloc.close();
//   });

//   group('LoadAllApplicationsEvent', () {
//     blocTest<ApplicationBloc, ApplicationState>(
//       'emits [isLoading: true, applications: applications, isLoading: false] when GetAllApplicationsUseCase returns Right(applications)',
//       build: () {
//         when(() => mockGetAllApplicationsUseCase())
//             .thenAnswer((_) async => Right(tApplications));
//         return applicationBloc;
//       },
//       act: (bloc) => bloc.add(const LoadAllApplicationsEvent()),
//       expect: () => [
//         ApplicationState.initial().copyWith(isLoading: true),
//         ApplicationState.initial()
//             .copyWith(applications: tApplications, isLoading: false),
//       ],
//     );

//     blocTest<ApplicationBloc, ApplicationState>(
//       'emits [isLoading: true, error: errorMessage, isLoading: false] when GetAllApplicationsUseCase returns Left(ApiFailure)',
//       build: () {
//         const failure = ApiFailure(message: 'Failed to load applications');
//         when(() => mockGetAllApplicationsUseCase())
//             .thenAnswer((_) async => Left(failure));
//         return applicationBloc;
//       },
//       act: (bloc) => bloc.add(const LoadAllApplicationsEvent()),
//       expect: () => [
//         ApplicationState.initial().copyWith(isLoading: true),
//         ApplicationState.initial()
//             .copyWith(error: 'Failed to load applications', isLoading: false),
//       ],
//     );

//     blocTest<ApplicationBloc, ApplicationState>(
//       'emits [isLoading: true, error: errorMessage, isLoading: false] when GetAllApplicationsUseCase returns Left(ServerFailure)',
//       build: () {
//         const failure = ApiFailure(message: 'Server error');
//         when(() => mockGetAllApplicationsUseCase())
//             .thenAnswer((_) async => Left(failure));
//         return applicationBloc;
//       },
//       act: (bloc) => bloc.add(const LoadAllApplicationsEvent()),
//       expect: () => [
//         ApplicationState.initial().copyWith(isLoading: true),
//         ApplicationState.initial()
//             .copyWith(error: 'Server error', isLoading: false),
//       ],
//     );

//     blocTest<ApplicationBloc, ApplicationState>(
//       'emits [isLoading: true, isLoading: false, applications: []] when GetAllApplicationsUseCase returns Right([]) (empty list)',
//       build: () {
//         when(() => mockGetAllApplicationsUseCase())
//             .thenAnswer((_) async => const Right([])); // Return an empty list
//         return applicationBloc;
//       },
//       act: (bloc) => bloc.add(const LoadAllApplicationsEvent()),
//       expect: () => [
//         ApplicationState.initial().copyWith(isLoading: true),
//         ApplicationState.initial().copyWith(applications: [], isLoading: false),
//       ],
//     );
//   });
// }
