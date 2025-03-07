import 'package:bdd_widget_test/step/i_see_text.dart';
import 'package:flutter_test/flutter_test.dart';

/// Usage: the user will navigated to {'Graph'} page
Future<void> theUserWillNavigatedToGraphPage(
    WidgetTester tester, String graphText) async {
  await tester.pumpAndSettle(const Duration(seconds: 2));
  await iSeeText(tester, graphText);
}
