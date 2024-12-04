// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:domain/domain.dart' as _i494;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../orders_repository_impl.dart' as _i722;
import '../remote/asset_manager.dart' as _i499;
import '../remote/orders_remote_repository_impl.dart' as _i673;
import '../repository/orders/orders_remote.dart' as _i577;
import '../store/orders/orders_data_store_factory.dart' as _i922;
import '../store/orders/orders_remote_data_store.dart' as _i944;

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
  gh.factory<_i499.AssetManager>(() => _i499.AssetManager());
  gh.factory<_i577.OrdersRemote>(
      () => _i673.OrdersRemoteRepositoryImpl(gh<_i499.AssetManager>()));
  gh.factory<_i944.OrdersRemoteDataStore>(
      () => _i944.OrdersRemoteDataStore(gh<_i577.OrdersRemote>()));
  gh.factory<_i922.OrdersDataStoreFactory>(
      () => _i922.OrdersDataStoreFactory(gh<_i944.OrdersRemoteDataStore>()));
  gh.factory<_i494.OrdersRepository>(
      () => _i722.OrdersRepositoryImpl(gh<_i922.OrdersDataStoreFactory>()));
  return getIt;
}
