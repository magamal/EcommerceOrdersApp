import 'package:app/src/app/my_app.dart';
import 'package:flutter_test/flutter_test.dart';

Future<void> commonTheAppIsRunning(WidgetTester tester) async {
  await tester.pumpWidget(const MyApp());
  await tester.pumpAndSettle(const Duration(seconds: 2));
}
