import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mdp_case_study/product/init/languages/locale_keys.g.dart';

class ValidatorManager {
  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return LocaleKeys.validation_email_cannot_empty.tr();
    } else if (value.length < 3) {
      return LocaleKeys.validation_enter_valid_email.tr();
    }
    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return LocaleKeys.validation_password_cannot_empty.tr();
    } else if (value.length < 6) {
      return LocaleKeys.validation_password_must_six.tr();
    }
    return null;
  }

  String? validateTitle(String? value) {
    if (value == null || value.isEmpty) {
      return LocaleKeys.validation_title_cannot_empty.tr();
    }
    return null;
  }
}

final validatorProvider = Provider<ValidatorManager>((ref) {
  return ValidatorManager();
});
