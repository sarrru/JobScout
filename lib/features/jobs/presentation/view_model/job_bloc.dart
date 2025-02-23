// import 'package:bloc/bloc.dart';
// import 'package:dartz/dartz.dart';
// import 'package:equatable/equatable.dart';
// import 'package:job_scout_project/core/error/failure.dart';
// import 'package:job_scout_project/features/jobs/domain/entity/jobs_entity';
// import 'package:job_scout_project/features/jobs/domain/use_case/get_all_jobs_usecase.dart';
// import 'package:job_scout_project/features/jobs/presentation/view_model/job_event.dart';
// import 'package:job_scout_project/features/jobs/presentation/view_model/job_state.dart';



// class JobBloc extends Bloc<JobEvent, JobState> {
//   final GetAllJobUseCase _getAllJobsUseCase;


//   JobBloc({
//     required GetAllJobUseCase getAllJobsUseCase,

//   })  : _getAllJobsUseCase = getAllJobsUseCase,
    
//         super(JobInitialState()) {
//     on<LoadJobsEvent>(_onLoadJobs);

//   }

//   /// **Load All Jobs**
//   void _onLoadJobs(
//     LoadJobsEvent event,
//     Emitter<JobState> emit,
//   ) async {
//     emit(JobLoadingState());

//     final Either<Failure, List<JobEntity>> result = await _getAllJobsUseCase();

//     result.fold(
//       (failure) => emit(JobErrorState(message: failure.message)),
//       (jobs) => emit(JobLoadedState(jobs: jobs)),
//     );
//   }

 
// }
