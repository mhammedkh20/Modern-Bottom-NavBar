import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:my_bottom_nav_bar/main.dart';

void main() {
  testWidgets('bottom navigation switches tabs', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('Home Tab'), findsOneWidget);
    expect(find.text('Messages Tab'), findsNothing);

    await tester.tap(find.byIcon(Icons.message_outlined));
    await tester.pumpAndSettle();

    expect(find.text('Messages Tab'), findsOneWidget);
    expect(find.text('Home Tab'), findsNothing);
  });
}
