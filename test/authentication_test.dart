// write authentication test e2e for login and register

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:poulty_manager/app/app.dart';
import 'package:poulty_manager/feature/auth/data/local/local_user.dart';

import 'user_local_mock.dart';

void main() {
  testWidgets('Check Invalid Login without credential',
      (WidgetTester tester) async {
    final container = ProviderContainer(overrides: [
      localUserRepositoryProvider.overrideWithValue(UserMockRepo())
    ]);

    await tester.pumpWidget(
      UncontrolledProviderScope(
        container: container,
        child: const App(),
      ),
    );

    expect(find.text('সাইন ইন'), findsOneWidget);

    final loginButton = find.text('অ্যাকাউন্টে প্রবেশ করুন');

    await tester.tap(loginButton);

    await tester.pumpAndSettle();

    expect(find.text('Invalid phone or password'), findsOneWidget);
  });
  testWidgets('Type phone and password and try to login',
      (WidgetTester tester) async {
    final container = ProviderContainer(overrides: [
      localUserRepositoryProvider.overrideWithValue(UserMockRepo())
    ]);

    await tester.pumpWidget(
      UncontrolledProviderScope(
        container: container,
        child: const App(),
      ),
    );

    expect(find.text('সাইন ইন'), findsOneWidget);

    final phoneField = find.byWidgetPredicate((widget) {
      return widget is TextField &&
          widget.decoration?.hintText == "ইমেইল/ফোন নম্বর";
    });
    final passwordField = find.byWidgetPredicate(
      (widget) {
        return widget is TextField &&
            widget.decoration?.hintText == "পাসওয়ার্ড";
      },
    );

    expect(phoneField, findsOneWidget);
    expect(passwordField, findsOneWidget);

    await tester.enterText(phoneField, '01234567890');

    await tester.enterText(passwordField, 'test1234');

    await tester.pumpAndSettle();

    expect(find.text('01234567890'), findsOneWidget);
    expect(find.text('test1234'), findsOneWidget);

    final loginButton = find.text('অ্যাকাউন্টে প্রবেশ করুন');

    await tester.tap(loginButton);

    await tester.pumpAndSettle();
  });

  testWidgets('Go registration screen and register', (tester) async {
    final container = ProviderContainer(overrides: [
      localUserRepositoryProvider.overrideWithValue(UserMockRepo())
    ]);

    await tester.pumpWidget(
      UncontrolledProviderScope(
        container: container,
        child: const App(),
      ),
    );

    expect(find.text('সাইন ইন'), findsOneWidget);
    expect(find.textContaining("সাইন আপ করুন"), findsOneWidget);
  });
}
