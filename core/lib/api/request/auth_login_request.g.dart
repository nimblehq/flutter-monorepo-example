// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_login_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthLoginRequest _$AuthLoginRequestFromJson(Map<String, dynamic> json) =>
    AuthLoginRequest(
      grantType: json['grant_type'] as String? ?? GRANT_TYPE_PASSWORD,
      email: json['email'] as String,
      password: json['password'] as String,
      clientId: json['client_id'] as String,
      clientSecret: json['client_secret'] as String,
    );

Map<String, dynamic> _$AuthLoginRequestToJson(AuthLoginRequest instance) =>
    <String, dynamic>{
      'grant_type': instance.grantType,
      'email': instance.email,
      'password': instance.password,
      'client_id': instance.clientId,
      'client_secret': instance.clientSecret,
    };
