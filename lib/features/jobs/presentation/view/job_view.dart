// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:job_scout_project/features/jobs/presentation/view_model/job_bloc.dart';
// import 'package:job_scout_project/features/jobs/presentation/view_model/job_event.dart';
// import 'package:job_scout_project/features/jobs/presentation/view_model/job_state.dart';

// class JobView extends StatefulWidget {
//   const JobView({super.key});

//   @override
//   State<JobView> createState() => _JobViewState();
// }

// class _JobViewState extends State<JobView> {
//   @override
//   void initState() {
//     super.initState();
//     context.read<JobBloc>().add(LoadJobsEvent()); // Load jobs when view opens
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Job Listings')),
//       body: BlocBuilder<JobBloc, JobState>(
//         builder: (context, state) {
//           if (state is JobLoadingState) {
//             return const Center(child: CircularProgressIndicator());
//           } else if (state is JobLoadedState) {
//             return ListView.builder(
//               itemCount: state.jobs.length,
//               itemBuilder: (context, index) {
//                 final job = state.jobs[index];
//                 return Card(
//                   margin: const EdgeInsets.all(8),
//                   child: ListTile(
//                     title: Text(job.title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
//                     subtitle: Text("Company: ${job.company.name}\nLocation: ${job.location}"),
//                     trailing: IconButton(
//                       icon: const Icon(Icons.arrow_forward),
//                       onPressed: () {
//                         // Navigate to job details screen (Implement later)
//                       },
//                     ),
//                   ),
//                 );
//               },
//             );
//           } else if (state is JobErrorState) {
//             return Center(child: Text(state.message, style: const TextStyle(color: Colors.red, fontSize: 16)));
//           }
//           return const Center(child: Text("No jobs available"));
//         },
//       ),
//     );
//   }
// }
