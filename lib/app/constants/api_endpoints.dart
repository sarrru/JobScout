class ApiEndpoints {
  ApiEndpoints._();

  static const Duration connectionTimeout = Duration(seconds: 1000);
  static const Duration receiveTimeout = Duration(seconds: 5000);
  // static const String baseUrl = "http://192.168.137.1:4011/api/";
  static const String baseUrl = "http://10.0.2.2:8000/api/v1/";

  // ================= Auth Routes =========================
  static const String login = "auth/login";
  static const String register = "auth/register";
  // static const String getAllStudents = "auth/getAllStudents";
  // static const String getStudentsByBatch = "auth/getStudentsByBatch/";
  // static const String getStudentsByCourse = "auth/getStudentsByCourse/";
  // static const String updateStudent = "auth/updateStudent/";
  // static const String deleteStudent = "auth/deleteStudent/";
  static const String imageUrl = "http://10.0.2.2:3000/uploads/";
  static const String uploadImage = "auth/uploadImage";

  // // ======================== Batch Routes =============================
  // static const String createBatch = "batch/createBatch";
  // static const String getAllBatch = "batch/getAllBatches";

  // ======================== Batch Routes =============================
  // static const String createCourse = "course/createCourse";
  // static const String deleteCourse = "course/";
  // static const String getAllCourse = "course/getAllCourse";
}
