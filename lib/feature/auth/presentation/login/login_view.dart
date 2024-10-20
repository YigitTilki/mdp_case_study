import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mdp_case_study/feature/auth/application/auth_view_model.dart';
import 'package:mdp_case_study/feature/auth/presentation/login/login_view_mixin.dart';
import 'package:mdp_case_study/feature/auth/presentation/widgets/auth_button.dart';
import 'package:mdp_case_study/feature/auth/presentation/widgets/custom_text_form_field.dart';
import 'package:mdp_case_study/feature/auth/presentation/widgets/forgot_password.dart';
import 'package:mdp_case_study/feature/auth/presentation/widgets/remember_me.dart';
import 'package:mdp_case_study/feature/auth/presentation/widgets/top_field_text.dart';
import 'package:mdp_case_study/product/init/languages/locale_keys.g.dart';
import 'package:mdp_case_study/product/manager/validator_manager.dart';
import 'package:mdp_case_study/product/widgets/app_spacer.dart';

class LoginView extends ConsumerStatefulWidget {
  const LoginView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoginViewState();
}

class _LoginViewState extends ConsumerState<LoginView> with LoginViewMixin {
  @override
  Widget build(BuildContext context) {
    final state = ref.watch(authNotifierProvider);
    final validator = ref.watch(validatorProvider);

    return state.isLoading
        ? const Center(child: CircularProgressIndicator())
        : SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppSpacer.vertical20(),
                  const TopFieldText(title: LocaleKeys.auth_email),
                  CustomTextFormField(
                    controller: emailController,
                    validator: validator.validateEmail,
                  ),
                  AppSpacer.vertical10(),
                  const TopFieldText(title: LocaleKeys.auth_password),
                  CustomTextFormField(
                    controller: passwordController,
                    validator: validator.validatePassword,
                  ),
                  AppSpacer.vertical10(),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      RememberMe(),
                      ForgotPassword(),
                    ],
                  ),
                  AppSpacer.vertical10(),
                  AuthButton(onPressed: login, title: LocaleKeys.auth_login),
                ],
              ),
            ),
          );
  }
}
