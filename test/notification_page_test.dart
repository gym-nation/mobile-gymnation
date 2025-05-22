import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:gymnation/menu_utama/notification_page.dart';

void main() {
  testWidgets('Notification page shows notifications',
      (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: NotificationPage()));

    expect(find.textContaining('Check-In Reminder'), findsWidgets);
    expect(find.byType(ListTile), findsWidgets);
  });
}
