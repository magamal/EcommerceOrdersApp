import 'package:bdd_widget_test/step/i_see_text.dart';
import 'package:flutter_test/flutter_test.dart';

/// Usage: average price is {'3022'}
Future<void> averagePriceIs(WidgetTester tester, String averagePrice) async {
  await iSeeText(tester, averagePrice);
}
