import 'package:bloc/bloc.dart';
import 'package:job_scout_project/features/application/domain/usecase/create_application_usecase.dart';
import 'package:job_scout_project/features/application/presentation/view_model/application_event.dart';
import 'package:job_scout_project/features/application/presentation/view_model/application_state.dart';



class ApplicationBloc extends Bloc<ApplicationEvent, ApplicationState> {
  final CreateApplicationUseCase _createApplicationUseCase;

  ApplicationBloc({required CreateApplicationUseCase createApplicationUseCase})
      : _createApplicationUseCase = createApplicationUseCase,
        super(ApplicationInitial()) {
    on<AddApplication>(_onAddApplication);
  }

  /// *Handles Creating a New Job Application*
  Future<void> _onAddApplication(
      AddApplication event, Emitter<ApplicationState> emit) async {
    emit(ApplicationAdding());

    final result = await _createApplicationUseCase.call(
      CreateApplicationParams(
        jobId: event.jobId,
        applicantId: event.applicantId,
        status: event.status,
        createdAt: event.createdAt,
        updatedAt: event.updatedAt,
      ),
    );

    result.fold(
      (failure) => emit(ApplicationError(failure.message)),
      (_) => emit(ApplicationAdded()),
    );
  }
}