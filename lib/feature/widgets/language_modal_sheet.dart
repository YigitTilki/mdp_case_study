import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mdp_case_study/product/constants/app_colors.dart';
import 'package:mdp_case_study/product/init/languages/locale_keys.g.dart';
import 'package:mdp_case_study/product/init/languages/locales.dart';
import 'package:mdp_case_study/product/init/languages/product_localization.dart';
import 'package:mdp_case_study/product/widgets/app_spacer.dart';

class LanguageModalSheet extends ConsumerStatefulWidget {
  const LanguageModalSheet({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _LanguageModalSheetState();

  static Future<void> show(BuildContext context) async {
    await showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (BuildContext context) {
        return const LanguageModalSheet();
      },
    );
  }
}

class _LanguageModalSheetState extends ConsumerState<LanguageModalSheet> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        AppSpacer.vertical20(),
        Text(
          LocaleKeys.languageModal_select_language.tr(),
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: AppColors.labelGreyColor,
          ),
        ),
        AppSpacer.vertical10(),
        const Divider(),
        AppSpacer.vertical10(),
        InkWell(
          onTap: () {
            ProductLocalization.updateLanguage(
              context: context,
              value: Locales.tr,
            );
            context.router.maybePop();
          },
          child: SizedBox(
            width: double.infinity,
            child: Text(
              LocaleKeys.languageModal_turkish.tr(),
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: context.locale == Locales.tr.locale
                    ? AppColors.primaryTextColor
                    : AppColors.labelGreyColor,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        AppSpacer.vertical10(),
        const Divider(),
        AppSpacer.vertical10(),
        InkWell(
          onTap: () {
            ProductLocalization.updateLanguage(
              context: context,
              value: Locales.en,
            );
            context.router.maybePop();
          },
          child: SizedBox(
            width: double.infinity,
            child: Text(
              LocaleKeys.languageModal_english.tr(),
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: context.locale == Locales.en.locale
                    ? AppColors.primaryTextColor
                    : AppColors.labelGreyColor,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        AppSpacer.vertical50(),
      ],
    );
  }
}
