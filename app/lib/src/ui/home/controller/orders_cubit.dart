import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:domain/domain.dart';
import 'package:injectable/injectable.dart';

part 'orders_state.dart';

part 'orders_cubit.freezed.dart';

@injectable
class OrdersCubit extends Cubit<OrdersState> {
  final GetOrdersStatisticsUseCase _getOrdersStatisticsUseCase;

  OrdersCubit(this._getOrdersStatisticsUseCase)
      : super(const OrdersState.initial());

  getOrders() async {
    emit(const OrdersState.loading());
    try {
      final statistics = await _getOrdersStatisticsUseCase.execute();
      emit(OrdersState.ordersStatistics(statistics: statistics));
    } catch (e, s) {
      debugPrintStack(stackTrace: s);
      emit(const OrdersState.error());
    }
  }
}
