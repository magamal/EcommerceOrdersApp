part of 'graph_cubit.dart';

@freezed
class GraphState with _$GraphState {
  const factory GraphState.initial() = _Initial;

  const factory GraphState.loading() = _Loading;

  const factory GraphState.ordersSuccess(
      {required List<OrdersPerMonthModel> points,
      required double maxY,
      required double minY,
      required double interval}) = _OrdersSuccess;

  const factory GraphState.error() = _OrdersError;
}
