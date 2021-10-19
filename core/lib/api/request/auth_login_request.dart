import 'package:json_annotation/json_annotation.dart';

part 'auth_login_request.g.dart';

const String GRANT_TYPE_PASSWORD = "password";

@JsonSerializable()
class AuthLoginRequest {
  @JsonKey(name: 'grant_type')
  String grantType;
  @JsonKey(name: 'email')
  String email;
  @JsonKey(name: 'password')
  String password;
  @JsonKey(name: 'client_id')
  String clientId;
  @JsonKey(name: 'client_secret')
  String clientSecret;

  AuthLoginRequest(
      {this.grantType = GRANT_TYPE_PASSWORD,
      required this.email,
      required this.password,
      required this.clientId,
      required this.clientSecret});

  factory AuthLoginRequest.fromJson(Map<String, dynamic> json) =>
      _$AuthLoginRequestFromJson(json);

  Map<String, dynamic> toJson() => _$AuthLoginRequestToJson(this);
}
