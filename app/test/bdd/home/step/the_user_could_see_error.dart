import 'package:bdd_widget_test/step/i_see_text.dart';
import 'package:flutter_test/flutter_test.dart';

/// Usage: the user could see error {'Something went wrong'}
Future<void> theUserCouldSeeError(WidgetTester tester, String error) async {
  await iSeeText(tester,error);
}
