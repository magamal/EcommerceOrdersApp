import 'package:app/src/ui/graph/graph_page.dart';
import 'package:app/src/ui/home/orders_page.dart';
import 'package:go_router/go_router.dart';

import 'routes_constants_paths.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        path: RoutesConstantsPaths.home,
        builder: (context, state) => const OrdersPage(),
      ),
      GoRoute(
        path: RoutesConstantsPaths.ordersGraph,
        builder: (context, state) => const GraphPage(),
      ),
    ],
  );
}
