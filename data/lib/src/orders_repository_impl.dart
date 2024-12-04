import 'package:data/src/store/orders/orders_data_store_factory.dart';
import 'package:injectable/injectable.dart';
import 'package:domain/domain.dart';

@Injectable(as: OrdersRepository)
class OrdersRepositoryImpl implements OrdersRepository {
  final OrdersDataStoreFactory ordersDataStoreFactory;

  OrdersRepositoryImpl(this.ordersDataStoreFactory);

  @override
  Future<List<OrderModel>> getOrders() =>
      ordersDataStoreFactory.getRemote().getOrders();
}
