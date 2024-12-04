import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:domain/domain.dart' as domain;
import 'package:data/data.dart' as data;
import 'package:app/app_lib.dart' as app;

final getIt = GetIt.instance;

@InjectableInit(
  initializerName: r'$initGetIt', // default
  preferRelativeImports: true, // default
  asExtension: false, // default
)
Future<void> configureDependencies(
    {String environment = Environment.dev}) async {
  await data.configureDataDependencies(getIt, environment);
  await domain.configureDomainDependencies(getIt, environment);
  await app.configureAppDependencies(getIt, environment);
}

Future resetDi() async {
  await getIt.reset();
}

T inject<T extends Object>({String? instanceName, Type? type}) {
  return getIt.get<T>(instanceName: instanceName, type: type);
}
