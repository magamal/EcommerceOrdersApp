import 'package:data/src/orders_repository_impl.dart';
import 'package:data/src/repository/orders/orders_data_store.dart';
import 'package:data/src/store/orders/orders_data_store_factory.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:core_testing/core_testing.dart';

import 'orders_repository_impl_test.mocks.dart';

@GenerateNiceMocks([
  MockSpec<OrdersDataStoreFactory>(),
  MockSpec<OrdersDataStore>(),
])
void main() {
  configureTestingDependencies();
  testOrdersRepository();
}

testOrdersRepository() {
  group("test orders repository", () {
    final dataStoreFactory = MockOrdersDataStoreFactory();
    final remoteDataStore = MockOrdersDataStore();
    late OrdersRepositoryImpl ordersRepositoryImpl;
    setUp(() {
      ordersRepositoryImpl = OrdersRepositoryImpl(dataStoreFactory);
    });
    test("test get data", () async {
      when(dataStoreFactory.getRemote()).thenReturn(remoteDataStore);
      when(remoteDataStore.getOrders())
          .thenAnswer((_) async => ordersListModel);
      final orders = await ordersRepositoryImpl.getOrders();
      expect(orders, ordersListModel);
    });

    test("test get data error", () async {
      final exception = Exception("test exception");
      when(dataStoreFactory.getRemote()).thenReturn(remoteDataStore);
      when(remoteDataStore.getOrders()).thenThrow(exception);
      expect(() => ordersRepositoryImpl.getOrders(), throwsA(exception));
    });
  });
}
