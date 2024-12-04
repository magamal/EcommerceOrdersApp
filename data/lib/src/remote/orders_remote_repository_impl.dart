import 'dart:convert';

import 'package:data/gen/assets.gen.dart';
import 'package:data/src/remote/asset_manager.dart';
import 'package:data/src/repository/orders/orders_remote.dart';
import 'package:domain/src/models/order_model.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: OrdersRemote)
class OrdersRemoteRepositoryImpl implements OrdersRemote {
  final AssetManager assetManager;

  OrdersRemoteRepositoryImpl(this.assetManager);

  @override
  Future<List<OrderModel>> getOrders() {
    return parseJsonFromAssets("packages/data/${Assets.data.orders}")
        .then((result) {
      return result.map((item) => OrderModel.fromJson(item)).toList();
    });
  }

  Future<List<dynamic>> parseJsonFromAssets(String assetsPath) async {
    return assetManager
        .loadString(assetsPath)
        .then((jsonStr) => jsonDecode(jsonStr));
  }
}
