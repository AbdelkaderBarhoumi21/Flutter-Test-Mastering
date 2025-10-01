import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import 'package:unit_test/main.dart';
import 'package:unit_test/screens/login_page.dart';

import 'test_utils.dart';

void main() {
  /*
  Enter your email address/password,
  press "Login",
  check the items are present,
  open the details,
  add a product via the dialog box.
  */
  // Initialise l’environnement d’intégration
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  group("App Integration Tests to end", () {
    testWidgets("Login success", (tester) async {
      await tester.pumpWidget(MyApp());
      await login(tester, "abdelkader@gmail.com", "password123");
      expect(find.byType(ProductListPage), findsOneWidget);
    });
    testWidgets("Add New product", (tester) async {
      await tester.pumpWidget(MyApp());
      await login(tester, "abdelkader@gmail.com", "password123");
      await tester.tap(find.byKey(Key("addProductButton")));
      await tester.pumpAndSettle();
      await tester.enterText(find.byKey(Key("addProductField")), "Product 3");
      await tester.tap(find.byKey(Key("confirmAddProduct")));
      await tester.pumpAndSettle();
      expect(find.text("Product 3"), findsOneWidget);
    });
    testWidgets("Navigate to product details", (tester) async {
      await tester.pumpWidget(MyApp());
      await login(tester, "abdelkader@gmail.com", "password123");
      await tester.tap(find.byKey(Key("product_0")));
      await tester.pumpAndSettle();
      expect(find.text("Details for Product 1"), findsOneWidget);
    });
  });
}

// to run it =>flutter test integration_test/product_test.dart
