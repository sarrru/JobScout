import 'package:dartz/dartz.dart';
import 'package:job_scout_project/core/error/failure.dart';

// IT is with parameter
abstract interface class UsecaseWithParams<SuccessType, Params> {
  Future<Either<Failure, SuccessType>> call(Params params);
}

// It is not witoutparameter
abstract interface class UsecaseWithoutParams<SuccessType> {
  Future<Either<Failure, SuccessType>> call();
}
