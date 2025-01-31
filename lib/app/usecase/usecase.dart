import 'package:dartz/dartz.dart';
import 'package:job_scout_project/core/error/failure.dart';


//generic usecase junai datat type ko lagi hune vayo
abstract interface class UsecaseWithParams<SuccessType, Params> {
  // login ko case ma username password return garxa so teslai return garne params laa
  Future<Either<Failure, SuccessType>> call(Params params);
}

abstract interface class UsecaseWithoutParams<SuccessType> {
  Future<Either<Failure, SuccessType>> call();
}
