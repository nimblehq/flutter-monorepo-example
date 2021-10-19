import 'package:admin_app/model/response/user_response.dart';

abstract class ApiService {
  Future<UserResponse> getProfile();
}
