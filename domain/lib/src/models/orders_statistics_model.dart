class OrdersStatisticsModel {
  final int totalCount;
  final int returnedOrders;
  final double averagePrice;

  const OrdersStatisticsModel({
    required this.totalCount,
    required this.returnedOrders,
    required this.averagePrice,
  });
}
