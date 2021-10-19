// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:fluro/fluro.dart' as _i3;
import 'package:flutter/material.dart' as _i4;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../core/router/app_router.dart' as _i5;
import 'di.dart' as _i6; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final appModule = _$AppModule();
  gh.singleton<_i3.FluroRouter>(appModule.provideFluroRouter());
  gh.singleton<_i4.GlobalKey<_i4.NavigatorState>>(
      appModule.provideNavigatorKey());
  gh.singleton<_i5.AppRouter>(_i5.AppRouter(
      get<_i3.FluroRouter>(), get<_i4.GlobalKey<_i4.NavigatorState>>()));
  return get;
}

class _$AppModule extends _i6.AppModule {}
