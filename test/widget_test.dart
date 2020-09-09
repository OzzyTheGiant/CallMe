// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';
import 'package:call_me/main.dart';

void main() {
    testWidgets('Contact List Page displays content', (WidgetTester tester) async {
        // Build our app and trigger a frame.
        await tester.pumpWidget(CallMeApp());
        expect(find.text('No Contacts Added'), findsOneWidget);
    });
}
