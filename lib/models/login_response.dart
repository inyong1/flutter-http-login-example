import 'package:eproconnect/models/user.dart';

class LoginResponse {
  String? message;
  User? user;

  LoginResponse._({this.user, this.message});

  factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse._(
      message: json['message'],
      user: json.containsKey('user') ? User.fromJson(json['user']) : null);
}
