import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:job_scout_project/features/auth/presentation/view/login_view.dart';
import 'package:mocktail/mocktail.dart';
import 'package:image_picker/image_picker.dart';
import 'package:job_scout_project/features/auth/presentation/view/sign_up_view.dart';
import 'package:job_scout_project/features/auth/presentation/view_model/signup/register_bloc.dart';

class MockRegisterBloc extends MockBloc<RegisterEvent, RegisterState>
    implements RegisterBloc {}

class MockImagePicker extends Mock implements ImagePicker {}

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  late MockRegisterBloc registerBloc;
  late MockImagePicker mockImagePicker;

  setUp(() {
    registerBloc = MockRegisterBloc();
    mockImagePicker = MockImagePicker();
  });

  Widget loadSignUpView() {
    return BlocProvider<RegisterBloc>(
      create: (context) => registerBloc,
      child: const MaterialApp(
        home: SignUpView(),
      ),
    );
  }

  group('SignUpView Integration Tests', () {
    testWidgets('Check if Register button exists', (tester) async {
      await tester.pumpWidget(loadSignUpView());
      await tester.pumpAndSettle();

      expect(find.widgetWithText(ElevatedButton, 'REGISTER'), findsOneWidget);
    });

    testWidgets('Check input fields for username, email, phone, and password', (tester) async {
      await tester.pumpWidget(loadSignUpView());
      await tester.pumpAndSettle();

      await tester.enterText(find.byType(TextFormField).at(0), 'testuser');
      await tester.enterText(find.byType(TextFormField).at(1), '9876543210');
      await tester.enterText(find.byType(TextFormField).at(2), 'test@example.com');
      await tester.enterText(find.byType(TextFormField).at(3), 'password123');

      expect(find.text('testuser'), findsOneWidget);
      expect(find.text('9876543210'), findsOneWidget);
      expect(find.text('test@example.com'), findsOneWidget);
      expect(find.text('password123'), findsOneWidget);
    });

    testWidgets('Check for validation error when fields are empty', (tester) async {
      await tester.pumpWidget(loadSignUpView());
      await tester.pumpAndSettle();

      await tester.tap(find.widgetWithText(ElevatedButton, 'REGISTER'));
      await tester.pumpAndSettle();

      expect(find.text('Username is required'), findsWidgets);
      expect(find.text('Phone number is required'), findsWidgets);
      expect(find.text('Email is required'), findsWidgets);
      expect(find.text('Password is required'), findsWidgets);
    });

    testWidgets('Check for invalid email error', (tester) async {
      await tester.pumpWidget(loadSignUpView());
      await tester.pumpAndSettle();

      await tester.enterText(find.byType(TextFormField).at(2), 'invalidemail');
      await tester.tap(find.widgetWithText(ElevatedButton, 'REGISTER'));
      await tester.pumpAndSettle();

      expect(find.text('Enter a valid email address'), findsWidgets);
    });

    testWidgets('Check for invalid phone number error', (tester) async {
      await tester.pumpWidget(loadSignUpView());
      await tester.pumpAndSettle();

      await tester.enterText(find.byType(TextFormField).at(1), '1234');
      await tester.tap(find.widgetWithText(ElevatedButton, 'REGISTER'));
      await tester.pumpAndSettle();

      expect(find.text('Enter a valid 10-digit phone number'), findsWidgets);
    });

    testWidgets('Check for weak password error', (tester) async {
      await tester.pumpWidget(loadSignUpView());
      await tester.pumpAndSettle();

      await tester.enterText(find.byType(TextFormField).at(3), '123');
      await tester.tap(find.widgetWithText(ElevatedButton, 'REGISTER'));
      await tester.pumpAndSettle();

      expect(find.text('Password must be at least 6 characters long'), findsWidgets);
    });

    

    testWidgets('Registration success scenario', (tester) async {
      when(() => registerBloc.state)
          .thenReturn(RegisterState(isLoading: false, isSuccess: true));

      await tester.pumpWidget(loadSignUpView());
      await tester.pumpAndSettle();

      await tester.enterText(find.byType(TextFormField).at(0), 'validuser');
      await tester.enterText(find.byType(TextFormField).at(1), '9876543210');
      await tester.enterText(find.byType(TextFormField).at(2), 'valid@example.com');
      await tester.enterText(find.byType(TextFormField).at(3), 'password123');
      await tester.tap(find.widgetWithText(ElevatedButton, 'REGISTER'));
      await tester.pumpAndSettle();

      expect(registerBloc.state.isSuccess, isTrue);
    });

    
    testWidgets('Navigation to LoginView', (tester) async {
      await tester.pumpWidget(loadSignUpView());
      await tester.pumpAndSettle();

      await tester.tap(find.widgetWithText(TextButton, 'Login here'));
      await tester.pumpAndSettle();

      expect(find.byType(LoginView), findsOneWidget);
    });
  });
}
