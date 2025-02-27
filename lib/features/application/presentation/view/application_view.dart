import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:job_scout_project/features/application/presentation/view_model/application_bloc.dart';
import 'package:job_scout_project/features/application/presentation/view_model/application_event.dart';
import 'package:job_scout_project/features/application/presentation/view_model/application_state.dart';


class AddApplicationView extends StatefulWidget {
  const AddApplicationView({super.key});

  @override
  _AddApplicationViewState createState() => _AddApplicationViewState();
}

class _AddApplicationViewState extends State<AddApplicationView> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _jobIdController = TextEditingController();
  final TextEditingController _applicantIdController = TextEditingController();
  final TextEditingController _statusController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Apply for Job")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildTextField("Job ID", _jobIdController),
              _buildTextField("Applicant ID", _applicantIdController),
              _buildTextField("Status (Optional)", _statusController),
              const SizedBox(height: 20),
              BlocConsumer<ApplicationBloc, ApplicationState>(
                listener: (context, state) {
                  if (state is ApplicationAdded) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                          content: Text("Job application submitted successfully")),
                    );
                    Navigator.pop(context); // Close the form after success
                  } else if (state is ApplicationError) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(state.message)),
                    );
                  }
                },
                builder: (context, state) {
                  return SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: state is ApplicationAdding ? null : _submitForm,
                      child: state is ApplicationAdding
                          ? const CircularProgressIndicator(color: Colors.white)
                          : const Text("Submit Application"),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// *Builds Text Input Field*
  Widget _buildTextField(String label, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: TextFormField(
        controller: controller,
        decoration:
            InputDecoration(labelText: label, border: OutlineInputBorder()),
        validator: (value) =>
            value == null || value.isEmpty ? "$label cannot be empty" : null,
      ),
    );
  }

  /// *Handles Form Submission*
  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      context.read<ApplicationBloc>().add(
            AddApplication(
              jobId: _jobIdController.text.trim(),
              applicantId: _applicantIdController.text.trim(),
              status: _statusController.text.trim().isEmpty
                  ? "pending"
                  : _statusController.text.trim(),
            ),
          );
    }
  }
}