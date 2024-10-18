import 'package:mdp_case_study/product/model/login_request_model.dart';

abstract class Service {
  Future<void> login(LoginRequestModel loginRequest);
}
