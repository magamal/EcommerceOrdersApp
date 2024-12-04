import 'package:data/src/store/orders/orders_data_store_factory.dart';
import 'package:data/src/store/orders/orders_remote_data_store.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:core_testing/core_testing.dart';

import 'orders_data_store_factory_test.mocks.dart';

@GenerateNiceMocks([MockSpec<OrdersRemoteDataStore>()])
void main() {
  configureTestingDependencies();
  testOrdersDataStoreFactory();
}

void testOrdersDataStoreFactory() {
  group("test orders store factory", () {
    final MockOrdersRemoteDataStore remoteDataStore =
        MockOrdersRemoteDataStore();
    late OrdersDataStoreFactory factory;
    setUp(() {
      factory = OrdersDataStoreFactory(remoteDataStore);
    });

    test("factory returns remote", () {
      expect(factory.getRemote(), remoteDataStore);
    });

  });
}
