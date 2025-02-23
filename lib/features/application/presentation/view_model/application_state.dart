part of 'application_bloc.dart';

class ApplicationState extends Equatable {
  final List<ApplicationEntity> applications;
  final bool isLoading;
  final String? error;

  const ApplicationState({
    required this.applications,
    required this.isLoading,
    this.error,
  });

  factory ApplicationState.initial() {
    return const ApplicationState(
      applications: [],
      isLoading: false,
      error: null,
    );
  }

  ApplicationState copyWith({
    List<ApplicationEntity>? applications,
    bool? isLoading,
    String? error,
  }) {
    return ApplicationState(
      applications: applications ?? this.applications,
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
    );
  }

  @override
  List<Object?> get props => [applications, isLoading, error];
}
