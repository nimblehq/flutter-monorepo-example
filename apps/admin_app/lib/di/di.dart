import 'package:core/di/di.dart';
import 'package:features/di/di.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'di.config.dart';

final GetIt getIt = GetIt.instance;

@injectableInit
Future<void> configureInjection() async {
  await configureCoreModuleDependencies(getIt);
  await $initGetIt(getIt);
  configureFeaturesModuleDependencies(getIt);
}

@module
abstract class AppModule {
  @singleton
  FluroRouter provideFluroRouter() => FluroRouter();

  @singleton
  GlobalKey<NavigatorState> provideNavigatorKey() =>
      GlobalKey<NavigatorState>();
}
