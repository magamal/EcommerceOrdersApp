import 'package:core_testing/core_testing.dart';
import 'package:domain/domain.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'get_orders_per_month_graph_use_case_test.mocks.dart';

@GenerateNiceMocks([MockSpec<GetOrdersUseCase>()])
void main() {
  configureTestingDependencies();
  testGetOrdersPerMonthUseCase();
}

testGetOrdersPerMonthUseCase() {
  group("test use case", () {
    final MockGetOrdersUseCase getOrdersUseCase = MockGetOrdersUseCase();

    late GetOrdersPerMonthGraphUseCase useCase;
    setUp(() {
      useCase = GetOrdersPerMonthGraphUseCase(getOrdersUseCase);
    });

    test("test get data success", () async {
      when(getOrdersUseCase.execute()).thenAnswer((_) async => ordersListModel);

      await useCase.execute();
    });
  });
}
