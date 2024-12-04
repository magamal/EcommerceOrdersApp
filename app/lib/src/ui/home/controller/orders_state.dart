part of 'orders_cubit.dart';

@freezed
class OrdersState with _$OrdersState {
  const factory OrdersState.initial() = _Initial;

  const factory OrdersState.loading() = _Loading;

  // const factory OrdersState.ordersSuccess({required List<OrderModel> orders}) =
  //     _OrdersSuccess;

  const factory OrdersState.ordersStatistics(
      {required OrdersStatisticsModel statistics}) = _OrdersStatistics;

  const factory OrdersState.error() = _OrdersError;
}
