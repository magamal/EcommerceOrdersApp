import 'package:data/src/repository/orders/orders_data_store.dart';
import 'package:data/src/repository/orders/orders_remote.dart';
import 'package:domain/src/models/order_model.dart';
import 'package:injectable/injectable.dart';

@injectable
class OrdersRemoteDataStore implements OrdersDataStore {
  final OrdersRemote ordersRemote;

  OrdersRemoteDataStore(this.ordersRemote);

  @override
  Future<List<OrderModel>> getOrders() => ordersRemote.getOrders();
}
