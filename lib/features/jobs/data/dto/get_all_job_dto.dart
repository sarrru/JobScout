// import 'package:job_scout_project/features/jobs/data/model/job_api_model.dart';
// import 'package:json_annotation/json_annotation.dart';

// part 'get_all_job_dto.g.dart';

// @JsonSerializable()
// class GetAllJobsDto {
//   final List<JobApiModel> jobs;

//   GetAllJobsDto({required this.jobs});

//   /// *✅ Safe JSON Parsing with Error Handling*
//   factory GetAllJobsDto.fromJson(Map<String, dynamic> json) {
//     if (json.isEmpty || !json.containsKey("jobs")) {
//       throw Exception("Invalid API response: Missing 'jobs' key.");
//     }

//     try {
//       // ✅ Extract the jobs list safely
//       List<dynamic>? jobList = json['jobs'];

//       if (jobList == null || jobList.isEmpty) {
//         print("⚠ Warning: Job list is empty or null");
//         return GetAllJobsDto(jobs: []);
//       }

//       // ✅ Parse and filter valid job entries
//       List<JobApiModel> parsedJobs = jobList
//           .where((e) => e != null && e is Map<String, dynamic>) // Prevent nulls
//           .map((e) {
//             try {
//               return JobApiModel.fromJson(e as Map<String, dynamic>);
//             } catch (error) {
//               print("❌ Skipping invalid entry: $e - Error: $error");
//               return null; // ✅ Skip invalid items instead of crashing
//             }
//           })
//           .whereType<JobApiModel>() // ✅ Ensure only valid models are returned
//           .toList();

//       return GetAllJobsDto(jobs: parsedJobs);
//     } catch (e, stackTrace) {
//       print("❌ Error parsing GetAllJobsDto: $e\nStack Trace: $stackTrace");
//       throw Exception("Error parsing GetAllJobsDto: ${e.toString()}");
//     }
//   }

//   Map<String, dynamic> toJson() => {
//         'jobs': jobs.map((e) => e.toJson()).toList(),
//       };
// }

import 'package:job_scout_project/features/jobs/data/model/job_api_model.dart';
import 'package:json_annotation/json_annotation.dart';


part 'get_all_job_dto.g.dart';

@JsonSerializable()
class GetAllJobsDto {
  final List<JobApiModel> jobs;

  GetAllJobsDto({required this.jobs});

  /// ✅ Improved JSON Parsing with Null Handling
  factory GetAllJobsDto.fromJson(Map<String, dynamic> json) {
    if (json.isEmpty || !json.containsKey("jobs")) {
      throw Exception("Invalid API response: Missing 'jobs' key.");
    }

    try {
      List<dynamic>? jobList = json['jobs'];

      if (jobList == null || jobList.isEmpty) {
        print("⚠ Warning: Job list is empty or null");
        return GetAllJobsDto(jobs: []);
      }

      List<JobApiModel> parsedJobs = jobList
          .where((e) => e != null && e is Map<String, dynamic>) // Prevent nulls
          .map((e) {
            try {
              return JobApiModel.fromJson(e as Map<String, dynamic>);
            } catch (error) {
              print("❌ Skipping invalid entry: $e - Error: $error");
              return null;
            }
          })
          .whereType<JobApiModel>() // Ensure only valid models are returned
          .toList();

      return GetAllJobsDto(jobs: parsedJobs);
    } catch (e, stackTrace) {
      print("❌ Error parsing GetAllJobsDto: $e\nStack Trace: $stackTrace");
      throw Exception("Error parsing GetAllJobsDto: ${e.toString()}");
    }
  }

  Map<String, dynamic> toJson() => {
        'jobs': jobs.map((e) => e.toJson()).toList(),
      };
}