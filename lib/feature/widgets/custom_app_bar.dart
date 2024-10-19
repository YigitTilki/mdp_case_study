import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mdp_case_study/product/constants/app_colors.dart';
import 'package:mdp_case_study/product/constants/app_icons.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({required this.title, super.key});
  final String title;

  @override
  Widget build(BuildContext context) {
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
          onPressed: () {},
          icon: SvgPicture.asset(AppIcons.language),
        ),
        IconButton(
          onPressed: () {},
          icon: SvgPicture.asset(AppIcons.exit),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
