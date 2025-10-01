import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import 'package:unit_test/main.dart';

void main() {
  // Initialise l’environnement d’intégration
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  group("end to end test", () {
    testWidgets("Counter increment Press test", (WidgetTester tester) async {
      await tester.pumpWidget(const MyApp());
      Finder textZero = find.text("0");
      Finder tap = find.byKey(ValueKey("increment"));
      expect(textZero, findsOneWidget);
      expect(tap, findsOneWidget);
      await tester.tap(tap);
      await tester.pumpAndSettle();
      Finder textOne = find.text("1");
      expect(textOne, findsOneWidget);
    });
  });
}
