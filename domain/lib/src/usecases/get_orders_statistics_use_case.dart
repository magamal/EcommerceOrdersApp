import 'package:domain/domain.dart';
import 'package:domain/src/base/base_use_case.dart';
import 'package:domain/src/base/no_parameter.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetOrdersStatisticsUseCase
    extends BaseUseCase<Future<OrdersStatisticsModel>, NoParameter> {
  final GetOrdersUseCase getOrdersUseCase;

  GetOrdersStatisticsUseCase(this.getOrdersUseCase);

  @override
  Future<OrdersStatisticsModel> execute({NoParameter p}) async {
    return getOrdersUseCase
        .execute()
        .then((orders) => _generateStatistics(orders));
  }

  OrdersStatisticsModel _generateStatistics(List<OrderModel> orders) {
    return OrdersStatisticsModel(
      totalCount: orders.length,
      averagePrice: _generateAveragePrices(orders),
      returnedOrders: _getReturnedOrdersNumbers(orders),
    );
  }

  double _generateAveragePrices(List<OrderModel> orders) =>
      orders
          .map((order) => _convertPriceToDouble(order.price))
          .reduce((a, b) => a + b) / orders.length;

  double _convertPriceToDouble(String? price) =>
      double.tryParse(
          (price ?? "0")
              .replaceAll("\$", "")
              .replaceAll(" ", "")
              .replaceAll(",", "")
      ) ??
      0;

  int _getReturnedOrdersNumbers(List<OrderModel> orders) => orders
      .where((order) => order.status == OrderStatus.RETURNED)
      .toList()
      .length;
}
