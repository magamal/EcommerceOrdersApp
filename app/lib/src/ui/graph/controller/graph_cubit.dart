import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:domain/domain.dart';
import 'package:injectable/injectable.dart';

part 'graph_state.dart';

part 'graph_cubit.freezed.dart';

@injectable
class GraphCubit extends Cubit<GraphState> {
  final GetOrdersPerMonthGraphUseCase _getOrdersPerMonthGraphUseCase;

  GraphCubit(
    this._getOrdersPerMonthGraphUseCase,
  ) : super(const GraphState.initial());

  getOrders() async {
    emit(const GraphState.loading());
    try {
      await _generateGraphData();
    } catch (e, s) {
      debugPrintStack(stackTrace: s);
      emit(const GraphState.error());
    }
  }

  _generateGraphData() async {
    final points = await _getOrdersPerMonthGraphUseCase.execute();
    double minY = (points.isNotEmpty
            ? points
                .map((e) => e.numberOfOrders)
                .reduce((a, b) => a < b ? a : b)
            : 0)
        .toDouble();
    double maxY = (points.isNotEmpty
            ? points
                .map((e) => e.numberOfOrders)
                .reduce((a, b) => a > b ? a : b)
            : 1)
        .toDouble();

    // Adjust maxY and minY to add some padding for better visualization
    minY = minY - (minY * 0.1); // Decrease by 10% for padding
    maxY = maxY + (maxY * 0.1); // Increase by 10% for padding
    double interval = (maxY - minY) / 5;
    if (interval == 0) {
      interval = 0.5.toDouble();
    }
    minY = minY - interval;
    maxY = maxY + interval;

    emit(
      GraphState.ordersSuccess(
        points: points,
        maxY: maxY,
        minY: minY,
        interval: interval,
      ),
    );
  }
}
