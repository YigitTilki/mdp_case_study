import 'package:mdp_case_study/feature/auth/domain/login_request_model.dart';
import 'package:mdp_case_study/feature/auth/domain/user.dart';
import 'package:mdp_case_study/product/service/base_service.dart';

class AuthService extends BaseService {
  Future<User?> login(LoginRequestModel loginRequest) async {
    try {
      final data = loginRequest.toJson();

      final response = await dio.post<dynamic>('/auth/login', data: data);

      if (response.statusCode == 200) {
        return User.fromJson(response.data! as Map<String, dynamic>);
      } else {
        print('Login failed: ${response.statusCode}');
        return null;
      }
    } catch (e) {
      print('Login request error: $e');
      return null;
    }
  }
}
