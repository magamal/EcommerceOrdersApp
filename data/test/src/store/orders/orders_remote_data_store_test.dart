import 'package:data/src/repository/orders/orders_remote.dart';
import 'package:data/src/store/orders/orders_remote_data_store.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:core_testing/core_testing.dart';
import 'package:mockito/mockito.dart';

import 'orders_remote_data_store_test.mocks.dart';

// @injectable
// class OrdersRemoteDataStore implements OrdersDataStore {
//   final OrdersRemote ordersRemote;
//
//   OrdersRemoteDataStore(this.ordersRemote);
//
//   @override
//   Future<List<OrderModel>> getOrders() => ordersRemote.getOrders();
// }

@GenerateNiceMocks([MockSpec<OrdersRemote>()])
void main() {
  configureTestingDependencies();
  testRemoteDataStore();
}

void testRemoteDataStore() {
  group("test Orders Remote DataStore", () {
    final MockOrdersRemote ordersRemote = MockOrdersRemote();
    late OrdersRemoteDataStore ordersRemoteDataStore;
    setUp(() {
      ordersRemoteDataStore = OrdersRemoteDataStore(ordersRemote);
    });

    test("test get data", () async {
      when(ordersRemote.getOrders())
          .thenAnswer((_) async => ordersListModel);
      final orders = await ordersRemoteDataStore.getOrders();
      expect(orders, ordersListModel);
    });

    test("test get data error", () async {
      final exception = Exception("test exception");
      when(ordersRemote.getOrders()).thenThrow(exception);
      expect(() => ordersRemoteDataStore.getOrders(), throwsA(exception));
    });
  });
}
