import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:job_scout_project/features/application/domain/entity/application_entity';
import 'package:job_scout_project/features/application/domain/usecase/get_all_applications_usecase.dart';

part 'application_event.dart';
part 'application_state.dart';

class ApplicationBloc extends Bloc<ApplicationEvent, ApplicationState> {
  final GetAllApplicationsUseCase _getAllApplicationsUseCase;

  ApplicationBloc({
    required GetAllApplicationsUseCase getAllApplicationsUseCase,
  })  : _getAllApplicationsUseCase = getAllApplicationsUseCase,
        super(ApplicationState.initial()) {
    on<LoadAllApplicationsEvent>(_onLoadAllApplications);
  }

  Future<void> _onLoadAllApplications(
    LoadAllApplicationsEvent event,
    Emitter<ApplicationState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));

    final result = await _getAllApplicationsUseCase();
    result.fold(
      (failure) =>
          emit(state.copyWith(isLoading: false, error: failure.message)),
      (applications) => emit(state.copyWith(
        isLoading: false,
        applications: applications,
      )),
    );
  }
}
