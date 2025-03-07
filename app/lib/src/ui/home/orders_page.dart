import 'package:app/gen/assets.gen.dart';
import 'package:app/generated/l10n.dart';
import 'package:app/src/resources/resources.dart';
import 'package:app/src/routes/routes.dart';
import 'package:app/src/ui/home/controller/orders_cubit.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:di/di.dart' as di;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import 'statistics_item_widget.dart';

class OrdersPage extends StatefulWidget {
  static const totalOrdersKey = Key("total_orders");
  static const loadingWidgetKey = Key("loading");
  static const errorWidgetKey = Key("error");

  const OrdersPage({super.key});

  @override
  State<OrdersPage> createState() => _OrdersPageState();
}

class _OrdersPageState extends State<OrdersPage> {
  late OrdersCubit _cubit;

  @override
  void initState() {
    _cubit = di.inject()..getOrders();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.greyBackground,
      body: body(),
    );
  }

  body() => BlocBuilder(
      bloc: _cubit,
      builder: (context, OrdersState state) => state.map(
          initial: (state) => progress(),
          loading: (state) => progress(),
          ordersStatistics: (state) => statisticsWidget(state.statistics),
          error: (state) => errorWidget()));

  progress() => const Center(
        key: OrdersPage.loadingWidgetKey,
        child: CircularProgressIndicator(color: AppColors.red),
      );

  statisticsWidget(OrdersStatisticsModel statistics) => Column(
        children: [
          totalOrders(statistics.totalCount),
          const SizedBox(height: 32),
          divider(),
          const SizedBox(height: 24),
          averagePrice(statistics.averagePrice),
          returnedOrders(statistics.returnedOrders),
          const Spacer(),
          navigateToGraphPageButton(),
        ],
      );

  errorWidget() => Center(
      key: OrdersPage.errorWidgetKey,
      child: Text(S.current.somethingWentWrong));

  totalOrders(int totalCount) => SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            Container(
              decoration: const BoxDecoration(
                color: AppColors.grey,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20)),
              ),
              padding:
                  const EdgeInsetsDirectional.only(top: 32, start: 24, end: 24),
              height: 150,
              width: 150,
              alignment: Alignment.bottomCenter,
              child: SvgPicture.asset(
                width: 90,
                height: 90,
                fit: BoxFit.fitWidth,
                alignment: Alignment.bottomCenter,
                Assets.images.orders,
              ),
            ),
            Text(
              key: OrdersPage.totalOrdersKey,
              "$totalCount",
              style: const TextStyle(
                  color: AppColors.black,
                  fontSize: 90,
                  fontWeight: FontWeight.w900),
            ),
            Text(
              S.current.totalOrders,
              style: const TextStyle(
                  color: AppColors.black,
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
            )
          ],
        ),
      );

  divider() => Container(
        margin: const EdgeInsetsDirectional.symmetric(horizontal: 32),
        color: AppColors.lightGrey,
        height: 2,
        width: double.infinity,
      );

  averagePrice(double price) => StatisticsItemWidget(
        title: S.current.averagePrice,
        value: price.ceil().toString(),
        assetName: Assets.images.priceAverage,
      );

  returnedOrders(int price) => StatisticsItemWidget(
        title: S.current.returnedOrders,
        value: price.toString(),
        assetName: Assets.images.canceledOrders,
      );

  navigateToGraphPageButton() => Container(
        margin: const EdgeInsets.only(bottom: 32),
        child: ElevatedButton(
          onPressed: () => context.push(RoutesConstantsPaths.ordersGraph),
          style: ElevatedButton.styleFrom(backgroundColor: AppColors.red),
          child: SizedBox(
            width: 150,
            child: Center(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 8),
                child: Center(
                  child: Text(
                    S.current.showGraph,
                    style: const TextStyle(
                      color: AppColors.white,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      );
}
