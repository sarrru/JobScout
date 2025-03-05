import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:job_scout_project/features/auth/presentation/view/sign_up_view.dart';
import 'package:mocktail/mocktail.dart';
import 'package:job_scout_project/features/auth/presentation/view/login_view.dart';
import 'package:job_scout_project/features/auth/presentation/view_model/login/login_bloc.dart';

class MockLoginBloc extends MockBloc<LoginEvent, LoginState>
    implements LoginBloc {}

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  late MockLoginBloc loginBloc;

  setUp(() {
    loginBloc = MockLoginBloc();
  });

  Widget loadLoginView() {
    return BlocProvider<LoginBloc>(
      create: (context) => loginBloc,
      child: const MaterialApp(
        home: LoginView(),
      ),
    );
  }

  group('LoginView Integration Tests', () {
    testWidgets('Check if Login and Register buttons exist', (tester) async {
      await tester.pumpWidget(loadLoginView());
      await tester.pumpAndSettle();

      expect(find.widgetWithText(ElevatedButton, 'LOGIN'), findsOneWidget);
      expect(find.widgetWithText(ElevatedButton, 'CREATE ACCOUNT'), findsOneWidget);
    });

    testWidgets('Check username and password input fields', (tester) async {
      await tester.pumpWidget(loadLoginView());
      await tester.pumpAndSettle();

      await tester.enterText(find.byType(TextFormField).at(0), 'testuser');
      await tester.enterText(find.byType(TextFormField).at(1), 'password123');

      expect(find.text('testuser'), findsOneWidget);
      expect(find.text('password123'), findsOneWidget);
    });

    testWidgets('Check for validation error when fields are empty', (tester) async {
      await tester.pumpWidget(loadLoginView());
      await tester.pumpAndSettle();

      await tester.tap(find.widgetWithText(ElevatedButton, 'LOGIN'));
      await tester.pumpAndSettle();

      expect(find.text('Username is required'), findsWidgets);
      expect(find.text('Please enter your password'), findsWidgets);
    });

    testWidgets('Login success scenario - navigates to HomeView', (tester) async {
      when(() => loginBloc.state)
          .thenReturn(LoginState(isLoading: false, isSuccess: true));

      await tester.pumpWidget(loadLoginView());
      await tester.pumpAndSettle();

      await tester.enterText(find.byType(TextFormField).at(0), 'validuser');
      await tester.enterText(find.byType(TextFormField).at(1), 'validpassword');
      await tester.tap(find.widgetWithText(ElevatedButton, 'LOGIN'));
      await tester.pumpAndSettle();

      expect(loginBloc.state.isSuccess, isTrue);
    });

  });
}
