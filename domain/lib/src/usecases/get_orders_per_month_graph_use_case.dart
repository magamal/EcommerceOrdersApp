import 'package:domain/domain.dart';
import 'package:domain/src/base/base_use_case.dart';
import 'package:domain/src/base/no_parameter.dart';
import 'package:injectable/injectable.dart';
import 'package:intl/intl.dart';

@injectable
class GetOrdersPerMonthGraphUseCase
    extends BaseUseCase<Future<List<OrdersPerMonthModel>>, NoParameter> {
  final GetOrdersUseCase _getOrdersUseCase;

  GetOrdersPerMonthGraphUseCase(this._getOrdersUseCase);

  @override
  Future<List<OrdersPerMonthModel>> execute({NoParameter p}) async {
    final orders = await _getOrdersUseCase.execute();
    final sortedOrders = sortOrders(orders);
    Map<String, int> chartData = {}; // <DateMonth,times>
    for (var order in sortedOrders) {
      final date = getDate(order.registered);
      if (date == null) continue;
      int times = chartData[date] ?? 0;
      chartData[date] = times + 1;
    }
    return chartData.entries
        .map((entry) =>
            OrdersPerMonthModel(date: entry.key, numberOfOrders: entry.value))
        .toList();
  }

  List<OrderModel> sortOrders(List<OrderModel> orders) {
    return orders
      ..sort((a, b) => _convertDateStringToTimestamp(a.registered)
          .compareTo(_convertDateStringToTimestamp(b.registered)));
  }

  int _convertDateStringToTimestamp(String? dateStr) =>
      parseDate(dateStr)?.millisecondsSinceEpoch ?? 0;

  DateTime? parseDate(String? date) {
    if (date == null) return null;
    try {
      return DateTime.parse(date);
    } catch (e, s) {
      return null;
    }
  }

  String? getDate(String? date) {
    if (date == null || date.isEmpty) return null;
    final dateTime = parseDate(date);
    if (dateTime == null) return null;
    String formattedDate = DateFormat('MM-yy').format(dateTime);
    return formattedDate;
  }
}
