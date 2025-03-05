class ApiEndpoints {
  ApiEndpoints._();

  static const Duration connectionTimeout = Duration(seconds: 1000);
  static const Duration receiveTimeout = Duration(seconds: 8000);
  // static const String baseUrl = "http://192.168.137.1:4011/api/";
  static const String baseUrl = "http://10.0.2.2:5000/api/v1/";
  // static const String baseUrl = "http://192.168.18.5:5000/api/v1/";

  // ================= Auth Routes =========================
  static const String login = "user/login";
  static const String register = "user/register";
  // static const String getAllStudents = "auth/getAllStudents";
  // static const String getStudentsByBatch = "auth/getStudentsByBatch/";
  // static const String getStudentsByCourse = "auth/getStudentsByCourse/";
  // static const String updateStudent = "auth/updateStudent/";
  // static const String deleteStudent = "auth/deleteStudent/";
  static const String imageUrl = "http://10.0.2.2:5000/uploads/";
  static const String uploadImage = "user/uploadImage";

  // // ======================== Batch Routes =============================
  // static const String createBatch = "batch/createBatch";
  static const String getAllJobs = "job/get/";
  static const String getJobById = "job/get/:id";

  // ======================== Company Routes =============================
  static const String createCompany = "company/createCompany";
  static const String createApplication = "application/createApplication";
  static const String getAllCompany = "company/get";
  static const String getCompanyById = "company/get";
  // ======================== Batch Routes =============================
}
