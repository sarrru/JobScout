import 'package:equatable/equatable.dart';
import 'package:job_scout_project/features/application/domain/entity/application_entity.dart';

/// *Abstract Parent Class for All Application States*
abstract class ApplicationState extends Equatable {
  const ApplicationState();

  @override
  List<Object?> get props => [];
}

/// *Initial State*
class ApplicationInitial extends ApplicationState {}

/// *State When an Application is Being Added*
class ApplicationAdding extends ApplicationState {}

/// *State When an Application is Successfully Added*
class ApplicationAdded extends ApplicationState {}

/// *State When Applications Are Being Loaded*
class ApplicationsLoading extends ApplicationState {}

/// *State When Applications Are Successfully Loaded*
class ApplicationsLoaded extends ApplicationState {
  final List<ApplicationEntity> applications;

  const ApplicationsLoaded(this.applications);

  @override
  List<Object?> get props => [applications];
}

/// *State When an Application is Being Deleted*
class ApplicationDeleting extends ApplicationState {}

/// *State When an Application is Successfully Deleted*
class ApplicationDeleted extends ApplicationState {}

/// *State When There is an Error in Application Processing*
class ApplicationError extends ApplicationState {
  final String message;

  const ApplicationError(this.message);

  @override
  List<Object?> get props => [message];
}