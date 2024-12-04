import 'package:domain/domain.dart';
import 'package:core_testing/core_testing.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'get_orders_statistics_use_case_test.mocks.dart';

@GenerateNiceMocks([MockSpec<GetOrdersUseCase>()])
void main() {
  configureTestingDependencies();
  testGetOrdersStatisticsUseCase();
}

void testGetOrdersStatisticsUseCase() {
  group("test get statistics", () {
    GetOrdersUseCase getOrdersUseCase = MockGetOrdersUseCase();
    late GetOrdersStatisticsUseCase useCase;
    setUp(() {
      useCase = GetOrdersStatisticsUseCase(getOrdersUseCase);
    });

    test("test success use case", () async {
      when(getOrdersUseCase.execute()).thenAnswer((_) async => ordersListModel);
      final result = await useCase.execute();

      expect(result.totalCount, ordersListModel.length);

      final returnedOrders = ordersListModel
          .where((order) => order.status == OrderStatus.RETURNED)
          .length;

      expect(result.returnedOrders, returnedOrders);

      final average = ordersListModel
          .map((order) => double.parse(
              (order.price ?? "").replaceAll(",", "").replaceAll("\$", "")))
          .reduce((a, b) => a + b) / ordersListModel.length;

      expect(result.averagePrice, average);
    });

    test("test error use case", (){
      final exception = Exception("Test Exception");
      when(getOrdersUseCase.execute()).thenThrow(exception);
      expect(() => useCase.execute(), throwsA(exception));
    });
  });
}
