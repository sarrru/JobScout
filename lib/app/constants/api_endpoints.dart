class ApiEndpoints {
  ApiEndpoints._();

  static const Duration connectionTimeout = Duration(seconds: 1000);
  static const Duration receiveTimeout = Duration(seconds: 5000);
  // static const String baseUrl = "http://192.168.137.1:4011/api/";
  static const String baseUrl = "http://10.0.2.2:5000/api/v1/";

  // ================= Auth Routes =========================
  static const String login = "user/login";
  static const String register = "user/register";
  // static const String getAllStudents = "user/getAllStudents";
  // static const String getStudentsByBatch = "user/getStudentsByBatch/";
  // static const String getStudentsByCourse = "user/getStudentsByCourse/";
  // static const String updateStudent = "user/updateStudent/";
  // static const String deleteStudent = "v/deleteStudent/";
  static const String imageUrl = "http://10.0.2.2:3000/uploads/";
  static const String uploadImage = "user/uploadImage";

  // // ======================== Batch Routes =============================
  // static const String createBatch = "batch/createBatch";
  // static const String getAllBatch = "batch/getAllBatches";

  // ======================== Company Routes =============================
  static const String createCompany = "company/createCompany";
  static const String getAllBatch = "batch/getAllBatches";
  // ======================== Batch Routes =============================
  // static const String createCourse = "course/createCourse";
  // static const String deleteCourse = "course/";
  // static const String getAllCourse = "course/getAllCourse";
}
