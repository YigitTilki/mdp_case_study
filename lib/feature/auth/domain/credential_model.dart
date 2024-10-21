import 'package:equatable/equatable.dart';

class CredentialModel extends Equatable {
  const CredentialModel({
    this.email,
    this.password,
    this.rememberMe,
  });

  final String? email;
  final String? password;
  final bool? rememberMe;

  @override
  List<Object?> get props => [email, password, rememberMe];
}
