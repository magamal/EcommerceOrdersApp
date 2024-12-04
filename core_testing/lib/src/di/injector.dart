import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:di/di.dart' as di;

import 'injector.config.dart';

@InjectableInit(
  initializerName: r'$initGetIt', // default
  preferRelativeImports: true, // default
  asExtension: false, // default
)
Future<void> _configureCoreTestingDependencies(
    GetIt getIt, String? environment) async {
  await $initGetIt(getIt, environment: environment);
}

@visibleForTesting
Future<void> configureTestingDependencies() async {
  const environment = Environment.test;
  // di.getIt.allowReassignment = true;
  await di.configureDependencies(environment: environment);
  await _configureCoreTestingDependencies(di.getIt, environment);
}
