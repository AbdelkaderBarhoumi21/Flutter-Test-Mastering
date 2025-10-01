import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

Future login(WidgetTester tester, String email, String password) async {
  await tester.enterText(find.byKey(ValueKey("emailField")), email);
  await tester.enterText(find.byKey(ValueKey("passwordField")), password);
  await tester.tap(find.byKey(Key("loginButton")));
  await tester.pumpAndSettle();
}
