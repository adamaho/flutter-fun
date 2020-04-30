// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'form.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginForm _$LoginFormFromJson(Map<String, dynamic> json) {
  return LoginForm(
    json['email'] as String,
    json['password'] as String,
  );
}

Map<String, dynamic> _$LoginFormToJson(LoginForm instance) => <String, dynamic>{
      'email': instance.email,
      'password': instance.password,
    };
