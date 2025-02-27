import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:job_scout_project/features/jobs/domain/entity/jobs_entity.dart';
import 'package:job_scout_project/features/jobs/domain/use_case/get_all_jobs_usecase.dart';
import 'package:job_scout_project/features/jobs/domain/use_case/get_job_by_id_usecase.dart';

part 'job_event.dart';
part 'job_state.dart';

class JobBloc extends Bloc<JobEvent, JobState> {
  final GetAllJobs _getAllJobs;
  final GetJobById _getJobById;

  JobBloc({
    required GetAllJobs getAllJobs,
    required GetJobById getJobById,
  })  : _getAllJobs = getAllJobs,
        _getJobById = getJobById,
        super(JobState.initial()) {
    on<LoadJobs>(_onLoadJobs);
    on<LoadJobDetails>(_onLoadJobDetails);
  }

  void _onLoadJobs(LoadJobs event, Emitter<JobState> emit) async {
    emit(state.copyWith(isLoading: true));

    final result = await _getAllJobs.call();

    result.fold(
        (failure) =>
            emit(state.copyWith(isLoading: false, error: failure.message)),
        (Jobs) => emit(state.copyWith(
              isLoading: false,
              error: null,
              jobs: Jobs,
            )));
  }

  void _onLoadJobDetails(LoadJobDetails event, emit) async {
    emit(state.copyWith(isLoading: true));

    final result = await _getJobById.call(event.jobId); // Directly pass JobId

    result.fold(
      (failure) =>
          emit(state.copyWith(isLoading: false, error: failure.message)),
      (Job) => emit(state.copyWith(
        isLoading: false,
        error: null,
        selectedJob: Job,
      )),
    );
  }
}
