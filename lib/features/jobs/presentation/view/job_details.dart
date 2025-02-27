import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:job_scout_project/features/company/presentation/view_model/company_bloc.dart';
import 'package:job_scout_project/features/company/presentation/view_model/company_event.dart';
import 'package:job_scout_project/features/company/presentation/view_model/company_state.dart';

class CompanyDetailsPage extends StatefulWidget {
  final String companyId;

  const CompanyDetailsPage({super.key, required this.companyId});

  @override
  _CompanyDetailsPageState createState() => _CompanyDetailsPageState();
}

class _CompanyDetailsPageState extends State<CompanyDetailsPage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      context.read<CompanyBloc>().add(FetchCompanyById(widget.companyId));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Company Details"),
        backgroundColor: Colors.deepPurple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: BlocBuilder<CompanyBloc, CompanyState>(
          builder: (context, state) {
            if (state.isLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state.error != null) {
              return Center(
                child: Text(state.error!,
                    style: const TextStyle(color: Colors.red, fontSize: 16)),
              );
            } else if (state.selectedCompany == null) {
              return const Center(
                child: Text("Company details not available."),
              );
            }

            final company = state.selectedCompany!;

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(company.name,
                    style: const TextStyle(
                        fontSize: 22, fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                Text(company.description ?? "No description available"),
                const SizedBox(height: 8),
                Text("Location: ${company.location ?? 'Not provided'}"),
                const SizedBox(height: 8),
                Text("Salary: \$${company.jobSalary ?? 'Not Disclosed'}"),
              ],
            );
          },
        ),
      ),
    );
  }
}