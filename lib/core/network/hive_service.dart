import 'package:hive_flutter/hive_flutter.dart';
import 'package:job_scout_project/app/constants/hive_table_constant.dart';
import 'package:job_scout_project/features/auth/data/model/auth_hive_model.dart';

class HiveService {
  /// Initialize Hive database
  Future<void> init() async {
    // Initialize Hive for Flutter
    await Hive.initFlutter();

    // Register adapters
    Hive.registerAdapter(AuthHiveModelAdapter());

    // Open frequently used boxes
    await Hive.openBox<AuthHiveModel>(HiveTableConstant.jobseekerBox);
  }

  /// Register a new student
  Future<void> register(AuthHiveModel auth) async {
    try {
      var box = await Hive.openBox<AuthHiveModel>(HiveTableConstant.jobseekerBox);
      await box.put(auth.studentId, auth);
    } catch (error) {
      throw Exception("Failed to register student: $error");
    }
  }

  /// Delete a student by ID
  Future<void> deleteAuth(String id) async {
    try {
      var box = await Hive.openBox<AuthHiveModel>(HiveTableConstant.jobseekerBox);
      await box.delete(id);
    } catch (error) {
      throw Exception("Failed to delete student: $error");
    }
  }

  /// Get all registered students
  Future<List<AuthHiveModel>> getAllAuth() async {
    try {
      var box = await Hive.openBox<AuthHiveModel>(HiveTableConstant.jobseekerBox);
      return box.values.toList();
    } catch (error) {
      throw Exception("Failed to fetch students: $error");
    }
  }

  /// Login using username and password
  Future<AuthHiveModel?> login(String username, String password) async {
    try {
      var box = await Hive.openBox<AuthHiveModel>(HiveTableConstant.jobseekerBox);
      var student = box.values.firstWhere(
        (element) =>
            element.username == username && element.password == password,
        orElse: () => throw Exception("Invalid credentials"),
      );
      return student;
    } catch (error) {
      throw Exception("Login failed: $error");
    }
  }

  /// Clear all boxes
  Future<void> clearAll() async {
    try {
      await Hive.deleteBoxFromDisk(HiveTableConstant.batchBox);
      await Hive.deleteBoxFromDisk(HiveTableConstant.courseBox);
      await Hive.deleteBoxFromDisk(HiveTableConstant.jobseekerBox);
      await Hive.deleteBoxFromDisk(HiveTableConstant.categoryBox);
    } catch (error) {
      throw Exception("Failed to clear boxes: $error");
    }
  }

  /// Clear only the student box
  Future<void> clearStudentBox() async {
    try {
      await Hive.deleteBoxFromDisk(HiveTableConstant.jobseekerBox);
    } catch (error) {
      throw Exception("Failed to clear student box: $error");
    }
  }

  /// Close Hive
  Future<void> close() async {
    try {
      await Hive.close();
    } catch (error) {
      throw Exception("Failed to close Hive: $error");
    }
  }
}
