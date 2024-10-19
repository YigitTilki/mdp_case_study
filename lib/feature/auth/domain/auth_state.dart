import 'package:equatable/equatable.dart';
import 'package:mdp_case_study/feature/auth/domain/user.dart';

class AuthState extends Equatable {
  const AuthState({
    this.userModel,
    this.isLoading = false,
  });

  final User? userModel;
  final bool isLoading;

  @override
  List<Object?> get props => [userModel, isLoading];

  AuthState copyWith({
    User? userModel,
    bool? isLoading,
  }) {
    return AuthState(
      userModel: userModel ?? this.userModel,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
