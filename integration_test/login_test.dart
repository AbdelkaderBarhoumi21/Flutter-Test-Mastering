import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import 'package:unit_test/main.dart';

void main() {
  // Initialise l’environnement d’intégration
  /*
  email=eve.holt@reqres.in
  password=cityslicka
  */
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  group("Login integration test test", () {
    //success login
    testWidgets("Successful login", (WidgetTester tester) async {
      await tester.pumpWidget(const MyApp());
      final emailField = find.byKey(const ValueKey("emailField"));
      await tester.enterText(emailField, "eve.holt@reqres.in");
      final passwordField = find.byKey(const ValueKey("passwordField"));
      await tester.enterText(emailField, "cityslicka");
      final loginButton = find.byKey(const ValueKey("loginButton"));
      await tester.tap(loginButton);
      await tester.pumpAndSettle(); //refresh UI
      expect(find.textContaining("Login Successful! Token"), findsOneWidget);
    });
    //error login
    testWidgets("Failed login", (tester) async {
      await tester.pumpWidget(const MyApp());
      final emailField = find.byKey(const ValueKey("emailField"));
      await tester.enterText(emailField, "eve.holt@reqres.in");
      final passwordField = find.byKey(const ValueKey("passwordField"));
      await tester.enterText(emailField, "cityslicka");
      final loginButton = find.byKey(const ValueKey("loginButton"));
      await tester.tap(loginButton);
      await tester.pumpAndSettle(); //refresh UI
      expect(find.textContaining("Missing API key"), findsOneWidget);
    });
  });
}
