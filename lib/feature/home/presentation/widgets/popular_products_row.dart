import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mdp_case_study/product/constants/app_colors.dart';
import 'package:mdp_case_study/product/init/languages/locale_keys.g.dart';
import 'package:mdp_case_study/product/navigation/app_router.dart';

class PopularProductsRow extends ConsumerWidget {
  const PopularProductsRow({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          flex: 2,
          child: Text(
            LocaleKeys.home_popular_products.tr(),
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w900,
              color: AppColors.primaryTextColor,
            ),
          ),
        ),
        Expanded(
          child: TextButton(
            onPressed: () {
              context.router.push(const ProductRoute());
            },
            child: Text(
              LocaleKeys.home_see_all.tr(),
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: AppColors.primaryTextColor,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
