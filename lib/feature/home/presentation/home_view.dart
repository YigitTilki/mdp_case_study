import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mdp_case_study/feature/home/presentation/widgets/home_grid_view.dart';
import 'package:mdp_case_study/feature/home/presentation/widgets/popular_products_row.dart';
import 'package:mdp_case_study/feature/home/presentation/widgets/profile_avatar.dart';
import 'package:mdp_case_study/feature/home/presentation/widgets/user_list_tile.dart';
import 'package:mdp_case_study/feature/widgets/custom_app_bar.dart';
import 'package:mdp_case_study/product/constants/app_colors.dart';
import 'package:mdp_case_study/product/init/languages/locale_keys.g.dart';
import 'package:mdp_case_study/feature/auth/application/auth_view_model.dart';
import 'package:mdp_case_study/feature/home/application/home_view_model.dart';
import 'package:mdp_case_study/product/widgets/app_padding.dart';
import 'package:mdp_case_study/product/widgets/app_spacer.dart';
import 'package:mdp_case_study/product/widgets/loading_indicator.dart';

part 'home_view_mixin.dart';

@RoutePage()
class HomeView extends ConsumerStatefulWidget {
  const HomeView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<HomeView> with _HomeViewMixin {
  @override
  Widget build(BuildContext context) {
    final user = ref.watch(authNotifierProvider).userModel;
    final isLoading = ref.watch(homeNotifierProvider).isLoading;
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: const CustomAppBar(
        title: LocaleKeys.home_home,
      ),
      body: isLoading
          ? const LoadingIndicator()
          : Center(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: AppPadding.symHMedium(),
                      child: Row(
                        children: [
                          ProfileAvatar(user: user),
                          UserListTile(user: user),
                        ],
                      ),
                    ),
                    AppSpacer.vertical20(),
                    Column(
                      children: [
                        Padding(
                          padding: AppPadding.symHXXLarge(),
                          child: const PopularProductsRow(),
                        ),
                        Padding(
                          padding: AppPadding.symHMedium(),
                          child: const HomeGridView(),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
