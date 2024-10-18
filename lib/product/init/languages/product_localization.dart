import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:mdp_case_study/product/init/languages/locales.dart';

class ProductLocalization extends EasyLocalization {
  ProductLocalization({required super.child, super.key})
      : super(
          supportedLocales: _supportedItems,
          path: _translationPath,
          useOnlyLangCode: true,
        );

  static final List<Locale> _supportedItems = [
    Locales.tr.locale,
    Locales.en.locale,
  ];
  static const String _translationPath = 'assets/translations';

  static Future<void> updateLanguage({
    required BuildContext context,
    required Locales value,
  }) =>
      context.setLocale(value.locale);
}
