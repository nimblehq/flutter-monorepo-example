import 'package:core/api/request/auth_login_request.dart';
import 'package:core/api/services/auth_service.dart';
import 'package:injectable/injectable.dart';

abstract class AuthRepository {
  Future<void> login({required String email, required String password});
}

@LazySingleton(as: AuthRepository)
class AuthRepositoryImpl extends AuthRepository {
  final AuthService _authService;

  AuthRepositoryImpl(this._authService);

  @override
  Future<void> login({required String email, required String password}) {
    return _authService.login(AuthLoginRequest(
        email: email,
        password: password,
        clientId: "z9iUamZLvRgtVVtRJ8UqItg2vmncGyEi30p1eWEddnA",
        clientSecret: "1vqRNMxq-Yx83A61GNjLb17qxCGKxHDb8EmB3MKdxqA"));
  }
}
