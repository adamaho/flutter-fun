import 'dart:convert';
import 'package:json_annotation/json_annotation.dart';
import 'package:http/http.dart' as http;

part 'form.g.dart';

@JsonSerializable()
class LoginForm {
  final String email;
  final String password;

  LoginForm(this.email, this.password);

  factory LoginForm.fromJson(Map<String, dynamic> json) => _$LoginFormFromJson(json);

  Map<String, dynamic> toJson() => _$LoginFormToJson(this);

  Future<http.Response> saveForm() async {
    var response = await http.post(
      'http://192.168.0.159:8080/login',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(this),
    );
    print('Response body: ${response.body}');

    return response;
  }
}
