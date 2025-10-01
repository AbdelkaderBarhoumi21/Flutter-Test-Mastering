import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:unit_test/screens/list_items_page.dart';

void main() {
  testWidgets("finds a deep item in a long list", (WidgetTester tester) async {
    await tester.pumpWidget(
      ListItemsPage(items: List<String>.generate(10000, (i) => "Item $i")),
    );
    Finder scrollablewidget = find.byType(Scrollable);
    Finder itemFinder = find.text("Item 300");
    Size size = tester.getSize(scrollablewidget);
    await tester.scrollUntilVisible(
      itemFinder,
      size.height,
      scrollable: scrollablewidget,
      maxScrolls: 100,
    );
    expect(itemFinder, findsOneWidget);
  });
}
