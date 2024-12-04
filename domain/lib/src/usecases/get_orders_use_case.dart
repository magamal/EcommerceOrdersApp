import 'package:domain/src/base/base_use_case.dart';
import 'package:domain/src/base/no_parameter.dart';
import 'package:domain/src/models/order_model.dart';
import 'package:domain/src/repos/orders_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetOrdersUseCase
    extends BaseUseCase<Future<List<OrderModel>>, NoParameter> {
  final OrdersRepository _ordersRepository;

  GetOrdersUseCase(this._ordersRepository);

  @override
  Future<List<OrderModel>> execute({NoParameter p}) =>
      _ordersRepository.getOrders();
}
