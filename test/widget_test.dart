import 'package:flutter_test/flutter_test.dart';

import 'package:school_management_app/main.dart';

void main() {
  testWidgets('shows school manager title', (tester) async {
    await tester.pumpWidget(const SchoolManagementApp());

    expect(find.text('Greenfield School Manager'), findsOneWidget);
    expect(find.text('Dashboard'), findsWidgets);
  });
}
