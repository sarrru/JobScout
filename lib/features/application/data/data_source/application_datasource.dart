import 'package:job_scout_project/features/application/domain/entity/application_entity.dart';

abstract interface class IApplicationDataSource {
  Future<List<ApplicationEntity>> getApplications(); // Fetch all applications
  Future<void> createApplication(
      ApplicationEntity application, String token); // Create a new application
  Future<void> deleteApplication(
      String id, String? token); // Delete an application by ID
}
