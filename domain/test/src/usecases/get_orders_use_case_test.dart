import 'package:domain/domain.dart';
import 'package:mockito/annotations.dart';
import 'package:core_testing/core_testing.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';

import 'get_orders_use_case_test.mocks.dart';

@GenerateNiceMocks([MockSpec<OrdersRepository>()])
void main() {
  configureTestingDependencies();
  testGetOrdersUseCase();
}

testGetOrdersUseCase() {
  group("test get orders ", () {
    MockOrdersRepository repository = MockOrdersRepository();
    late GetOrdersUseCase useCase;
    setUp(() {
      useCase = GetOrdersUseCase(repository);
    });

    test("get orders success", () async {
      when(repository.getOrders()).thenAnswer((_) async => ordersListModel);
      final result = await useCase.execute();
      expect(result, ordersListModel);
    });

    test("get orders errors", () async {
      final exception = Exception("Test Exception");
      when(repository.getOrders()).thenThrow(exception);
      expect(() => useCase.execute(), throwsA(exception));
    });
  });
}
