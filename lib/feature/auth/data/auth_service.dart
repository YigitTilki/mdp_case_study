import 'package:mdp_case_study/feature/auth/domain/login_request_model.dart';
import 'package:mdp_case_study/feature/auth/domain/user.dart';
import 'package:mdp_case_study/product/base/base_service.dart';

class AuthService extends BaseService {
  Future<User?> login(LoginRequestModel loginRequest) async {
    try {
      final data = loginRequest.toJson();

      final response = await dio.post<dynamic>('/auth/login', data: data);

      if (response.statusCode == 200) {
        return User.fromJson(response.data! as Map<String, dynamic>);
      } else {
        logger.d('Login failed: ${response.statusCode}');
      }
    } catch (e) {
      logger.d('Login request error: $e');
    }
    return null;
  }
}
