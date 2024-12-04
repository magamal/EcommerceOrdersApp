import 'package:domain/domain.dart';

abstract interface class OrdersDataStore {
  Future<List<OrderModel>> getOrders();
}
