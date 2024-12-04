// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../domain.dart' as _i789;
import '../repos/orders_repository.dart' as _i427;
import '../usecases/get_orders_per_month_graph_use_case.dart' as _i784;
import '../usecases/get_orders_statistics_use_case.dart' as _i407;
import '../usecases/get_orders_use_case.dart' as _i728;

// initializes the registration of main-scope dependencies inside of GetIt
_i174.GetIt $initGetIt(
  _i174.GetIt getIt, {
  String? environment,
  _i526.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i526.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  gh.factory<_i728.GetOrdersUseCase>(
      () => _i728.GetOrdersUseCase(gh<_i427.OrdersRepository>()));
  gh.factory<_i407.GetOrdersStatisticsUseCase>(
      () => _i407.GetOrdersStatisticsUseCase(gh<_i789.GetOrdersUseCase>()));
  gh.factory<_i784.GetOrdersPerMonthGraphUseCase>(
      () => _i784.GetOrdersPerMonthGraphUseCase(gh<_i789.GetOrdersUseCase>()));
  return getIt;
}
