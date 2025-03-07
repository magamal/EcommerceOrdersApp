import 'package:bdd_widget_test/step/i_see_text.dart';
import 'package:flutter_test/flutter_test.dart';

/// Usage: returned orders is {'3'}
Future<void> returnedOrdersIs(WidgetTester tester, String returnedOrders) async {
  await iSeeText(tester,returnedOrders);
}
