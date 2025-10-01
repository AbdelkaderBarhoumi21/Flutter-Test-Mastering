import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:unit_test/screens/counter_page.dart';

void main() {
  testWidgets("Counter increment Press test", (WidgetTester tester) async {
    // Monte le widget CounterPage dans un MaterialApp
    // pumpWidget = rendu initial dans l’environnement de test
    await tester.pumpWidget(MaterialApp(home: CounterPage()));

    // Finder qui cherche le texte "0" (valeur initiale du compteur)
    Finder textZero = find.text("0");

    // Finder qui cherche le bouton (ici un ElevatedButton)
    Finder btn = find.byKey(Key("btn1"));

    // Vérifie qu'au départ, on voit bien "0" et qu'il y a le bouton
    expect(textZero, findsOneWidget);
    expect(btn, findsOneWidget);

    // Simule un clic sur le bouton
    await tester.tap(btn);

    // pumpAndSettle = reconstruit l'UI après toutes les animations / setState
    await tester.pumpAndSettle();

    // Finder pour le texte "1" (nouvelle valeur attendue après clic)
    Finder textOne = find.text("1");

    // Vérifie que "1" est affiché
    expect(textOne, findsOneWidget);

    // Vérifie que "0" n'est plus affiché
    expect(textZero, findsNothing);
  });
  testWidgets("Calculate the square", (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: CounterPage()));

    Finder textZero = find.text("0");

    Finder btn = find.byKey(Key("btn1"));
    Finder numberfield = find.byType(TextField);

    expect(textZero, findsOneWidget);
    expect(btn, findsOneWidget);
    expect(numberfield, findsOneWidget);
    num number = 5;
    await tester.enterText(numberfield, "$number");

    await tester.tap(btn);

    await tester.pumpAndSettle();
    num result = number * number;

    Finder textOne = find.text("$result");

    expect(textOne, findsOneWidget);

    expect(textZero, findsNothing);
  });
}
