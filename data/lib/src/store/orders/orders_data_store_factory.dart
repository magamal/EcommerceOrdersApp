import 'package:data/src/repository/orders/orders_data_store.dart';
import 'package:injectable/injectable.dart';

import 'orders_remote_data_store.dart';

@injectable
class OrdersDataStoreFactory {
  final OrdersRemoteDataStore _remoteDataStore;

  OrdersDataStoreFactory(this._remoteDataStore);

  OrdersDataStore getRemote() => _remoteDataStore;
}
