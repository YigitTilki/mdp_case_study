import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mdp_case_study/feature/auth/data/auth_service.dart';
import 'package:mdp_case_study/feature/auth/domain/auth_state.dart';
import 'package:mdp_case_study/feature/auth/domain/login_request_model.dart';
import 'package:mdp_case_study/product/base/base_notifier.dart';

final authNotifierProvider =
    StateNotifierProvider<AuthViewModel, AuthState>((ref) {
  return AuthViewModel();
});

class AuthViewModel extends BaseNotifier<AuthState> {
  AuthViewModel() : super(const AuthState());

  final _apiService = AuthService();

  Future<bool> login(String email, String password) async {
    final model = LoginRequestModel(username: email, password: password);

    emit(state.copyWith(isLoading: true));

    final user = await _apiService.login(model);

    emit(state.copyWith(userModel: user, isLoading: false));

    if (user == null) return false;
    return true;
  }

  void changeRememberMe({required bool value}) {
    emit(state.copyWith(rememberMe: value));
  }
}
