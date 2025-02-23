import 'package:app/generated/l10n.dart';
import 'package:app/src/app/my_app.dart';
import 'package:app/src/ui/home/orders_page.dart';
import 'package:app/src/ui/home/statistics_item_widget.dart';
import 'package:core_testing/core_testing.dart';
import 'package:di/di.dart' as di;
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'widget_test.mocks.dart';

@GenerateNiceMocks([MockSpec<GetOrdersStatisticsUseCase>()])
void main() {
  configureTestingDependencies();
  group("test home", () {
    final getOrdersStatisticsUseCase = MockGetOrdersStatisticsUseCase();
    const successStatistics = OrdersStatisticsModel(
      totalCount: 3,
      returnedOrders: 1,
      averagePrice: 2,
    );
    setUp(() async {
      di.getIt
        ..unregister<GetOrdersStatisticsUseCase>()
        ..registerFactory<GetOrdersStatisticsUseCase>(
            () => getOrdersStatisticsUseCase);
    });

    testWidgets("test data on success", (tester) async {
      when(getOrdersStatisticsUseCase.execute())
          .thenAnswer((_) async => successStatistics);

      await tester.pumpWidget(const MyApp());
      await tester.pumpAndSettle(const Duration(seconds: 2));

      final totalOrdersText = find.byKey(OrdersPage.totalOrdersKey);
      await expectLater(totalOrdersText, findsOneWidget);
      expect((totalOrdersText.found.first.widget as Text).data,
          equals(successStatistics.totalCount.toString()));

      final averagePriceWidget = find.descendant(
          of: find.ancestor(
              of: find.text(S.current.averagePrice),
              matching: find.byType(StatisticsItemWidget),
              matchRoot: true),
          matching:
              find.text(successStatistics.averagePrice.floor().toString()));
      expect(averagePriceWidget, findsOneWidget);

      final returnedOrdersWidget = find.descendant(
          of: find.ancestor(
              of: find.text(S.current.returnedOrders),
              matching: find.byType(StatisticsItemWidget),
              matchRoot: true),
          matching:
              find.text(successStatistics.returnedOrders.floor().toString()));
      expect(returnedOrdersWidget, findsOneWidget);
    });

    testWidgets("test error", (tester) async {
      when(getOrdersStatisticsUseCase.execute())
          .thenThrow((_) => Exception("test"));

      await tester.pumpWidget(const MyApp());
      await tester.pumpAndSettle(const Duration(seconds: 2));

      var errorWidget = find.text(S.current.somethingWentWrong);
      expectLater(errorWidget, findsOneWidget);
    });
  });
}
