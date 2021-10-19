import 'package:core/api/request/auth_login_request.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'auth_service.g.dart';

class AuthApi {
  AuthApi._();
  static const String oauthToken = '/api/v1/oauth/token';
}

@RestApi()
abstract class AuthService {
  factory AuthService(Dio dio, {String baseUrl}) = _AuthService;

  @POST(AuthApi.oauthToken)
  Future<void> login(@Body() AuthLoginRequest body);
}
