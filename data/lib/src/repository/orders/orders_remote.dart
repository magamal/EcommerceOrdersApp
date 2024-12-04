import 'package:domain/domain.dart';

abstract interface class OrdersRemote {
  Future<List<OrderModel>> getOrders();
}
