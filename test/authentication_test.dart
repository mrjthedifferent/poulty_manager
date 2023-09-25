// write authentication test e2e for login and register

// Path: test/authentication_test.dart

import 'package:flutter_test/flutter_test.dart';
import 'package:poulty_manager/app/app.dart';

void main() {
  testWidgets('Login and Register', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const App());

    // Verify that our counter starts at 0.
    expect(find.text('সাইন ইন'), findsOneWidget);

    // find a button with text  অ্যাকাউন্টে প্রবেশ করুন
    final loginButton = find.text('অ্যাকাউন্টে প্রবেশ করুন');
    // tap on the login button
    await tester.tap(loginButton);
    // wait for the animation to complete
    await tester.pumpAndSettle();

    // it show a snackbar with text Invalid phone or password
    expect(find.text('Invalid phone or password'), findsOneWidget);
  });
}
