// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:job_scout_project/features/company/presentation/view_model/company_bloc.dart';


// class AddCompanyView extends StatefulWidget {
//   const AddCompanyView({super.key});

//   @override
//   _AddCompanyViewState createState() => _AddCompanyViewState();
// }

// class _AddCompanyViewState extends State<AddCompanyView> {
//   final _formKey = GlobalKey<FormState>();

//   final TextEditingController _nameController = TextEditingController();
//   final TextEditingController _descriptionController = TextEditingController();
//   final TextEditingController _logoController = TextEditingController();
//   final TextEditingController _locationController = TextEditingController();
//   final TextEditingController _websiteController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text("Add Company")),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Form(
//           key: _formKey,
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               _buildTextField("Company Name", _nameController),
//               _buildTextField("Description", _descriptionController),
//               _buildTextField("Logo URL", _logoController),
//               _buildTextField("Location", _locationController),
//               _buildTextField("Website", _websiteController),
//               const SizedBox(height: 20),
//               BlocConsumer<CompanyBloc, CompanyState>(
//                 listener: (context, state) {
//                   if (state is CompanyAdded) {
//                     ScaffoldMessenger.of(context).showSnackBar(
//                       const SnackBar(
//                           content: Text("Company added successfully")),
//                     );
//                     Navigator.pop(context); // Close the form after success
//                   } else if (state is CompanyError) {
//                     ScaffoldMessenger.of(context).showSnackBar(
//                       SnackBar(content: Text(state.message)),
//                     );
//                   }
//                 },
//                 builder: (context, state) {
//                   return SizedBox(
//                     width: double.infinity,
//                     child: ElevatedButton(
//                       onPressed: state is CompanyAdding ? null : _submitForm,
//                       child: state is CompanyAdding
//                           ? const CircularProgressIndicator(color: Colors.white)
//                           : const Text("Add Company"),
//                     ),
//                   );
//                 },
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   /// **Builds Text Input Field**
//   Widget _buildTextField(String label, TextEditingController controller) {
//     return Padding(
//       padding: const EdgeInsets.only(bottom: 12.0),
//       child: TextFormField(
//         controller: controller,
//         decoration:
//             InputDecoration(labelText: label, border: OutlineInputBorder()),
//         validator: (value) =>
//             value == null || value.isEmpty ? "$label cannot be empty" : null,
//       ),
//     );
//   }

//   /// **Handles Form Submission**
//   void _submitForm() {
//     if (_formKey.currentState!.validate()) {
//       context.read<CompanyBloc>().add(
//             AddCompany(
//               name: _nameController.text.trim(),
//               description: _descriptionController.text.trim(),
//               logo: _logoController.text.trim(),
//               location: _locationController.text.trim(),
//               website: _websiteController.text.trim(),
//             ),
//           );
//     }
//   }
// }
