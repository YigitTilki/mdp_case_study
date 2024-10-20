import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:mdp_case_study/product/init/languages/locale_keys.g.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
      child: Text(
        LocaleKeys.auth_forgot_password.tr(),
        style: const TextStyle(color: Colors.blue),
      ),
    );
  }
}
