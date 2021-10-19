import 'package:core/api/services/auth_service.dart';
import 'package:core/di/providers/dio_provider.dart';
import 'package:injectable/injectable.dart';

@module
abstract class NetworkModule {
  @Singleton()
  AuthService provideOAuthService(DioProvider dioProvider) {
    return AuthService(
      dioProvider.getNonAuthenticatedDio(),
      baseUrl: 'https://nimble-survey-web-staging.herokuapp.com/',
    );
  }
}
