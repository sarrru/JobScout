// import 'package:dartz/dartz.dart';
// import 'package:equatable/equatable.dart';
// import 'package:job_scout_project/app/shared_prefs/token_shared_prefs.dart';
// import 'package:job_scout_project/app/usecase/usecase.dart';
// import 'package:job_scout_project/core/error/failure.dart';
// import 'package:job_scout_project/features/company/domain/entity/company_entity';
// import 'package:job_scout_project/features/company/domain/repository/company_repository.dart';

// /// **Data Transfer Object (DTO) for Creating a Company**
// class CreateCompanyParams extends Equatable {
//   final String name;
//   final String? description;
//   final String? logo;
//   final String? location;
//   final String? website;
//   final String? companyId;
//   final String? userId;

//   /// **Constructor*
//   const CreateCompanyParams({
//     required this.name,
//     this.description,
//     this.logo,
//     this.location,
//     this.website,
//     this.companyId,
//     this.userId,
//   });

//   /// **Empty Constructor with Default Values**
//   const CreateCompanyParams.empty()
//       : name = '',
//         description = null,
//         logo = null,
//         location = null,
//         website = null,
//         companyId = null,
//         userId = null;

//   @override
//   List<Object?> get props => [
//         name,
//         description,
//         logo,
//         location,
//         website,
//         companyId,
//         userId,
//       ];
// }

// /// **Use Case: Create Company**
// class CreateCompanyUseCase
//     implements UsecaseWithParams<void, CreateCompanyParams> {
//   final ICompanyRepository companyRepository;
//   final TokenSharedPrefs tokenSharedPrefs; // ✅ Inject Token Shared Prefs

//   /// **Fixed Constructor**
//   CreateCompanyUseCase({
//     required this.companyRepository,
//     required this.tokenSharedPrefs,
//   });

//   @override
//   Future<Either<Failure, void>> call(CreateCompanyParams params) async {
//     // ✅ Get token from Shared Preferences
//     final tokenResult = await tokenSharedPrefs.getToken();

//     return tokenResult.fold(
//       (failure) => Left(failure), // ✅ Handle token retrieval failure
//       (token) async {
//         if (token.isEmpty) {
//           return Left(ApiFailure(message: "Authentication token is missing"));
//         }

//         return await companyRepository.createCompany(
//           CompanyEntity(
//             companyId: params.companyId ?? '',
//             name: params.name,
//             description: params.description,
//             logo: params.logo,
//             location: params.location,
//             userId: params.userId ?? '',
//             website: params.website,
//           ),
//           token, // ✅ Pass token to repository
//         );
//       },
//     );
//   }
// }
