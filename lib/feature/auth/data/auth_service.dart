import 'package:mdp_case_study/feature/auth/domain/login_request_model.dart';
import 'package:mdp_case_study/feature/auth/domain/user.dart';
import 'package:mdp_case_study/product/base/base_service.dart';

class AuthService extends BaseService {
  Future<User?> login(LoginRequestModel loginRequest) async {
    final data = loginRequest.toJson();

    return handleApiCall<User>(
      request: () => dio.post<Map<String, dynamic>>('/auth/login', data: data),
      onSuccess: (response) {
        return User.fromJson(response.data! as Map<String, dynamic>);
      },
      onError: () {
        logger.d('Login failed.');
        return null;
      },
    );
  }
}
