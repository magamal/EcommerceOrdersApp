import 'package:domain/domain.dart';

abstract interface class OrdersRepository {
  Future<List<OrderModel>> getOrders();
}
