import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:unit_test/screens/todo_list_page.dart';

void main() {
  testWidgets("Add an remove a todo", (WidgetTester tester) async {
    //add todo test
    await tester.pumpWidget(TodoList());
    await tester.enterText(find.byType(TextField), "Todo");
    await tester.tap(find.byType(FloatingActionButton));
    await tester.pumpAndSettle();
    //todo+index todo1
    expect(find.text("Todo"), findsOneWidget);
    expect(find.byKey(Key("Todo0")), findsOneWidget);
    //remove todo test => offset direction to remove drag dismissble
    //Attempts to drag the given widget by the given offset, by starting a drag in the middle of the widget.=>drag
    await tester.drag(find.byKey(Key("Todo0")), Offset(500, 0));
    await tester
        .pumpAndSettle(); //because there's animation when remove using dissmisible pumpAndSettle wait until the UI rebuild
    expect(find.text("Todo"), findsNothing);
  });
}
