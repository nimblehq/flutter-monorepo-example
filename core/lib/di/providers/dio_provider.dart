import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';

const String HEADER_CONTENT_TYPE = 'Content-Type';
const String DEFAULT_CONTENT_TYPE = 'application/json; charset=utf-8';

@Singleton()
class DioProvider {
  Dio? _nonAuthenticatedDio;
  Dio? _authenticatedDio;

  DioProvider();

  Dio getNonAuthenticatedDio() {
    _nonAuthenticatedDio ??= _createDio();
    return _nonAuthenticatedDio!;
  }

  Dio getAuthenticatedDio() {
    _authenticatedDio ??= _createDio(requireAuthenticate: true);
    return _authenticatedDio!;
  }

  Dio _createDio({bool requireAuthenticate = false}) {
    final dio = Dio();
    final interceptors = <Interceptor>[];
    if (!kReleaseMode) {
      interceptors.add(LogInterceptor(
        request: true,
        responseBody: true,
        requestBody: true,
        requestHeader: true,
      ));
    }

    return dio
      ..options.connectTimeout = 30000
      ..options.receiveTimeout = 30000
      ..options.headers = {HEADER_CONTENT_TYPE: DEFAULT_CONTENT_TYPE}
      ..options.baseUrl = 'https://nimble-survey-web-staging.herokuapp.com/'
      ..interceptors.addAll(interceptors);
  }
}
