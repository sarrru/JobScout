import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mocktail/mocktail.dart';
import 'package:job_scout_project/features/company/presentation/view_model/company_bloc.dart';
import 'package:job_scout_project/features/company/presentation/view_model/company_state.dart';
import 'package:job_scout_project/features/jobs/presentation/view/job_view.dart';

// Mock CompanyBloc
class MockCompanyBloc extends Mock implements CompanyBloc {}

void main() {
  late MockCompanyBloc mockCompanyBloc;

  setUp(() {
    mockCompanyBloc = MockCompanyBloc();
  });

  Widget createTestWidget() {
    return MaterialApp(
      home: BlocProvider<CompanyBloc>(
        create: (_) => mockCompanyBloc,
        child: const JobViewPage(),
      ),
    );
  }

  testWidgets('JobViewPage renders search bar and sorting dropdown', (WidgetTester tester) async {
    when(() => mockCompanyBloc.state).thenReturn(const CompanyState(
      isLoading: false,
      companies: [],
    ));

    await tester.pumpWidget(createTestWidget());
    await tester.pump(); // Rebuild widget with state

    // Check if search bar is present
    expect(find.byType(TextField), findsOneWidget);

    // Check if sorting dropdown exists
    expect(find.byType(DropdownButton<String>), findsOneWidget);
  });
}
