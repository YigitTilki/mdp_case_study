import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mdp_case_study/product/model/login_request_model.dart';
import 'package:mdp_case_study/product/service/api_service.dart';
import 'package:mdp_case_study/product/state/auth/auth_state.dart';
import 'package:mdp_case_study/product/state/base/base_notifier.dart';

final authNotifierProvider =
    StateNotifierProvider<AuthViewModel, AuthState>((ref) {
  return AuthViewModel();
});

class AuthViewModel extends BaseNotifier<AuthState> {
  AuthViewModel() : super(const AuthState());

  final _apiService = ApiService();

  Future<bool> login(String email, String password) async {
    emit(state.copyWith(isLoading: true));
    final user = await _apiService.login(
      LoginRequestModel(username: email, password: password),
    );
    emit(state.copyWith(userModel: user));
    emit(state.copyWith(isLoading: false));
    if (user == null) return false;

    return true;
  }
}
