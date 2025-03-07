import 'package:bdd_widget_test/step/i_see_text.dart';
import 'package:flutter_test/flutter_test.dart';

/// Usage: the user could see {'14'} total orders
Future<void> theUserCouldSeeTotalOrders(
    WidgetTester tester, String totalOrders) async {
  await iSeeText(tester,totalOrders);
}
