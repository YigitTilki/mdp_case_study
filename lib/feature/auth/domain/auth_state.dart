// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

import 'package:mdp_case_study/feature/auth/domain/user.dart';

class AuthState extends Equatable {
  const AuthState({
    this.userModel,
    this.isLoading = false,
    this.rememberMe = false,
  });

  final User? userModel;
  final bool isLoading;
  final bool? rememberMe;

  @override
  List<Object?> get props => [userModel, isLoading, rememberMe];

  AuthState copyWith({
    User? userModel,
    bool? isLoading,
    bool? rememberMe,
  }) {
    return AuthState(
      userModel: userModel ?? this.userModel,
      isLoading: isLoading ?? this.isLoading,
      rememberMe: rememberMe ?? this.rememberMe,
    );
  }
}
