import 'package:app/generated/l10n.dart';
import 'package:app/src/resources/resources.dart';
import 'package:app/src/ui/graph/controller/graph_cubit.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:di/di.dart' as di;
import 'package:syncfusion_flutter_charts/charts.dart';

class GraphPage extends StatefulWidget {
  const GraphPage({super.key});

  @override
  State<GraphPage> createState() => _GraphPageState();
}

class _GraphPageState extends State<GraphPage> {
  late GraphCubit _cubit;

  @override
  void initState() {
    _cubit = di.inject()..getOrders();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: body(),
    );
  }

  appBar() => AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.pop(),
        ),
        title: Text(S.current.graph),
      );

  body() => BlocBuilder(
      bloc: _cubit,
      builder: (context, GraphState state) => state.map(
          initial: (state) => progress(),
          loading: (state) => progress(),
          ordersSuccess: (state) => showGraph(
                points: state.points,
                maxY: state.maxY,
                minY: state.minY,
                interval: state.interval,
              ),
          error: (state) => errorWidget()));

  progress() =>
      const Center(child: CircularProgressIndicator(color: AppColors.red));

  showGraph({
    required List<OrdersPerMonthModel> points,
    required double maxY,
    required double minY,
    required double interval,
  }) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding:
              const EdgeInsetsDirectional.only(top: 8, start: 8, bottom: 4),
          child: Align(
            alignment: AlignmentDirectional.centerStart,
            child: Text(S.current.numberOfOrdersPerMonth),
          ),
        ),
        SizedBox(
          height: 500,
          child: SfCartesianChart(
            primaryXAxis: CategoryAxis(
              title: AxisTitle(
                text: S.current.month,
                alignment: ChartAlignment.far,
              ),
            ),
            primaryYAxis: NumericAxis(
              minimum: minY.toDouble(),
              maximum: maxY.toDouble(),
              interval: interval.toDouble(),
            ),
            series: <CartesianSeries>[
              LineSeries<OrdersPerMonthModel, String>(
                dataSource: points,
                xValueMapper: (OrdersPerMonthModel data, _) => data.date,
                yValueMapper: (OrdersPerMonthModel data, _) =>
                    data.numberOfOrders,
                pointColorMapper: (OrdersPerMonthModel data, _) {
                  return AppColors.grey;
                },
              ),
            ],
          ),
        ),
      ],
    );
  }

  errorWidget() => Center(child: Text(S.current.somethingWentWrong));
}
