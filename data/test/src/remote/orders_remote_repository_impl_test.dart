import 'dart:convert';

import 'package:data/src/remote/asset_manager.dart';
import 'package:data/src/remote/orders_remote_repository_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:core_testing/core_testing.dart';
import 'package:mockito/mockito.dart';

import 'orders_remote_repository_impl_test.mocks.dart';

@GenerateNiceMocks([MockSpec<AssetManager>()])
void main() {
  configureTestingDependencies();
  testRemoteOrders();
}

testRemoteOrders() {
  group("test orders remote repo", () {
    final MockAssetManager assetManager = MockAssetManager();
    late OrdersRemoteRepositoryImpl ordersRemoteRepositoryImpl;

    setUp(() {
      ordersRemoteRepositoryImpl = OrdersRemoteRepositoryImpl(assetManager);
    });

    test("test get data success", () async {
      when(assetManager.loadString(any))
          .thenAnswer((_) async => jsonEncode(ordersJson));
      final orders = await ordersRemoteRepositoryImpl.getOrders();
      final ordersResultJson = orders.map((order) => order.toJson()).toList();
      expect(ordersResultJson, ordersJson);
    });
  });
}
