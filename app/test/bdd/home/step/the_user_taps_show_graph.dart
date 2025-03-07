import 'package:bdd_widget_test/step/i_tap_text.dart';
import 'package:flutter_test/flutter_test.dart';

/// Usage: the user taps {'Show graph'}
Future<void> theUserTapsShowGraph(
    WidgetTester tester, String showGraphText) async {
  await iTapText(tester, showGraphText);
}
