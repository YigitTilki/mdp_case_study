import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mdp_case_study/feature/auth/view/login/login_view.dart';
import 'package:mdp_case_study/product/navigation/app_router.dart';
import 'package:mdp_case_study/product/state/auth_view_model.dart';

mixin LoginViewMixin on ConsumerState<LoginView> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  Future<void> login() async {
    final response = await ref
        .read(authNotifierProvider.notifier)
        .login(emailController.text, passwordController.text);

    if (response) {
      if (!mounted) return;
      await context.router.replace(const HomeRoute());
    }
  }
}
