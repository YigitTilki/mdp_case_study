import 'package:mdp_case_study/feature/auth/domain/credential_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefManager {
  static const String _emailKey = 'email';
  static const String _passwordKey = 'password';
  static const String _rememberMe = 'rememberMe';

  Future<void> saveCredentials(
    String email,
    String password, {
    required bool rememberMe,
  }) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_emailKey, email);
    await prefs.setString(_passwordKey, password);
    await prefs.setBool(_rememberMe, rememberMe);
  }

  Future<CredentialModel?> loadCredentials() async {
    final prefs = await SharedPreferences.getInstance();
    final email = prefs.getString(_emailKey);
    final password = prefs.getString(_passwordKey);
    final rememberMe = prefs.getBool(_rememberMe);
    final returnModel = CredentialModel(
      email: email,
      password: password,
      rememberMe: rememberMe,
    );
    return returnModel;
  }

  Future<void> clearCredentials() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_emailKey);
    await prefs.remove(_passwordKey);
    await prefs.remove(_rememberMe);
  }
}
