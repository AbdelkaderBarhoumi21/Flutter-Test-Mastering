import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:unit_test/screens/widget.dart';

void main() {
  testWidgets("My widget has a title and message", (WidgetTester tester) async {
    await tester.pumpWidget(
      const MyWidget(title: "T", message: "M"),
    ); //render(build) inside test enviromenet
    Finder title = find.text("T"); //search for widget inside test enviroment
    Finder message = find.text("M");
    expect(title, findsOneWidget); //Le texte "T" est bien affiché une fois.
    expect(message, findsOneWidget);
  });
  testWidgets("Find widget by key", (WidgetTester tester) async {
    await tester.pumpWidget(const MyWidget(title: "T", message: "M"));
    Finder appbarFinder = find.byKey(Key("Appbar"));
    expect(appbarFinder, findsOneWidget);
  });
  testWidgets("Find appbar with title", (WidgetTester tester) async {
    await tester.pumpWidget(const MyWidget(title: "T", message: "M"));
    Finder appbarFinder = find.byKey(Key("Appbar"));
    expect(appbarFinder, findsOneWidget);
    Finder appbarTitle = find.descendant(
      of: appbarFinder,
      matching: find.text("T"),
    );
    expect(appbarTitle, findsOneWidget);
  });
  testWidgets("Find widget by type", (WidgetTester tester) async {
    await tester.pumpWidget(const MyWidget(title: "T", message: "M"));
    Finder centerFind = find.byType(Center);
    expect(centerFind, findsOneWidget);
  });
  testWidgets("Find widget by instance", (WidgetTester tester) async {
    Widget icon = const Icon(Icons.done);
    await tester.pumpWidget(MyWidget(title: "T", message: "M", icon: icon));
    // await tester.pumpWidget(MyWidget(title: "T", message: "M", icon: Icon(Icons.done))); //error not by instance
    Finder iconFinder = find.byWidget(icon);
    expect(iconFinder, findsOneWidget);
  });
}
