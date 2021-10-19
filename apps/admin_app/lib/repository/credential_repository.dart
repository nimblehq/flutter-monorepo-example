import 'package:admin_app/api/api_service.dart';
import 'package:admin_app/model/response/user_response.dart';

abstract class CredentialRepository {
  Future<UserResponse> getProfile();
}

class CredentialRepositoryImpl extends CredentialRepository {
  final ApiService _apiService;

  CredentialRepositoryImpl(this._apiService);

  @override
  Future<UserResponse> getProfile() {
    return _apiService.getProfile();
  }
}
