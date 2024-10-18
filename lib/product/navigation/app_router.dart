import 'package:auto_route/auto_route.dart';
import 'package:mdp_case_study/feature/auth/view/auth_view.dart';
import 'package:mdp_case_study/feature/home/home_view.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'View,Route')
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: AuthRoute.page),
        AutoRoute(page: HomeRoute.page, initial: true),
      ];
}
