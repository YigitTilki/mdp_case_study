import 'package:auto_route/auto_route.dart';
import 'package:mdp_case_study/feature/auth/presentation/auth_view.dart';
import 'package:mdp_case_study/feature/home/presentation/home_view.dart';
import 'package:mdp_case_study/feature/products/presentation/product_view.dart';
import 'package:mdp_case_study/feature/profile/presentation/profile_view.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'View,Route')
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: AuthRoute.page),
        AutoRoute(page: HomeRoute.page),
        AutoRoute(page: ProductRoute.page),
        AutoRoute(page: ProfileRoute.page, initial: true),
      ];
}
