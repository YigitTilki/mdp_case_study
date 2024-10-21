import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mdp_case_study/feature/auth/application/auth_view_model.dart';
import 'package:mdp_case_study/feature/widgets/language_modal_sheet.dart';
import 'package:mdp_case_study/product/constants/app_colors.dart';
import 'package:mdp_case_study/product/constants/app_icons.dart';
import 'package:mdp_case_study/product/manager/shared_pref_manager.dart';
import 'package:mdp_case_study/product/navigation/app_router.dart';

class CustomAppBar extends ConsumerWidget implements PreferredSizeWidget {
  const CustomAppBar({required this.title, super.key});
  final String title;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AppBar(
      scrolledUnderElevation: 0,
      backgroundColor: AppColors.whiteColor,
      centerTitle: true,
      title: Text(
        title.tr(),
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: AppColors.primaryTextColor,
        ),
      ),
      actions: [
        IconButton(
          onPressed: () {
            LanguageModalSheet.show(context);
          },
          icon: SvgPicture.asset(AppIcons.language),
        ),
        IconButton(
          onPressed: () async {
            await SharedPrefManager().clearCredentials();
            ref
                .read(authNotifierProvider.notifier)
                .changeRememberMe(value: false);
            if (!context.mounted) return;
            await context.router.replace(const AuthRoute());
          },
          icon: SvgPicture.asset(AppIcons.exit),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
