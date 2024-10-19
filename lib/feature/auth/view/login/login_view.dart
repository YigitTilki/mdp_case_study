import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mdp_case_study/feature/auth/view/login/login_view_mixin.dart';
import 'package:mdp_case_study/feature/auth/widgets/custom_text_form_field.dart';
import 'package:mdp_case_study/feature/auth/widgets/top_field_text.dart';
import 'package:mdp_case_study/product/init/languages/locale_keys.g.dart';
import 'package:mdp_case_study/product/state/auth/auth_view_model.dart';
import 'package:mdp_case_study/product/widgets/app_spacer.dart';

class LoginView extends ConsumerStatefulWidget {
  const LoginView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoginViewState();
}

class _LoginViewState extends ConsumerState<LoginView> with LoginViewMixin {
  @override
  Widget build(BuildContext context) {
    final isLoading = ref.watch(authNotifierProvider).isLoading;
    return isLoading
        ? const Center(child: CircularProgressIndicator())
        : SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppSpacer.vertical20(),
                const TopFieldText(title: LocaleKeys.auth_email),
                CustomTextFormField(controller: emailController),
                AppSpacer.vertical10(),
                const TopFieldText(title: LocaleKeys.auth_password),
                CustomTextFormField(controller: passwordController),
                AppSpacer.vertical10(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Checkbox.adaptive(
                          value: false,
                          onChanged: (value) {},
                          materialTapTargetSize:
                              MaterialTapTargetSize.shrinkWrap,
                        ),
                        Text(LocaleKeys.auth_remember_me.tr()),
                      ],
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        LocaleKeys.auth_forgot_password.tr(),
                        style: const TextStyle(color: Colors.blue),
                      ),
                    ),
                  ],
                ),
                AppSpacer.vertical10(),
                ElevatedButton(
                  onPressed: login,
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(double.infinity, 50),
                    backgroundColor: const Color.fromRGBO(29, 97, 231, 1),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text(
                    LocaleKeys.auth_login.tr(),
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          );
  }
}
