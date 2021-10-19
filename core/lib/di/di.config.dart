// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../api/repositories/auth_repository.dart' as _i5;
import '../api/services/auth_service.dart' as _i4;
import 'modules/network_module.dart' as _i6;
import 'providers/dio_provider.dart'
    as _i3; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initCoreModuleGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final networkModule = _$NetworkModule();
  gh.singleton<_i3.DioProvider>(_i3.DioProvider());
  gh.singleton<_i4.AuthService>(
      networkModule.provideOAuthService(get<_i3.DioProvider>()));
  gh.lazySingleton<_i5.AuthRepository>(
      () => _i5.AuthRepositoryImpl(get<_i4.AuthService>()));
  return get;
}

class _$NetworkModule extends _i6.NetworkModule {}
