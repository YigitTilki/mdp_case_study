// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class LoginRequestModel extends Equatable {
  const LoginRequestModel({
    required this.username,
    required this.password,
    this.expiresInMins = 60,
  });
  final String username;
  final String password;
  final int expiresInMins;

  Map<String, dynamic> toJson() {
    return {
      'username': username,
      'password': password,
      'expiresInMins': expiresInMins,
    };
  }

  @override
  List<Object> get props => [username, password, expiresInMins];
}
