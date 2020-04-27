import 'package:json_annotation/json_annotation.dart';

part 'form.g.dart';

@JsonSerializable()
class LoginForm {
  final String email;
  final String password;

  LoginForm(this.email, this.password);

  factory LoginForm.fromJson(Map<String, dynamic> json) => _$LoginFormFromJson(json);

  Map<String, dynamic> toJson() => _$LoginFormToJson(this);

  void saveForm() {
    // execute function to save the form using http and return any errors if there are any
    print(this.email);
  }
}
